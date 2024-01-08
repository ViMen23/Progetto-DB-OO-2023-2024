/*******************************************************************************
 * PROJECT NAME : FOOTBALL PLAYER DATABASE
 *
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY
 * FIELD        : COMPUTER SCIENCE
 * CLASS        : DATA BASES I
 * TEACHER      : SILVIO BARRA
 * YEAR         : 2023-2024
 ******************************************************************************/



/*******************************************************************************
 * TRIGGER FUNCTION
 ******************************************************************************/


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_country TRIGGER 
 * NAME : tf_bi_country
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_country
(
)
RETURNS trigger
AS
$$
BEGIN

	-- if new country to insert is of type world
	IF (NEW.type = 'WORLD') THEN
		-- .. and if there are not active worlds
		IF (no_world()) THEN
			-- new country can be inserted
			RETURN NEW;
		END IF;
	-- if new country to insert is not of type world
	ELSE
		-- ..and new country is contained
		-- in the correct type of super country
		IF (insu_country(NEW.type, get_country_type(NEW.super))) THEN
			-- new country can be inserted
			RETURN NEW;
		END IF;
	END IF;
	
	-- in all other cases new country cannot be inserted
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_player TRIGGER
 * NAME : tf_bi_player
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player
(
)
RETURNS trigger
AS
$$
BEGIN

	-- if new football player to insert
	IF
	(
		-- is associated to a nation
		is_nation(NEW.country)
		AND
		-- and nation was active when player to insert was born
		is_in_country
		(
			CAST(extract(year from NEW.b_date) AS integer),
			NEW.country
		)
	)
	THEN
		-- new football player can be inserted
		RETURN NEW;
	END IF;
	
	-- in all other cases new player cannot be inserted
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_team TRIGGER
 * NAME : tf_bi_team
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team
(
)
RETURNS trigger
AS
$$	
BEGIN

	-- if football team to insert
	IF
	(
		-- is associated to a nation
		is_nation(NEW.country)
		AND
		-- and nation was active during team to insert year range
		is_in_country(NEW.s_year, NEW.e_year, NEW.country)
	)
	THEN
		-- ..and football team to insert is of type club
		IF ('CLUB' = NEW.type) THEN
			-- new football team can be inserted
			RETURN NEW;
		END IF;
	ELSE
			-- ..and football team to insert is of type nation
			IF
			(
				-- if team to insert has same suppression year
				-- of nation it belongs to 
				NEW.e_year IS NOT DISTINCT FROM get_country_e_year(NEW.country)
				AND
				-- ..and has also same name
				NEW.name IS NOT DISTINCT FROM get_country_name(NEW.country)
			)
			THEN
				-- new football team can be inserted
				RETURN NEW;
			END IF;
	END IF;	
	
	-- in all other cases new team cannot be inserted
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_conf TRIGGER
 * NAME : tf_bi_conf
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_conf
(
)
RETURNS trigger
AS
$$
BEGIN

	-- if football confederation to insert
	IF
	(
		-- belongs to a country than was active
		-- during confederation to insert year range
		(is_in_country(NEW.s_year, NEW.e_year, NEW.country))
		AND
		-- ..and confederation to insert is contained
		-- in the correct type of super confederation
		(insu_country(NEW.type, get_conf_type(NEW.super))) 
	)
	THEN
		-- new football confederation can be inserted
		RETURN NEW;
	END IF;
	
	-- in all other cases new confederation cannot be inserted
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_p_country TRIGGER
 * NAME : tf_bi_p_country
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_p_country
(
)
RETURNS trigger
AS
$$
BEGIN

	-- if p_country table record to insert
	-- is associated to a nation
	IF (is_nation(NEW.country)) THEN
		-- new p_country table record can be inserted
		RETURN NEW;
	END IF;
	
	-- in all other cases new p_country table record cannot be inserted
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_comp TRIGGER
 * NAME : tf_bi_comp
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_comp
(
)
RETURNS trigger
AS
$$
BEGIN

	-- if football competition to insert
	IF
	(
		(
			-- is a nation competition and
			-- the team type of competition is not national
			('NATION' = get_conf_type(NEW.conf) AND NEW.t_type <> 'NATIONAL')
			OR
			-- or is not a nation competition and
			-- the competition type is not championship
			('NATION' <> get_conf_type(NEW.conf) AND NEW.type <> 'CHAMPIONSHIP')
		)
		AND
		-- and it belongs to a confederation than was active
		-- during competition to insert year range
		(is_in_conf(NEW.s_year, NEW.e_year, NEW.conf))	
	)
	THEN
		-- new football competitoin can be inserted
		RETURN NEW;
	END IF;
	
	-- in all other cases new competition cannot be inserted
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_comp_ed TRIGGER
 * NAME : tf_bi_comp_ed
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_comp_ed
(
)
RETURNS trigger
AS
$$
BEGIN

	IF
	(
		is_in_comp(NEW.s_year, NEW.e_year, NEW.comp)
		AND
		(0 = (NEW.s_year - get_comp_s_year(NEW.comp)) % get_comp_freq(comp))
		AND
		ctrl_formula(conf_ty(comp_conf(NEW.comp)), comp_ty(NEW.comp), NEW.formula)
	)
	THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_t_comp_ed TRIGGER
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_t_comp_ed
(
)
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		( is_in_team(NEW.s_year, NEW.e_year, NEW.team) )
		AND
		( comp_tty(NEW.comp) IS NOT DISTINCT FROM team_ty(NEW.team) ) -- comp_tty can be NULL
		AND
		( comp_sex(NEW.comp) = team_sex(NEW.team) )
		AND
		( comp_max_age(NEW.comp) IS NOT DISTINCT FROM team_max_age ) -- max_age of both tables can be NULL
		AND
		
		
	) THEN
	
	END IF;

	
	-- check limit team for the competition
	-- check n_match between min and max match
	-- check match totali with tuples of that competition on this table if it is possible
	-- check that team doesn't play in another competition champhionship in the same nation
	-- example( team can't play serie A and serie B at the same time)
	-- check that team is of the same country as the competition or at least the competition is
	-- a super of team country

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TRIGGER
 ******************************************************************************/
 

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_country
 * DESC : trigger to activate
 *        before inserting a new country
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_country
BEFORE INSERT ON country
FOR EACH ROW
EXECUTE FUNCTION tf_bi_country();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player 
 * DESC : trigger to activate
 *        before inserting a new football player
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT ON player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER 
 * NAME : tg_bi_team
 * DESC : trigger to activate
 *        before inserting a new football team
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team
BEFORE INSERT ON team
FOR EACH ROW
EXECUTE FUNCTION tf_new_team();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER 
 * NAME : tg_bi_conf
 * DESC : trigger to activate
 *        before inserting a new football confederation
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_conf
BEFORE INSERT ON conf
FOR EACH ROW
EXECUTE FUNCTION tf_bi_conf();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_p_country
 * DESC : trigger to activate
 *        before inserting a new p_country table record
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_p_country
BEFORE INSERT ON p_country
FOR EACH ROW
EXECUTE FUNCTION tf_bi_p_country();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_comp
 * DESC : trigger to activate
 *        before inserting a new football competition
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_comp
BEFORE INSERT ON comp
FOR EACH ROW
EXECUTE FUNCTION tf_bi_comp();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_comp_ed
 * DESC : trigger to activate
 *        before inserting a new football competition edition
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_comp_ed
BEFORE INSERT ON comp_ed
FOR EACH ROW
EXECUTE FUNCTION tf_bi_comp_ed();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_t_comp_ed
 * DESC : trigger to activate
 *        before inserting a new t_comp_ed table record
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_t_comp_ed
BEFORE INSERT ON t_comp_ed
FOR EACH ROW
EXECUTE FUNCTION tf_bi_t_comp_ed();
--------------------------------------------------------------------------------

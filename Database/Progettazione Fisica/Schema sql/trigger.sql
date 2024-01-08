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
 * TRIGGER AND TRIGGER FUNCTION
 ******************************************************************************/


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
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

	-- if new country we want to insert is of world type
	IF (NEW.type = 'WORLD') THEN
		-- .. and if there are not active worlds
		IF (no_world()) THEN
			-- new country can be inserted
			RETURN NEW;
		END IF;
	-- if new country we want to insert is not of world type
	ELSE
		-- ..and new country is contained
		-- in the correct type of super country 
		IF (insu_country(NEW.type, country_type(NEW.super))) THEN
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
 * TYPE : TRIGGER
 * NAME : tg_bi_country
 * DESC : trigger to activate
 *        before the inserting a new country
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_country
BEFORE INSERT ON country
FOR EACH ROW
EXECUTE FUNCTION tf_bi_country();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_player
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player
(
)
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		is_nation(NEW.country)
		AND
		is_in_country
		(
			CAST(extract(year from NEW.b_date) AS integer),
			NEW.country
		)
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
 * TYPE : TRIGGER
 * NAME : tg_bi_player 
 * DESC : trigger to activate
 *        before the inserting a new football player
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT ON player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_team()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (is_nation(NEW.country) AND is_in_country(NEW.s_year, NEW.e_year, NEW.country)) THEN
		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;
		ELSE
			IF
			(
				NEW.e_year IS NOT DISTINCT FROM country_ey(NEW.country)
				AND
				NEW.name IS NOT DISTINCT FROM country_nm(NEW.country)
			)
			THEN
				RETURN NEW;
			END IF;
		END IF;
	END IF;	
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER 
 * NAME : 
 * DESC : trigger to activate
 *        before the inserting a new football team
 ******************************************************************************/
CREATE OR REPLACE TRIGGER new_team
BEFORE INSERT ON team
FOR EACH ROW
EXECUTE FUNCTION tf_new_team();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_conf()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN
	IF
	( 
		(insu_country(NEW.type, conf_ty(NEW.super)))
		AND
		(is_in_country(NEW.s_year, NEW.e_year, NEW.country)) 
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
 * TYPE : TRIGGER 
 * NAME : 
 * DESC : trigger to activate
 *        before the inserting a new football confederation
 ******************************************************************************/
CREATE OR REPLACE TRIGGER new_conf
BEFORE INSERT ON conf
FOR EACH ROW
EXECUTE FUNCTION tf_new_conf();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_p_country()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (is_nation(NEW.country)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : 
 * DESC : trigger to activate
 *        before the inserting a new p_country table record
 ******************************************************************************/
CREATE OR REPLACE TRIGGER new_p_country
BEFORE INSERT ON p_country
FOR EACH ROW
EXECUTE FUNCTION tf_new_p_country();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_comp()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		(
			('NATION' = conf_ty(NEW.conf) AND NEW.t_type <> 'NATIONAL')
			OR
			('NATION' <> conf_ty(NEW.conf) AND NEW.type <> 'CHAMPIONSHIP')
		)
		AND
		(is_in_conf(NEW.s_year, NEW.e_year, NEW.conf))	
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
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE TRIGGER new_comp
BEFORE INSERT ON comp
FOR EACH ROW
EXECUTE FUNCTION tf_new_comp();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_comp_ed()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		is_in_comp(NEW.s_year, NEW.e_year, NEW.comp)
		AND
		(0 = (NEW.s_year - comp_sy(NEW.comp)) % comp_fq(comp))
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
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE TRIGGER new_comp_ed
BEFORE INSERT ON comp_ed
FOR EACH ROW
EXECUTE FUNCTION tf_new_comp_ed();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_new_t_comp_ed()
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
 * TYPE : 
 * NAME : 
 * DESC :
 ******************************************************************************/
BEFORE INSERT ON t_comp_ed
FOR EACH ROW
EXECUTE FUNCTION tf_new_t_comp_ed();
--------------------------------------------------------------------------------

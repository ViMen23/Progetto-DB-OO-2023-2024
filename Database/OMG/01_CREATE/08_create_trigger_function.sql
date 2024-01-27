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
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_if_referenced_refuse
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_if_referenced_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', string_for_reference('@', TG_TABLE_NAME, OLD))) THEN
		RETURN NEW;
	END IF;
	
	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_refuse
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_au_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_country
(
)
RETURNS trigger
AS
$$
BEGIN

	UPDATE
		fp_team
	SET
		name = NEW.name
	WHERE
		type = 'NATIONAL'
		AND
		country_id = NEW.id;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_confederation
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp						text;

	id_country_super_conf	integer;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.super_id);
	id_country_super_conf = CAST(tmp AS integer);

	IF (can_be_inside(NEW.country_id, id_country_super_conf)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;
	id_country_conf	integer;
	name_country 	text;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	IF (is_nation(NEW.country_id) AND NEW.country_id = id_country_conf) THEN

		IF ('CLUB' = NEW.type) THEN
		
			RETURN NEW;
		
		ELSIF ('NATIONAL' = NEW.type) THEN

			name_country = get_column('fp_country', 'name', NEW.country_id);

			IF (NEW.name = name_country) THEN
		
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
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_team_name
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_team_name
(
)
RETURNS trigger
AS
$$
DECLARE

	name_country	text;

BEGIN

	name_country = get_column('fp_country', 'name', OLD.country_id);

	IF (NEW.name = name_country) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_competition
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp					text;

	id_country_conf		integer;
	type_country_conf	text;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	type_country_conf = get_column('fp_country', 'type', id_country_conf);

	IF (type_country_conf <> 'NATION' OR NEW.team_type <> 'NATIONAL') THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_competition_edition
(
)
RETURNS trigger
AS
$$
BEGIN

	IF
	(
		corr_years_comp_ed(NEW.competition_id, NEW.start_year, NEW.end_year)
		AND
		corr_tot_team(NEW.competition_id, NEW.total_team)
	)
	THEN
		IF (NOT has_edition(NEW.competition_id)) THEN
			RETURN NEW;
		ELSE
			IF (corr_freq(NEW.competition_id, NEW.start_year)) THEN
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
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_partecipation
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	id_conf_comp	integer;

BEGIN

	tmp = get_column('fp_competition', 'confederation_id', NEW.competition_id);
	id_conf_comp = CAST(tmp AS integer);

	IF
	(
		has_place(NEW.competition_id, NEW.start_year)
		AND
		belong_to(NEW.team_id, id_conf_comp)
		AND
		team_fit_comp(NEW.team_id, id_comp)
		AND
		can_take_part(NEW.team_id, NEW.competition_id, NEW.start_year)
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
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_nation(NEW.country_id) AND NEW.role IS NULL) THEN
		RETURN NEW;
	END IF;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_ai_player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_player
(
)
RETURNS trigger
AS
$$
BEGIN

	INSERT INTO
		fp_nationality (country_id, player_id)
	VALUES
	(
		NEW.country_id,
		NEW.id
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_player_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_country
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_nation(NEW.country_id)) THEN
		RETURN NEW;
	END IF;

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_player_role
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_role
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (role_all_positions(NEW.id, NEW.role)) THEN
		RETURN NEW;
	END IF;

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_player_dob
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_dob
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	born_year		integer;
	retired_year	integer;

	min_militancy	integer;
	max_militancy	integer;

BEGIN


	born_year = extract year from NEW.dob;

	IF (is_retired(NEW.id)) THEN

		tmp = get_column('fp_player_retired', 'retired_date', NEW.id);
		retired_year_year = extract year from CAST(tmp AS date);

		IF ((retired_year - born_year) NOT BETWEEN min_age() AND max_age()) THEN
		
			RETURN OLD;
		
		END IF;
	
	END IF;


	IF (has_militancy(NEW.id)) THEN
	
		SELECT
			min(start_year)
		INTO
			min_militancy
		FROM
			fp_militancy
		WHERE
			player_id = NEW.id;
		

		IF (min_militancy - born_year < min_age()) THEN

			RETURN OLD;

		ELSE

		IF (NOT is_retired(NEW.id)) THEN

			SELECT
				max(start_year)
			INTO
				max_militancy
			FROM
				fp_militancy
			WHERE
				player_id = NEW.id;


			IF (max_militancy - born_year > max_age()) THEN

				RETURN OLD;

			END IF;

		END IF;
		
	END IF;

	RETURN NEW;
	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_au_player_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_country
(
)
RETURNS trigger
AS
$$
DECLARE

	id_team	integer;

BEGIN

	id_team = national_team_from_country(OLD.country_id);

	IF (NOT has_militancy(NEW.id, id_team)) THEN

		DELETE FROM
			fp_nationality
		WHERE
			country_id = OLD.country_id
			AND
			player_id = NEW.id;

	END IF;

	INSERT INTO
		fp_nationality (country_id, player_id)
	VALUES
	(
		NEW.country_id,
		NEW.id
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_au_player_role
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_role
(
)
RETURNS trigger
AS
$$
DECLARE

	

BEGIN

	IF (OLD.role LIKE '%GK%' AND NEW.role NOT LIKE '%GK%') THEN

		DELETE FROM
			fp_player_attribute
		WHERE
			player_id = NEW.id
			AND
			attribute_id IN (SELECT * FROM gk_attr());

		DELETE FROM
			fp_player_tag
		WHERE
			player_id = NEW.id
			AND
			tag_id IN (SELECT * FROM gk_tag());

		DELETE FROM
			fp_play_statistic
		WHERE
			play_id IN (SELECT * FROM player_play(NEW.id))
			AND
			statistic_id IN (SELECT * FROM gk_stat());

	END IF;
	

	DELETE FROM
		fp_player_trophy_case
	WHERE
		player_id = NEW.id
		AND
		trophy_id IN (SELECT * FROM trophy_not_role(NEW.role));

	DELETE FROM
		fp_player_prize_case
	WHERE
		player_id = NEW.id
		AND
		trophy_id IN (SELECT * FROM prize_not_role(NEW.role));

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_nationality
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_nation(NEW.country_id)) THEN

		RETURN NEW;

	END IF;


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bd_nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_nationality
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp					text;

	id_country_player	integer;

BEGIN

	tmp = get_column('fp_player', 'country_id', OLD.player_id);
	id_country_player = CAST(tmp AS integer);


	IF (OLD.country_id <> id_country_player) THEN

		RETURN OLD;
	
	END IF;


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_ad_nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ad_nationality
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	id_country	integer;

	id_team		integer;

BEGIN

	IF (is_national(OLD.player_id)) THEN

		id_team = national_team();

		tmp = get_column('fp_team', 'country_id', id_team);
		id_country = CAST(tmp AS integer);

		IF (OLD.country_id = id_country) THEN
			
			DELETE FROM
				fp_militancy
			WHERE
				player_id = OLD.player_id
			AND
				team_type = 'NATIONAL';
		
		END IF;

	END IF; 
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_militancy
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	birth_date		integer;
	retired_date	integer;

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.player_id);
	birth_date = extract year from CAST(tmp AS date);

	retired_date = NULL;

	tmp = get_column('fp_player_retired', 'retired_date', NEW.player_id);
	retired_date = CAST(tmp AS date);

	IF
	(
		corr_age_militancy(birth_date, retired_date, NEW.start_season, NEW.end_season)
		AND
		corr_militancy
		(
			NEW.player_id, NEW.team_id,
			NEW.start_season, NEW.type_start_season
			NEW.end_season, NEW.type_end_season
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
 * TYPE : TRIGGER FUNCTION - tg_bi_player_tag TRIGGER 
 * NAME : tf_bi_player_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_tag
(
)
RETURNS trigger
AS
$$
DECLARE

	type_tag	text;

BEGIN

	type_tag = get_column('fp_tag', 'type', NEW.tag_id);

	IF
	(
		type_tag <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_tag AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION - tg_bi_player_attribute TRIGGER 
 * NAME : tf_bi_player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_attribute
(
)
RETURNS trigger
AS
$$
DECLARE

	type_column	text;

BEGIN

	type_column = get_column('fp_attribute', 'type', NEW.attribute_id);

	IF
	(
		type_column <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_column AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_team_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;

BEGIN

	type_trohy = get_column('fp_trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trohy) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_ai_team_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_team_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	id_player	integer;

BEGIN

	FOR id_player
	IN
		SELECT
			player_id
		FROM
			fp_squad
		WHERE
			team_id = NEW.team_id
			AND
			start_year = NEW.start_year
			AND
			type <> 'I PART'
	
	LOOP

		INSERT INTO
			fp_player_trophy_case
			(
				player_id,
				team_id,
				trophy_id,
				start_year,
				competition_id
			)
		VALUES
		(
			id_player,
			NEW.team_id,
			NEW.id,
			NEW.start_year,
			NEW.competition_id
		);

	END LOOP;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_ad_team_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ad_team_trophy_case
(
)
RETURNS trigger
AS
$$
BEGIN

	DELETE FROM
		fp_player_trophy_case
	WHERE
		team_id = OLD.team_id
		AND
		trophy_id = OLD.id
		AND
		start_year = OLD.start_year
		AND
		competition_id = OLD.competition_id;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_player_prize_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_prize_case
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	type_prize		text;
	role_prize		text;

	year_dob_player	integer;

	min_age			integer;

BEGIN

	min_age = 15;

	type_prize = get_column('fp_prize', 'type', NEW.prize_id);

	IF ('PLAYER' = type_prize) THEN

		tmp = get_column('fp_player', 'dob', NEW.player_id);
		year_dob_player = extract year from CAST(tmp AS date);
	
		IF (NEW.assign_year - year_dob_player > min_age) THEN

			role_prize = get_column('fp_prize', 'role', NEW.prize_id);

			IF (role_prize IS NULL) THEN
			
				RETURN NEW;
			
			ELSE

				role_player = get_column('fp_player', 'role', NEW.player_id);
			
				IF (position(role_prize in role_player) > 0) THEN

					RETURN NEW;

				END IF;

			END IF;
		
		END IF;
	
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_team_prize_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team_prize_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_prize	text;

BEGIN

	type_prize = get_column('fp_prize', 'type', NEW.prize_id);

	IF ('TEAM' = type_prize) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play
(
)
RETURNS trigger
AS
$$
DECLARE

	tot_team	integer;

BEGIN

	tot_team = tot_team_comp_ed(NEW.competition_id, NEW.start_year);

	IF (NEW.match <= tot_team * 4) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_play_match
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_play_match
(
)
RETURNS trigger
AS
$$
DECLARE

	tot_team	integer;

BEGIN

	tot_team = tot_team_comp_ed(NEW.competition_id, NEW.start_year);

	IF (NEW.match <= tot_team * 4) THEN
		RETURN NEW;
	END IF;
	
	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play_statistic
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	gk_stat		boolean;
	
	id_player	integer;
	role_player	integer;

BEGIN

	tmp = get_column('fp_statistic', 'goalkeeper', NEW.statistic_id);
	gk_stat = CAST(tmp AS boolean);

	IF (NOT gk_stat) THEN
		
		RETURN NEW;

	ELSE

		tmp = get_column('fp_play', 'player_id', NEW.play_id);
		id_player = CAST(tmp AS integer);

		role_player = get_column('fp_player', 'role', id_player);

		IF (role_player LIKE '%GK%') THEN
			
			RETURN NEW;
		
		END IF;

	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

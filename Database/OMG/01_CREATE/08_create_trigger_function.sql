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
 * TYPE : TRIGGER FUNCTION - tg_bu_country TRIGGER 
 * NAME : tf_bu_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_country
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', 'fp_country@id@' || OLD->id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_au_country TRIGGER 
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

	UPDATE TABLE
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
 * TYPE : TRIGGER FUNCTION - tg_bi_confederation TRIGGER 
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

	IF (NULL = NEW.super_id) THEN
		RETURN NEW;
	END IF;

	tmp = get_column('fp_confederation', 'country_id', NEW.super_id);
	id_country_super_conf = CAST(tmp AS integer);

	IF (can_be_inside(NEW.country_id, NEW.id_country_super_conf)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bu_confederation TRIGGER 
 * NAME : tf_bu_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_confederation
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', 'fp_confederation@id@' || OLD->id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_team TRIGGER 
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
 * TYPE : TRIGGER FUNCTION - tg_bu_team TRIGGER 
 * NAME : tf_bu_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_team
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', 'fp_team@id@' || OLD->id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bu_team_name TRIGGER 
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
BEGIN

	IF (OLD.type <> 'NATIONAL') THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_competition TRIGGER 
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
 * TYPE : TRIGGER FUNCTION - tg_bu_competition TRIGGER 
 * NAME : tf_bu_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_competition
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', 'fp_competition@id@' || OLD->id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bu_competition_freq TRIGGER 
 * NAME : tf_bu_competition_freq
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_competition_freq
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (0 = NEW.frequency) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_competition_edition TRIGGER 
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

	IF (NOT has_edition(NEW.competition_id)) THEN

		RETURN NEW;
	
	ELSE
	
		IF
		(
			corr_freq(NEW.competition_id, NEW.start_year)
			AND
			corr_tot_team(NEW.competition_id, NEW.total_team)
		) 
		THEN
	
			RETURN NEW;
	
		END IF;
	
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_partecipation TRIGGER 
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

	tmp		text;
	id_conf	integer;
	id_comp	integer;

BEGIN

	id_conf = conf_from_comp_ed(NEW.competition_edition_id);

	tmp = get_column('fp_competition_edition', 'competition_id', NEW.competition_edition_id);
	id_comp = CAST(tmp AS integer);

	IF
	(
		has_place(NEW.competition_edition_id)
		AND
		belong_to(NEW.team_id, id_conf)
		AND
		team_fit_comp(NEW.team_id, id_comp)
		AND
		can_take_part(NEW.team_id, NEW.competition_edition_id)
	)
	THEN
		RETURN NEW;
	END IF;
	
	raise notice 'SOMETHING HAS GONE WRONG';
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_player TRIGGER 
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

	IF (is_nation(NEW.country_id)) THEN
		RETURN NEW;
	END IF;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_nationality TRIGGER 
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
 * TYPE : TRIGGER FUNCTION - tg_bi_militancy TRIGGER 
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

	tmp			text;
	dob_player	date;
	type_team	text;
	valid_range	daterange;

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.player_id);
	dob_player = CAST(tmp AS date);
	
	valid_range = valid_daterange(dob_player);

	type_team = get_column('fp_team', 'type', NEW.team_id);

	IF ('CLUB' = type_team) THEN

		IF
		(
			NEW.date_range <@ valid_range
			AND
			free_club_militancy(NEW.player_id, NEW.date_range)
		)
		THEN
			RETURN NEW;
		END IF;

	ELSIF ('NATIONAL' = type_team) THEN

		IF
		(
			has_nationality(NEW.player_id, rec_team.country_id)
			AND
			upper(NEW.date_range) IS NULL
			AND
			lower(NEW.date_range) <@ valid_range
			AND
			free_national_militancy(NEW.player_id, rec_team.country_id)
		)
		THEN
			RETURN NEW;
		END IF;

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
 * TYPE : TRIGGER FUNCTION - tg_bi_team_trophy_case TRIGGER 
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
 * TYPE : TRIGGER FUNCTION - tg_bi_player_trophy_case TRIGGER 
 * NAME : tf_bi_player_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;
	time_range	daterange;
	existence	integer;

BEGIN

	time_range = range_edition(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN

		type_trohy = get_column('fp_trophy', 'type', NEW.trophy_id);

		IF ('TEAM' = type_trohy) THEN

			existence = NULL;

			SELECT
				id
			INTO
				existence
			FROM
				fp_team_trophy_case
			WHERE
				competition_edition_id = NEW.competition_edition_id
				AND
				team_id = NEW.team_id
				AND
				trophy_id = NEW.trophy_id;
			
			IF (existence IS NOT NULL) THEN
				RETURN NEW;
			END IF;
		ELSE
			RETURN NEW;
		END IF;

	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_team_prize_case TRIGGER 
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
 * TYPE : TRIGGER FUNCTION - tg_bi_play TRIGGER 
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

	time_range	daterange;

BEGIN

	time_range = range_edition(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_play_statistic TRIGGER 
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

	tmp				text;
	id_player_pos	integer;
	id_pos			integer;

BEGIN

	tmp = get_column('fp_play', 'player_position_id', NEW.play_id);
	id_player_pos = CAST(tmp AS integer);

	tmp = get_column('fp_player_position', 'position_id', id_player_pos);
	id_pos = CAST(tmp AS integer);


	IF (pos_fit_stat(id_pos, statistic_id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

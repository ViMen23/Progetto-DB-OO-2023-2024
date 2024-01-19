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

	tmp				text;
	id_country_conf	integer;

BEGIN

	tmp = get_attr('confederation', 'country_id', NEW.super_id);
	id_country_conf = CAST(tmp AS integer);

	IF (corr_containment(NEW.country_id, id_country_conf)) THEN
		RETURN NEW
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

	name_team text;

BEGIN

	IF
	(
		is_nation(NEW.country_id)
		AND
		same_country_conf(NEW.country_id, NEW.confederation_id)
	)
	THEN
		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;
		ELSE
			name_team = national_team_name(NEW.country_id, NEW.age_cap, NEW.sex)
			IF (NEW.name = name_team) THEN
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

	type_country text;

BEGIN

	type_country = type_country_from_conf(NEW.confederation_id);

	IF ('NATION' = type_country AND 'NATIONAL' = NEW.team_type) THEN
		RETURN NULL;
	END IF
	
	RETURN NEW;
	
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
		RETURN NEW
	ELSE
		IF
		(
			corr_freq(NEW.competition_id, NEW.start_year)
			AND
			one_tier_edition(NEW.competition_id, NEW.start_year)
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

	tmp		text
	id_conf	integer;
	id_comp	integer;

BEGIN

	id_conf = conf_from_comp_ed(NEW.competition_edition_id);

	tmp = get_attr('competition_edition', 'competition_id', NEW.competition_edition_id);
	id_comp = CAST(tmp AS integer);

	IF
	(
		available(NEW.competition_edition_id)
		AND
		belong_to(NEW.team_id, id_conf)
		AND
		team_fit_comp(NEW.team_id, id_comp)
		-- TODO:
		-- dopo nuova definizione tipologia competizioni
		-- controllo per livello e tipo competizione nella confederazione
	)
	THEN
		RETURN NEW;
	END IF;
	
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

	-- TODO
	-- cambiamento tabella
	-- avere una tupla marcata non ha senso
	-- in ogni caso la nazionale scelta sara' l unica in cui potra giocare
	-- da discutere
	
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

	rec_team	record;
	rec_player	record;

	valid_range	daterange;

BEGIN

	rec_team = get_rec('team', NEW.team_id);
	rec_player = get_rec('player', NEW.player_id);

	IF (rec_team.sex = rec_player.sex) THEN

		valid_range = valid_daterange(rec_player.dob, rec_team.age_cap);

		IF ('CLUB' = rec_team.type) THEN

			IF
			(
				NEW.date_range <@ valid_range
				AND
				free_club_militancy(NEW.player_id, NEW.date_range)
			)
			THEN
				RETURN TRUE;
			END IF;

		ELSIF ('NATIONAL' = rec_team.type) THEN

			IF
			(
				lower(NEW.date_range) <@ valid_range
				AND
				free_national_militancy(NEW.player_id, rec_team.country_id, rec_team.age_cap)
			)
			THEN
				RETURN TRUE;
			END IF;

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

	type_tag = get_attr('tag', 'type', NEW.tag_id);

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

	type_attr	text;

BEGIN

	type_attr = get_attr('attribute', 'type', NEW.attribute_id);

	IF
	(
		type_attr <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_attr AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION - tg_bi_trophy_team_case TRIGGER 
 * NAME : tf_bi_trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_trophy_team_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;

BEGIN

	type_trohy = get_attr('trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trohy) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_trophy_player_case TRIGGER 
 * NAME : tf_bi_trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_trophy_player_case
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

	time_range = get_time_range(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN

		type_trohy = get_attr('trophy', 'type', NEW.trophy_id);

		IF ('TEAM' = type_trohy) THEN

			existence = NULL;

			SELECT
				id
			INTO
				existence
			FROM
				trophy_team_case
			WHERE
				competition_edition_id = NEW.competition_edition_id
				AND
				team_id = NEW.team_id
				AND
				player_id = NEW.player_id;
			
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
 * TYPE : TRIGGER FUNCTION - tg_bi_prize_team_case TRIGGER 
 * NAME : tf_bi_prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_prize_team_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_prize	text;

BEGIN

	type_prize = get_attr('prize', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trohy AND team_fit_prize(NEW.team_id, NEW.prize_id)) THEN
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

	time_range = get_time_range(NEW.competition_edition_id);

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
	id_player_pos	integer	

	id_pos			integer;

BEGIN

	tmp = get_attr('play', 'player_position_id', NEW.play_id);
	id_player_pos = CAST(tmp AS integer);

	tmp = get_attr('player_position', 'position_id', id_player_pos);
	id_pos = CAST(tmp AS integer);


	IF (pos_fit_stat(id_pos, statistic_id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TRIGGER
 ******************************************************************************/



/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation
BEFORE INSERT IN confederation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_confederation();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team
BEFORE INSERT IN team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition
BEFORE INSERT IN competition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition_edition
BEFORE INSERT IN competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition_edition();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_partecipation
BEFORE INSERT IN partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_partecipation();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT IN player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_nationality
BEFORE INSERT IN nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bi_nationality();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_militancy
BEFORE INSERT IN militancy
FOR EACH ROW
EXECUTE FUNCTION tf_bi_militancy();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_tag
BEFORE INSERT IN player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_tag();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_attribute
BEFORE INSERT IN player_attribute
FOR EACH ROW
EXECUTE FUNCTION tg_bi_player_attribute();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_trophy_team_case
BEFORE INSERT IN trophy_team_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_trophy_team_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_trophy_player_case
BEFORE INSERT IN trophy_player_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_trophy_player_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_prize_team_case
BEFORE INSERT IN prize_team_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_prize_team_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play
BEFORE INSERT IN play
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play_statistic
BEFORE INSERT IN play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------
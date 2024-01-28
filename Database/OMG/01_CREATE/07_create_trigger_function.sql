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
		fp_nationality
		(
			country_id,
			player_id
		)
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

	IF (role_fit_positions(NEW.id, NEW.role)) THEN
	
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

	retired_date	date;

	born_year		integer;

BEGIN

	IF (is_retired(NEW.id)) THEN

		tmp = get_column('fp_player_retired', 'retired_date', NEW.id);
		retired_date = CAST(tmp AS date);

		IF (NOT corr_age_limit(NEW.dob, retired_date)) THEN
		
			RETURN OLD;
		
		END IF;
	
	END IF;


	IF (has_militancy(NEW.id)) THEN

		born_year = extract year from NEW.dob;

		IF (min_militancy_year(NEW.id) - born_year < min_age()) THEN

			RETURN OLD;

		END IF;


		IF (NOT is_retired(NEW.id)) THEN

			IF (max_militancy_year(NEW.id) - born_year > max_age()) THEN

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
		fp_nationality
		(
			country_id,
			player_id
		)
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
BEGIN

	IF ((OLD.role LIKE '%GK%') AND (NEW.role NOT LIKE '%GK%')) THEN

		delete_gk_attribute(NEW.id);
		delete_gk_statistic(NEW.id);
		delete_gk_tag(NEW.id);

	END IF;
	

	delete_not_role_trophy(NEW.id, NEW.role);
	delete_not_role_prize(NEW.id, NEW.role);

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
			
			delete_national_militancy(OLD.player_id);
		
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

	tmp			text;

	start_valid	integer;
	end_valid	integer;

	type_team	text;

	role_player	text;

	id_country	integer;

BEGIN

	type_team = get_column('fp_team', 'type', NEW.team_id);

	role_player = get_column('fp_player', 'role', NEW.player_id);

	IF (NEW.team_type = type_team AND role_player IS NOT NULL) THEN

		valid_year_range(NEW.player_id, start_valid, end_valid);

		IF (NEW.start_year BETWEEN start_valid AND end_valid) THEN

			IF ('NATIONAL' = NEW.team_type) THEN

				tmp = get_column('fp_team', 'country_id', NEW.team_id);
				id_country = CAST(tmp AS integer);

				IF (NOT has_nationality(NEW.player_id, id_country)) THEN
					RETURN NULL;
				END IF;

				IF (is_national(NEW.player_id)) THEN

					IF (national_team(NEW.player_id) <> NEW.team_id) THEN
						RETURN NULL;
					END IF;

				END IF;

			END IF;

			IF (free_militancy(NEW.player_id, NEW.team_id, NEW.team_type, NEW.start_year)) THEN
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
 * NAME : tf_au_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_militancy
(
)
RETURNS trigger
AS
$$
BEGIN

	IF ('I PART' = OLD.type AND NEW.type <> 'I PART') THEN
		remove_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	ELSIF (OLD.type <> 'I PART' AND 'I PART' = NEW.type) THEN
		assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
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

	role_player	text;

BEGIN

	role_player = get_column('fp_player', 'role', NEW.player_id);

	IF (role_player LIKE '%GK%') THEN
		RETURN NEW;
	END IF;
	
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_player_position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_player_position
(
)
RETURNS trigger
AS
$$
DECLARE

	role_player		text;
	new_role_player	text;

BEGIN

	new_role_player = new_role(NEW.player_id);

	role_player = get_column('fp_player', 'role', NEW.player_id);

	IF (role_player IS NULL OR role_player <> new_role_player) THEN
		
		UPDATE
			fp_player
		SET
			role = new_role_player
		WHERE
			id = NEW.player_id;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_player_position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_player_position
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (position_number(OLD.player_id) > 1 OR OLD.player_id IS NULL) THEN
		RETURN OLD;
	END IF;

	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ad_player_position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ad_player_position
(
)
RETURNS trigger
AS
$$
DECLARE

	role_player		text;
	new_role_player	text;

BEGIN

	new_role_player = new_role(OLD.player_id);

	role_player = get_column('fp_player', 'role', OLD.player_id);

	IF (role_player IS NULL OR role_player <> new_role_player) THEN
		
		UPDATE
			fp_player
		SET
			role = new_role_player
		WHERE
			id = OLD.player_id;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
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

	role_player	text;

BEGIN

	role_player = get_column('fp_player', 'role', NEW.player_id);

	IF (role_player LIKE '%GK%') THEN
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
			fp_militancy
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

	type_militancy	text;

	type_trophy		text;
	role_trophy		text;

	role_player		text;

BEGIN

	type_militancy = get_type_militancy(NEW.player_id, NEW.team_id, NEW.start_year);

	IF (type_militancy <> 'I PART') THEN

		type_trophy = get_column('fp_trophy', 'type', NEW.trophy_id);

		IF ('TEAM' = type_trophy) THEN
		
			IF (team_has_trophy(NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id)) THEN
				RETURN NEW;
			END IF;
		
		ELSIF ('PLAYER' = type_trophy) THEN

			role_trophy = get_column('fp_trophy', 'role', NEW.trophy_id);
			role_player = get_column('fp_player', 'role', NEW.player_id);

			IF (position(role_trophy in role_player) > 0) THEN
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
 * NAME : tf_bd_player_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_player_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_militancy	text;

	type_trophy		text;
	role_trophy		text;

	role_player		text;

BEGIN

	type_trophy = get_column('fp_trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trophy) THEN

		type_militancy = get_type_militancy(NEW.player_id, NEW.team_id, NEW.start_year);
	
		IF
		(
			team_has_trophy(NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id)
			AND
			type_militancy <> 'I PART' 
		)
		THEN
			RETURN NULL;
		END IF;
	
	END IF;
	
	RETURN OLD;
	
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

	type_prize		text;
	role_prize		text;

	start_valid	integer;
	end_valid	integer;

BEGIN

	type_prize = get_column('fp_prize', 'type', NEW.prize_id);
	
	IF ('PLAYER' = type_prize) THEN

		valid_year_range(NEW.player_id, start_valid, end_valid);
	
		IF (NEW.assign_year BETWEEN start_valid AND end_valid) THEN

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

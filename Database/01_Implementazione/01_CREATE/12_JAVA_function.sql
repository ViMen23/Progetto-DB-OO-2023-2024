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
 * JAVA FUNCTION
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_admin_valid
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_admin_valid
(
    IN  username_admin  text,
    IN  password_admin  text
)
RETURNS boolean
AS
$$
BEGIN
	
    RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_admin
		WHERE
			fp_admin.username = username_admin
            AND
            fp_admin.password = password_admin
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_countries
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_countries
(
)
RETURNS integer
AS
$$
BEGIN
	
    RETURN
	(
		SELECT
			count(*)
		FROM
			fp_country
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_confederations
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_confederations
(
)
RETURNS integer
AS
$$
BEGIN
	
    RETURN
	(
		SELECT
			count(*)
		FROM
			fp_confederation
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_competitions
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_competitions
(
)
RETURNS integer
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*)
		FROM
			fp_competition
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_teams
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_teams
(
)
RETURNS integer
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*)
		FROM
			fp_team
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_players
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_players
(
)
RETURNS integer
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*)
		FROM
			fp_player
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_countries
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_countries
(
    IN  type_country        text,
    IN  id_super_country    text
)
RETURNS TABLE
        (
            country_id          text,
            country_type        text,
            country_code        text,
            country_name        text,
            super_country_id    text,
            super_country_name  text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        country_id          text    NOT NULL,
        country_type        text    NOT NULL,
        country_code        text    NOT NULL,
        country_name        text    NOT NULL,
        super_country_id    text            ,
        super_country_name  text
    );

    INSERT INTO
        output_table
    SELECT
        inner_country.id::text,
        inner_country.type::text,
        inner_country.code::text,
        inner_country.name::text,
        super_country.id::text,
        super_country.name::text
    FROM
        fp_country AS inner_country
        LEFT OUTER JOIN
        fp_country AS super_country
            ON
            inner_country.super_id = super_country.id
    WHERE
        TRUE;

    
    IF (type_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_type <> type_country;

    END IF;


    IF (id_super_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.super_country_id <> id_super_country;

    END IF;


    RETURN QUERY
        SELECT
            output_table.country_id,
            output_table.country_type,
            output_table.country_code,
            output_table.country_name,
            output_table.super_country_id,
            output_table.super_country_name
        FROM
            output_table
        WHERE
            TRUE
        ORDER BY
            output_table.country_name;
    

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------







/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_confederations
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_confederations
(
    IN  type_country    text,
    IN  id_super_conf   text
)
RETURNS TABLE
        (
            conf_id                 text,
            conf_short_name         text,
            conf_long_name          text,
            country_id              text,
            country_name            text,
            super_conf_id           text,
            super_conf_short_name   text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        conf_id                 text    NOT NULL,
        conf_short_name         text    NOT NULL,
        conf_long_name          text    NOT NULL,
        country_id              text    NOT NULL,
        country_name            text    NOT NULL,
        country_type            text    NOT NULL,
        super_conf_id           text            ,
        super_conf_short_name   text
    );

    INSERT INTO
        output_table
    SELECT
        inner_confederation.id::text,
        inner_confederation.short_name::text,
        inner_confederation.long_name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.type::text,
        super_confederation.id::text,
        super_confederation.short_name::text
    FROM
        fp_confederation AS inner_confederation
        JOIN
        fp_country
            ON
            inner_confederation.country_id = fp_country.id
        LEFT OUTER JOIN
        fp_confederation AS super_confederation
            ON
            inner_confederation.super_id = super_confederation.id
    WHERE
        TRUE;

    
    IF (type_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_type <> type_country;

    END IF;


    IF (id_super_conf IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.super_conf_id <> id_super_conf;

    END IF;


    RETURN QUERY
        SELECT
            output_table.conf_id,
            output_table.conf_short_name,
            output_table.conf_long_name,
            output_table.country_id,
            output_table.country_name,
            output_table.super_conf_id,
            output_table.super_conf_short_name
        FROM
            output_table
        ORDER BY
            output_table.conf_long_name;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_competitions
 *
 * IN      : text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_competitions
(
    IN  sub_name_comp   text,
    IN  type_comp       text,
    IN  type_team_comp  text,
    IN  type_country    text,
    IN  id_country      text
)
RETURNS TABLE
        (
            comp_id         text,
            comp_type       text,
            comp_type_team  text,
            comp_name       text,
            conf_id         text,
            conf_short_name text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        comp_id         text    NOT NULL,
        comp_type       text    NOT NULL,
        comp_type_team  text    NOT NULL,
        comp_name       text    NOT NULL,
        conf_id         text    NOT NULL,
        conf_short_name text    NOT NULL,
        country_id      text    NOT NULL,
        country_name    text    NOT NULL,
        country_type    text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_competition.id::text,
        fp_competition.type::text,
        fp_competition.team_type::text,
        fp_competition.name::text,
        fp_confederation.id::text,
        fp_confederation.short_name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.type::text
    FROM
        fp_competition
        JOIN
        fp_confederation
            ON
            fp_competition.confederation_id = fp_confederation.id
        JOIN
        fp_country
            ON
            fp_confederation.country_id = fp_country.id
    WHERE
		TRUE;


    IF (sub_name_comp IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_name_comp) IN lower(output_table.comp_name));

    END IF;


    IF (type_comp IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.comp_type <> type_comp;

    END IF;


    IF (type_team_comp IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.comp_type_team <> type_team_comp;
        
    END IF;


    IF (type_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_type <> type_country;

    END IF;


    IF (id_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_country;
        
    END IF;


    RETURN QUERY
        SELECT
            output_table.comp_id,
            output_table.comp_type,
            output_table.comp_type_team,
            output_table.comp_name,
            output_table.conf_id,
            output_table.conf_short_name,
            output_table.country_id,
            output_table.country_name
        FROM
            output_table
        WHERE
			TRUE
        ORDER BY
            output_table.comp_name;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_teams
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_teams
(
    IN  sub_long_name_team  text,
    IN  sub_short_name_team text,
    IN  type_team           text,
    IN  type_country        text,
    IN  id_country          text
)
RETURNS TABLE
        (
            team_id         text,
            team_type       text,
            team_short_name text,
            team_long_name  text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        team_id             text    NOT NULL,
        team_type           text    NOT NULL,
        team_short_name     text    NOT NULL,
        team_long_name      text    NOT NULL,
        country_id          text    NOT NULL,
        country_name        text    NOT NULL,
        country_type        text    NOT NULL,
        country_super_id    text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_team.id::text,
        fp_team.type::text,
        fp_team.short_name::text,
        fp_team.long_name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.type::text,
        fp_country.super_id::text
    FROM
        fp_team
        JOIN
        fp_country
            ON
            fp_team.country_id = fp_country.id
    WHERE
		TRUE;


    IF (sub_long_name_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_long_name_team) IN lower(output_table.team_long_name));

    END IF;


    IF (sub_short_name_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_short_name_team) IN lower(output_table.team_short_name));

    END IF;


    IF (type_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.team_type <> type_team;

    END IF;


    IF (type_country IS NOT NULL) THEN

        IF ('CONTINENT' = type_country AND id_country IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                output_table.country_super_id <> id_country;

        ELSIF ('NATION' = type_country AND id_country IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                output_table.country_id <> id_country;

        END IF;

    END IF;


    RETURN QUERY
        SELECT
            output_table.team_id,
            output_table.team_type,
            output_table.team_short_name,
            output_table.team_long_name,
            output_table.country_id,
            output_table.country_name
        FROM
            output_table
        WHERE
			TRUE
        ORDER BY
            output_table.team_long_name;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_players
 *
 * IN      : text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_players
(
    IN  sub_name_player     text,
    IN  sub_surname_player  text,
    IN  ref_year_player     text,
    IN  min_age_player      text,
    IN  max_age_player      text,
    IN  id_country          text,
    IN  role_player         text,
    IN  id_pos              text,
    IN  foot_player         text
)
RETURNS TABLE
        (
            player_id           text,
            player_name         text,
            player_surname      text,
            player_dob          text,
            player_foot         text,
            player_role         text,
            player_retired_date text,
            position_id         text,
            position_name       text,
            country_id          text,
            country_name        text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        player_id           text    NOT NULL,
        player_name         text    NOT NULL,
        player_surname      text    NOT NULL,
        player_dob          text    NOT NULL,
        player_foot         text    NOT NULL,
        player_role         text    NOT NULL,
        player_retired_date text            ,
        position_id         text    NOT NULL,
        position_name       text    NOT NULL,
        country_id          text    NOT NULL,
        country_name        text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_player.id::text,
        fp_player.name::text,
        fp_player.surname::text,
        fp_player.dob::text,
        fp_player.foot::text,
        fp_player.role::text,
        fp_player_retired.retired_date::text,
        fp_position.id::text,
        fp_position.name::text,
        fp_country.id::text,
        fp_country.name::text
    FROM
        fp_player
        LEFT OUTER JOIN
        fp_player_retired
            ON
            fp_player.id = fp_player_retired.player_id
        JOIN
        fp_position
            ON
            fp_player.position_id = fp_position.id
        JOIN
        fp_country
            ON
            fp_player.country_id = fp_country.id
    WHERE
        TRUE;


    IF (sub_name_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_name_player) IN lower(output_table.player_name));

    END IF;


    IF (sub_surname_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_surname_player) IN lower(output_table.player_surname));

    END IF;


    IF (ref_year_player IS NOT NULL) THEN

        IF (min_age_player IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                (ref_year_player::integer - extract(year from output_table.player_dob::date)) < min_age_player::integer;

        END IF;

        IF (max_age_player IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                (ref_year_player::integer - extract(year from output_table.player_dob::date)) > max_age_player::integer;
        
        END IF;

    END IF;


    IF (id_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_country;
        
    END IF;


    IF (role_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(role_player) IN lower(output_table.player_role::text));
        
    END IF;


    IF (id_pos IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.position_id <> id_pos;
        
    END IF;


    IF (foot_player IS NOT NULL) THEN

        IF ('RIGHT' = foot_player) THEN

            DELETE FROM
                output_table
            WHERE
                output_table.player_foot = 'LEFT';
            
        ELSIF ('LEFT' = foot_player) THEN

            DELETE FROM
                output_table
            WHERE
                output_table.player_foot = 'RIGHT';

        ELSE

            DELETE FROM
                output_table
            WHERE
                output_table.player_foot <> foot_player;

        END IF;
        
    END IF;


    RETURN QUERY
        SELECT
            *
        FROM
            output_table
        WHERE
            TRUE
        ORDER BY
            output_table.player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_militancy_players
 *
 * IN      : text, text, text
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_militancy_players
(
    IN  id_team_militancy   text,
    IN  s_year_militancy    text,
    IN  e_year_militancy    text
)
RETURNS TABLE
        (
            player_id           text,
            player_name         text,
            player_surname      text,
            player_dob          text,
            player_foot         text,
            player_role         text,
            player_retired_date text,
            position_id         text,
            position_name       text,
            country_id          text,
            country_name        text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.dob::text AS player_dob,
            fp_player.foot::text AS player_foot,
            fp_player.role::text AS player_role,
            fp_player_retired.retired_date::text AS player_retired_date,
            fp_position.id::text AS position_id,
            fp_position.name::text AS position_name,
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name
        FROM
            fp_player
            LEFT OUTER JOIN
            fp_player_retired
                ON
                fp_player.id = fp_player_retired.player_id
            JOIN
            fp_position
                ON
                fp_player.position_id = fp_position.id
            JOIN
            fp_country
                ON
                fp_player.country_id = fp_country.id
            JOIN
            fp_militancy
                ON
                fp_player.id = fp_militancy.player_id
        WHERE
            fp_militancy.team_id = id_team_militancy::integer
            AND
            fp_militancy.start_year BETWEEN s_year_militancy::integer AND e_year_militancy::integer
        ORDER BY
            player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : all_total_statistics
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_total_statistics
(
    IN  type_team   text,
    IN  role_player text
)
RETURNS TABLE
        (
            player_id       text,
            player_role     text,
            player_name     text,
            player_surname  text,
            match           text,
            goal_scored     text,
            assist          text,
            yellow_card     text,
            red_card        text,
            penalty_scored  text,
            goal_conceded   text,
            penalty_saved   text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        player_id       text    NOT NULL,
        player_role     text    NOT NULL,
        player_name     text    NOT NULL,
        player_surname  text    NOT NULL,
        match           text    NOT NULL,
        goal_scored     text    NOT NULL,
        assist          text    NOT NULL,
        yellow_card     text    NOT NULL,
        red_card        text    NOT NULL,
        penalty_scored  text    NOT NULL,
        goal_conceded   text            ,
        penalty_saved   text            ,
        team_type       text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_player.id::text,
        fp_player.role::text,
        fp_player.name::text,
        fp_player.surname::text,
        fp_play.match::text,
        fp_statistic_general.goal_scored::text,
        fp_statistic_general.assist::text,
        fp_statistic_general.yellow_card::text,
        fp_statistic_general.red_card::text,
        fp_statistic_general.penalty_scored::text,
        fp_statistic_goalkeeper.goal_conceded::text,
        fp_statistic_goalkeeper.penalty_saved::text,
        fp_competition.team_type::text
    FROM
        fp_player
        JOIN
        fp_play
            ON
            fp_player.id = fp_play.player_id
        JOIN
        fp_statistic_general
            ON
            fp_play.id = fp_statistic_general.play_id
        LEFT OUTER JOIN
        fp_statistic_goalkeeper
            ON
            fp_play.id = fp_statistic_goalkeeper.play_id
        JOIN
        fp_competition
            ON
            fp_play.competition_id = fp_competition.id
    WHERE
        TRUE;


    IF (type_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.team_type <> type_team::en_team;

    END IF;


    IF (role_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(role_player) IN lower(output_table.player_role::text));

    END IF;



    RETURN QUERY
        SELECT
            output_table.player_id AS player_id,
            output_table.player_role AS player_role,
            output_table.player_name AS player_name,
            output_table.player_surname AS player_surname,
            sum(output_table.match::integer)::text AS match,
            sum(output_table.goal_scored::integer)::text AS goal_scored,
            sum(output_table.assist::integer)::text AS assist,
            sum(output_table.yellow_card::integer)::text AS yellow_card,
            sum(output_table.red_card::integer)::text AS red_card,
            sum(output_table.penalty_scored::integer)::text AS penalty_scored,
            sum(output_table.goal_conceded::integer)::text AS goal_conceded,
            sum(output_table.penalty_saved::integer)::text AS penalty_saved
        FROM
            output_table
        GROUP BY
            output_table.player_id,
            output_table.player_role,
            output_table.player_name,
            output_table.player_surname
        ORDER BY
            player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
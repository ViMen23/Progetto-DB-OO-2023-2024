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
 * NAME : get_countries
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
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
            country_id      text,
            country_type    text,
            country_code    text,
            country_name    text
        )
AS
$$
BEGIN

    IF (('NATION' = type_country::en_country) AND (id_super_country IS NOT NULL)) THEN

        RETURN QUERY
            SELECT
                fp_country.id::text,
                fp_country.type::text,
                fp_country.code::text,
                fp_country.name::text
            FROM
                fp_country
            WHERE
                (
                    fp_country.type = 'NATION'
                    AND
                    fp_country.super_id = id_super_country::integer
                )
                OR
                (
                    fp_country.type = 'CONTINENT'
                    AND
                    fp_country.id = id_super_country::integer
                )
            ORDER BY
                fp_country.type DESC,
                fp_country.name;

    ELSIF ('CONTINENT' = type_country::en_country) THEN

        RETURN QUERY
            SELECT
                fp_country.id::text,
                fp_country.type::text,
                fp_country.code::text,
                fp_country.name::text
            FROM
                fp_country
            WHERE
                fp_country.type = 'CONTINENT'
                OR
                fp_country.type = 'WORLD'
            ORDER BY
                fp_country.type DESC,
                fp_country.name;

    ELSIF ('WORLD' = type_country::en_country) THEN

        RETURN QUERY
            SELECT
                fp_country.id::text,
                fp_country.type::text,
                fp_country.code::text,
                fp_country.name::text
            FROM
                fp_country
            WHERE
                fp_country.type = 'WORLD'
            ORDER BY
                fp_country.name;

    END IF;

    RETURN;

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
 * NAME : get_confederations
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text)
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
            conf_id         text,
            conf_short_name text,
            conf_long_name  text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    IF (('NATION' = type_country::en_country) AND (id_super_conf IS NOT NULL)) THEN

        RETURN QUERY
            SELECT
                fp_confederation.id::text,
                fp_confederation.short_name::text,
                fp_confederation.long_name::text,
                fp_country.id::text,
                fp_country.name::text
            FROM
                fp_confederation
                JOIN
                fp_country
                    ON
                    fp_confederation.country_id = fp_country.id
            WHERE
                (
                    fp_country.type = 'NATION'
                    AND
                    fp_confederation.super_id = id_super_conf::integer
                )
                OR
                (
                    fp_country.type = 'CONTINENT'
                    AND
                    fp_confederation.id = id_super_conf::integer
                )
            ORDER BY
                fp_country.type DESC,
                fp_confederation.short_name;

    ELSIF ('CONTINENT' = type_country::en_country) THEN

        RETURN QUERY
            SELECT
                fp_confederation.id::text,
                fp_confederation.short_name::text,
                fp_confederation.long_name::text,
                fp_country.id::text,
                fp_country.name::text
            FROM
                fp_confederation
                JOIN
                fp_country
                    ON
                    fp_confederation.country_id = fp_country.id
            WHERE
                fp_country.type = 'CONTINENT'
                OR
                fp_country.type = 'WORLD'
            ORDER BY
                fp_country.type DESC,
                fp_confederation.short_name;

    ELSIF ('WORLD' = type_country::en_country) THEN

        RETURN QUERY
            SELECT
                fp_confederation.id::text,
                fp_confederation.short_name::text,
                fp_confederation.long_name::text,
                fp_country.id::text,
                fp_country.name::text
            FROM
                fp_confederation
                JOIN
                fp_country
                    ON
                    fp_confederation.country_id = fp_country.id
            WHERE
                fp_country.type = 'WORLD'
            ORDER BY
                fp_confederation.short_name;

    END IF;

	RETURN;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_competitions
 *
 * IN      : text, text, text, text
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
        country_name    text    NOT NULL
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
        fp_country.name::text
    FROM
        fp_competition
        JOIN
        fp_confederation
            ON
            fp_competition.confederation_id = fp_confederation.id
        JOIN
        fp_country
            ON
            fp_confederation.country_id = fp_country.id;


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


    IF (id_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_country;
        
    END IF;


    RETURN QUERY
        SELECT
            *
        FROM
            output_table
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
        team_id         text    NOT NULL,
        team_type       text    NOT NULL,
        team_short_name text    NOT NULL,
        team_long_name  text    NOT NULL,
        country_id      text    NOT NULL,
        country_name    text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_team.id::text,
        fp_team.type::text,
        fp_team.short_name::text,
        fp_team.long_name::text,
        fp_country.id::text,
        fp_country.name::text
    FROM
        fp_team
        JOIN
        fp_country
            ON
            fp_team.country_id = fp_country.id;


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


    IF (id_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_country;
        
    END IF;


    RETURN QUERY
        SELECT
            *
        FROM
            output_table
        ORDER BY
            output_table.team_long_name;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


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
        JOIN
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
            fp_player.country_id = fp_country.id;


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
                (extract(year from output_table.player_dob) - ref_year_player::integer) < min_age_player;

        END IF;

        IF (max_age_player IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                (extract(year from output_table.player_dob) - ref_year_player::integer) > max_age_player;
        
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
        ORDER BY
            output_table.player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
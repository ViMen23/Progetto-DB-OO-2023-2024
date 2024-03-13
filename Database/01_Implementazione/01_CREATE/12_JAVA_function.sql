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
 * JAVA FUNCTION OUTPUT
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_admin
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Valuta se l'username e password in ingresso sono di un admin
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_admin
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
			fp_admin.username = username_admin::dm_username
            AND
            fp_admin.password = password_admin::dm_password
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_country
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di paesi
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_country
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
 * NAME : count_confederation
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di confederazioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_confederation
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
 * NAME : count_competition
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di competizioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_competition
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
 * NAME : count_team
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_team
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
 * NAME : count_player
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di calciatori
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_player
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
 * NAME : search_country
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti i paesi.
 *        I paesi in output possono essere cercati per:
 *         - tipologia
 *         - paese superiore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_country
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
 * NAME : search_confederation
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti le confederazioni calcistiche.
 *        Le confederazioni in output possono essere cercate per:
 *         - tipologia
 *         - confederazione superiore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_confederation
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
            country_type            text,
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
            output_table.country_type,
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
 * NAME : search_competition
 *
 * IN      : text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti le competizioni calcistiche.
 *        Le competizioni in output possono essere cercate per:
 *         - sottostringa del nome
 *         - tipologia
 *         - tipologia squadra di calcio che puo' parteciparvi
 *         - tipologia paese
 *         - continente di appartenenza
 *         - nazione di appartenenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_competition
(
    IN  sub_name_comp   text,
    IN  type_comp       text,
    IN  type_team_comp  text,
    IN  type_country    text,
    IN  id_continent    text,
    IN  id_nation       text
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
        comp_id             text    NOT NULL,
        comp_type           text    NOT NULL,
        comp_type_team      text    NOT NULL,
        comp_name           text    NOT NULL,
        conf_id             text    NOT NULL,
        conf_short_name     text    NOT NULL,
        country_id          text    NOT NULL,
        country_name        text    NOT NULL,
        country_type        text    NOT NULL,
	    country_super_id	text
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
        fp_country.type::text,
		fp_country.super_id::text
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

        
        IF (id_continent IS NOT NULL) THEN

            IF ('CONTINENT' = type_country) THEN

                DELETE FROM
                    output_table
                WHERE
                    output_table.country_id <> id_continent;

            ELSIF ('NATION' = type_country) THEN

                DELETE FROM
                    output_table
                WHERE
                    output_table.country_super_id <> id_continent;

                IF (id_nation IS NOT NULL) THEN

                    DELETE FROM
                        output_table
                    WHERE
                        output_table.country_id <> id_nation;

                END IF;

            END IF;

        END IF;

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
 * NAME : filter_competition_edition
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce tutte le edizioni di una competizione calcistica in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION filter_competition_edition
(
    IN  id_comp text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition_edition.start_year::text
        FROM
            fp_competition_edition
        WHERE
            fp_competition_edition.competition_id = id_comp::integer
        ORDER BY
            fp_competition_edition.start_year DESC;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_player
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni per squadre club
 *        o per squadre nazionali giocate da un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_player
(
    IN  id_player       text,
    IN  type_team_comp  text
)
RETURNS TABLE
        (
            comp_id     text,
            comp_name   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name
        FROM
            fp_play
            JOIN
            fp_competition
                ON
                fp_play.competition_id = fp_competition.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team_comp::en_team
        ORDER BY
            comp_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_player_season
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni per squadre club
 *        o per squadre nazionali giocate da un calciatore in una stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_player_season
(
    IN  id_player   text,
    IN  type_team   text,
    IN  s_year      text
)
RETURNS TABLE
        (
            comp_id     text,
            comp_name   text
        )
AS
$$
BEGIN

    
    RETURN QUERY
        SELECT DISTINCT
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name
        FROM
            fp_play
            JOIN
            fp_competition
                ON
                fp_play.competition_id = fp_competition.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team::en_team
            AND
            fp_play.start_year = s_year::dm_year
        ORDER BY
            comp_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_team
 *
 * IN      : text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti le squadre di calcio.
 *        Le squadre in output possono essere cercate per:
 *         - sottostringa del nome esteso
 *         - sottostringa del nome abbreviato
 *         - tipologia
 *         - continente di appartenenza
 *         - nazione di appartenenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_team
(
    IN  sub_long_name_team  text,
    IN  sub_short_name_team text,
    IN  type_team           text,
    IN  id_continent        text,
    IN  id_nation           text
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


    IF (id_continent IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_super_id <> id_continent;

    END IF;


    IF (id_nation IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_nation;

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
 * NAME : filter_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardanti le squadre di calcio.
 *        Le squadre in output devono essere filtrate per:
 *         - stagione
 *         - competizione cui partecipano
 ******************************************************************************/
CREATE OR REPLACE FUNCTION filter_team
(
    IN  s_year  text,
    IN  id_comp text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_partecipation
            JOIN
            fp_team
                ON
                fp_partecipation.team_id = fp_team.id
            JOIN
            fp_country
                ON
                fp_team.country_id = fp_country.id
        WHERE
            fp_partecipation.start_year = s_year::integer
            AND
            fp_partecipation.competition_id = id_comp::integer
        ORDER BY
            fp_team.long_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : club_team_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce tutte le squadre di calcio di tipo club in cui il
 *        calciatore in input ha giocato effettivamente
 ******************************************************************************/
CREATE OR REPLACE FUNCTION club_team_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_team.type = 'CLUB'
        ORDER BY
            team_long_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : year_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce tutti gli anni nei quali una squadra di calcio ha militanze
 *        di calciatori o partecipazioni a competizioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION year_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            years.start_year::text AS start_year
        FROM
            (
                (
                    SELECT
                        fp_militancy.start_year
                    FROM
                        fp_militancy
                    WHERE
                        fp_militancy.team_id = id_team::integer
                )
                UNION
                (
                    SELECT
                        fp_partecipation.start_year
                    FROM
                        fp_partecipation
                    WHERE
                        fp_partecipation.team_id = id_team::integer
                )
            ) AS years
        ORDER BY start_year DESC;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : info_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce tutte le informazioni riguardanti una squadra di calcio
 *        in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION info_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            team_id         text,
            team_type       text,
            team_short_name text,
            team_long_name  text,
            country_id      text,
            country_name    text,
            conf_id         text,
            conf_short_name text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id,
            fp_team.type::text AS team_type,
            fp_team.short_name::text AS team_short_name,
            fp_team.long_name::text AS team_long_name,
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name,
            fp_confederation.id::text AS conf_id,
            fp_confederation.short_name::text AS conf_short_name
        FROM
            fp_team
            JOIN
            fp_country
                ON
                fp_team.country_id = fp_country.id
            JOIN
            fp_confederation
                ON
                fp_country.id = fp_confederation.country_id
        WHERE
            fp_team.id = id_team::integer;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : partecipation_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni calcistiche
 *        cui partecipa una squadra di calcio in una specifica stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION partecipation_team
(
    IN  id_team text,
    IN  s_year  text
)
RETURNS TABLE
        (
            comp_id         text,
            comp_type       text,
            comp_name       text,
            conf_id         text,
            conf_short_name text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition.id::text AS comp_id,
            fp_competition.type::text AS comp_type,
            fp_competition.name::text AS comp_name,
            fp_confederation.id::text AS conf_id,
            fp_confederation.short_name::text AS conf_short_name
        FROM
            fp_partecipation
            JOIN
            fp_competition
                ON
                fp_partecipation.competition_id = fp_competition.id
            JOIN
            fp_confederation
                ON
                fp_competition.confederation_id = fp_confederation.id
        WHERE
            fp_partecipation.team_id = id_team::integer
            AND
            fp_partecipation.start_year = s_year::integer;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : trophy_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i trofei calcistici vinti da
 *        una squadra di calcio in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION trophy_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            trophy_id       text,
            trophy_name     text,
            comp_id         text,
            comp_start_year text,
            comp_name       text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_trophy.id::text AS trophy_id,
            fp_trophy.name::text AS trophy_name,
            fp_competition.id::text AS comp_id,
            fp_team_trophy_case.start_year::text AS comp_start_year,
            fp_competition.name::text AS comp_name
        FROM
            fp_team_trophy_case
            JOIN
            fp_trophy
                ON
                 fp_team_trophy_case.trophy_id = fp_trophy.id
            JOIN
            fp_competition
                ON
                fp_team_trophy_case.competition_id = fp_competition.id
        WHERE
            fp_team_trophy_case.team_id = id_team::integer
        ORDER BY
            fp_team_trophy_case.start_year DESC,
            fp_competition.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : prize_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i premi calcistici vinti da
 *        una squadra di calcio in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION prize_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            prize_id            text,
            prize_assign_year   text,
            prize_name          text,
            prize_given         text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_prize.id::text AS prize_id,
            fp_team_prize_case.assign_year::text AS prize_assign_year,
            fp_prize.name::text AS prize_name,
            fp_prize.given::text AS prize_given
        FROM
            fp_team_prize_case
            JOIN
            fp_prize
                ON
                 fp_team_prize_case.prize_id = fp_prize.id
        WHERE
            fp_team_prize_case.team_id = id_team::integer
        ORDER BY
            fp_team_prize_case.assign_year DESC,
            fp_prize.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : squad_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo la rosa di una squadra di calcio
 *        in una specifica stagione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION squad_team
(
    IN  id_team text,
    IN  s_year  text
)
RETURNS TABLE
        (
            player_id       text,
            player_name     text,
            player_surname  text,
            player_role     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.role::text AS player_role
        FROM
            fp_militancy
            JOIN
            fp_player
                ON
                 fp_militancy.player_id = fp_player.id
        WHERE
            fp_militancy.team_id = id_team::integer
            AND
            fp_militancy.start_year = s_year::integer
        ORDER BY
            fp_player.role;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_player
 *
 * IN      : text, text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti i calciatori.
 *        I calciatori in output possono essere cercati per:
 *         - sottostringa del nome
 *         - sottostringa del cognome
 *         - range eta
 *         - continente di nascita
 *         - nazione di nascita
 *         - ruolo
 *         - posizione principale
 *         - piede preferito
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_player
(
    IN  sub_name_player     text,
    IN  sub_surname_player  text,
    IN  ref_year_player     text,
    IN  min_age_player      text,
    IN  max_age_player      text,
    IN  id_continent        text,
    IN  id_nation           text,
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
        country_name        text    NOT NULL,
        country_super_id    text    NOT NULL
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
        fp_country.name::text,
        fp_country.super_id::text
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


    IF (id_continent IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_super_id <> id_continent;

    END IF;


    IF (id_nation IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_nation;

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
            output_table.player_id,
            output_table.player_name,
            output_table.player_surname,
            output_table.player_dob,
            output_table.player_foot,
            output_table.player_role,
            output_table.player_retired_date,
            output_table.position_id,
            output_table.position_name,
            output_table.country_id,
            output_table.country_name
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
 * NAME : filter_player
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardanti i calciatori.
 *        I calciatori in output devono essere filtrati per:
 *         - anno militanza
 *         - squadra di calcio in cui militano
 ******************************************************************************/
CREATE OR REPLACE FUNCTION filter_player
(
    IN  s_year  text,
    IN  id_team text
)
RETURNS TABLE
        (
            player_id       text,
            player_name     text,
            player_surname  text,
            player_role     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.role::text AS player_role
        FROM
            fp_militancy
            JOIN
            fp_player
                ON
                fp_militancy.player_id = fp_player.id
        WHERE
            fp_militancy.start_year = s_year::integer
            AND
            fp_militancy.team_id = id_team::integer
        ORDER BY
            fp_player.role,
            fp_player.surname;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : season_play
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce tutte le stagioni calcistiche in cui il calciatore
 *        ha giocato in una squadra di calcio club o nazionale
 ******************************************************************************/
CREATE OR REPLACE FUNCTION season_play
(
    IN  id_player   text,
    IN  type_team   text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_play.start_year::text AS start_year
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_team.type = type_team::en_team
        ORDER BY
            start_year DESC;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : info_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce tutte le informazioni riferite ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION info_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            player_id           text,
            player_name         text,
            player_surname      text,
            player_dob          text,
            country_name        text,
            player_foot         text,
            position_name       text,
            player_role         text,
            player_retired_date text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.dob::text AS player_dob,
            fp_country.name::text AS country_name,
            fp_player.foot::text AS player_foot,
            fp_position.name::text AS position_name,
            fp_player.role::text AS player_role,
            fp_player_retired.retired_date::text AS player_retired_date
        FROM
            fp_player
            JOIN
            fp_country
                ON
                fp_player.country_id = fp_country.id
            JOIN
            fp_position
                ON
                fp_player.position_id = fp_position.id
            LEFT OUTER JOIN
            fp_player_retired
                ON
                fp_player.id = fp_player_retired.player_id
        WHERE
            fp_player.id = id_player::integer;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : position_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo tutte le posizioni di gioco
 *        associate ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION position_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            position_id     text,
            position_role   text,
            position_code   text,
            position_name   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_position.id::text AS position_id,
            fp_position.role::text AS position_role,
            fp_position.code::text AS position_code,
            fp_position.name::text AS position_name
        FROM
            fp_player_position
            JOIN
            fp_position
                ON
                fp_player_position.position_id = fp_position.id
        WHERE
            fp_player_position.player_id = id_player::integer
        ORDER BY
            fp_position.role,
            fp_position.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : nationality_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo tutte le nazionalita'
 *        associate ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION nationality_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name
        FROM
            fp_nationality
            JOIN
            fp_country
                ON
                fp_nationality.country_id = fp_country.id
        WHERE
            fp_nationality.player_id = id_player::integer
        ORDER BY
            fp_country.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_militancy_player
 *
 * IN      : text, text, text
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti i calciatori.
 *        I calciatori in output possono essere cercati per:
 *         - squadra in cui hanno militato
 *         - range di militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_militancy_player
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

    IF (s_year_militancy IS NULL) THEN

        s_year_militancy = '1810';
    
    END IF;


    IF (e_year_militancy IS NULL) THEN

        e_year_militancy = extract(year from current_date)::text;
    
    END IF;


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
 * NAME : total_statistic
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce le statistiche totali di calciatori.
 *        Le statistiche possono essere filtrate per:
 *         - tipologia di squadra di calcio
 *         - ruolo del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION total_statistic
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
            penalty_scored  text,
            assist          text,
            yellow_card     text,
            red_card        text,
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
        penalty_scored  text    NOT NULL,
        assist          text    NOT NULL,
        yellow_card     text    NOT NULL,
        red_card        text    NOT NULL,
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
        fp_statistic_general.penalty_scored::text,
        fp_statistic_general.assist::text,
        fp_statistic_general.yellow_card::text,
        fp_statistic_general.red_card::text,
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
            output_table.team_type <> type_team;

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


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_edition_statistic
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce le statistiche di gioco riferite ad una specifica
 *        edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_edition_statistic
(
    IN  s_year  text,
    IN  id_comp text
)
RETURNS TABLE
        (
            team_id                     text,
            team_long_name              text,
            player_id                   text,
            player_role                 text,
            player_name                 text,
            player_surname              text,
            match                       text,
            goal_scored                 text,
            penalty_scored              text,
            assist                      text,
            yellow_card                 text,
            red_card                    text,
            goal_conceded               text,
            penalty_saved               text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_player.id::text AS player_id,
            fp_player.role::text AS player_role,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_play.match::text AS match,
            fp_statistic_general.goal_scored::text AS goal_scored,
            fp_statistic_general.penalty_scored::text AS penalty_scored,
            fp_statistic_general.assist::text AS assist,
            fp_statistic_general.yellow_card::text AS yellow_card,
            fp_statistic_general.red_card::text AS red_card,
            fp_statistic_goalkeeper.goal_conceded::text AS goal_conceded,
            fp_statistic_goalkeeper.penalty_saved::text AS penalty_saved
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
            JOIN
            fp_player
                ON
                fp_play.player_id = fp_player.id
            JOIN
            fp_statistic_general
                ON
                fp_play.id = fp_statistic_general.play_id
            LEFT OUTER JOIN
            fp_statistic_goalkeeper
                ON
                fp_play.id = fp_statistic_goalkeeper.play_id
        WHERE
            fp_play.start_year = s_year::integer
            AND
            fp_play.competition_id = id_comp::integer
        ORDER BY
            fp_player.surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : prize_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i premi calcistici vinti da
 *        un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION prize_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            prize_id    text,
            prize_year  text,
            prize_name  text,
            prize_given text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_prize.id::text AS prize_id,
            fp_player_prize_case.assign_year::text AS prize_year,
            fp_prize.name::text AS prize_name,
            fp_prize.given::text AS prize_given
        FROM
            fp_player_prize_case
            JOIN
            fp_prize
                ON
                fp_player_prize_case.prize_id = fp_prize.id
        WHERE
            fp_player_prize_case.player_id = id_player::integer
        ORDER BY
            fp_player_prize_case.assign_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : trophy_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i trofei calcistici vinti da
 *        un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION trophy_player
(
    IN  id_player   text,
    IN  type_team   text
)
RETURNS TABLE
        (
            comp_start_year text,
            comp_id         text,
            comp_name       text,
            team_id         text,
            team_long_name  text,
            trophy_name     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player_trophy_case.start_year::text AS comp_start_year,
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_trophy.name::text AS trophy_name
        FROM
            fp_player_trophy_case
            JOIN
            fp_trophy
                ON
                fp_player_trophy_case.trophy_id = fp_trophy.id
            JOIN
            fp_team
                ON
                fp_player_trophy_case.team_id = fp_team.id
            JOIN
            fp_competition
                ON
                fp_player_trophy_case.competition_id = fp_competition.id
        WHERE
            fp_player_trophy_case.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team::en_team
        ORDER BY
            fp_player_trophy_case.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_goalkeeping
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_goalkeeping
(
    IN  id_player text
)
RETURNS TABLE
        (
            aerial_reach			text,
            command_of_area			text,
            communication			text,
            eccentricity			text,
            first_touch_gk			text,
            handling				text,
            kicking					text,
            one_on_ones				text,
            passing_gk				text,
            punching_tendency		text,
            reflexes				text,
            rushing_out_tendency	text,
            throwing				text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_attribute_goalkeeping.aerial_reach::text,
            fp_attribute_goalkeeping.command_of_area::text,
            fp_attribute_goalkeeping.communication::text,
            fp_attribute_goalkeeping.eccentricity::text,
            fp_attribute_goalkeeping.first_touch_gk::text,
            fp_attribute_goalkeeping.handling::text,
            fp_attribute_goalkeeping.kicking::text,
            fp_attribute_goalkeeping.one_on_ones::text,
            fp_attribute_goalkeeping.passing_gk::text,
            fp_attribute_goalkeeping.punching_tendency::text,
            fp_attribute_goalkeeping.reflexes::text,
            fp_attribute_goalkeeping.rushing_out_tendency::text,
            fp_attribute_goalkeeping.throwing::text
        FROM
            fp_attribute_goalkeeping
        WHERE
            fp_attribute_goalkeeping.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_mental
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_mental
(
    IN  id_player text
)
RETURNS TABLE
        (
            aggression		text,
            anticipation	text,
            bravery			text,
            composure		text,
            concentration	text,
            decision		text,
            determination	text,
            flair			text,
            leadership		text,
            off_the_ball	text,
            positioning		text,
            teamwork		text,
            vision			text,
            work_rate		text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_attribute_mental.aggression::text,
            fp_attribute_mental.anticipation::text,
            fp_attribute_mental.bravery::text,
            fp_attribute_mental.composure::text,
            fp_attribute_mental.concentration::text,
            fp_attribute_mental.decision::text,
            fp_attribute_mental.determination::text,
            fp_attribute_mental.flair::text,
            fp_attribute_mental.leadership::text,
            fp_attribute_mental.off_the_ball::text,
            fp_attribute_mental.positioning::text,
            fp_attribute_mental.teamwork::text,
            fp_attribute_mental.vision::text,
            fp_attribute_mental.work_rate::text
        FROM
            fp_attribute_mental
        WHERE
            fp_attribute_mental.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_physical
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_physical
(
    IN  id_player text
)
RETURNS TABLE
        (
            acceleration	text,
            agility			text,
            balance			text,
            jumping_reach	text,
            natural_fitness	text,
            pace			text,
            stamina			text,
            strength		text
        )
AS
$$
BEGIN

            
    RETURN QUERY
        SELECT
            fp_attribute_physical.acceleration::text,
            fp_attribute_physical.agility::text,
            fp_attribute_physical.balance::text,
            fp_attribute_physical.jumping_reach::text,
            fp_attribute_physical.natural_fitness::text,
            fp_attribute_physical.pace::text,
            fp_attribute_physical.stamina::text,
            fp_attribute_physical.strength::text
        FROM
            fp_attribute_physical
        WHERE
            fp_attribute_physical.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_technical
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_technical
(
    IN  id_player text
)
RETURNS TABLE
        (
            corners				text,
            crossing			text,
            dribbling			text,
            finishing			text,
            first_touch			text,
            free_kick_taking	text,
            heading				text,
            long_shots			text,
            long_throws			text,
            marking				text,
            passing				text,
            penalty_taking		text,
            tackling			text,
            technique			text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_attribute_technical.corners::text,
            fp_attribute_technical.crossing::text,
            fp_attribute_technical.dribbling::text,
            fp_attribute_technical.finishing::text,
            fp_attribute_technical.first_touch::text,
            fp_attribute_technical.free_kick_taking::text,
            fp_attribute_technical.heading::text,
            fp_attribute_technical.long_shots::text,
            fp_attribute_technical.long_throws::text,
            fp_attribute_technical.marking::text,
            fp_attribute_technical.passing::text,
            fp_attribute_technical.penalty_taking::text,
            fp_attribute_technical.tackling::text,
            fp_attribute_technical.technique::text  
        FROM
            fp_attribute_technical
        WHERE
            fp_attribute_technical.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_tag_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_tag_player
(
    IN  id_player text
)
RETURNS TABLE
        (
            tag_id      text,
            tag_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_tag.id::text AS tag_id,
            fp_tag.name::text AS tag_name
        FROM
            fp_player_tag
            JOIN
            fp_tag
                ON
                fp_player_tag.tag_id = fp_tag.id
        WHERE
            fp_player_tag.player_id = id_player::integer
        ORDER BY
            fp_tag.name;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_club_career_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_club_career_player
(
    IN  id_player text
)
RETURNS TABLE
        (
            militancy_year  text,
            militancy_type  text,
            team_id         text,
            team_long_name  text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_militancy.start_year::text AS militancy_year,
            fp_militancy.type::text AS militancy_type,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name
        FROM
            fp_militancy
            JOIN
            fp_team
                ON
                fp_militancy.team_id = fp_team.id
            JOIN
            fp_country
                ON
                fp_team.country_id = fp_country.id
        WHERE
            fp_militancy.player_id = id_player::integer
            AND
            fp_militancy.team_type = 'CLUB'
        ORDER BY
            fp_militancy.start_year DESC,
            fp_militancy.type DESC;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_national_career_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_national_career_player
(
    IN  id_player text
)
RETURNS TABLE
        (
            militancy_year  text,
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_militancy.start_year::text AS militancy_year,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_militancy
            JOIN
            fp_team
                ON
                fp_militancy.team_id = fp_team.id
        WHERE
            fp_militancy.player_id = id_player::integer
            AND
            fp_militancy.team_type = 'NATIONAL'
        ORDER BY
            fp_militancy.start_year DESC;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_statistic_player
 *
 * IN      : text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_statistic_player
(
    IN  id_player           text,
    IN  type_team           text,
    IN  id_team             text,
    IN  id_comp             text,
    IN  s_year_militancy    text,
    IN  e_year_militancy    text
)
RETURNS TABLE
        (
            start_year      text,
            comp_id         text,
            comp_name       text,
            team_id         text,
            team_long_name  text,
            match           text,
            goal_scored     text,
            penalty_scored  text,
            assist          text,
            yellow_card     text,
            red_card        text,
            goal_conceded   text,
            penalty_saved   text
        )
AS
$$
BEGIN

    IF (s_year_militancy IS NULL) THEN

        s_year_militancy = '1810';
    
    END IF;


    IF (e_year_militancy IS NULL) THEN

        e_year_militancy = extract(year from current_date)::text;
    
    END IF;


    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        start_year      text    NOT NULL,
        comp_id         text    NOT NULL,
        comp_name       text    NOT NULL,
        team_id         text    NOT NULL,
        team_long_name  text    NOT NULL,
        match           text    NOT NULL,
        goal_scored     text    NOT NULL,
        penalty_scored  text    NOT NULL,
        assist          text    NOT NULL,
        yellow_card     text    NOT NULL,
        red_card        text    NOT NULL,
        goal_conceded   text            ,
        penalty_saved   text            
    );

    INSERT INTO output_table
    SELECT
        fp_play.start_year::text,
        fp_competition.id::text,
        fp_competition.name::text,
        fp_team.id::text,
        fp_team.long_name::text,
        fp_play.match::text,
        fp_statistic_general.goal_scored::text,
        fp_statistic_general.penalty_scored::text,
        fp_statistic_general.assist::text,
        fp_statistic_general.yellow_card::text,
        fp_statistic_general.red_card::text,
        fp_statistic_goalkeeper.goal_conceded::text,
        fp_statistic_goalkeeper.penalty_saved::text
    FROM
        fp_militancy
        JOIN
        fp_play
            ON
            fp_militancy.start_year = fp_play.start_year
            AND
            fp_militancy.team_id = fp_play.team_id
            AND
            fp_militancy.player_id = fp_play.player_id
        JOIN
        fp_competition
            ON
            fp_play.competition_id = fp_competition.id
        JOIN
        fp_team
            ON
            fp_play.team_id = fp_team.id
        JOIN
        fp_statistic_general
            ON
            fp_play.id = fp_statistic_general.play_id
        LEFT OUTER JOIN
        fp_statistic_goalkeeper
            ON
            fp_play.id = fp_statistic_goalkeeper.play_id
    WHERE
        fp_militancy.player_id = id_player::integer
        AND
        fp_militancy.team_type = type_team::en_team
        AND
        fp_militancy.start_year BETWEEN s_year_militancy::integer AND e_year_militancy::integer
    ORDER BY
        fp_militancy.start_year DESC,
        fp_militancy.type DESC;


    IF (id_team IS NOT NULL) THEN

       DELETE FROM
            output_table
        WHERE
            output_table.team_id <> id_team;

    END IF;


    IF (id_comp IS NOT NULL) THEN

       DELETE FROM
            output_table
        WHERE
            output_table.comp_id <> id_comp;

    END IF;



    RETURN QUERY
        SELECT
            output_table.start_year,
            output_table.comp_id,
            output_table.comp_name,
            output_table.team_id,
            output_table.team_long_name,
            output_table.match,
            output_table.goal_scored,
            output_table.penalty_scored,
            output_table.assist,
            output_table.yellow_card,
            output_table.red_card,
            output_table.goal_conceded,
            output_table.penalty_saved
        FROM
            output_table
        WHERE
			TRUE;

        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * JAVA FUNCTION ADMIN
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_team_confederation
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_team_confederation
(
    IN  team_id text
)
RETURNS TABLE
        (
            super_super_conf_id text,
            super_conf_id       text,
            conf_id             text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            conf2.super_id::text AS super_super_conf_id,
            conf1.super_id::text AS super_conf_id,
            conf1.id::text AS conf_id
        FROM
            fp_confederation AS conf1
            JOIN
            fp_confederation AS conf2
                ON
                conf1.super_id = conf2.id
        WHERE conf1.id = (SELECT
                                fp_confederation.id
                            FROM
                                fp_confederation
                            WHERE
                                fp_confederation.country_id = (SELECT
                                                                    fp_team.country_id
                                                                FROM
                                                                    fp_team
                                                                WHERE
                                                                    fp_team.id = team_id::integer));
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_national_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_national_team
(
    IN  id_country  text
)
RETURNS text
AS
$$
DECLARE

	name_country    text;
    code_country    text;
    count_row       integer;
    output_message  text;

BEGIN

	SELECT
        fp_country.name::text,
        fp_country.code::text
    INTO
        name_country,
        code_country
    FROM
        fp_country
    WHERE
        fp_country.id = id_country::integer;



	INSERT INTO
		fp_team
		(
			type,
			country_id,
			long_name,
			short_name
		)
	VALUES
	(
		'NATIONAL',
		id_country::integer,
		name_country::dm_alnum,
		code_country::dm_code
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;


	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertNationalTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_club_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_club_team
(
    IN  id_country      text,
    IN  long_name_team  text,
    IN  short_name_team text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_team
		(
			type,
			country_id,
			long_name,
			short_name
		)
	VALUES
	(
		'CLUB',
		id_country::integer,
		long_name_team::dm_alnum,
		short_name_team::dm_code
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertClubTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_club_team
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_club_team
(
    IN  id_team         text,
    IN  long_name_team  text,
    IN  short_name_team text
)
RETURNS text
AS
$$
DECLARE

    conflict        boolean;
    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        count(*) >= 1
    INTO
        conflict
    FROM
        fp_team
    WHERE
        fp_team.type = 'CLUB'
        AND
        fp_team.long_name = long_name_team::dm_alnum
        AND
        fp_team.id <> id_team::integer;


    IF (conflict) THEN
        output_message = 'errorMessageUpdateClubTeamConflict';
        RETURN output_message;
    END IF;


	UPDATE
		fp_team
	SET
        long_name = long_name_team,
        short_name = short_name_team
	WHERE
        id = id_team::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateClubTeam';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_team
(
    IN  id_team text
)
RETURNS text
AS
$$
DECLARE

    partecipation   boolean;
    militancy       boolean;
    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        count(*) >= 1
    INTO
        partecipation
    FROM
        fp_partecipation
    WHERE
        fp_partecipation.team_id = id_team::integer;
    

    SELECT
        count(*) >= 1
    INTO
        militancy
    FROM
        fp_militancy
    WHERE
        fp_militancy.team_id = id_team::integer;


    IF (partecipation OR militancy) THEN
        output_message = 'errorMessageDeleteTeamReference';
        RETURN output_message;
    END IF;



	DELETE FROM
		fp_team
	WHERE
        id = id_team::integer;	
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteTeam';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_partecipation
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_partecipation
(
    IN  id_team         text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_partecipation
		(
			start_year,
            competition_id,
            team_id
		)
	VALUES
	(
		start_year_comp::dm_year,
		id_comp::integer,
        id_team::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPartecipation';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_partecipation
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_partecipation
(
    IN  id_team         text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_partecipation
	WHERE
		fp_partecipation.start_year = start_year_comp::dm_year
        AND
		fp_partecipation.competition_id = id_comp::integer
        AND
        fp_partecipation.team_id = id_team::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePartecipation';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_trophy_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_trophy_team
(
    IN  id_team         text,
    IN  id_trophy       text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_team_trophy_case
		(
			team_id,
            trophy_id,
            start_year,
            competition_id
		)
	VALUES
	(
        id_team::integer,
        id_trophy::integer,
		start_year_comp::dm_year,
		id_comp::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertTrophyTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_trophy_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_trophy_team
(
    IN  id_team         text,
    IN  id_trophy       text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_team_trophy_case
	WHERE
        fp_team_trophy_case.team_id = id_team::integer
        AND
        fp_team_trophy_case.trophy_id = id_trophy::integer
        AND
		fp_team_trophy_case.start_year = start_year_comp::dm_year
        AND
		fp_team_trophy_case.competition_id = id_comp::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteTrophyTeam';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_prize_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_prize_team
(
    IN  id_team     text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_team_prize_case
		(
            team_id,
            prize_id,
            assign_year
		)
	VALUES
	(
        id_team::integer,
        id_prize::integer,
		a_year::dm_year
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPrizeTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_prize_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_prize_team
(
    IN  id_team     text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_team_prize_case
	WHERE
        fp_team_prize_case.team_id = id_team::integer
        AND
        fp_team_prize_case.prize_id = id_prize::integer
        AND
		fp_team_prize_case.assign_year = a_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePrizeTeam';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_competition_confederation
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_competition_confederation
(
    IN  id_conf     text,
    IN  type_team   text
)
RETURNS TABLE
        (
            comp_id     text,
            comp_name   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name
        FROM
            fp_competition
        WHERE 
            fp_competition.confederation_id = id_conf::integer
            AND
            fp_competition.team_type = type_team::en_team
        ORDER BY
            fp_competition.name;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : partecipation_year_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION partecipation_year_team
(
    IN  id_team     text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_partecipation.start_year::text AS start_year
        FROM
            fp_partecipation
        WHERE 
            fp_partecipation.team_id = id_team::integer
        ORDER BY
            fp_partecipation.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_year
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_year
(
    IN  id_comp text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition_edition.start_year::text AS start_year
        FROM
            fp_competition_edition
        WHERE 
            fp_competition_edition.competition_id = id_comp::integer
        ORDER BY
            fp_competition_edition.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_competition_edition
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_competition_edition
(
    IN  id_comp text,
    IN  s_year  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_competition_edition
		(
            competition_id,
            start_year
		)
	VALUES
	(
        id_comp::integer,
		s_year::dm_year
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertCompetitionEdition';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_competition_edition
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_competition_edition
(
    IN  id_comp text,
    IN  s_year  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_competition_edition
	WHERE
        fp_competition_edition.competition_id = id_comp::integer
        AND
        fp_competition_edition.start_year = s_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteCompetitionEdition';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : info_competition
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION info_competition
(
    IN  id_comp text
)
RETURNS TABLE
        (
            comp_name       text,
            comp_type       text,
            comp_team_type  text,
            comp_freq       text,
            conf_short_name text,
            country_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition.name::text AS comp_name,
            fp_competition.type::text AS comp_type,
            fp_competition.team_type::text AS comp_team_type,
            fp_competition.frequency::text AS comp_freq,
            fp_confederation.short_name::text AS conf_short_name,
            fp_country.name::text AS country_name
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
            fp_competition.id = id_comp::integer;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_position
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_position
(
    IN  id_player   text,
    IN  id_position text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player_position
		(
            player_id,
            position_id
		)
	VALUES
	(
        id_player::integer,
		id_position::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerPosition';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_position
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_position
(
    IN  id_player   text,
    IN  id_position text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_position
	WHERE
        fp_player_position.player_id = id_player::integer
        AND
        fp_player_position.position_id = id_position::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerPosition';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_nationality
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_nationality
(
    IN  id_player   text,
    IN  id_country  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_nationality
		(
            player_id,
            country_id
		)
	VALUES
	(
        id_player::integer,
		id_country::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertNationality';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_nationality
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_nationality
(
    IN  id_player   text,
    IN  id_country  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_nationality
	WHERE
        fp_nationality.player_id = id_player::integer
        AND
        fp_nationality.country_id = id_country::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteNationality';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_tag
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_tag
(
    IN  id_player   text,
    IN  id_tag      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player_tag
		(
            player_id,
            tag_id
		)
	VALUES
	(
        id_player::integer,
		id_tag::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerTag';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_tag
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_tag
(
    IN  id_player   text,
    IN  id_tag      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_tag
	WHERE
        fp_player_tag.player_id = id_player::integer
        AND
        fp_player_tag.tag_id = id_tag::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerTag';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_year
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_year
(
    IN  id_player   text
)
RETURNS text
AS
$$
DECLARE

    year_player     text;
    start_player    integer;
    retired_player  boolean;
    end_player      integer; 

BEGIN

	SELECT
        extract(year from fp_player.dob)::integer
    INTO
        start_player
    FROM
        fp_player
    WHERE
        fp_player.id = id_player::integer;

    
    SELECT
        count(*) >= 1
    INTO
        retired_player
    FROM
        fp_player_retired
    WHERE
        fp_player_retired.player_id = id_player::integer;


	IF (retired_player) THEN

        SELECT
            extract(year from fp_player_retired.retired_date)::integer
        INTO
            retired_player
        FROM
            fp_player_retired
        WHERE
            fp_fp_player_retired.player_id = id_player::integer;
    
    ELSE

        end_player = start_player + max_age();

    END IF;

    start_player = start_player + min_age();

    
    year_player = start_player::text;
    year_player = year_player || '@';
    year_player = year_player || end_player::text;
    

    RETURN year_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_prize
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_prize
(
    IN  id_player   text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player_prize_case
		(
            player_id,
            prize_id,
            assign_year
		)
	VALUES
	(
        id_player::integer,
		id_prize::integer,
        a_year::dm_year
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerPrize';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_prize
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_prize
(
    IN  id_player   text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_prize_case
	WHERE
        fp_player_prize_case.player_id = id_player::integer
        AND
        fp_player_prize_case.prize_id = id_prize::integer
        AND
        fp_player_prize_case.assign_year = a_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerPrize';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_national_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_national_team
(
    IN  id_player   text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id, 
            fp_team.long_name::text AS team_long_name
        FROM
            fp_nationality
            JOIN
            fp_team
                ON
                fp_nationality.country_id = fp_team.country_id
        WHERE
            fp_nationality.player_id = id_player::integer
            AND
            fp_team.type = 'NATIONAL';

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_team_year
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_team_year
(
    IN  id_player   text,
    IN  type_team   text,
    IN  s_year      text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id, 
            fp_team.long_name::text AS team_long_name
        FROM
            fp_militancy
            JOIN
            fp_team
                ON
                fp_militancy.team_id = fp_team.id
        WHERE
            fp_militancy.player_id = id_player::integer
            AND
            fp_militancy.team_type = type_team::en_team
            AND
            fp_militancy.start_year = s_year::dm_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_trophy
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_trophy
(
    IN  id_player   text,
    IN  id_team     text,
    IN  id_comp     text,
    IN  s_year_comp text,
    IN  id_trophy   text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

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
        id_player::integer,
		id_team::integer,
        id_trophy::integer,
        s_year_comp::dm_year,
        id_comp::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerTrophy';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_trophy
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_trophy
(
    IN  id_player   text,
    IN  id_team     text,
    IN  id_comp     text,
    IN  s_year_comp text,
    IN  id_trophy   text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_trophy_case
	WHERE
        fp_player_trophy_case.player_id = id_player::integer
        AND
        fp_player_trophy_case.team_id = id_team::integer
        AND
        fp_player_trophy_case.trophy_id = id_trophy::integer
        AND
        fp_player_trophy_case.start_year = s_year_comp::dm_year
        AND
        fp_player_trophy_case.competition_id = id_comp::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerTrophy';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_trophy_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_trophy_player
(
    IN  id_player   text,
    IN  type_team   text
)
RETURNS TABLE
        (
            comp_start_year text,
            comp_id         text,
            comp_name       text,
            team_id         text,
            team_long_name  text,
            trophy_id       text,
            trophy_name     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player_trophy_case.start_year::text AS comp_start_year,
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_trophy.id::text AS trophy_id,
            fp_trophy.name::text AS trophy_name
        FROM
            fp_player_trophy_case
            JOIN
            fp_trophy
                ON
                fp_player_trophy_case.trophy_id = fp_trophy.id
            JOIN
            fp_team
                ON
                fp_player_trophy_case.team_id = fp_team.id
            JOIN
            fp_competition
                ON
                fp_player_trophy_case.competition_id = fp_competition.id
        WHERE
            fp_player_trophy_case.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team::en_team
            AND
            fp_trophy.type = 'PLAYER'
        ORDER BY
            fp_player_trophy_case.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_militancy
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_militancy
(
    IN  id_player       text,
    IN  id_team         text,
    IN  type_team       text,
    IN  s_year          text,
    IN  type_militancy  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

    IF ('NATIONAL' = type_team::en_team) THEN
        type_militancy = 'FULL';
    END IF;


	INSERT INTO
		fp_militancy
		(
            team_type,
            team_id,
            player_id,
            start_year,
            type
		)
	VALUES
	(
        type_team::en_team,
		id_team::integer,
        id_player::integer,
        s_year::dm_year,
        type_militancy::en_season
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerTrophy';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_militancy
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_militancy
(
    IN  id_player   text,
    IN  id_team     text,
    IN  s_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_militancy
	WHERE
        fp_militancy.player_id = id_player::integer
        AND
        fp_militancy.team_id = id_team::integer
        AND
        fp_militancy.start_year = s_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerTrophy';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_goalkeeping
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_goalkeeping
(
    IN  id_player                   text,
    IN  new_aerial_reach            text,
    IN  new_command_of_area         text,
    IN  new_communication           text,
    IN  new_eccentricity            text,
    IN  new_first_touch_gk          text,
    IN  new_handling                text,
    IN  new_kicking                 text,
    IN  new_one_on_ones             text,
    IN  new_passing_gk              text,
    IN  new_punching_tendency       text,        
    IN  new_reflexes                text,
    IN  new_rushing_out_tendency    text,             
    IN  new_throwing                text
)   
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_goalkeeping
	SET
        aerial_reach = new_aerial_reach::dm_attribute,
        command_of_area = new_command_of_area::dm_attribute,
        communication = new_communication::dm_attribute,
        eccentricity = new_eccentricity::dm_attribute,
        first_touch_gk = new_first_touch_gk::dm_attribute,
        handling = new_handling::dm_attribute,
        kicking = new_kicking::dm_attribute,
        one_on_ones = new_one_on_ones::dm_attribute,
        passing_gk = new_passing_gk::dm_attribute,
        punching_tendency = new_punching_tendency::dm_attribute,
        reflexes = new_reflexes::dm_attribute,
        rushing_out_tendency = new_rushing_out_tendency::dm_attribute,
        throwing = new_throwing::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributeGoalkeeping';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_mental
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_mental
(
    IN  id_player           text,
    IN  new_aggression      text,
    IN  new_anticipation    text,
    IN  new_bravery         text,
    IN  new_composure       text,
    IN  new_concentration   text,
    IN  new_decision        text,
    IN  new_determination   text,
    IN  new_flair           text,
    IN  new_leadership      text,
    IN  new_off_the_ball    text,
    IN  new_positioning     text,
    IN  new_teamwork        text,
    IN  new_vision          text,
    IN  new_work_rate       text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_mental
	SET
        aggression = new_aggression::dm_attribute,
        anticipation = new_anticipation::dm_attribute,
        bravery = new_bravery::dm_attribute,
        composure = new_composure::dm_attribute,
        concentration = new_concentration::dm_attribute,
        decision = new_decision::dm_attribute,
        determination = new_determination::dm_attribute,
        flair = new_flair::dm_attribute,
        leadership = new_leadership::dm_attribute,
        off_the_ball = new_off_the_ball::dm_attribute,
        positioning = new_positioning::dm_attribute,
        teamwork = new_teamwork::dm_attribute,
        vision = new_vision::dm_attribute,
        work_rate = new_work_rate::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributeMental';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_physical
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_physical
(
    IN  id_player           text,
    IN  new_acceleration    text,
    IN  new_agility         text,
    IN  new_balance         text,
    IN  new_jumping_reach   text,
    IN  new_natural_fitness text,
    IN  new_pace            text,
    IN  new_stamina         text,
    IN  new_strength        text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_physical
	SET
        acceleration = new_acceleration::dm_attribute,
        agility = new_agility::dm_attribute,
        balance = new_balance::dm_attribute,
        jumping_reach = new_jumping_reach::dm_attribute,
        natural_fitness = new_natural_fitness::dm_attribute,
        pace = new_pace::dm_attribute,
        stamina = new_stamina::dm_attribute,
        strength = new_strength::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributePhysical';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_technical
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_technical
(
    IN  id_player               text,
    IN  new_corners				text,
    IN  new_crossing			text,
    IN  new_dribbling			text,
    IN  new_finishing			text,
    IN  new_first_touch			text,
    IN  new_free_kick_taking    text,	
    IN  new_heading				text,
    IN  new_long_shots			text,
    IN  new_long_throws			text,
    IN  new_marking				text,
    IN  new_passing				text,
    IN  new_penalty_taking		text,
    IN  new_tackling			text,
    IN  new_technique			text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_technical
	SET
        corners = new_corners::dm_attribute,
        crossing = new_crossing::dm_attribute,
        dribbling = new_dribbling::dm_attribute,
        finishing = new_finishing::dm_attribute,
        first_touch = new_first_touch::dm_attribute,
        free_kick_taking = new_free_kick_taking::dm_attribute,
        heading = new_heading::dm_attribute,
        long_shots = new_long_shots::dm_attribute,
        long_throws = new_long_throws::dm_attribute,
        marking = new_marking::dm_attribute,
        passing = new_passing::dm_attribute,
        penalty_taking = new_penalty_taking::dm_attribute,
        tackling = new_tackling::dm_attribute,
        technique = new_technique::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributeTechnical';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_match
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_match
(
    IN  id_play     text,
    IN  new_match   text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_play
	SET
        match = new_match::dm_usint
	WHERE
        id = id_play::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateMatch';
    ELSE
        output_message = 'okUpdate';
    END IF;


    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_statistic_general
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_statistic_general
(
    IN  id_play             text,
    IN  new_goal_scored     text,
    IN  new_assist          text,
    IN  new_yellow_card     text,
    IN  new_red_card        text,
    IN  new_penalty_scored  text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


    UPDATE
        fp_statistic_general
    SET
        goal_scored = new_goal_scored::dm_usint,
        assist = new_assist::dm_usint,
        yellow_card = new_yellow_card::dm_usint,
        red_card = new_red_card::dm_usint,
        penalty_scored = new_penalty_scored::dm_usint
    WHERE
        play_id = id_play::integer;


    
    IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateStatisticGeneral';
    ELSE
        output_message = 'okUpdate';
    END IF;


    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_statistic_goalkeeper
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_statistic_goalkeeper
(
    IN  id_play             text,
    IN  new_goal_conceded   text,
    IN  new_penalty_saved   text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


    UPDATE
        fp_statistic_goalkeeper
    SET
        goal_conceded = new_goal_conceded::dm_usint,
        penalty_saved = new_penalty_saved::dm_usint
    WHERE
        play_id = id_play::integer;

    
    IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateStatisticGoalkeeper';
    ELSE
        output_message = 'okUpdate';
    END IF;


    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_statistic
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_statistic
(
    IN  id_play             text,
    IN  new_match           text,
    IN  new_goal_scored     text,
    IN  new_assist          text,
    IN  new_yellow_card     text,
    IN  new_red_card        text,
    IN  new_penalty_scored  text,
    IN  new_goal_conceded   text,
    IN  new_penalty_saved   text
)       
RETURNS text    
AS  
$$  
DECLARE

    goalkeeper                  boolean;

    output_message              text;
    match_update_msg            text;
    statistic_general_msg       text;
    statistic_goalkeeper_msg    text;

BEGIN


    match_update_msg = update_match(
        id_play, 
        new_match
    );

    output_message = match_update_msg;

    IF (match_update_msg = 'okUpdate') THEN

        statistic_general_msg = update_statistic_general(
            id_play, 
            new_goal_scored, 
            new_assist,
            new_yellow_card,
            new_red_card,
            new_penalty_scored
        );

        output_message = output_message || '@';
        output_message = statistic_general_msg;


        SELECT
            count(*) >= 1
        INTO
            goalkeeper
        FROM
            fp_statistic_goalkeeper
        WHERE
            play_id = id_play::integer;


        IF (goalkeeper) THEN

            statistic_goalkeeper_msg = update_statistic_goalkeeper(
                id_play, 
                new_goal_conceded, 
                new_penalty_saved
            );
            
            
            output_message = output_message || '@';
            output_message = statistic_goalkeeper_msg;
        
        END IF;

    END IF;
    

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_statistic_player_admin
 *
 * IN      : text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_statistic_player_admin
(
    IN  id_player   text,
    IN  id_team     text,
    IN  id_comp     text,
    IN  s_year      text
)
RETURNS TABLE
        (
            play_id         text,
            match           text,
            goal_scored     text,
            penalty_scored  text,
            assist          text,
            yellow_card     text,
            red_card        text,
            goal_conceded   text,
            penalty_saved   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_play.id::text AS play_id,
            fp_play.match::text AS match,
            fp_statistic_general.goal_scored::text AS goal_scored,
            fp_statistic_general.penalty_scored::text AS penalty_scored,
            fp_statistic_general.assist::text AS assist,
            fp_statistic_general.yellow_card::text AS yellow_card,
            fp_statistic_general.red_card::text AS red_card,
            fp_statistic_goalkeeper.goal_conceded::text AS goal_conceded,
            fp_statistic_goalkeeper.penalty_saved::text AS penalty_saved
        FROM
            fp_play
            JOIN
            fp_statistic_general
                ON
                fp_play.id = fp_statistic_general.play_id
            LEFT OUTER JOIN
            fp_statistic_goalkeeper
                ON
                fp_play.id = fp_statistic_goalkeeper.play_id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_play.start_year = s_year::dm_year
            AND
            fp_play.competition_id = id_comp::integer
            AND
            fp_play.team_id = id_team::integer;

        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player
(
    IN  new_name        text,
    IN  new_surname     text,
    IN  new_dob         text,
    IN  new_country_id  text,
    IN  new_foot        text,
    IN  new_position_id text,
    IN  new_role        text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player
		(
            name,
            surname,
            dob,
            country_id,
            foot,
            position_id,
            role
		)
	VALUES
	(
        new_name::dm_string,
        new_surname::dm_string,
        new_dob::dm_date,
        new_country_id::integer,
        new_foot::en_foot,
        new_position_id::integer,
        new_role::en_role
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayer';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player
(
    IN  id_player   text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player
	WHERE
        id = id_player::integer;	
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayer';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_player
(
    IN  id_player       text,
    IN  new_name        text,
    IN  new_surname     text,
    IN  new_dob         text,
    IN  new_country_id  text,
    IN  new_foot        text,
    IN  new_position_id text
)
RETURNS text
AS
$$
DECLARE

    conflict        boolean;
    count_row       integer;
    output_message  text;

BEGIN

	SELECT
        count(*) >= 1
    INTO
        conflict
    FROM
        fp_player
    WHERE
        fp_player.name = new_name::dm_string
        AND
        fp_player.surname = new_surname::dm_string
        AND
        fp_player.dob = new_dob::dm_date
        AND
        fp_player.country_id = new_country_id::integer
        AND
        fp_player.id <> id_player::integer;


    IF (conflict) THEN
        output_message = 'errorMessageUpdatePlayerConflict';
        RETURN output_message;
    END IF;


	UPDATE
		fp_player
	SET
        name = new_name::dm_string,
        surname = new_surname::dm_string,
        dob = new_dob::dm_date,
        country_id = new_country_id::integer,
        foot = new_foot::en_foot,
        position_id = new_position_id::integer
	WHERE
        id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdatePlayer';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------







/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_play
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_play
(
    IN  id_player   text,
    IN  s_year      text,
    IN  id_comp     text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_play.start_year = s_year::dm_year
            AND
            fp_play.competition_id = id_comp::integer
        ORDER BY
            team_long_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_retired_date
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_retired_date
(
    IN  id_player   text,
    IN  r_date      text
)
RETURNS text
AS
$$
DECLARE

    retired         boolean;

    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        count(*) >= 1
    INTO
        retired
    FROM
        fp_player_retired
    WHERE
        player_id = id_player::integer;

    
    IF ((retired) AND (r_date IS NOT NULL)) THEN


        UPDATE
            fp_player_retired
        SET
            retired_date = r_date::dm_date
        WHERE
            player_id = id_player::integer;

        
        GET DIAGNOSTICS count_row = row_count;

        IF (0 = count_row) THEN
            output_message = 'errorMessageUpdateRetiredDate';
        ELSE
            output_message = 'okUpdate';
        END IF;

        RETURN output_message;


    ELSIF ((retired) AND (r_date IS NULL)) THEN


        DELETE FROM
            fp_player_retired
        WHERE
            player_id = id_player::integer;

        
        GET DIAGNOSTICS count_row = row_count;

        IF (0 = count_row) THEN
            output_message = 'errorMessageDeleteRetiredDate';
        ELSE
            output_message = 'okDelete';
        END IF;

        RETURN output_message;


    ELSIF ((NOT retired) AND (r_date IS NOT NULL)) THEN


        INSERT INTO
            fp_player_retired
            (
                player_id,
                retired_date
            )
        VALUES
        (
            id_player::integer,
            r_date::dm_date
        )
        ON CONFLICT DO NOTHING;

        GET DIAGNOSTICS count_row = row_count;
        
        IF (0 = count_row) THEN
            output_message = 'errorMessageInsertRetiredDate';
        ELSE
            output_message = 'okInsert';
        END IF;

        RETURN output_message;


    ELSE
   
        output_message = 'errorMessageRetiredDate';
        RETURN output_message;
  
    END IF;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

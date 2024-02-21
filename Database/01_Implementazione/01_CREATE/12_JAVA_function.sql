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
 * RETURNS : TABLE (text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_competitions
(
    IN  sub_name_comp   text,
    IN  type_comp       text,
    IN  type_team_comp  text,
    IN  name_country    text
)
RETURNS TABLE
        (
            comp_type       text,
            comp_type_team  text,
            comp_name       text,
            conf_short_name text,
            country_name    text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        comp_type       text    NOT NULL,
        comp_type_team  text    NOT NULL,
        comp_name       text    NOT NULL,
        conf_short_name text    NOT NULL,
        country_name    text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_competition.type::text,
        fp_competition.team_type::text,
        fp_competition.name::text,
        fp_confederation.short_name::text,
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


    IF (name_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_name <> name_country;
        
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


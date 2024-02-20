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
 * NAME : all_sub_countries
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_sub_countries
(
    IN  name_super_country  text
)
RETURNS TABLE
        (
            id_sub_country      integer,
            type_sub_country    text,
            code_sub_country    text,
            name_sub_country    text,
            code_super_country  text
        )
AS
$$
BEGIN

	RETURN QUERY
		SELECT
            country_1.id::integer,
            country_1.type::text,
            country_1.code::text,
            country_1.name::text,
            country_2.code::text
		FROM
			fp_country AS country_1
            JOIN
            fp_country AS country_2
                ON
                country_1.super_id = country_2.id
		WHERE
			country_2.name = name_super_country
        ORDER BY
            country_1.name;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : all_sub_confederations
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_sub_confederations
(
    IN  long_name_super_conf text
)
RETURNS TABLE
        (
            short_name_sub_conf     text,
            long_name_sub_conf      text,
            name_country_sub_conf   text,
            short_name_super_conf   text
        )
AS
$$
BEGIN

	RETURN QUERY
		SELECT
            conf_1.short_name::text,
            conf_1.long_name::text,
            country.name::text,
            conf_2.short_name::text
		FROM
			fp_confederation AS conf_1
            JOIN
            fp_confederation AS conf_2
                ON
                conf_1.super_id = conf_2.id
            JOIN
            fp_country AS country
                ON
                conf_1.country_id = country.id
		WHERE
			conf_2.long_name = long_name_super_conf
        ORDER BY
            long_name;

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


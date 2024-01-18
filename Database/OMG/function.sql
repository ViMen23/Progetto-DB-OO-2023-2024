/******************************************************************************* 
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : competitionUTER SCIENCE                                            
 * CLASS        : DATA BASES I                                                
 * TEACHER      : SILVIO BARRA                                                
 * YEAR         : 2023-2024                                                   
 ******************************************************************************/



/*******************************************************************************
 * FUNCTION                                                               
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_row_from_id
 *
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_row_from_id
(
	IN	name_table	text,
	IN	value_id	integer
)
RETURNS record
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	to_execute text = ''; 
	
	table_record record;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = to_execute || 'SELECT *';
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	EXECUTE to_execute INTO table_record;

	RETURN table_record;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : correct_containment
 *
 * IN      : country.id%TYPE, country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION correct_containment
(
	IN	in_country_id		country.id%TYPE,
	IN	super_country_id	country.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	in_country_type	text := get_attribute_from_id
							(
								'country',
								'type',
								in_country_id
							);
							
	super_country_type text := get_attribute_from_id
							   (
							   		'country',
							   		'type',
							   		super_country_id
							   	);
	
BEGIN
	
	IF
	(
		(in_country_type = 'NATION' AND super_country_type = 'CONTINENT')
		OR
		(in_country_type = 'CONTINENT' AND super_country_type = 'WORLD')
		OR
		(in_country_type = 'WORLD' AND super_country_type IS NULL)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 *
 * IN      : country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN	country_id	country.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE
	
BEGIN
	
	IF (get_attribute_from_id('country', 'type', country_id) = 'NATION') THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : same_country_confederation
 *
 * IN      : country.id%TYPE, confederation.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION same_country_confederation
(
	IN	country_id			country.id%TYPE
	IN	confederation_id	confederation.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
BEGIN
	
	IF
	(
		country_id = CAST
				 	(
						get_attribute_from_id
						(
							'confederation', 'country_id', confederation_id
						)
						AS integer
					)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : country_type_from_confederation_id
 *
 * IN      : confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION country_type_from_confederation_id
(
	IN	confederation_id	confederation.id%TYPE
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE 

BEGIN
	
	RETURNS get_attribute_from_id
			(
				'country',
				'type',
				CAST
				(
					get_attribute_from_id
					(
						'confederation',
						'country_id',
						NEW.confederation_id
					)
					AS integer
				)
			);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : confederation_id_from_competition_edition_id
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : confederation.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION confederation_id_from_competition_edition_id
(
	IN	competition_edition_id	competition_edition.id%TYPE
)
RETURNS confederation.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE 

BEGIN
	
	RETURNS CAST
			(
				get_attribute_from_id
				(
					'competition',
					'confederation_id',
					CAST
					(
						get_attribute_from_id
						(
							'competition_edition',
							'competition_id',
							NEW.competition_edition_id
						)
						AS integer
					)
					
				)
				AS integer
			);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_team_name
 *
 * IN      : country.id%TYPE, ty_age_cap, ty_sex
 * INOUT   : void
 * OUT     : void
 * RETURNS : dm_alnum
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_team_name
(
	IN	country_id	country.id%TYPE,
	IN	age_cap		ty_age_cap,
	IN	sex			ty_sex
)
RETURNS dm_alnum
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	national_team_name dm_alnum := get_attribute_from_id('country', 'name', country_id);

BEGIN
	
	IF (age_cap <> 'MAJOR') THEN
		national_team_name = national_team_name || ' ' || age_cap;
	END IF;
	
	IF (sex = 'FEMALE') THEN
		national_team_name = national_team_name || ' Women';
	END IF;
	
	RETURN national_team_name;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_has_edition
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_has_edition
(
	IN	id_competition	competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) > 0
		FROM
			competition_edition
		WHERE
			competition_id = id_competition
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------






/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : a_start_year
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : dm_year
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION a_start_year
(
	IN	id_competition	competition.id%TYPE
)
RETURNS dm_year
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			start_year
		FROM
			competition_ed
		WHERE
			competition_id = id_competition
		LIMIT
			1
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : correct_frequency
 *
 * IN      : competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION correct_frequency
(
	IN	competition_id	competition.id%TYPE,
	IN	start_year		dm_year
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	frequency integer := CAST
						 (
						 	get_attribute_from_id
						 	(
						 		'competition',
						 		'frequency',
						 		competition_id
						 	)
						 	AS integer
						 );
	
BEGIN
	
	IF (frequency <= 1) THEN
		RETURN TRUE;
	ELSE
		IF ((start_year - a_start_year(competition_id)) % frequency = 0) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_competitions
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF competition.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_competitions
(
	IN	competition_id	competition.id%TYPE
)
RETURNS SETOF competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			id
		FROM
			competition
		WHERE
			type = get_attribute_from_id('competition', 'type', competition_id)
			AND
			team_type = get_attribute_from_id('competition', 'team_type', competition_id)
			AND
			tier = CAST(get_attribute_from_id('competition', 'tier', competition_id) AS integer)
			AND
			age_cap = get_attribute_from_id('competition', 'age_cap', competition_id)
			AND
			sex = get_attribute_from_id('competition', 'sex', competition_id)
			AND
			confederation_id = CAST(get_attribute_from_id('competition', 'confederation_id', competition_id) AS integer)
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : one_tier_edition
 *
 * IN      : competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION one_tier_edition
(
	IN	competition_id			competition.id%TYPE,
	IN	competition_start_year	dm_year
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

BEGIN
	
	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			competition_edition
		WHERE
			start_year = competition_start_year
			AND
			competition_id IN SELECT similar_competitions(competition_id) 
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : belong_to_confederation
 *
 * IN      : team.id%TYPE, confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to_confederation
(
	IN	team_id				team.id%TYPE,
	IN	confederation_id	confederation.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	confederation_type text = country_type_from_confederation_id(confederation_id);
	
	team_confederation_id integer = CAST
									(
										get_attribute_from_id
										(
											'team',
											'confederation_id',
											team_id
										)
										AS integer
									);

BEGIN
	
	IF
	(
		confederation_type = 'NATION'
		AND
		team_confederation_id = confederation_id
	)
	THEN
		RETURN TRUE;
	END IF;
	
	team_confederation_id = CAST
							(
								get_attribute_from_id
								(
									'confederation',
									'super_id',
									team_confederation_id
								)
								AS integer
							);
	
	IF
	(
		confederation_type = 'CONTINENT'
		AND
		team_confederation_id = confederation_id
	)
	THEN
		RETURN TRUE;
	END IF;
	
	team_confederation_id = CAST
							(
								get_attribute_from_id
								(
									'confederation',
									'super_id',
									team_confederation_id
								)
								AS integer
							);
	
	IF
	(
		confederation_type = 'WORLD'
		AND
		team_confederation_id = confederation_id
	)
	THEN
		RETURN TRUE;
	END IF;
	
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


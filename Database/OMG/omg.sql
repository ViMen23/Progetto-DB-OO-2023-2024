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
 * SCHEMA                                                                     
 ******************************************************************************/


/******************************************************************************* 
 * TYPE : SCHEMA
 * NAME : public
 *
 * DESC : TODO                                 
 ******************************************************************************/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
--------------------------------------------------------------------------------



/*******************************************************************************
 * DOMAIN 
 ******************************************************************************/


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_alnum
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_alnum AS varchar(100)
CHECK
(
	value ~ '(?=^'
				'['
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
				']'
				'['
					'\u0020'
					'\u0027'
					'\u002D'
					'\u002E'
					'\u002F'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0060'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
				']{0,98}'
				'['
					'\u002E'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
				']'
			'$)'
			'(?!.*('
				'[\u0020\u0027\u002D\u002F\u0060]{2}'
				'|'
				'[\u0027\u002D\u002E\u002F\u0060]{2}'
				'|'
				'\u0020\u002E'
			'))'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_pdate
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_pdate AS date
CHECK
(
	value <= current_date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_string
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_string AS varchar(100)
CHECK
(
	value ~ '(?=^'
				'['
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
				']'
				'['
					'\u0020'
					'\u0027'
					'\u002D'
					'\u002E'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
				']{0,98}'
				'['
					'\u002E'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
				']'
			'$)'
			'(?!.*('
				'[\u0020\u0027\u002D]{2}'
				'|'
				'[\u0027\u002D\u002E]{2}'
				'|'
				'\u0020\u002E'
			'))'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_password
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_password AS varchar(255)
CHECK
(
	value ~ '(?=^[\u0020-\u007E]{8,255}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_code
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_code AS varchar(3)
CHECK
(
	value ~ '(?=^[\u0041-\u005A]{2,3}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_usint
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_usint AS smallint
CHECK
(
	value >= 0
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_username
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_username AS varchar(20)
CHECK
(
	value ~ '(?=^'
				'['
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
				']'
				'['
					'\u002D'
					'\u002E'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u005F'
					'\u0061-\u007A'
				']{2,18}'
				'['
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
				']'
			'$)'
			'(?!.*[\u002D\u002E\u005F]{2})'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_year
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_year AS smallint
CHECK
(
	value BETWEEN 0 AND (extract(year from current_date) + 1)
);
--------------------------------------------------------------------------------




/*******************************************************************************
 * ENUM TYPE
 ******************************************************************************/



/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_age_cap
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_age_cap AS ENUM
(
	'MAJOR',
	'U-15',
	'U-16',
	'U-17',
	'U-18',
	'U-19',
	'U-20',
	'U-21',
	'U-22',
	'U-23'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_attribute AS ENUM
(
	'GOALKEEPER',
	'KEY attribute',
	'MEDICAL',
	'MENTAL',
	'PHYSICAL',
	'SET PIECE',
	'TACTICAL - ATTACKING',
	'TACTICAL - DEFENDING',
	'TEAM WORK',
	'TECHNICAL - ATTACKING',
	'TECHNICAL - DEFENDING',
	'TECHNICAL - IN positionSESSION',
	'TECHNICAL - OUT positionSESSION'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_competition AS ENUM
(
	'CHAMPIONSHIP',
	'SUPER CUP',
	'TOURNAMENT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_country AS ENUM
(
	'NATION',
	'CONTINENT',
	'WORLD'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_foot
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_foot AS ENUM
(
	'EITHER',
	'LEFT',
	'RIGHT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_formula
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_formula AS ENUM
(
	'GROUP',
	'GROUP HOME/AWAY',
	'GROUP OPEN/CLOSURE',
	'GROUP HOME/AWAY OPEN/CLOSURE',
	'KNOCKOUT',
	'KNOCKOUT HOME/AWAY',
	'KNOCKOUT HOME/AWAY + FINAL',
	'GROUP + KNOCKOUT',
	'GROUP + KNOCKOUT HOME/AWAY',
	'GROUP + KNOCKOUT HOME/AWAY + FINAL',
	'GROUP HOME/AWAY + KNOCKOUT',
	'GROUP HOME/AWAY + KNOCKOUT HOME/AWAY',
	'GROUP HOME/AWAY + KNOCKOUT HOME/AWAY + FINAL',
	'GROUP OPEN/CLOSURE + KNOCKOUT',
	'GROUP OPEN/CLOSURE + KNOCKOUT HOME/AWAY',
	'GROUP OPEN/CLOSURE + KNOCKOUT HOME/AWAY + FINAL',
	'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT',
	'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT HOME/AWAY',
	'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT HOME/AWAY + FINAL'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_role
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_role AS ENUM
(
	'GK', -- goalkeeper
	'DF', -- defender
	'MF', -- midfield
	'FW'  -- forward
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_sex
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_sex AS ENUM
(
	'FEMALE',
	'MALE'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_statistic AS ENUM
(
	'GK',
	'DF',
	'MF',
	'FW',
	'GK-DF',
	'GK-MF',
	'GK-FW',
	'DF-MF',
	'DF-FW',
	'MF-FW',
	'GK-DF-MF',
	'GK-DF-FW',
	'GK-MF-FW',
	'DF-MF-FW',
	'GK-DF-MF-FW'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_trophy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_trophy AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------




/*******************************************************************************
 * FUNCTION
 ******************************************************************************/



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : table_exists
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION table_exists
(
	IN	name_table	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			information_schema.tables 
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : attribute_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION attribute_exists
(
	IN	name_table		text,
	IN	name_attribute	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			information_schema.columns 
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
			AND
			column_name = name_attribute
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_type
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_type
(
	IN	name_table		text,
	IN	name_attribute	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	attribute_type text; 

BEGIN
	
	
	SELECT
		data_type
	INTO
		attribute_type
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_attribute;
		
	RETURN attribute_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_id
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_id
(
	IN	separator		text,
	IN	input_string	text
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	id_to_find	integer := NULL;
	to_execute	text := '';
	
	count	integer := 0;
	
	name_table		text;
	name_attribute	text;
	value_attribute	text;
	type_attribute	text;

	input RECORD;
	
BEGIN
	
	FOR input IN
		SELECT string_to_table(input_string, separator)
	LOOP
		
		IF (0 = count) THEN

			name_table = input.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			to_execute = to_execute || 'SELECT id ';
			to_execute = to_execute || 'FROM ' || name_table || ' WHERE ';
			
		ELSIF (1 = (count % 2)) THEN
		
			name_attribute = input.string_to_table;
			
			IF (NOT attribute_exists(name_table, name_attribute)) THEN
				RETURN NULL;
			END IF;
			
			type_attribute = get_attribute_type(name_table, name_attribute);
			
			to_execute = to_execute || name_attribute || ' = ';
			
		ELSIF (0 = (count % 2)) THEN
		
			value_attribute = input.string_to_table;
			
			IF (NOT type_attribute LIKE '%int%') THEN
				
				SELECT quote_literal(value_attribute)
				INTO value_attribute;
				
			END IF;
				
			to_execute = to_execute || value_attribute || ' AND ';
			
		END IF;
		
		count = count + 1;
		
	END LOOP;
	
	
	SELECT trim(to_execute, ' AND ')
	INTO to_execute;
	
	to_execute = to_execute || ';';
	
	EXECUTE to_execute INTO id_to_find;
	
	RETURN id_to_find;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_from_id
 *
 * IN      : text, text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_from_id
(
	IN	name_table		text,
	IN	name_attribute	text,
	IN	value_id		integer
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	to_execute	text	:= ''; 
	
	type_attribute	text;
	
	output_cursor	refcursor;
	integer_output	integer;
	
	value_attribute	text;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	IF (NOT attribute_exists(name_table, name_attribute)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = to_execute || 'SELECT ' || name_attribute;
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	
	
	OPEN output_cursor FOR EXECUTE to_execute;
	
	
	
	type_attribute = get_attribute_type(name_table, name_attribute);
	
	
	
	IF (type_attribute LIKE '%int%') THEN
		
		FETCH output_cursor INTO integer_output;
		
		SELECT CAST(integer_output AS text)
		INTO value_attribute; 
		
	ELSE
	
		FETCH output_cursor INTO value_attribute;
	
	END IF;
	
	CLOSE output_cursor;

	RETURN value_attribute;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_total_team
 *
 * IN      : integer, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_total_team
(
	IN	num_group	integer,
	IN	team_group	integer,
	IN	team_knock	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
BEGIN

	IF (0 = num_group) THEN
		RETURN team_knock;
	ELSE
		RETURN num_group * team_group;
	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_min_match
 *
 * IN      : ty_formula, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_min_match
(
	IN	type		ty_formula,
	IN	num_group	integer,
	IN	team_group	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
BEGIN

	CASE type
	
		WHEN 'GROUP' THEN
			RETURN team_group - 1;
			
		WHEN 'GROUP HOME/AWAY' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP OPEN/CLOSURE' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE' THEN
			RETURN (team_group - 1) * 2 * 2;
			
		WHEN 'KNOCKOUT' THEN
			RETURN 1;
			
		WHEN 'KNOCKOUT HOME/AWAY' THEN
			RETURN 1 * 2;
			
		WHEN 'KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN 1;
			
		WHEN 'GROUP + KNOCKOUT' THEN
			RETURN team_group - 1;
			
		WHEN 'GROUP + KNOCKOUT HOME/AWAY' THEN
			RETURN team_group - 1;
			
		WHEN 'GROUP + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN team_group - 1;
			
		WHEN 'GROUP HOME/AWAY + KNOCKOUT' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP HOME/AWAY + KNOCKOUT HOME/AWAY' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP HOME/AWAY + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP OPEN/CLOSURE + KNOCKOUT' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP OPEN/CLOSURE + KNOCKOUT HOME/AWAY' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP OPEN/CLOSURE + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT' THEN
			RETURN (team_group - 1) * 2 * 2;
			
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT HOME/AWAY' THEN
			RETURN (team_group - 1) * 2 * 2;
			
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (team_group - 1) * 2 * 2;
			
	END CASE;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_min_match
 *
 * IN      : ty_formula, integer, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_max_match
(
	IN	type		ty_formula,
	IN	num_group	integer,
	IN	team_group	integer,
	IN	team_knock	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
BEGIN

	CASE type
	
		WHEN 'GROUP' THEN
			RETURN team_group - 1;
			
		WHEN 'GROUP HOME/AWAY' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP OPEN/CLOSURE' THEN
			RETURN (team_group - 1) * 2;
			
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE' THEN
			RETURN (team_group - 1) * 2 * 2;
			
		WHEN 'KNOCKOUT' THEN
			RETURN CAST(ceil(log(2, team_knock)) AS integer);
						
		WHEN 'KNOCKOUT HOME/AWAY' THEN
			RETURN CAST(ceil(log(2, team_knock)) AS integer) * 2;
						
		WHEN 'KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (CAST(ceil(log(2, team_knock)) AS integer) * 2) - 1;
					
		WHEN 'GROUP + KNOCKOUT' THEN
			RETURN team_group - 1 + CAST(ceil(log(2, team_knock)) AS integer);
										 
		WHEN 'GROUP + KNOCKOUT HOME/AWAY' THEN
			RETURN team_group - 1 + CAST(ceil(log(2, team_knock)) AS integer) * 2;
										 
		WHEN 'GROUP + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN team_group - 1 + (CAST(ceil(log(2, team_knock)) AS integer) * 2) - 1;
									 
		WHEN 'GROUP HOME/AWAY + KNOCKOUT' THEN
			RETURN (team_group - 1) * 2 + CAST(ceil(log(2, team_knock)) AS integer);
											   
		WHEN 'GROUP HOME/AWAY + KNOCKOUT HOME/AWAY' THEN
			RETURN (team_group - 1) * 2 + CAST(ceil(log(2, team_knock)) AS integer) * 2;
											   
		WHEN 'GROUP HOME/AWAY + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (team_group - 1) * 2 + (CAST(ceil(log(2, team_knock)) AS integer) * 2) - 1;
										   
		WHEN 'GROUP OPEN/CLOSURE + KNOCKOUT' THEN
			RETURN (team_group - 1) * 2 + CAST(ceil(log(2, team_knock)) AS integer);
											   
		WHEN 'GROUP OPEN/CLOSURE + KNOCKOUT HOME/AWAY' THEN
			RETURN (team_group - 1) * 2 + CAST(ceil(log(2, team_knock)) AS integer) * 2;
											   
		WHEN 'GROUP OPEN/CLOSURE + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (team_group - 1) * 2 + (CAST(ceil(log(2, team_knock)) AS integer) * 2) - 1;
										   
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT' THEN
			RETURN (team_group - 1) * 2 * 2 + CAST(ceil(log(2, team_knock)) AS integer);
												   
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT HOME/AWAY' THEN
			RETURN (team_group - 1) * 2 * 2 + CAST(ceil(log(2, team_knock)) AS integer) * 2;
												   
		WHEN 'GROUP HOME/AWAY OPEN/CLOSURE + KNOCKOUT HOME/AWAY + FINAL' THEN
			RETURN (team_group - 1) * 2 * 2 + (CAST(ceil(log(2, team_knock)) AS integer) * 2) - 1;
											   
	END CASE;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TABLES AND CONSTRAINTS
 ******************************************************************************/




/*******************************************************************************
 * TYPE : TABLE
 * NAME : country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country
(
	id		serial		NOT NULL,
	type	ty_country	NOT NULL,
	code	dm_code		NOT NULL,
	name	dm_string	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country TABLE
 * NAME : pk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT pk_country
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - country TABLE
 * NAME : uq_country_code
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT uq_country_code
UNIQUE
(
	code
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - country TABLE
 * NAME : uq_country_name
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT uq_country_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE confederation
(
	id			serial		NOT NULL,
	country_id	integer		NOT NULL,
	short_name	dm_alnum 	NOT NULL,
	long_name	dm_alnum	NOT NULL,
	super_id	integer				  -- super confederation
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - confederation TABLE
 * NAME : pk_confederation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	confederation
ADD CONSTRAINT pk_confederation
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - confederation TABLE
 * NAME : uq_confederation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	confederation
ADD CONSTRAINT uq_confederation
UNIQUE
(
	long_name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - confederation TABLE
 * NAME : confederation_fk_confederation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE confederation
ADD CONSTRAINT confederation_fk_confederation
FOREIGN KEY
(
	super_id
)
REFERENCES confederation
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - confederation TABLE
 * NAME : confederation_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	confederation
ADD CONSTRAINT confederation_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------





/*******************************************************************************
 * TYPE : TABLE
 * NAME : team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team
(
	id					serial		NOT NULL,
	type				ty_team 	NOT NULL,
	country_id			integer		NOT NULL,
	name				dm_alnum	NOT NULL,
	age_cap				ty_age_cap	NOT NULL,
	sex					ty_sex		NOT NULL,
	confederation_id	integer		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team TABLE
 * NAME : pk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT pk_team
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - team TABLE
 * NAME : uq_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT uq_team
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team TABLE
 * NAME : team_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT team_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team TABLE
 * NAME : team_fk_confederation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT team_fk_confederation
FOREIGN KEY
(
	confederation_id
)
REFERENCES confederation
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE competition
(
	id					serial			NOT NULL,
	type				ty_competition	NOT NULL,
	team_type			ty_team			NOT NULL,
	name				dm_string		NOT NULL,
	sex					ty_sex			NOT NULL,
	frequency			dm_usint		NOT NULL,
	confederation_id	integer			NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - competition TABLE
 * NAME : pk_competition
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition 
ADD CONSTRAINT pk_competition
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - competition TABLE
 * NAME : uq_competition_name
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition 
ADD CONSTRAINT uq_competition_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - competition TABLE
 * NAME : competition_fk_confederation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition
ADD CONSTRAINT competition_fk_confederation
FOREIGN KEY
(
	confederation_id
)
REFERENCES confederation
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : formula
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE formula
(
	id			serial		NOT NULL,
	type		ty_formula	NOT NULL,
	total_team	dm_usint	NOT NULL  -- total number of football teams
		GENERATED ALWAYS AS
		(
			set_formula_total_team
			(
				num_group,
				team_group,
				team_knock
			)
		)
		STORED						,
	num_group	dm_usint	NOT NULL, -- number of groups
	team_group	dm_usint	NOT NULL, -- number of teams for each group
	team_knock	dm_usint	NOT NULL, -- number of teams for knock out phase
	min_match	dm_usint 	NOT NULL  -- minimum number of matches for team
		GENERATED ALWAYS AS
		(
			set_formula_min_match
			(
				type,
				num_group,
				team_group
			)
		)
		STORED						,
	max_match	dm_usint 	NOT NULL  -- maximum number of matches for team
		GENERATED ALWAYS AS
		(
			set_formula_max_match
			(
				type,
				num_group,
				team_group,
				team_knock
			)
		)
		STORED	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - formula TABLE
 * NAME : pk_formula
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT pk_formula
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - formula TABLE
 * NAME : uq_formula
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT uq_formula
UNIQUE
(
	type,
	num_group,
	team_group,
	team_knock
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_group
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_group
CHECK
(
	(
		NOT (CAST(type AS text) LIKE '%GROUP%')
		AND
		0 = num_group
		AND
		0 = team_group
	)
	OR
	(
		CAST(type AS text) LIKE '%GROUP%'
		AND
		num_group <= 20
		AND
		team_group BETWEEN 2 AND 100
	)
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_knock
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_knock
CHECK
(
	(
		NOT (CAST(type AS text) LIKE '%KNOCKOUT%')
		AND
		0 = team_knock
	)
	OR
	(
		CAST(type AS text) LIKE '%KNOCKOUT%'
		AND
		team_knock <= 256
		AND
		floor(log(2, team_knock)) = ceil(log(2, team_knock))
	)
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_exist
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_exist
CHECK
(
	team_knock <> 0 OR num_group <> 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_total_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_total_team
CHECK
(
	total_team BETWEEN 2 AND 200
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE competition_edition
(
	id				serial		NOT NULL,
	edition			daterange	NOT NULL, -- data range of edition
	competition_id	integer		NOT NULL,
	tier			dm_usint	NOT NULL,
	age_cap			ty_age_cap	NOT NULL,
	formula_id		integer 	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - competition_edition TABLE
 * NAME : pk_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition_edition
ADD CONSTRAINT pk_competition_edition
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - competition_edition TABLE
 * NAME : uq_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition_edition
ADD CONSTRAINT uq_competition_edition
UNIQUE
(
	edition,
	competition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - competition_edition TABLE
 * NAME : competition_edition_fk_competition
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition_edition
ADD CONSTRAINT competition_edition_fk_competition
FOREIGN KEY
(
	competition_id
)
REFERENCES competition
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - competition_edition TABLE
 * NAME : competition_edition_fk_formula
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition_edition
ADD CONSTRAINT competition_edition_fk_formula
FOREIGN KEY
(
	formula_id
)
REFERENCES formula
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : partecipation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE partecipation
(
	competition_edition_id	integer	NOT NULL,
	team_id					integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - partecipation TABLE
 * NAME : pk_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	partecipation
ADD CONSTRAINT pk_partecipation
PRIMARY KEY
(
	competition_edition_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - partecipation TABLE
 * NAME : partecipation_fk_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	partecipation
ADD CONSTRAINT partecipation_fk_competition_edition
FOREIGN KEY
(
	competition_edition_id
)
REFERENCES competition_edition
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - partecipation TABLE
 * NAME : partecipation_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	partecipation
ADD CONSTRAINT partecipation_fk_team
FOREIGN KEY
(
	team_id
)
REFERENCES team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player
(
	id			serial		NOT NULL,
	name		dm_string	NOT NULL,
	surname		dm_string	NOT NULL,
	sex			ty_sex		NOT NULL,
	foot		ty_foot		NOT NULL, -- preferred foot
	country_id	integer		NOT NULL, -- birth country id
	dob			dm_pdate	NOT NULL, -- birth date
	career_time	daterange			  -- date range of player career
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player TABLE
 * NAME : pk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player
ADD CONSTRAINT pk_player
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - player TABLE
 * NAME : uq_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player
ADD CONSTRAINT uq_player
UNIQUE
(
	name,
	surname,
	sex,
	dob,
	country_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player TABLE
 * NAME : player_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player
ADD CONSTRAINT player_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE nationality
(
	team_nation	boolean	NOT NULL, -- country of player national team
	country_id	integer	NOT NULL,
	player_id	integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - nationality TABLE
 * NAME : pk_nationality
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE nationality
ADD CONSTRAINT pk_nationality
PRIMARY KEY
(
	country_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - nationality TABLE
 * NAME : nationality_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	nationality
ADD CONSTRAINT nationality_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - nationality TABLE
 * NAME : nationality_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	nationality
ADD CONSTRAINT nationality_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE militancy
(
	team_id		integer		NOT NULL,
	player_id	integer		NOT NULL,
	time_lap	daterange	NOT NULL  -- date range of militancy
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - militancy TABLE
 * NAME : pk_militancy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE militancy
ADD CONSTRAINT pk_militancy
PRIMARY KEY
(
	team_id,
	player_id,
	time_lap
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - militancy TABLE
 * NAME : militancy_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	militancy
ADD CONSTRAINT militancy_fk_team
FOREIGN KEY
(
	team_id
)
REFERENCES team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - militancy TABLE
 * NAME : militancy_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	militancy
ADD CONSTRAINT militancy_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE tag
(
	id			serial			NOT NULL,
	type		ty_attribute	NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_string		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - tag TABLE 
 * NAME : pk_tag
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	tag
ADD CONSTRAINT pk_tag
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - tag TABLE
 * NAME : uq_tag
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	tag
ADD CONSTRAINT uq_tag
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_tag
(
	player_id	integer	NOT NULL,
	tag_id		integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_tag TABLE 
 * NAME : pk_player_tag
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_tag
ADD CONSTRAINT pk_player_tag
PRIMARY KEY
(
	player_id,
	tag_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_tag TABLE
 * NAME : player_tag_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_tag
ADD CONSTRAINT player_tag_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_tag TABLE
 * NAME : player_tag_fk_tag
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_tag
ADD CONSTRAINT player_tag_fk_tag
FOREIGN KEY
(
	tag_id
)
REFERENCES tag
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE position
(
	id		serial		NOT NULL,
	role	ty_role		NOT NULL,
	code	dm_code		NOT NULL,
	name	dm_string	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - position TABLE
 * NAME : pk_position
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	position
ADD CONSTRAINT pk_position
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - position TABLE
 * NAME : uq_position_code
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	position
ADD CONSTRAINT uq_position_code
UNIQUE
(
	code
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - position TABLE
 * NAME : uq_position_name
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	position
ADD CONSTRAINT uq_position_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_position
(
	player_id	integer		NOT NULL,
	position_id	integer		NOT NULL,
	match		dm_usint	NOT NULL  -- number of match
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_position TABLE  
 * NAME : pk_player_position
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_position
ADD CONSTRAINT pk_player_position
PRIMARY KEY
(
	player_id,
	position_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_position TABLE 
 * NAME : player_position_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_position
ADD CONSTRAINT player_position_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_position TABLE
 * NAME : player_position_fk_position
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_position
ADD CONSTRAINT player_position_fk_position
FOREIGN KEY
(
	position_id
)
REFERENCES position
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE attribute
(
	id			serial			NOT NULL,
	type		ty_attribute	NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_string		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - attribute TABLE   
 * NAME : pk_attribute
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE attribute
ADD CONSTRAINT pk_attribute
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - attribute TABLE
 * NAME : uq_attribute
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	attribute
ADD CONSTRAINT uq_attribute
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_attribute
(
	player_id		integer		NOT NULL,
	attribute_id	integer		NOT NULL,
	score			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_attribute TABLE  
 * NAME : pk_player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attribute
ADD CONSTRAINT pk_player_attribute
PRIMARY KEY
(
	player_id,
	attribute_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_attribute TABLE
 * NAME : player_attribute_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attribute
ADD CONSTRAINT player_attribute_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_attribute TABLE
 * NAME : player_attribute_fk_attribute
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attribute
ADD CONSTRAINT player_attribute_fk_attribute
FOREIGN KEY
(
	attribute_id
)
REFERENCES attribute
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE statistic
(
	id			serial			NOT NULL,
	role		ty_statistic	NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_string		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - statistic TABLE  
 * NAME : pk_statistic
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE statistic
ADD CONSTRAINT pk_statistic
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - statistic TABLE
 * NAME : uq_statistic
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	statistic
ADD CONSTRAINT uq_statistic
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : trophy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy
(
	id			serial		NOT NULL,
	type		ty_trophy	NOT NULL,
	name		dm_string	NOT NULL,
	description	dm_string	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy TABLE  
 * NAME : pk_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE trophy
ADD CONSTRAINT pk_trophy
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - trophy TABLE
 * NAME : uq_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE trophy
ADD CONSTRAINT uq_trophy
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_team_case
(
	competition_edition_id	integer	NOT NULL,
	team_id					integer	NOT NULL,
	trophy_id				integer	NOT NULL
	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy_team_case TABLE
 * NAME : pk_trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_case
ADD CONSTRAINT pk_trophy_team_case
PRIMARY KEY
(
	competition_edition_id,
	team_id,
	trophy_id
	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_team_case TABLE
 * NAME : trophy_team_case_fk_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_case
ADD CONSTRAINT trophy_team_case_fk_partecipation
FOREIGN KEY
(
	competition_edition_id,
	team_id
)
REFERENCES partecipation
(
	competition_edition_id,
	team_id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_team_case TABLE
 * NAME : trophy_team_case_fk_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_case
ADD CONSTRAINT trophy_team_case_fk_trophy
FOREIGN KEY
(
	trophy_id
)
REFERENCES trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_player_case
(
	competition_edition_id	integer	NOT NULL,
	team_id					integer	NOT NULL,
	player_id				integer NOT NULL,
	trophy_id				integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy_player_case TABLE
 * NAME : pk_trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_case
ADD CONSTRAINT pk_trophy_player_case
PRIMARY KEY
(
	competition_edition_id,
	team_id,
	player_id,
	trophy_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_case TABLE
 * NAME : trophy_player_case_fk_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_case
ADD CONSTRAINT trophy_player_case_fk_partecipation
FOREIGN KEY
(
	competition_edition_id,
	team_id
)
REFERENCES partecipation
(
	competition_edition_id,
	team_id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_case TABLE
 * NAME : trophy_player_case_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_case
ADD CONSTRAINT trophy_player_case_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_case TABLE
 * NAME : trophy_player_case_fk_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_case
ADD CONSTRAINT trophy_player_case_fk_trophy
FOREIGN KEY
(
	trophy_id
)
REFERENCES trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : prize
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize
(
	id			serial		NOT NULL,
	type		ty_trophy	NOT NULL,
	sex			ty_sex		NOT NULL,
	age_cap		ty_age_cap	NOT NULL,
	name		dm_string	NOT NULL,
	description	dm_string	NOT NULL,
	given		dm_string	NOT NULL  -- give the prize
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize TABLE
 * NAME : pk_prize
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize
ADD CONSTRAINT pk_prize
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - prize TABLE
 * NAME : uq_prize
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize
ADD CONSTRAINT uq_prize
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_team_case
(
	assign_year	dm_year	NOT NULL,
	prize_id	integer	NOT NULL,
	team_id		integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize_team_case TABLE
 * NAME : pk_prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_team_case
ADD CONSTRAINT pk_prize_team_case
PRIMARY KEY
(
	assign_year,
	prize_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_team_case TABLE
 * NAME : prize_team_case_fk_prize
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_team_case
ADD CONSTRAINT prize_team_case_fk_prize
FOREIGN KEY
(
	prize_id
)
REFERENCES prize
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_team_case TABLE
 * NAME : prize_team_case_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_team_case
ADD CONSTRAINT prize_team_case_fk_team
FOREIGN KEY
(
	team_id
)
REFERENCES team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : prize_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_player_case
(
	assign_year	dm_year	NOT NULL,
	prize_id	integer	NOT NULL,
	player_id	integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize_player_case TABLE
 * NAME : pk_prize_player_case
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_player_case
ADD CONSTRAINT pk_prize_player_case
PRIMARY KEY
(
	assign_year,
	prize_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_player_case TABLE
 * NAME : prize_player_case_fk_prize
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_player_case
ADD CONSTRAINT prize_player_case_fk_prize
FOREIGN KEY
(
	prize_id
)
REFERENCES prize
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_player_case TABLE
 * NAME : prize_player_case_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_player_case
ADD CONSTRAINT prize_player_case_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : TABLE
 * NAME : play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE play
(
	id						serial	NOT NULL,
	competition_edition_id	integer	NOT NULL,
	team_id					integer	NOT NULL,
	player_id				integer	NOT NULL,
	position_id				integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - play TABLE  
 * NAME : pk_play
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT pk_play
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - play TABLE  
 * NAME : uq_play
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT uq_play
UNIQUE
(
	competition_edition_id,
	team_id,
	player_id,
	position_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE  
 * NAME : play_fk_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT play_fk_partecipation
FOREIGN KEY
(
	competition_edition_id,
	team_id
)
REFERENCES partecipation
(
	competition_edition_id,
	team_id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE  
 * NAME : play_fk_player_position
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT play_fk_player_position
FOREIGN KEY
(
	player_id,
	position_id
)
REFERENCES player_position
(
	player_id,
	position_id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE play_statistic
(
	play_id			integer		NOT NULL,
	statistic_id	integer		NOT NULL,
	score			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - play_statistic TABLE  
 * NAME : pk_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play_statistic
ADD CONSTRAINT pk_play_statistic
PRIMARY KEY
(
	play_id,
	statistic_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play_statistic TABLE
 * NAME : play_statistic_fk_play
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play_statistic
ADD CONSTRAINT play_statistic_fk_play
FOREIGN KEY
(
	play_id
)
REFERENCES play
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play_statistic TABLE
 * NAME : play_statistic_fk_statistic
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play_statistic
ADD CONSTRAINT play_statistic_fk_statistic
FOREIGN KEY
(
	statistic_id
)
REFERENCES statistic
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : user_account
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE user_account
(
	username	dm_username	NOT NULL,
	password	dm_password	NOT NULL,
	priviledge	dm_usint	NOT NULL  -- level of priviledge					
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - user_account TABLE
 * NAME : pk_user_account
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	user_account
ADD CONSTRAINT pk_user_account
PRIMARY KEY
(
	username
);
--------------------------------------------------------------------------------

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
 * NAME : dm_psswd
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_psswd AS varchar(255)
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
 * NAME : dm_usrnm
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_usrnm AS varchar(20)
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
 * NAME : ty_attr
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_attr AS ENUM
(
	'GOALKEEPER',
	'KEY ATTRIBUTE',
	'MEDICAL',
	'MENTAL',
	'PHYSICAL',
	'SET PIECE',
	'TACTICAL - ATTACKING',
	'TACTICAL - DEFENDING',
	'TEAM WORK',
	'TECHNICAL - ATTACKING',
	'TECHNICAL - DEFENDING',
	'TECHNICAL - IN POSSESSION',
	'TECHNICAL - OUT POSSESSION'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_comp
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_comp AS ENUM
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
 * NAME : ty_stat
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_stat AS ENUM
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

	
	SELECT quote_literal(value_attribute)
	INTO value_attribute;
		
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
	id		serial		NOT NULL, -- id
	type	ty_country	NOT NULL, -- type
	code	dm_code		NOT NULL, -- code
	name	dm_string	NOT NULL  -- name
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
 * NAME : conf
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf
(
	id			serial		NOT NULL, -- id
	country_id	integer		NOT NULL, -- country id
	s_name		dm_alnum 	NOT NULL, -- short name
	l_name		dm_alnum	NOT NULL, -- long name
	super_id	integer				  -- super confederation
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf TABLE
 * NAME : pk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT pk_conf
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - conf TABLE
 * NAME : uq_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT uq_conf
UNIQUE
(
	l_name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf TABLE
 * NAME : conf_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf
ADD CONSTRAINT conf_fk_conf
FOREIGN KEY
(
	super_id
)
REFERENCES conf
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf TABLE
 * NAME : conf_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT conf_fk_country
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
	id			serial		NOT NULL, -- id
	type		ty_team 	NOT NULL, -- type
	country_id	integer		NOT NULL, -- country
	name		dm_alnum	NOT NULL, -- name
	age_cap		ty_age_cap	NOT NULL, -- age cap
	sex			ty_sex		NOT NULL, -- sex
	conf_id		integer		NOT NULL  -- confederation id
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
 * NAME : team_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT team_fk_conf
FOREIGN KEY
(
	conf_id
)
REFERENCES conf
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------







/*******************************************************************************
 * TYPE : TABLE
 * NAME : comp
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp
(
	id			serial		NOT NULL, -- id
	type		ty_comp		NOT NULL, -- type
	team_type	ty_team		NOT NULL, -- team type
	name		dm_string	NOT NULL, -- name
	sex			ty_sex		NOT NULL, -- sex
	freq		dm_usint	NOT NULL, -- frequency
	conf_id		integer		NOT NULL  -- confederation id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp TABLE
 * NAME : pk_comp
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT pk_comp
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp TABLE
 * NAME : uq_comp_name
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT uq_comp_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp TABLE
 * NAME : comp_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp
ADD CONSTRAINT comp_fk_conf
FOREIGN KEY
(
	conf_id
)
REFERENCES conf
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
	id			serial		NOT NULL, -- id
	type		ty_formula	NOT NULL, -- type
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
 * NAME : comp_ed
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed
(
	id			serial		NOT NULL, -- id
	s_year		dm_year		NOT NULL, -- start year
	e_year		dm_year		NOT NULL, -- end year
	comp_id		integer		NOT NULL, -- referring competition
	tier		dm_usint	NOT NULL, -- tier
	age_cap		ty_age_cap	NOT NULL, -- age cap
	formula_id	integer 	NOT NULL  -- formula
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed TABLE
 * NAME : pk_comp_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT pk_comp_ed
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp_ed TABLE
 * NAME : uq_comp_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT uq_comp_ed
UNIQUE
(
	s_year,
	e_year,
	comp_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - comp_ed TABLE
 * NAME : ck_comp_ed_year
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT ck_comp_ed_year
CHECK
(
	(e_year - s_year) BETWEEN 0 AND 1
);

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed TABLE
 * NAME : comp_ed_fk_comp
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT comp_ed_fk_comp
FOREIGN KEY
(
	comp_id
)
REFERENCES comp
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed TABLE
 * NAME : comp_ed_fk_formula
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT comp_ed_fk_formula
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
 * NAME : part
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE part
(
	id			serial	NOT NULL, -- id
	comp_ed_id	integer	NOT NULL, -- competition edition id
	team_id		integer	NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - part TABLE
 * NAME : pk_part
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	part
ADD CONSTRAINT pk_part
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - part TABLE
 * NAME : uq_part
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	part
ADD CONSTRAINT uq_part
UNIQUE
(
	comp_ed_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - part TABLE
 * NAME : part_fk_comp_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	part
ADD CONSTRAINT part_fk_comp_ed
FOREIGN KEY
(
	comp_ed_id
)
REFERENCES comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - part TABLE
 * NAME : part_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	part
ADD CONSTRAINT part_fk_team
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
	id			serial		NOT NULL, -- id player
	name		dm_string	NOT NULL, -- name
	surname		dm_string	NOT NULL, -- surname
	sex			ty_sex		NOT NULL, -- sex
	dob			dm_pdate	NOT NULL, -- birth date
	foot		ty_foot		NOT NULL, -- preferred foot
	country_id	integer		NOT NULL  -- birth country id
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
 * NAME : player_s
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_s
(
	r_date		dm_pdate	NOT NULL, -- retired date
	player_id	integer		NOT NULL  -- player id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_s TABLE
 * NAME : pk_player_s
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_s
ADD CONSTRAINT pk_player_s
PRIMARY KEY
(
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_s TABLE
 * NAME : player_s_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_s
ADD CONSTRAINT player_s_fk_player
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
 * NAME : nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE nationality
(
	team_nation	boolean	NOT NULL, -- country of player national team
	country_id	integer	NOT NULL, -- country id
	player_id	integer	NOT NULL  -- player id
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
	s_date		dm_pdate	NOT NULL, -- start date
	e_date		date		NOT NULL, -- end date
	team_id		integer		NOT NULL, -- team id
	player_id	integer		NOT NULL  -- player id
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
	s_date,
	team_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONTRAINT - militancy TABLE
 * NAME : ck_militancy_date
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	militancy
ADD CONSTRAINT ck_militancy_date
CHECK
(
	e_date - s_date >= 0
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
	id		serial		NOT NULL, -- id
	type	ty_attr		NOT NULL, -- type
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL  -- description
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
	player_id	integer	NOT NULL, -- player id
	tag_id		integer	NOT NULL  -- tag id
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
 * NAME : pos
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE pos
(
	id		serial		NOT NULL, -- id
	role	ty_role		NOT NULL, -- role code
	code	dm_code		NOT NULL, -- position code
	name	dm_string	NOT NULL  -- position name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - pos TABLE
 * NAME : pk_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	pos
ADD CONSTRAINT pk_pos
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - pos TABLE
 * NAME : uq_pos_code
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	pos
ADD CONSTRAINT uq_pos_code
UNIQUE
(
	code
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - pos TABLE
 * NAME : uq_pos_name
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	pos
ADD CONSTRAINT uq_pos_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_pos
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_pos
(
	player_id	integer		NOT NULL, -- player id
	pos_id		integer		NOT NULL, -- position id
	match		dm_usint	NOT NULL  -- number of match TODO: funzione
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_pos TABLE  
 * NAME : pk_player_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_pos
ADD CONSTRAINT pk_player_pos
PRIMARY KEY
(
	player_id,
	pos_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_pos TABLE 
 * NAME : player_pos_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_pos
ADD CONSTRAINT player_pos_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_pos TABLE
 * NAME : player_pos_fk_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_pos
ADD CONSTRAINT player_pos_fk_pos
FOREIGN KEY
(
	pos_id
)
REFERENCES pos
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : attr
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE attr
(
	id		serial		NOT NULL, -- attribute id
	type	ty_attr		NOT NULL, -- attribute type
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL  -- description
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - attr TABLE   
 * NAME : pk_attr
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE attr
ADD CONSTRAINT pk_attr
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - attr TABLE
 * NAME : uq_attr
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	attr
ADD CONSTRAINT uq_attr
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_attr
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_attr
(
	player_id	integer		NOT NULL, -- player id
	attr_id		integer		NOT NULL, -- attribute id
	score		dm_usint	NOT NULL  -- score of attribute for player
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_attr TABLE  
 * NAME : pk_player_attr
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attr
ADD CONSTRAINT pk_player_attr
PRIMARY KEY
(
	player_id,
	attr_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_attr TABLE
 * NAME : player_attr_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attr
ADD CONSTRAINT player_attr_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_attr TABLE
 * NAME : player_attr_fk_attr
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attr
ADD CONSTRAINT player_attr_fk_attr
FOREIGN KEY
(
	attr_id
)
REFERENCES attr
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : stat
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE stat
(
	id		serial		NOT NULL, -- id
	role	ty_stat		NOT NULL, -- associated role
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL  -- description
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - stat TABLE  
 * NAME : pk_stat
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE stat
ADD CONSTRAINT pk_stat
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - stat TABLE
 * NAME : uq_stat
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	stat
ADD CONSTRAINT uq_stat
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
	id		serial		NOT NULL, -- id
	type	ty_trophy	NOT NULL, -- type
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL  -- description
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
 * NAME : comp_ed_trophy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed_trophy
(
	id			serial	NOT NULL, -- id
	comp_ed_id	integer	NOT NULL, -- competition edition
	trophy_id	integer	NOT NULL  -- trophy id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed_trophy TABLE
 * NAME : pk_comp_ed_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_trophy
ADD CONSTRAINT pk_comp_ed_trophy
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp_ed_trophy TABLE
 * NAME : uq_comp_ed_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_trophy
ADD CONSTRAINT uq_comp_ed_trophy
UNIQUE
(
	comp_ed_id,
	trophy_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_trophy TABLE
 * NAME : comp_ed_trophy_fk_comp_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_trophy
ADD CONSTRAINT comp_ed_trophy_fk_comp_ed
FOREIGN KEY
(
	comp_ed_id
)
REFERENCES comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_trophy TABLE
 * NAME : comp_ed_trophy_fk_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_trophy
ADD CONSTRAINT comp_ed_trophy_fk_trophy
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
 * NAME : trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_team_case
(
	comp_ed_trophy_id	integer	NOT NULL, -- trophy competition edition id
	team_id				integer	NOT NULL  -- team id
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
	comp_ed_trophy_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_team_case TABLE
 * NAME : trophy_team_case_fk_comp_ed_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_case
ADD CONSTRAINT trophy_team_case_fk_comp_ed_trophy
FOREIGN KEY
(
	comp_ed_trophy_id
)
REFERENCES comp_ed_trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_team_case TABLE
 * NAME : trophy_team_case_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_case
ADD CONSTRAINT trophy_team_case_fk_team
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
 * NAME : trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_player_case
(
	comp_ed_trophy_id	integer	NOT NULL, -- trophy competition edition id
	team_id				integer	NOT NULL, -- team id
	player_id			integer NOT NULL  -- player id
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
	comp_ed_trophy_id,
	team_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_case TABLE
 * NAME : trophy_player_case_fk_comp_ed_trophy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_case
ADD CONSTRAINT trophy_player_case_fk_comp_ed_trophy
FOREIGN KEY
(
	comp_ed_trophy_id
)
REFERENCES comp_ed_trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_case TABLE
 * NAME : trophy_player_case_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_case
ADD CONSTRAINT trophy_player_case_fk_team
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
 * TYPE : TABLE
 * NAME : prize
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize
(
	id		serial		NOT NULL, -- id
	type	ty_trophy	NOT NULL, -- type
	sex		ty_sex		NOT NULL, -- sex
	age_cap	ty_age_cap	NOT NULL, -- age cap
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL, -- description
	given	dm_string	NOT NULL  -- give the prize
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
 * NAME : prize_ed
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_ed
(
	id			serial	NOT NULL, -- id
	a_year		dm_year	NOT NULL, -- assigning year
	prize_id	integer	NOT NULL  -- prize id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize_ed TABLE
 * NAME : pk_prize_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_ed
ADD CONSTRAINT pk_prize_ed
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - prize_ed TABLE
 * NAME : pk_prize_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_ed
ADD CONSTRAINT uq_prize_ed
UNIQUE
(
	prize_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_ed TABLE
 * NAME : prize_ed_fk_prize
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_ed
ADD CONSTRAINT prize_ed_fk_prize
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
 * TYPE : TABLE
 * NAME : prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_team_case
(
	prize_ed_id	integer	NOT NULL, -- prize edition id
	team_id		integer	NOT NULL  -- team id
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
	prize_ed_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_team_case TABLE
 * NAME : prize_team_case_fk_prize_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_team_case
ADD CONSTRAINT prize_team_case_fk_prize_ed
FOREIGN KEY
(
	prize_ed_id
)
REFERENCES prize_ed
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
	prize_ed_id	integer	NOT NULL, -- prize
	player_id	integer	NOT NULL  -- player
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
	prize_ed_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_player_case TABLE
 * NAME : prize_player_case_fk_prize_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_player_case
ADD CONSTRAINT prize_player_case_fk_prize_ed
FOREIGN KEY
(
	prize_ed_id
)
REFERENCES prize_ed
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
	id			serial	NOT NULL, -- id
	part_id		integer	NOT NULL, -- team competition edition id
	player_id	integer	NOT NULL, -- player id
	pos_id		integer	NOT NULL  -- position id
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
	part_id,
	player_id,
	pos_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE  
 * NAME : play_fk_part
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT play_fk_part
FOREIGN KEY
(
	part_id
)
REFERENCES part
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE  
 * NAME : play_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT play_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE  
 * NAME : play_fk_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT play_fk_pos
FOREIGN KEY
(
	pos_id
)
REFERENCES pos
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : play_stat
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE play_stat
(
	play_id	integer		NOT NULL, -- play id
	stat_id	integer		NOT NULL, -- statistic id
	score	dm_usint	NOT NULL  -- score
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - play_stat TABLE  
 * NAME : pk_play_stat
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play_stat
ADD CONSTRAINT pk_play_stat
PRIMARY KEY
(
	play_id,
	stat_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play_stat TABLE
 * NAME : play_stat_fk_stat
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play_stat
ADD CONSTRAINT play_stat_fk_stat
FOREIGN KEY
(
	stat_id
)
REFERENCES stat
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play_stat TABLE
 * NAME : play_stat_fk_play
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play_stat
ADD CONSTRAINT play_stat_fk_play
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
 * TYPE : TABLE
 * NAME : user_account
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE user_account
(
	id			serial		NOT NULL, -- id
	username	dm_usrnm	NOT NULL, -- username
	password	dm_psswd	NOT NULL, -- password
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
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - user_account TABLE
 * NAME : uq_user_account
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	user_account
ADD CONSTRAINT uq_user_account
UNIQUE
(
	username
);
--------------------------------------------------------------------------------

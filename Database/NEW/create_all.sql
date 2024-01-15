/******************************************************************************* 
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : compUTER SCIENCE                                            
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
 * NAME : dm_pyear
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_pyear AS smallint
CHECK
(
	value BETWEEN 0 AND extract(year from current_date)
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
	IN	num_group		integer,
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
 * IN      : integer, integer, boolean, boolean, integer, boolean
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_min_match
(
	IN	num_group		integer,
	IN	team_group	integer,
	IN	ha_group		boolean,
	IN	oc_group		boolean,
	IN	team_knock	integer,
	IN	ha_knock		boolean
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
DECLARE

	min integer := 0; -- variable to accumulate minimum number of match

BEGIN

	-- if there are not groups the competition is just knockout type
	IF (0 = num_group) THEN
		-- miminum number of matches for each team is 1
		min = 1;
		
		-- if knock out phase is home and away type
		IF (ha_knock) THEN
			-- double the minimum
			min = min * 2;
		END IF;
		
	ELSE
		-- if there are groups, a team will necessarily have to play
		-- against all the teams in the same group
		min = team_group - 1;
		
		-- if group phase is home and away type
		IF (ha_group) THEN
			-- double the minimum
			min = min * 2;
		END IF;
		
		-- if group phase is open and closure type
		IF (oc_group) THEN
			-- double the minimum
			min = min * 2;
		END IF;
		
	END IF;

	RETURN min;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_max_match
 *
 * IN      : integer, integer, boolean, boolean, integer, boolean
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_max_match
(
	IN	num_group		integer,
	IN	team_group	integer,
	IN	ha_group		boolean,
	IN	oc_group		boolean,
	IN	team_knock	integer,
	IN	ha_knock		boolean
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
DECLARE

	max integer := 0; -- variable to accumulate maximum number of match

BEGIN
	
	-- if there is a group phase
	IF (num_group <> 0) THEN
		-- a team will necessarily have to play against
		-- all the teams in its group
		max = team_group - 1;
		
		-- if group phase is home and away type
		IF (ha_group) THEN
			-- double the maximum
			max = max * 2;
		END IF;
		
		-- if group phase is open and closure type
		IF (oc_group) THEN
			-- double the maximum
			max = max * 2;
		END IF;
		
	END IF;
	-- if there is a knock out phase
	IF (team_knock <> 0) THEN
		-- add all matches till final
		max = max + CAST(log(2, team_knock) AS integer);
		
		-- if knock phase is home and away type
		IF (ha_knock) THEN
			-- add all matches except final
			max = max + CAST(log(2, team_knock) AS integer) - 1;
		END IF;
		
	END IF;
	
	RETURN max;	

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
	s_year	dm_pyear	NOT NULL, -- foundation year
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
 * NAME : country_s
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_s
(
	e_year		dm_pyear	NOT NULL, -- suppression year
	country_id	integer		NOT NULL  -- country id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_s TABLE
 * NAME : pk_country_s
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_s
ADD CONSTRAINT pk_country_s
PRIMARY KEY
(
	country_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_s TABLE
 * NAME : country_s_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_s
ADD CONSTRAINT country_s_fk_country
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
 * NAME : conf
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf
(
	id		serial		NOT NULL, -- id
	s_year	dm_pyear	NOT NULL, -- foundation year
	type	ty_country	NOT NULL, -- type
	code	dm_alnum 	NOT NULL, -- code
	name	dm_alnum	NOT NULL  -- name
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
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : conf_s
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_s
(
	e_year	dm_pyear	NOT NULL, -- suppression year
	conf_id	integer 	NOT NULL  -- confederation id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_s TABLE
 * NAME : pk_conf_s
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_s
ADD CONSTRAINT pk_conf_s
PRIMARY KEY
(
	conf_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_s TABLE
 * NAME : conf_s_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_s
ADD CONSTRAINT conf_s_fk_conf
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
 * NAME : conf_conf
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_conf
(
	s_year		dm_pyear	NOT NULL, -- start year
	super_id	integer		NOT NULL, -- having member confederation id
	member_id	integer		NOT NULL  -- member confederation id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_conf TABLE
 * NAME : pk_conf_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_conf
ADD CONSTRAINT pk_conf_conf
PRIMARY KEY
(
	super_id,
	member_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_conf TABLE
 * NAME : conf_conf_super_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf
ADD CONSTRAINT conf_conf_super_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_conf TABLE
 * NAME : conf_conf_member_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf
ADD CONSTRAINT conf_conf_member_fk_conf
FOREIGN KEY
(
	member_id
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
 * NAME : conf_conf_h
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_conf_h
(
	s_year		dm_pyear 	NOT NULL, -- start year
	e_year		dm_pyear	NOT NULL, -- end year
	super_id	integer		NOT NULL, -- having member confederation
	member_id	integer		NOT NULL  -- member confederation
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_conf_h TABLE
 * NAME : pk_conf_conf_h
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_conf_h
ADD CONSTRAINT pk_conf_conf_h
PRIMARY KEY
(
	s_year,
	super_id,
	member_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_conf_h TABLE
 * NAME : ck_conf_conf_h_year
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_conf_h
ADD CONSTRAINT ck_conf_conf_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_conf_h TABLE
 * NAME : conf_conf_h_super_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf_h
ADD CONSTRAINT conf_conf_h_super_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_conf_h TABLE
 * NAME : conf_conf_h_member_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf_h
ADD CONSTRAINT conf_conf_h_member_fk_conf
FOREIGN KEY
(
	member_id
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
 * NAME : country_conf
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_conf
(
	s_year		dm_pyear	NOT NULL, -- start year
	country_id	integer		NOT NULL, -- country id
	conf_id		integer		NOT NULL  -- confederation id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_conf TABLE
 * NAME : pk_country_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf
ADD CONSTRAINT pk_country_conf
PRIMARY KEY
(
	conf_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_conf TABLE
 * NAME : country_conf_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf
ADD CONSTRAINT country_conf_fk_country
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
 * TYPE : FOREIGN KEY CONSTRAINT - country_conf TABLE
 * NAME : country_conf_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf
ADD CONSTRAINT country_conf_fk_conf
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
 * NAME : country_conf_h
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_conf_h
(
	s_year		dm_pyear	NOT NULL, -- start year
	e_year		dm_pyear	NOT NULL, -- end year
	country_id	integer		NOT NULL, -- country id
	conf_id		integer		NOT NULL  -- confederation id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_conf_h TABLE
 * NAME : pk_country_conf_h
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf_h
ADD CONSTRAINT pk_country_conf_h
PRIMARY KEY
(
	s_year,
	country_id,
	conf_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - country_conf_h TABLE
 * NAME : ck_country_conf_h_year
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf_h
ADD CONSTRAINT ck_country_conf_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_conf_h TABLE
 * NAME : country_conf_h_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf_h
ADD CONSTRAINT country_conf_h_fk_country
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
 * TYPE : FOREIGN KEY CONSTRAINT - country_conf_h TABLE
 * NAME : country_conf_h_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_conf_h
ADD CONSTRAINT country_conf_h_fk_conf
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
 * NAME : team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team
(
	id		serial		NOT NULL, -- id
	s_year	dm_pyear	NOT NULL, -- foundation year
	type	ty_team 	NOT NULL, -- type
	name	dm_alnum	NOT NULL, -- name
	age_cap	ty_age_cap	NOT NULL, -- age cap
	sex		ty_sex		NOT NULL  -- sex
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
	s_year,
	name,
	age_cap,
	sex
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : team_s
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_s
(
	e_year	dm_pyear	NOT NULL, -- suppression year
	team_id	integer		NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_s TABLE
 * NAME : pk_team_s
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_s
ADD CONSTRAINT pk_team_s
PRIMARY KEY
(
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_s TABLE
 * NAME : team_s_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_s
ADD CONSTRAINT team_s_fk_team
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
 * NAME : country_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_team
(
	s_year		dm_pyear	NOT NULL, -- start year
	country_id	integer		NOT NULL, -- country id
	team_id		integer		NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_team TABLE
 * NAME : pk_country_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team
ADD CONSTRAINT pk_country_team
PRIMARY KEY
(
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_team TABLE
 * NAME : country_team_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team
ADD CONSTRAINT country_team_fk_country
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
 * TYPE : FOREIGN KEY CONSTRAINT - country_team TABLE
 * NAME : country_team_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team
ADD CONSTRAINT country_team_fk_team
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
 * NAME : country_team_h
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_team_h
(
	s_year		dm_pyear	NOT NULL, -- start year
	e_year		dm_pyear	NOT NULL, -- end year
	country_id	integer		NOT NULL, -- country id
	team_id		integer		NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_team_h TABLE
 * NAME : pk_country_team_h
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team_h
ADD CONSTRAINT pk_country_team_h
PRIMARY KEY
(
	s_year,
	country_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - country_team_h TABLE
 * NAME : ck_country_team_h_year
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team_h
ADD CONSTRAINT ck_country_team_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_team_h TABLE
 * NAME : country_team_h_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team_h
ADD CONSTRAINT country_team_h_fk_country
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
 * TYPE : FOREIGN KEY CONSTRAINT - country_team_h TABLE
 * NAME : country_team_h_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_team_h
ADD CONSTRAINT country_team_h_fk_team
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
 * NAME : conf_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_team
(
	s_year	dm_pyear	NOT NULL, -- start year
	conf_id	integer		NOT NULL, -- confederation id
	team_id	integer		NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_team TABLE
 * NAME : pk_conf_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team
ADD CONSTRAINT pk_conf_team
PRIMARY KEY
(
	conf_id,
	team_id
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_team TABLE
 * NAME : conf_team_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team
ADD CONSTRAINT conf_team_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_team TABLE
 * NAME : conf_team_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team
ADD CONSTRAINT conf_team_fk_team
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
 * NAME : conf_team_h
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_team_h
(
	s_year	dm_pyear	NOT NULL, -- start year
	e_year	dm_pyear	NOT NULL, -- end year
	conf_id	integer		NOT NULL, -- confederation id
	team_id	integer		NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_team_h TABLE
 * NAME : pk_conf_team_h
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team_h
ADD CONSTRAINT pk_conf_team_h
PRIMARY KEY
(
	s_year,
	conf_id,
	team_id
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_team_h TABLE
 * NAME : ck_conf_team_h_year
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team_h
ADD CONSTRAINT ck_conf_team_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_team_h TABLE
 * NAME : conf_team_h_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team_h
ADD CONSTRAINT conf_team_h_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_team_h TABLE
 * NAME : conf_team_h_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_team_h
ADD CONSTRAINT conf_team_h_fk_team
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
 * NAME : comp
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp
(
	id			serial		NOT NULL, -- id
	s_year		dm_pyear	NOT NULL,  -- foundation year
	type		ty_comp		NOT NULL, -- type
	team_type	ty_team		NOT NULL, -- team type
	name		dm_string	NOT NULL, -- name
	sex			ty_sex		NOT NULL, -- sex
	freq		dm_usint	NOT NULL  -- frequency
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
 * TYPE : TABLE
 * NAME : comp_s
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_s
(
	e_year	dm_pyear	NOT NULL, -- suppression year
	comp_id	integer		NOT NULL  -- competition id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_s TABLE
 * NAME : pk_comp_s
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_s
ADD CONSTRAINT pk_comp_s
PRIMARY KEY
(
	comp_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_s TABLE
 * NAME : comp_s_fk_comp
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_s
ADD CONSTRAINT comp_s_fk_comp
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
 * TYPE : TABLE
 * NAME : conf_comp
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_comp
(
	s_year	dm_pyear	NOT NULL, -- start year
	conf_id	integer		NOT NULL, -- confederation id
	comp_id	integer		NOT NULL  -- competition id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_comp TABLE
 * NAME : pk_conf_comp
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp
ADD CONSTRAINT pk_conf_comp
PRIMARY KEY
(
	conf_id,
	comp_id
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_comp TABLE
 * NAME : conf_comp_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp
ADD CONSTRAINT conf_comp_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_comp TABLE
 * NAME : conf_comp_fk_comp
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp
ADD CONSTRAINT conf_comp_fk_comp
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
 * TYPE : TABLE
 * NAME : conf_comp_h
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_comp_h
(
	s_year	dm_pyear	NOT NULL, -- start year
	e_year	dm_pyear	NOT NULL, -- end year
	conf_id	integer		NOT NULL, -- confederation id
	comp_id	integer		NOT NULL  -- competition id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_team_h TABLE
 * NAME : pk_conf_team_h
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp_h
ADD CONSTRAINT pk_conf_comp_h
PRIMARY KEY
(
	s_year,
	conf_id,
	comp_id
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_comp_h TABLE
 * NAME : ck_conf_comp_h_year
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp_h
ADD CONSTRAINT ck_conf_comp_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_comp_h TABLE
 * NAME : conf_comp_h_fk_conf
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp_h
ADD CONSTRAINT conf_comp_h_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_comp_h TABLE
 * NAME : conf_comp_h_fk_comp
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_comp_h
ADD CONSTRAINT conf_comp_h_fk_comp
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
 * TYPE : TABLE
 * NAME : formula
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE formula
(
	id			serial		NOT NULL, -- id
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
	ha_group	boolean		NOT NULL, -- home and away group phase
	oc_group	boolean  	NOT NULL, -- open and closure group phase
	team_knock	dm_usint	NOT NULL, -- number of teams for knock out phase
	ha_knock	boolean		NOT NULL, -- home and away knockout phase
	min_match	dm_usint 	NOT NULL  -- minimum number of matches for team
		GENERATED ALWAYS AS
		(
			set_formula_min_match
			(
				num_group,
				team_group,
				ha_group,
				oc_group,
				team_knock,
				ha_knock
			)
		)
		STORED						,
	max_match	dm_usint 	NOT NULL  -- maximum number of matches for team
		GENERATED ALWAYS AS
		(
			set_formula_max_match
			(
				num_group,
				team_group,
				ha_group,
				oc_group,
				team_knock,
				ha_knock
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
	num_group,
	team_group,
	ha_group,
	ha_knock,
	oc_group,
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
		0 = num_group
		AND
		0 = team_group
		AND
		ha_group = FALSE
		AND
		oc_group = FALSE
	)
	OR
	(
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
		0 = team_knock
		AND
		ha_knock = FALSE
	)
	OR
	(
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
	s_year		dm_pyear	NOT NULL, -- start year
	e_year		dm_pyear	NOT NULL, -- end year
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
	e_year - s_year >= 0
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
 * NAME : comp_ed_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed_team
(
	id			serial	NOT NULL, -- id
	comp_ed_id	integer	NOT NULL, -- competition edition id
	team_id		integer	NOT NULL  -- team id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed_team TABLE
 * NAME : pk_comp_ed_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_team
ADD CONSTRAINT pk_comp_ed_team
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp_ed_team TABLE
 * NAME : uq_comp_ed_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_team
ADD CONSTRAINT uq_comp_ed_team
UNIQUE
(
	comp_ed_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team TABLE
 * NAME : comp_ed_team_fk_comp_ed
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_team
ADD CONSTRAINT comp_ed_team_fk_comp_ed
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
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team TABLE
 * NAME : comp_ed_team_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed_team
ADD CONSTRAINT comp_ed_team_fk_team
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
 * NAME : country_player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_player
(
	country_id	integer	NOT NULL, -- country id
	player_id	integer	NOT NULL  -- player id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_player TABLE
 * NAME : pk_country_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE country_player
ADD CONSTRAINT pk_country_player
PRIMARY KEY
(
	country_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_player TABLE
 * NAME : country_player_fk_country
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_player
ADD CONSTRAINT country_player_fk_country
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
 * TYPE : FOREIGN KEY CONSTRAINT - country_player TABLE
 * NAME : country_player_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_player
ADD CONSTRAINT country_player_fk_player
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
	s_date		dm_pdate	NOT NULL, -- start date
	e_date		date		NOT NULL, -- end date
	team_id		integer		NOT NULL, -- team id
	player_id	integer		NOT NULL  -- player id
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
	s_date,
	team_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONTRAINT - play TABLE
 * NAME : ck_play_date
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	play
ADD CONSTRAINT ck_play_date
CHECK
(
	e_date - s_date >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE
 * NAME : play_fk_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	play
ADD CONSTRAINT play_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE
 * NAME : play_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	play
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
	s_year	dm_pyear	NOT NULL, -- starting year
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
 * NAME : prize_s
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_s
(
	e_year		dm_pyear	NOT NULL, -- suppression year
	prize_id	integer		NOT NULL  -- prize
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize_s TABLE
 * NAME : pk_prize_s
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_s
ADD CONSTRAINT pk_prize_s
PRIMARY KEY
(
	prize_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_s TABLE
 * NAME : prize_s_fk_prize
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_s
ADD CONSTRAINT prize_s_fk_prize
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
 * NAME : prize_ed
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_ed
(
	id			serial		NOT NULL, -- id
	a_year		dm_pyear	NOT NULL, -- assigning year
	prize_id	integer		NOT NULL  -- prize id
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
 * NAME : comp_ed_team_player_pos
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed_team_player_pos
(
	id				serial	NOT NULL, -- id
	comp_ed_team_id	integer	NOT NULL, -- team competition edition id
	player_id		integer	NOT NULL, -- player id
	pos_id			integer	NOT NULL  -- position id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed_team_player_pos TABLE  
 * NAME : pk_comp_ed_team_player_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos
ADD CONSTRAINT pk_comp_ed_team_player_pos
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp_ed_team_player_pos TABLE  
 * NAME : uq_comp_ed_team_player_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos
ADD CONSTRAINT uq_comp_ed_team_player_pos
UNIQUE
(
	comp_ed_team_id,
	player_id,
	pos_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team_player_pos TABLE  
 * NAME : comp_ed_team_player_pos_fk_comp_ed_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos
ADD CONSTRAINT comp_ed_team_player_pos_fk_comp_ed_team
FOREIGN KEY
(
	comp_ed_team_id
)
REFERENCES comp_ed_team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team_player_pos TABLE  
 * NAME : comp_ed_team_player_pos_fk_player
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos
ADD CONSTRAINT comp_ed_team_player_pos_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team_player_pos TABLE  
 * NAME : comp_ed_team_player_pos_fk_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos
ADD CONSTRAINT comp_ed_team_player_pos_fk_pos
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
 * NAME : comp_ed_team_player_pos_stat
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed_team_player_pos_stat
(
	comp_ed_team_player_pos_id	integer		NOT NULL, -- p_season id
	stat_id						integer		NOT NULL, -- statistic id
	score						dm_usint	NOT NULL  -- score
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed_team_player_pos_stat TABLE  
 * NAME : pk_comp_ed_team_player_pos_stat
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos_stat
ADD CONSTRAINT pk_comp_ed_team_player_pos_stat
PRIMARY KEY
(
	comp_ed_team_player_pos_id,
	stat_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team_player_pos_stat TABLE
 * NAME : comp_ed_team_player_pos_stat_fk_stat
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos_stat
ADD CONSTRAINT comp_ed_team_player_pos_stat_fk_stat
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
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed_team_player_pos_stat TABLE
 * NAME : comp_ed_team_player_pos_stat_fk_comp_ed_team_player_pos
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE comp_ed_team_player_pos_stat
ADD CONSTRAINT comp_ed_team_player_pos_stat_fk_comp_ed_team_player_pos
FOREIGN KEY
(
	comp_ed_team_player_pos_id
)
REFERENCES comp_ed_team_player_pos
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

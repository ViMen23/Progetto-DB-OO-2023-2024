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
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : COMPUTER SCIENCE                                            
 * CLASS        : DATA BASES I                                                
 * TEACHER      : SILVIO BARRA                                                
 * YEAR         : 2023-2024                                                   
 ******************************************************************************/



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
					'\u0259'
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
					'\u0259'
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
					'\u0259'
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
					'\u0259'
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
					'\u0259'
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
					'\u0259'
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
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : COMPUTER SCIENCE                                            
 * CLASS        : DATA BASES I                                                
 * TEACHER      : SILVIO BARRA                                                
 * YEAR         : 2023-2024                                                   
 ******************************************************************************/



/*******************************************************************************
 * ENUM TYPE
 ******************************************************************************/




/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_attribute AS ENUM
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
 * NAME : ty_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_competition AS ENUM
(
	'CUP',
	'LEAGUE',
	'SUPER CUP'
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
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : competitionUTER SCIENCE                                            
 * CLASS        : DATA BASES I                                                
 * TEACHER      : SILVIO BARRA                                                
 * YEAR         : 2023-2024                                                   
 ******************************************************************************/




/*******************************************************************************
 * FUNCTION PRE SCHEMA                                              
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
 * NAME : attr_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION attr_exists
(
	IN	name_table	text,
	IN	name_attr	text
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
			column_name = name_attr
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_type_attr
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_type_attr
(
	IN	name_table	text,
	IN	name_attr	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_attr text;

BEGIN
	
	SELECT
		data_type
	INTO
		type_attr
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_attr;
		
	RETURN type_attr;
	
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
	IN	separator	text,
	IN	in_string	text
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	count		integer;	
	name_table	text;
	name_attr	text;
	value_attr	text;
	type_attr	text;
	row_table	record;
	to_execute	text;
	id_to_find	integer;
	
BEGIN
	
	to_execute = '';

	id_to_find = NULL;
	count = 0;

	FOR row_table IN SELECT string_to_table(in_string, separator)
	LOOP
		
		IF (0 = count) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			to_execute = to_execute || 'SELECT id ';
			to_execute = to_execute || 'FROM ' || name_table || ' WHERE ';
			
		ELSIF (1 = (count % 2)) THEN
		
			name_attr = row_table.string_to_table;
			
			IF (NOT attr_exists(name_table, name_attr)) THEN
				RETURN NULL;
			END IF;
			
			type_attr = get_type_attr(name_table, name_attr);
			
			to_execute = to_execute || name_attr || ' = ';
			
		ELSIF (0 = (count % 2)) THEN
		
			value_attr = row_table.string_to_table;
			
			IF (NOT type_attr LIKE '%int%') THEN
				 
				value_attr = quote_literal(value_attr);
				
			END IF;
				
			to_execute = to_execute || value_attr || ' AND ';
			
		END IF;
		
		count = count + 1;
		
	END LOOP;
	
	to_execute = trim(to_execute, ' AND ');
	
	to_execute = to_execute || ';';
	
	EXECUTE to_execute INTO id_to_find;
	
	RETURN id_to_find;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attr
 *
 * IN      : text, text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attr
(
	IN	name_table	text,
	IN	name_attr	text,
	IN	value_id	integer
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				integer;
	type_attr		text;
	value_attr		text;
	to_execute		text;
	cur_to_execute	refcursor;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	IF (NOT attr_exists(name_table, name_attr)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = '';
	to_execute = to_execute || 'SELECT ' || name_attr;
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	OPEN cur_to_execute FOR EXECUTE to_execute;
	
	type_attr = get_type_attr(name_table, name_attr);
	
	IF (type_attr LIKE '%int%') THEN
		
		FETCH cur_to_execute INTO tmp;
		 
		value_attr = CAST(tmp AS text); 
		
	ELSE
	
		FETCH cur_to_execute INTO value_attr;
	
	END IF;
	
	CLOSE cur_to_execute;

	RETURN value_attr;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_rec
 *
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_rec
(
	IN	name_table	text,
	IN	value_id	integer
)
RETURNS record
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	to_execute	text;
	rec_table	record;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = '';
	to_execute = to_execute || 'SELECT *';
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	EXECUTE to_execute INTO rec_table;

	RETURN rec_table;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


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
 * NAME : uq_confederation_long_name
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	confederation
ADD CONSTRAINT uq_confederation_long_name
UNIQUE
(
	long_name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - confederation TABLE
 * NAME : uq_confederation_country_id
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	confederation
ADD CONSTRAINT uq_confederation_country_id
UNIQUE
(
	country_id
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
	name				dm_alnum		NOT NULL,
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
 * NAME : competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE competition_edition
(
	id				serial		NOT NULL,
	start_year		dm_year		NOT NULL,
	end_year		dm_year		NOT NULL,
	competition_id	integer		NOT NULL,
	total_team		dm_usint	NOT NULL
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
	start_year,
	competition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - competition_edition TABLE
 * NAME : ck_competition_edition_range
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition_edition
ADD CONSTRAINT ck_competition_edition_range
CHECK
(
	(end_year - start_year) BETWEEN 0 AND 1
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - competition_edition TABLE
 * NAME : ck_competition_edition_total_team
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	competition_edition
ADD CONSTRAINT ck_competition_edition_total_team
CHECK
(
	total_team BETWEEN 2 AND 128
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
	id			serial		NOT NULL,
	team_id		integer		NOT NULL,
	player_id	integer		NOT NULL,
	date_range	daterange	NOT NULL
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
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - militancy TABLE
 * NAME : uq_militancy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE militancy
ADD CONSTRAINT uq_militancy
UNIQUE
(
	team_id,
	player_id,
	date_range
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
 * NAME : militancy_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE militancy_statistic
(
	militancy_id	integer		NOT NULL,
	statistic_id	integer		NOT NULL,
	score			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - militancy_statistic TABLE  
 * NAME : pk_militancy_statistic
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE militancy_statistic
ADD CONSTRAINT pk_militancy_statistic
PRIMARY KEY
(
	militancy_id,
	statistic_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - militancy_statistic TABLE
 * NAME : militancy_statistic_fk_militancy
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE militancy_statistic
ADD CONSTRAINT militancy_statistic_fk_militancy
FOREIGN KEY
(
	militancy_id
)
REFERENCES militancy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - militancy_statistic TABLE
 * NAME : militancy_statistic_fk_statistic
 *
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE militancy_statistic
ADD CONSTRAINT militancy_statistic_fk_statistic
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
 * FUNCTION POST SCHEMA                                              
 ******************************************************************************/



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_containment
 *
 * IN      : country.id%TYPE, country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_containment
(
	IN	id_in_country	country.id%TYPE,
	IN	id_su_country	country.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	type_in_country	text;			
	type_su_country	text;
	
BEGIN
	
	type_in_country	= get_attr('country', 'type', id_in_country);						
	type_su_country = get_attr('country', 'type', id_su_country);

	IF
	(
		('NATION' = type_in_country AND 'CONTINENT' = type_su_country)
		OR
		('CONTINENT' = type_in_country AND 'WORLD' = type_su_country)
		OR
		('WORLD' = type_in_country AND type_su_country IS NULL)
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
	IN	id_country	country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_country	text;

BEGIN
	
	type_country = get_attr('country', 'type', id_country);

	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : conf_from_comp_ed
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : confederation.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_from_comp_ed
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS confederation.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	id_comp	integer;
	id_conf	integer;

BEGIN
	
	tmp = get_attr('competition_edition', 'competition_id', id_comp_ed);
	id_comp = CAST(tmp AS integer);

	tmp = get_attr('competition', 'confederation_id', id_comp);
	id_conf = CAST(tmp AS integer);

	RETURN id_conf;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_edition
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_edition
(
	IN	id_comp	competition.id%TYPE
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
			competition_id = id_comp
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------





/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_freq
 *
 * IN      : competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_freq
(
	IN	id_comp	competition.id%TYPE,
	IN	s_year	dm_year
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	freq	integer;
	a_year	integer;
	
BEGIN
	
	tmp = get_attr('competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	IF (freq <= 1) THEN
		RETURN TRUE;
	ELSE

		SELECT
			start_year
		INTO
			a_year
		FROM
			competition_edition
		WHERE
			competition_id = id_comp
		LIMIT
			1;

		IF (0 = ((s_year - a_year) % freq)) THEN
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
 * NAME : belong_to
 *
 * IN      : team.id%TYPE, confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to
(
	IN	id_team	team.id%TYPE,
	IN	id_conf	confederation.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp							text;
	id_conf_team				integer;
	id_super_conf_team			integer;
	id_super_super_conf_team	integer;

BEGIN

	tmp = get_attr('team', 'confederation_id', id_team);
	id_conf_team = CAST(tmp AS integer);

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_conf_team);
	id_super_conf_team = CAST(tmp AS integer);
	
	IF (id_super_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_super_conf_team);
	id_super_super_conf_team = CAST(tmp AS integer);
	
	IF (id_super_super_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------





/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : available
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION available
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;
	tot_team	integer;

BEGIN
	
	tmp = get_attr('competition_edition', 'total_team', id_comp_ed);
	tot_team = CAST(tmp AS integer);

	RETURN
	(
		SELECT
			count(*) < tot_team
		FROM
			partecipation
		WHERE
			competition_edition_id = id_comp_ed
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_role
 *
 * IN      : player.id%TYPE, ty_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_role
(
	IN	id_player		player.id%TYPE,
	IN	role_to_check	ty_role
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	pos_player	integer;
	role_pos	text;

BEGIN
	
	FOR pos_player
	IN
		SELECT
			position_id
		FROM
			player_position
		WHERE
			player_id = id_player
	LOOP

		role_pos = get_attr('position', 'role', pos_player);

		IF (role_pos = role_to_check) THEN
			RETURN TRUE;
		END IF;

	END LOOP;

	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_time_range
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_time_range
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	time_range	daterange;
	s_year		integer;
	e_year		integer;
	s_date		date;
	e_date		date;

BEGIN
	
	s_year = get_attr('competition_edition', 'start_year', id_comp_ed);
	e_year = get_attr('competition_edition', 'end_year', id_comp_ed);

	IF (s_year = e_year) THEN
		s_date = make_date(s_year, 01, 01);
		e_date = make_date(s_year, 12, 31);
	ELSE
		s_date = make_date(s_year, 08, 01);
		e_date = make_date(e_year, 07, 31);
	END IF;

	time_range = daterange(s_date, e_date, '[]');

	RETURN time_range;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : play_in_during
 *
 * IN      : player.id%TYPE, team.id%TYPE, daterange 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION play_in_during
(
	IN	id_player	player.id%TYPE,
	IN	id_team		team.id%TYPE,
	IN	time_range	daterange
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
			militancy
		WHERE
			team_id = id_team
			AND
			player_id = id_player
			AND
			date_range && time_range
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : pos_fit_stat
 *
 * IN      : position.id%TYPE, statistic.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION pos_fit_stat
(
	IN	id_pos		"position".id%TYPE,
	IN	id_stat		statistic.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	role_pos	text;
	type_stat	text;

BEGIN
	
	role_pos = get_attr('position', 'role', id_pos);
	type_stat = get_attr('statistic', 'type', id_stat);

	IF (position(role_pos in type_stat) > 0) THEN
		RETURN TRUE;
	END IF;

	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_comp
 *
 * IN      : team.id%TYPE, competition.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_comp
(
	IN	id_team		team.id%TYPE,
	IN	id_comp		competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_team		text;
	type_team_comp	text;

BEGIN
	
	type_team = get_attr('team', 'type', id_team);
	type_team_comp = get_attr('competition', 'team_type', id_comp);

	RETURN type_team = type_team_comp;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : valid_daterange
 *
 * IN      : date
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_daterange
(
	IN	dob		date
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	min_age		integer;
	max_age		integer;
	dob_year	integer;
	dob_month	integer;
	dob_day		integer;
	valid_range	daterange;
	s_valid		date;
	e_valid		date;

BEGIN
	
	min_age = 14;
	max_age = 50;
	
	dob_year = extract(year from dob);
	dob_month = extract(month from dob);
	dob_day = extract(day from dob);

	IF (2 = dob_month AND 29 = dob_day) THEN
		dob_month = 3;
		dob_day = 1;
	END IF;

	s_valid = make_date(dob_year + min_age, dob_month, dob_day);
	e_valid = make_date(dob_year + max_age, dob_month, dob_day);

	valid_range = daterange(s_valid, e_valid, '[]');

	RETURN valid_range;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_club_militancy
 *
 * IN      : player.id%TYPE, daterange
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_club_militancy
(
	IN	id_player	player.id%TYPE,
	IN	range_date	daterange
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			militancy
		WHERE
			player_id = id_player
			AND
			upper(date_range) IS NOT NULL
			AND
			date_range && range_date
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_national_militancy
 *
 * IN      : player.id%TYPE, country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_national_militancy
(
	IN	id_player	player.id%TYPE,
	IN	id_country	country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			militancy
		WHERE
			player_id = id_player
			AND
			upper(date_range) IS NULL
	);	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_tot_team
 *
 * IN      : competition.id%TYPE, dm_usint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_tot_team
(
	IN	id_comp		competition.id%TYPE,
	IN	tot_team	dm_usint
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;
	id_conf			integer;
	id_country		integer;

	type_country	text;
	type_comp		text;
	
BEGIN
	
	type_comp = get_attr('competition', 'type', id_comp);

	IF ('SUPER CUP' = type_comp) THEN
		IF (tot_team <= 6) THEN
			RETURN TRUE;
		END IF;
	ELSIF ('LEAGUE' = type_comp) THEN
		IF (tot_team <= 50) THEN
			RETURN TRUE;
		END IF;
	ELSIF ('CUP' = type_comp) THEN

		tmp = get_attr('competition', 'confederation_id', id_comp);
		id_conf = CAST(tmp_text AS integer);

		tmp = get_attr('confederation', 'country_id', id_conf);
		id_country = CAST(tmp_text AS integer);

		type_country = get_attr('country', 'type', id_country);

		IF ('NATION' = type_country) THEN
			IF (floor(log(2, tot_team)) = ceil(log(2, tot_team))) THEN
				RETURN TRUE;
			END IF;
		ELSE
			IF (tot_team <= 50) THEN
				RETURN TRUE;
			END IF;
		END IF;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF competition.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp
(
	IN	id_comp	competition.id%TYPE
)
RETURNS SETOF competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp	record;

BEGIN
	
	rec_comp = get_rec('competition', id_comp);

	RETURN QUERY
		SELECT
			id
		FROM
			competition
		WHERE
			type = rec_comp.type
			AND
			team_type = rec_comp.team_type
			AND
			confederation_id = rec_comp.confederation_id;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp_ed
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF competition_edition.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp_ed
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS SETOF competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp_ed	record;

BEGIN
	
	rec_comp_ed = get_rec('competition_edition', id_comp_ed);

	RETURN QUERY
		SELECT
			id
		FROM
			competition_edition
		WHERE
			start_year = rec_comp_ed.start_year
			AND
			end_year = rec_comp_ed.end_year
			AND
			competition_id IN (similar_comp(rec_comp_ed.competition_id));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_take_part
 *
 * IN      : team.id%TYPE, competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_take_part
(
	IN	id_team		team.id%TYPE,
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			partecipation
		WHERE
			team_id = id_team
			AND
			competition_edition_id IN (similar_comp_ed(id_comp_ed))
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_nationality
 *
 * IN      : player.id%TYPE, team.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_nationality
(
	IN	id_player	player.id%TYPE,
	IN	id_team		team.id%TYPE
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
			nationality
		WHERE
			player_id = id_player
			AND
			team_id = id_team
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


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
 * TYPE : TRIGGER FUNCTION - tg_bi_confederation TRIGGER 
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

	tmp				text;
	id_country_conf	integer;

BEGIN

	tmp = get_attr('confederation', 'country_id', NEW.super_id);
	id_country_conf = CAST(tmp AS integer);

	IF (corr_containment(NEW.country_id, id_country_conf)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_team TRIGGER 
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

	tmp = get_attr('confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	IF (is_nation(NEW.country_id) AND NEW.country_id = id_country_conf) THEN

		IF ('CLUB' = NEW.type) THEN
		
			RETURN NEW;
		
		ELSIF ('NATIONAL' = NEW.type) THEN

			name_country = get_attr('country', 'name', NEW.country_id);

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
 * TYPE : TRIGGER FUNCTION - tg_bi_competition TRIGGER 
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

	tmp = get_attr('confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	type_country_conf = get_attr('country', 'type', id_country_conf);

	IF (type_country_conf <> 'NATION' OR NEW.team_type <> 'NATIONAL') THEN

		RETURN NEW;
	
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_competition_edition TRIGGER 
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

	IF (NOT has_edition(NEW.competition_id)) THEN

		RETURN NEW;
	
	ELSE
	
		IF
		(
			corr_freq(NEW.competition_id, NEW.start_year)
			AND
			corr_tot_team(NEW.competition_id, NEW.total_team)
		) 
		THEN
	
			RETURN NEW;
	
		END IF;
	
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_partecipation TRIGGER 
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

	tmp		text;
	id_conf	integer;
	id_comp	integer;

BEGIN

	id_conf = conf_from_comp_ed(NEW.competition_edition_id);

	tmp = get_attr('competition_edition', 'competition_id', NEW.competition_edition_id);
	id_comp = CAST(tmp AS integer);

	IF
	(
		available(NEW.competition_edition_id)
		AND
		belong_to(NEW.team_id, id_conf)
		AND
		team_fit_comp(NEW.team_id, id_comp)
		AND
		can_take_part(NEW.team_id, NEW.competition_edition_id)
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
 * TYPE : TRIGGER FUNCTION - tg_bi_player TRIGGER 
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

	IF (is_nation(NEW.country_id)) THEN
		RETURN NEW;
	END IF;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_nationality TRIGGER 
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
 * TYPE : TRIGGER FUNCTION - tg_bi_militancy TRIGGER 
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
	dob_player	date;
	type_team	text;
	valid_range	daterange;

BEGIN

	tmp = get_attr('player', 'dob', NEW.player_id);
	dob_player = CAST(tmp AS date);
	
	valid_range = valid_daterange(dob_player);

	type_team = get_attr('team', 'type', NEW.team_id);

	IF ('CLUB' = type_team) THEN

		IF
		(
			NEW.date_range <@ valid_range
			AND
			free_club_militancy(NEW.player_id, NEW.date_range)
		)
		THEN
			RETURN NEW;
		END IF;

	ELSIF ('NATIONAL' = type_team) THEN

		IF
		(
			has_nationality(NEW.player_id, rec_team.country_id)
			AND
			upper(NEW.date_range) IS NULL
			AND
			lower(NEW.date_range) <@ valid_range
			AND
			free_national_militancy(NEW.player_id, rec_team.country_id)
		)
		THEN
			RETURN NEW;
		END IF;

	END IF;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_player_tag TRIGGER 
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

	type_tag	text;

BEGIN

	type_tag = get_attr('tag', 'type', NEW.tag_id);

	IF
	(
		type_tag <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_tag AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION - tg_bi_player_attribute TRIGGER 
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

	type_attr	text;

BEGIN

	type_attr = get_attr('attribute', 'type', NEW.attribute_id);

	IF
	(
		type_attr <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_attr AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION - tg_bi_trophy_team_case TRIGGER 
 * NAME : tf_bi_trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_trophy_team_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;

BEGIN

	type_trohy = get_attr('trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trohy) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_trophy_player_case TRIGGER 
 * NAME : tf_bi_trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_trophy_player_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;
	time_range	daterange;
	existence	integer;

BEGIN

	time_range = get_time_range(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN

		type_trohy = get_attr('trophy', 'type', NEW.trophy_id);

		IF ('TEAM' = type_trohy) THEN

			existence = NULL;

			SELECT
				id
			INTO
				existence
			FROM
				trophy_team_case
			WHERE
				competition_edition_id = NEW.competition_edition_id
				AND
				team_id = NEW.team_id
				AND
				trophy_id = NEW.trophy_id;
			
			IF (existence IS NOT NULL) THEN
				RETURN NEW;
			END IF;
		ELSE
			RETURN NEW;
		END IF;

	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_prize_team_case TRIGGER 
 * NAME : tf_bi_prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_prize_team_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_prize	text;

BEGIN

	type_prize = get_attr('prize', 'type', NEW.prize_id);

	IF ('TEAM' = type_prize) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_play TRIGGER 
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

	time_range	daterange;

BEGIN

	time_range = get_time_range(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_play_statistic TRIGGER 
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

	tmp				text;
	id_player_pos	integer;
	id_pos			integer;

BEGIN

	tmp = get_attr('play', 'player_position_id', NEW.play_id);
	id_player_pos = CAST(tmp AS integer);

	tmp = get_attr('player_position', 'position_id', id_player_pos);
	id_pos = CAST(tmp AS integer);


	IF (pos_fit_stat(id_pos, statistic_id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TRIGGER
 ******************************************************************************/



/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation
BEFORE INSERT ON confederation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_confederation();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team
BEFORE INSERT ON team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition
BEFORE INSERT ON competition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition_edition
BEFORE INSERT ON competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition_edition();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_partecipation
BEFORE INSERT ON partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_partecipation();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT ON player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_nationality
BEFORE INSERT ON nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bi_nationality();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_militancy
BEFORE INSERT ON militancy
FOR EACH ROW
EXECUTE FUNCTION tf_bi_militancy();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_tag
BEFORE INSERT ON player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_tag();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_attribute
BEFORE INSERT ON player_attribute
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_attribute();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_trophy_team_case
BEFORE INSERT ON trophy_team_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_trophy_team_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_trophy_player_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_trophy_player_case
BEFORE INSERT ON trophy_player_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_trophy_player_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_prize_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_prize_team_case
BEFORE INSERT ON prize_team_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_prize_team_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play
BEFORE INSERT ON play
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play_statistic
BEFORE INSERT ON play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------


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
 * INSERT COUNTRY
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE COUNTRY
 ******************************************************************************/
INSERT INTO country (type, code, name)
VALUES
('WORLD', 'WLD', 'World');
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT CONTINENT TYPE COUNTRY
 ******************************************************************************/
INSERT INTO country (type, code, name)
VALUES
('CONTINENT', 'AFR', 'Africa'),
('CONTINENT', 'ASI', 'Asia'),
('CONTINENT', 'ATA', 'Antartica'),
('CONTINENT', 'EUR', 'Europe'),
('CONTINENT', 'NCA', 'North Center America'),
('CONTINENT', 'OCN', 'Oceania'),
('CONTINENT', 'STA', 'South America');
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT NATION TYPE COUNTRY
 ******************************************************************************/
INSERT INTO country (type, code, name)
VALUES
('NATION', 'AFG', 'Afghanistan'),
('NATION', 'AGO', 'Angola'),
('NATION', 'ALB', 'Albania'),
('NATION', 'AND', 'Andorra'),
('NATION', 'ARE', 'United Arab Emirates'),
('NATION', 'ARG', 'Argentina'),
('NATION', 'ARM', 'Armenia'),
('NATION', 'ATG', 'Antigua and Barbuda'),
('NATION', 'AUS', 'Australia'),
('NATION', 'AUT', 'Austria'),
('NATION', 'AZE', 'Azerbaijan'),
('NATION', 'BDI', 'Burundi'),
('NATION', 'BEL', 'Belgium'),
('NATION', 'BEN', 'Benin'),
('NATION', 'BFA', 'Burkina Faso'),
('NATION', 'BGD', 'Bangladesh'),
('NATION', 'BGR', 'Bulgaria'),
('NATION', 'BHR', 'Bahrain'),
('NATION', 'BHS', 'Bahamas'),
('NATION', 'BIH', 'Bosnia and Herzegovina'),
('NATION', 'BLR', 'Belarus'),
('NATION', 'BLZ', 'Belize'),
('NATION', 'BOL', 'Bolivia'),
('NATION', 'BRA', 'Brazil'),
('NATION', 'BRB', 'Barbados'),
('NATION', 'BRN', 'Brunei'),
('NATION', 'BTN', 'Bhutan'),
('NATION', 'BWA', 'Botswana'),
('NATION', 'CAF', 'Central African Republic'),
('NATION', 'CAN', 'Canada'),
('NATION', 'CHE', 'Switzerland'),
('NATION', 'CHL', 'Chile'),
('NATION', 'CHN', 'China'),
('NATION', 'CIV', 'Côte d''Ivoire'),
('NATION', 'CMR', 'Cameroon'),
('NATION', 'COD', 'Democratic Republic of the Congo'),
('NATION', 'COG', 'Congo'),
('NATION', 'COL', 'Colombia'),
('NATION', 'COM', 'Comoros'),
('NATION', 'CPV', 'Cabo Verde'),
('NATION', 'CRI', 'Costa Rica'),
('NATION', 'CUB', 'Cuba'),
('NATION', 'CUW', 'Curaçao'),
('NATION', 'CYP', 'Cyprus'),
('NATION', 'CZE', 'Czech Republic'),
('NATION', 'DEU', 'Germany'),
('NATION', 'DJI', 'Djibouti'),
('NATION', 'DMA', 'Dominica'),
('NATION', 'DNK', 'Denmark'),
('NATION', 'DOM', 'Dominican Republic'),
('NATION', 'DZA', 'Algeria'),
('NATION', 'ECU', 'Ecuador'),
('NATION', 'EGY', 'Egypt'),
('NATION', 'ENG', 'England'),
('NATION', 'ERI', 'Eritrea'),
('NATION', 'ESP', 'Spain'),
('NATION', 'EST', 'Estonia'),
('NATION', 'ETH', 'Ethiopia'),
('NATION', 'FIN', 'Finland'),
('NATION', 'FJI', 'Fiji'),
('NATION', 'FRA', 'France'),
('NATION', 'FSM', 'Micronesia'),
('NATION', 'GAB', 'Gabon'),
('NATION', 'GBR', 'United Kingdom'),
('NATION', 'GEO', 'Georgia'),
('NATION', 'GHA', 'Ghana'),
('NATION', 'GIN', 'Guinea'),
('NATION', 'GMB', 'Gambia'),
('NATION', 'GNB', 'Guinea-Bissau'),
('NATION', 'GNQ', 'Equatorial Guinea'),
('NATION', 'GRC', 'Greece'),
('NATION', 'GRD', 'Grenada'),
('NATION', 'GTM', 'Guatemala'),
('NATION', 'GUY', 'Guyana'),
('NATION', 'HND', 'Honduras'),
('NATION', 'HRV', 'Croatia'),
('NATION', 'HTI', 'Haiti'),
('NATION', 'HUN', 'Hungary'),
('NATION', 'IDN', 'Indonesia'),
('NATION', 'IND', 'India'),
('NATION', 'IRL', 'Ireland'),
('NATION', 'IRN', 'Iran'),
('NATION', 'IRQ', 'Iraq'),
('NATION', 'ISL', 'Iceland'),
('NATION', 'ISR', 'Israel'),
('NATION', 'ITA', 'Italy'),
('NATION', 'JAM', 'Jamaica'),
('NATION', 'JOR', 'Jordan'),
('NATION', 'JPN', 'Japan'),
('NATION', 'KAZ', 'Kazakhstan'),
('NATION', 'KEN', 'Kenya'),
('NATION', 'KGZ', 'Kyrgyzstan'),
('NATION', 'KHM', 'Cambodia'),
('NATION', 'KIR', 'Kiribati'),
('NATION', 'KNA', 'Saint Kitts and Nevis'),
('NATION', 'KOR', 'South Korea'),
('NATION', 'KWT', 'Kuwait'),
('NATION', 'LAO', 'Lao People''s Democratic Republic'),
('NATION', 'LBN', 'Lebanon'),
('NATION', 'LBR', 'Liberia'),
('NATION', 'LBY', 'Libya'),
('NATION', 'LCA', 'Saint Lucia'),
('NATION', 'LIE', 'Liechtenstein'),
('NATION', 'LKA', 'Sri Lanka'),
('NATION', 'LSO', 'Lesotho'),
('NATION', 'LTU', 'Lithuania'),
('NATION', 'LUX', 'Luxembourg'),
('NATION', 'LVA', 'Latvia'),
('NATION', 'MAR', 'Morocco'),
('NATION', 'MCO', 'Monaco'),
('NATION', 'MDA', 'Moldova'),
('NATION', 'MDG', 'Madagascar'),
('NATION', 'MDV', 'Maldives'),
('NATION', 'MEX', 'Mexico'),
('NATION', 'MHL', 'Marshall Islands'),
('NATION', 'MKD', 'North Macedonia'),
('NATION', 'MLI', 'Mali'),
('NATION', 'MLT', 'Malta'),
('NATION', 'MMR', 'Myanmar'),
('NATION', 'MNE', 'Montenegro'),
('NATION', 'MNG', 'Mongolia'),
('NATION', 'MOZ', 'Mozambique'),
('NATION', 'MRT', 'Mauritania'),
('NATION', 'MUS', 'Mauritius'),
('NATION', 'MWI', 'Malawi'),
('NATION', 'MYS', 'Malaysia'),
('NATION', 'NAM', 'Namibia'),
('NATION', 'NER', 'Niger'),
('NATION', 'NGA', 'Nigeria'),
('NATION', 'NIC', 'Nicaragua'),
('NATION', 'NIR', 'Northern Ireland'),
('NATION', 'NIU', 'Niue'),	
('NATION', 'NLD', 'Netherlands'),
('NATION', 'NOR', 'Norway'),
('NATION', 'NPL', 'Nepal'),
('NATION', 'NRU', 'Nauru'),
('NATION', 'NZL', 'New Zealand'),
('NATION', 'OMN', 'Oman'),
('NATION', 'PAK', 'Pakistan'),
('NATION', 'PAN', 'Panama'),
('NATION', 'PER', 'Peru'),
('NATION', 'PHL', 'Philippines'),
('NATION', 'PLW', 'Palau'),
('NATION', 'PNG', 'Papua New Guinea'),
('NATION', 'POL', 'Poland'),
('NATION', 'PRI', 'Puerto Rico'),
('NATION', 'PRK', 'North Korea'),
('NATION', 'PRT', 'Portugal'),
('NATION', 'PRY', 'Paraguay'),
('NATION', 'PSE', 'Palestine'),
('NATION', 'QAT', 'Qatar'),
('NATION', 'ROU', 'Romania'),
('NATION', 'RUS', 'Russian Federation'),
('NATION', 'RWA', 'Rwanda'),
('NATION', 'SAU', 'Saudi Arabia'),
('NATION', 'SCT', 'Scotland'),
('NATION', 'SDN', 'Sudan'),
('NATION', 'SEN', 'Senegal'),
('NATION', 'SGP', 'Singapore'),
('NATION', 'SLB', 'Solomon Islands'),
('NATION', 'SLE', 'Sierra Leone'),
('NATION', 'SLV', 'El Salvador'),
('NATION', 'SMR', 'San Marino'),
('NATION', 'SOM', 'Somalia'),
('NATION', 'SRB', 'Serbia'),
('NATION', 'SSD', 'South Sudan'),
('NATION', 'STP', 'São Tomé and Príncipe'),
('NATION', 'SUR', 'Suriname'),
('NATION', 'SVK', 'Slovakia'),
('NATION', 'SVN', 'Slovenia'),
('NATION', 'SWE', 'Sweden'),
('NATION', 'SWZ', 'Eswatini'),
('NATION', 'SYC', 'Seychelles'),
('NATION', 'SYR', 'Syria'),
('NATION', 'TCD', 'Chad'),
('NATION', 'TGO', 'Togo'),
('NATION', 'THA', 'Thailand'),
('NATION', 'TJK', 'Tajikistan'),
('NATION', 'TKM', 'Turkmenistan'),
('NATION', 'TLS', 'Timor-Leste'),
('NATION', 'TON', 'Tonga'),
('NATION', 'TTO', 'Trinidad and Tobago'),
('NATION', 'TUN', 'Tunisia'),
('NATION', 'TUR', 'Türkiye'),
('NATION', 'TWN', 'Taiwan'),
('NATION', 'TZA', 'Tanzania'),
('NATION', 'UGA', 'Uganda'),
('NATION', 'UKR', 'Ukraine'),
('NATION', 'URY', 'Uruguay'),
('NATION', 'USA', 'United States'),
('NATION', 'UZB', 'Uzbekistan'),
('NATION', 'VCT', 'Saint Vincent and the Grenadines'),
('NATION', 'VEN', 'Venezuela'),
('NATION', 'VNM', 'Vietnam'),
('NATION', 'VUT', 'Vanuatu'),
('NATION', 'WLS', 'Wales'),
('NATION', 'WSM', 'Samoa'),
('NATION', 'XKX', 'Kosovo'),
('NATION', 'YEM', 'Yemen'),
('NATION', 'YUG', 'Jugoslavia'),
('NATION', 'ZAF', 'South Africa'),
('NATION', 'ZMB', 'Zambia'),
('NATION', 'ZWE', 'Zimbabwe');
--------------------------------------------------------------------------------


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
 * INSERT CONFEDERATION
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'FIFA',
	'Fédération Internationale de Football Association',
	get_id('@', 'country@name@World'),
	NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT CONTINENT TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'CAF',
	'Confederation of African Football',
	get_id('@', 'country@name@Africa'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
	
),
(
	'AFC',
	'Asian Football Confederation',
	get_id('@', 'country@name@Asia'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'CONCACAF',
	'Confederation of North and Central America and Caribbean Association Football',
	get_id('@', 'country@name@North Center America'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'CONMEBOL',
	'Confederación Sudamericana de Fútbol',
	get_id('@', 'country@name@South America'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'OFC',
	'Oceania Football Confederation',
	get_id('@', 'country@name@Oceania'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'UEFA',
	'Union of European Football Associations',
	get_id('@', 'country@name@Europe'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT NATION TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'AFF',
	'Afghanistan Football Federation',
	get_id('@', 'country@name@Afghanistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')	
),
(
	'FAF',
	'Angolan Football Federation',
	get_id('@', 'country@name@Angola'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSHF',
	'Federata Shqiptare e Futbollit',
	get_id('@', 'country@name@Albania'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FAF',
	'Federació Andorrana de Futbol',
	get_id('@', 'country@name@Andorra'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'UAEFA',
	'UAE Football Association',
	get_id('@', 'country@name@United Arab Emirates'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'AFA',
	'Asociación del Fútbol Argentino',
	get_id('@', 'country@name@Argentina'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'FFA',
	'Football Federation of Armenia',
	get_id('@', 'country@name@Armenia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'ABFA',
	'Antigua and Barbuda Football Association',
	get_id('@', 'country@name@Antigua and Barbuda'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FFA',
	'Football Federation Australia',
	get_id('@', 'country@name@Australia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'ÖFB',
	'Österreichischer Fußball-Bund',
	get_id('@', 'country@name@Austria'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'AFFA',
	'Association of Football Federations of Azerbaijan',
	get_id('@', 'country@name@Azerbaijan'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFB',
	'Fédération de Football du Burundi',
	get_id('@', 'country@name@Burundi'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'KBVB',
	'Royal Belgian Football Association',
	get_id('@', 'country@name@Belgium'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FBF',
	'Fédération Béninoise de Football',
	get_id('@', 'country@name@Benin'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FBF',
	'Fédération Burkinabé de Football',
	get_id('@', 'country@name@Burkina Faso'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'BFF',
	'Bangladesh Football Federation',
	get_id('@', 'country@name@Bangladesh'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFU',
	'Bulgarian Football Union',
	get_id('@', 'country@name@Bulgaria'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'BFA',
	'Bahrain Football Association',
	get_id('@', 'country@name@Bahrain'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFA',
	'Bahamas Football Association',
	get_id('@', 'country@name@Bahamas'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'N/FSBiH',
	'Nogometni/Fudbalski Savez Bosne i Hercegovine',
	get_id('@', 'country@name@Bosnia and Herzegovina'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'BFF',
	'Football Federation of Belarus',
	get_id('@', 'country@name@Belarus'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFB',
	'Football Federation of Belize',
	get_id('@', 'country@name@Belize'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FBF',
	'Federación Boliviana de Fútbol',
	get_id('@', 'country@name@Bolivia'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'CBF',
	'Confederação Brasileira de Futebol',
	get_id('@', 'country@name@Brazil'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'BFA',
	'Barbados Football Association',
	get_id('@', 'country@name@Barbados'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'NFABD',
	'National Football Association of Brunei Darussalam',
	get_id('@', 'country@name@Brunei'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFF',
	'Bhutan Football Federation',
	get_id('@', 'country@name@Bhutan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFA',
	'Botswana Football Association',
	get_id('@', 'country@name@Botswana'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),

(
	'FCF',
	'Fédération Centrafricaine de Football',
	get_id('@', 'country@name@Central African Republic'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'CSA',
	'Canada Soccer',
	get_id('@', 'country@name@Canada'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'SFV',
	'Swiss Football Association',
	get_id('@', 'country@name@Switzerland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFCh',
	'Federación de Fútbol de Chile',
	get_id('@', 'country@name@Chile'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'CFA',
	'Chinese Football Association',
	get_id('@', 'country@name@China'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FIF',
	'Fédération Ivoirienne de Football',
	get_id('@', 'country@name@Côte d''Ivoire'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FECAFOOT',
	'Fédération Camerounaise de Football',
	get_id('@', 'country@name@Cameroon'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FECOFA',
	'Fédération Congolaise de Football-Association',
	get_id('@', 'country@name@Democratic Republic of the Congo'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FECOFOOT',
	'Fédération Congolaise de Football',
	get_id('@', 'country@name@Congo'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FCF',
	'Federación Colombiana de Fútbol',
	get_id('@', 'country@name@Colombia'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'FFC',
	'Fédération Comorienne de Football',
	get_id('@', 'country@name@Comoros'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FCF',
	'Federação Caboverdiana de Futebol',
	get_id('@', 'country@name@Cabo Verde'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FEDEFUTBOL',
	'Federación Costarricense de Fútbol',
	get_id('@', 'country@name@Costa Rica'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'AFC',
	'Asociación de Fútbol de Cuba',
	get_id('@', 'country@name@Cuba'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FFK',
	'Federashon Futbòl Kòrsou',
	get_id('@', 'country@name@Curaçao'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'CFA',
	'Cyprus Football Association',
	get_id('@', 'country@name@Cyprus'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FAČR',
	'Fotbalová asociace České republiky',
	get_id('@', 'country@name@Czech Republic'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'DFB',
	'Deutscher Fußball-Bund',
	get_id('@', 'country@name@Germany'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FDF',
	'Fédération Djiboutienne de Football',
	get_id('@', 'country@name@Djibouti'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'DFA',
	'Dominica Football Association',
	get_id('@', 'country@name@Dominica'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'DBU',
	'Dansk Boldspil-Union',
	get_id('@', 'country@name@Denmark'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FEDOFUTBOL',
	'Federación Dominicana de Fútbol',
	get_id('@', 'country@name@Dominican Republic'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FAF',
	'Fédération Algérienne de Football',
	get_id('@', 'country@name@Algeria'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FEF',
	'Federación Ecuatoriana de Fútbol',
	get_id('@', 'country@name@Ecuador'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'EFA',
	'Egyptian Football Association',
	get_id('@', 'country@name@Egypt'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FA',
	'The Football Association',
	get_id('@', 'country@name@England'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'ENFF',
	'Eritrean National Football Federation',
	get_id('@', 'country@name@Eritrea'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'RFEF',
	'Real Federación Española de Fútbol',
	get_id('@', 'country@name@Spain'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'EJL',
	'Eesti Jalgpalli Liit',
	get_id('@', 'country@name@Estonia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'EFF',
	'Ethiopian Football Federation',
	get_id('@', 'country@name@Ethiopia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SPL',
	'Suomen Palloliitto',
	get_id('@', 'country@name@Finland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFA',
	'Fiji Football Association',
	get_id('@', 'country@name@Fiji'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FFF',
	'Fédération Française de Football',
	get_id('@', 'country@name@France'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FSMFA',
	'Federated States of Micronesia Football Association',
	get_id('@', 'country@name@Micronesia'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FEGAFOOT',
	'Fédération Gabonaise de Football',
	get_id('@', 'country@name@Gabon'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'GFF',
	'Georgian Football Federation',
	get_id('@', 'country@name@Georgia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'GFA',
	'Ghana Football Association',
	get_id('@', 'country@name@Ghana'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FGF',
	'Fédération Guinéenne de Football',
	get_id('@', 'country@name@Guinea'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'GFF',
	'Gambia Football Federation',
	get_id('@', 'country@name@Gambia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FFGB',
	'Federação de Futebol da Guiné-Bissau',
	get_id('@', 'country@name@Guinea-Bissau'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FEGUIFUT',
	'Federación Ecuatoguineana de Fútbol',
	get_id('@', 'country@name@Equatorial Guinea'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'EPO',
	'Hellenic Football Federation',
	get_id('@', 'country@name@Greece'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'GFA',
	'Grenada Football Association',
	get_id('@', 'country@name@Grenada'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FENAFUTH',
	'Federación Nacional de Fútbol de Guatemala',
	get_id('@', 'country@name@Guatemala'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'GFF',
	'Guyana Football Federation',
	get_id('@', 'country@name@Guyana'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FENAFUTH',
	'Federación Nacional Autónoma de Fútbol de Honduras',
	get_id('@', 'country@name@Honduras'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'HNS',
	'Hrvatski nogometni savez',
	get_id('@', 'country@name@Croatia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FHF',
	'Fédération Haïtienne de Football',
	get_id('@', 'country@name@Haiti'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'MLSZ',
	'Magyar Labdarúgó Szövetség',
	get_id('@', 'country@name@Hungary'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'PSSI',
	'Indonesian Football Association',
	get_id('@', 'country@name@Indonesia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'AIFF',
	'All India Football Federation',
	get_id('@', 'country@name@India'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FAI',
	'Football Association of Ireland',
	get_id('@', 'country@name@Ireland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFIRI',
	'Football Federation Islamic Republic of Iran',
	get_id('@', 'country@name@Iran'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'IFA',
	'Iraq Football Association',
	get_id('@', 'country@name@Iraq'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'KSÍ',
	'Knattspyrnusamband Íslands',
	get_id('@', 'country@name@Iceland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'IFA',
	'Israel Football Association',
	get_id('@', 'country@name@Israel'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FIGC',
	'Federazione Italiana Giuoco Calcio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'JFF',
	'Jamaica Football Federation',
	get_id('@', 'country@name@Jamaica'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'JFA',
	'Jordan Football Association',
	get_id('@', 'country@name@Jordan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'JFA',
	'Japan Football Association',
	get_id('@', 'country@name@Japan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFK',
	'Football Federation of Kazakhstan',
	get_id('@', 'country@name@Kazakhstan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FKF',
	'Football Kenya Federation',
	get_id('@', 'country@name@Kenya'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FFKR',
	'Football Federation of the Kyrgyz Republic',
	get_id('@', 'country@name@Kyrgyzstan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFC',
	'Football Federation of Cambodia',
	get_id('@', 'country@name@Cambodia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'KIFA',
	'Kiribati Islands Football Association',
	get_id('@', 'country@name@Kiribati'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'SKNFA',
	'Saint Kitts and Nevis Football Association',
	get_id('@', 'country@name@Saint Kitts and Nevis'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'KFA',
	'Korea Football Association',
	get_id('@', 'country@name@South Korea'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'KFA',
	'Kuwait Football Association',
	get_id('@', 'country@name@Kuwait'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFF',
	'Lao Football Federation',
	get_id('@', 'country@name@Lao People''s Democratic Republic'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Lebanese Football Association',
	get_id('@', 'country@name@Lebanon'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Liberia Football Association',
	get_id('@', 'country@name@Liberia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'LFF',
	'Libyan Football Federation',
	get_id('@', 'country@name@Libya'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SLFA',
	'Saint Lucia Football Association',
	get_id('@', 'country@name@Saint Lucia'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'LFV',
	'Liechtensteiner Fussballverband',
	get_id('@', 'country@name@Liechtenstein'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFSL',
	'Football Federation of Sri Lanka',
	get_id('@', 'country@name@Sri Lanka'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Lesotho Football Association',
	get_id('@', 'country@name@Lesotho'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'LFF',
	'Lithuanian Football Federation',
	get_id('@', 'country@name@Lithuania'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FLF',
	'Luxembourg Football Federation',
	get_id('@', 'country@name@Luxembourg'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'LFF',
	'Latvijas Futbola federācija',
	get_id('@', 'country@name@Latvia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FRMF',
	'Royal Moroccan Football Federation',
	get_id('@', 'country@name@Morocco'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FMF',
	'Fédération Monegasque de Football',
	get_id('@', 'country@name@Monaco'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FMF',
	'Federația Moldovenească de Fotbal',
	get_id('@', 'country@name@Moldova'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FMF',
	'Fédération Malagasy de Football',
	get_id('@', 'country@name@Madagascar'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Maldives',
	get_id('@', 'country@name@Maldives'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FMF',
	'Federación Mexicana de Fútbol Asociación',
	get_id('@', 'country@name@Mexico'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'MISA',
	'Marshall Islands Soccer Association',
	get_id('@', 'country@name@Marshall Islands'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FFM',
	'Football Federation of North Macedonia',
	get_id('@', 'country@name@North Macedonia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FEMAFOOT',
	'Fédération Malienne de Football',
	get_id('@', 'country@name@Mali'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'MFA',
	'Malta Football Association',
	get_id('@', 'country@name@Malta'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'MFF',
	'Myanmar Football Federation',
	get_id('@', 'country@name@Myanmar'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FSCG',
	'Fudbalski Savez Crne Gore',
	get_id('@', 'country@name@Montenegro'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'MFF',
	'Mongolian Football Federation',
	get_id('@', 'country@name@Mongolia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FMF',
	'Federação Moçambicana de Futebol',
	get_id('@', 'country@name@Mozambique'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FFRIM',
	'Fédération de Football de la République Islamique de Mauritanie',
	get_id('@', 'country@name@Mauritania'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'MFA',
	'Mauritius Football Association',
	get_id('@', 'country@name@Mauritius'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Malawi',
	get_id('@', 'country@name@Malawi'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Malaysia',
	get_id('@', 'country@name@Malaysia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'NFA',
	'Namibia Football Association',
	get_id('@', 'country@name@Namibia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FENIFOOT',
	'Fédération Nigerienne de Football',
	get_id('@', 'country@name@Niger'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'NFF',
	'Nigeria Football Federation',
	get_id('@', 'country@name@Nigeria'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FENIFUT',
	'Federación Nicaragüense de Fútbol',
	get_id('@', 'country@name@Nicaragua'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'IFA',
	'Irish Football Association',
	get_id('@', 'country@name@Northern Ireland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'NISA',
	'Niue Island Soccer Association',
	get_id('@', 'country@name@Niue'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'KNVB',
	'Koninklijke Nederlandse Voetbalbond',
	get_id('@', 'country@name@Netherlands'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'NFF',
	'Norges Fotballforbund',
	get_id('@', 'country@name@Norway'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'ANFA',
	'All Nepal Football Association',
	get_id('@', 'country@name@Nepal'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')	
),
(
	'NZF',
	'New Zealand Football',
	get_id('@', 'country@name@New Zealand'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'OFA',
	'Oman Football Association',
	get_id('@', 'country@name@Oman'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'PFF',
	'Pakistan Football Federation',
	get_id('@', 'country@name@Pakistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FEPAFUT',
	'Federación Panameña de Fútbol',
	get_id('@', 'country@name@Panama'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FPF',
	'Federación Peruana de Futbol',
	get_id('@', 'country@name@Peru'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'PFF',
	'Philippine Football Federation',
	get_id('@', 'country@name@Philippines'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'PFA',
	'Palau Football Association',
	get_id('@', 'country@name@Palau'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'PNGFA',
	'Papua New Guinea Football Association',
	get_id('@', 'country@name@Papua New Guinea'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'PZPN',
	'Polski Związek Piłki Nożnej',
	get_id('@', 'country@name@Poland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FPF',
	'Federación Puertorriqueña de Fútbol',
	get_id('@', 'country@name@Puerto Rico'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'DPRK FA',
	'DPR Korea Football Association',
	get_id('@', 'country@name@North Korea'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FPF',
	'Federação Portuguesa de Futebol',
	get_id('@', 'country@name@Portugal'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'APF',
	'Asociación Paraguaya de Fútbol',
	get_id('@', 'country@name@Paraguay'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'PFA',
	'Palestine Football Association',
	get_id('@', 'country@name@Palestine'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'QFA',
	'Qatar Football Association',
	get_id('@', 'country@name@Qatar'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FRF',
	'Federația Română de Fotbal',
	get_id('@', 'country@name@Romania'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'RFU',
	'Russian Football Union',
	get_id('@', 'country@name@Russian Federation'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FERWAFA',
	'Fédération Rwandaise de Football Association',
	get_id('@', 'country@name@Rwanda'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SAFF',
	'Saudi Arabian Football Federation',
	get_id('@', 'country@name@Saudi Arabia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SFA',
	'Scottish Football Association',
	get_id('@', 'country@name@Scotland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SFA',
	'Sudan Football Association',
	get_id('@', 'country@name@Sudan'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSF',
	'Fédération Sénégalaise de Football',
	get_id('@', 'country@name@Senegal'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAS',
	'Football Association of Singapore',
	get_id('@', 'country@name@Singapore'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SIFF',
	'Solomon Islands Football Federation',
	get_id('@', 'country@name@Solomon Islands'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'SLFA',
	'Sierra Leone Football Association',
	get_id('@', 'country@name@Sierra Leone'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FESFUT',
	'Federación Salvadoreña de Fútbol',
	get_id('@', 'country@name@El Salvador'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FSGC',
	'Federazione Sammarinese Giuoco Calcio',
	get_id('@', 'country@name@San Marino'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SFF',
	'Somali Football Federation',
	get_id('@', 'country@name@Somalia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSS',
	'Football Association of Serbia',
	get_id('@', 'country@name@Serbia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SSFA',
	'South Sudan Football Association',
	get_id('@', 'country@name@South Sudan'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSF',
	'Federação Santomense de Futebol',
	get_id('@', 'country@name@São Tomé and Príncipe'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SVB',
	'Surinaamse Voetbal Bond',
	get_id('@', 'country@name@Suriname'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'SFZ',
	'Slovenský futbalový zväz',
	get_id('@', 'country@name@Slovakia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'NZS',
	'Nogometna zveza Slovenije',
	get_id('@', 'country@name@Slovenia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SvFF',
	'Svenska Fotbollförbundet',
	get_id('@', 'country@name@Sweden'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'EFA',
	'Eswatini Football Association',
	get_id('@', 'country@name@Eswatini'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SFF',
	'Seychelles Football Federation',
	get_id('@', 'country@name@Seychelles'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SAFA',
	'Syrian Arab Football Association',
	get_id('@', 'country@name@Syria'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FTFA',
	'Fédération Tchadienne de Football',
	get_id('@', 'country@name@Chad'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FTF',
	'Fédération Togolaise de Football',
	get_id('@', 'country@name@Togo'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAT',
	'Football Association of Thailand',
	get_id('@', 'country@name@Thailand'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'TFF',
	'Tajikistan Football Federation',
	get_id('@', 'country@name@Tajikistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFT',
	'Football Federation of Turkmenistan',
	get_id('@', 'country@name@Turkmenistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFTL',
	'Federação de Futebol de Timor-Leste',
	get_id('@', 'country@name@Timor-Leste'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'TFA',
	'Tonga Football Association',
	get_id('@', 'country@name@Tonga'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'TTFA',
	'Trinidad and Tobago Football Association',
	get_id('@', 'country@name@Trinidad and Tobago'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FTF',
	'Fédération Tunisienne de Football',
	get_id('@', 'country@name@Tunisia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'TFF',
	'Türkiye Futbol Federasyonu',
	get_id('@', 'country@name@Türkiye'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'CTFA',
	'Chinese Taipei Football Association',
	get_id('@', 'country@name@Taiwan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'TFF',
	'Tanzania Football Federation',
	get_id('@', 'country@name@Tanzania'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FUFA',
	'Federation of Uganda Football Associations',
	get_id('@', 'country@name@Uganda'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'UAF',
	'Ukrainian Association of Football',
	get_id('@', 'country@name@Ukraine'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'AUF',
	'Asociación Uruguaya de Fútbol',
	get_id('@', 'country@name@Uruguay'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'USSF',
	'United States Soccer Federation',
	get_id('@', 'country@name@United States'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'UFA',
	'Uzbekistan Football Association',
	get_id('@', 'country@name@Uzbekistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SVGFF',
	'Saint Vincent and the Grenadines Football Federation',
	get_id('@', 'country@name@Saint Vincent and the Grenadines'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FVF',
	'Federación Venezolana de Fútbol',
	get_id('@', 'country@name@Venezuela'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'VFF',
	'Vietnam Football Federation',
	get_id('@', 'country@name@Vietnam'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'VFF',
	'Vanuatu Football Federation',
	get_id('@', 'country@name@Vanuatu'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FAW',
	'Football Association of Wales',
	get_id('@', 'country@name@Wales'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFS',
	'Football Federation Samoa',
	get_id('@', 'country@name@Samoa'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FFK',
	'Football Federation of Kosovo',
	get_id('@', 'country@name@Kosovo'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'YFA',
	'Yemen Football Association',
	get_id('@', 'country@name@Yemen'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SAFA',
	'South African Football Association',
	get_id('@', 'country@name@South Africa'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAZ',
	'Football Association of Zambia',
	get_id('@', 'country@name@Zambia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'ZIFA',
	'Zimbabwe Football Association',
	get_id('@', 'country@name@Zimbabwe'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
);
--------------------------------------------------------------------------------


INSERT INTO competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'LEAGUE',
	'CLUB',
	'Afghan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Afghanistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria Superiore',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Parë',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Dytë',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Superkupa e Shqipërisë',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'CUP',
	'CLUB',
	'Kupa e Shqipërisë',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Girabola',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Angolan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segundona',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Angolan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Angolan SuperCup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Angolan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Angolan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Angolan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Divisió',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segona Divisió',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Andorran Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Constitució',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE First Division League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE Second Division League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@UAE Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'UAE President''s Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@UAE Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'UAE Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Profesional de Fútbol',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Nacional',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Argentina',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Argentina',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Centenario de la AFA',
	100,
	get_id
	(
		'@',
		'confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Armenian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Armenia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Armenian First League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Armenia'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Armenian Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Armenia'
	)
),
(
	'CUP',
	'CLUB',
	'Armenian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Armenia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Antigua and Barbuda Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Antigua and Barbuda Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Antigua and Barbuda FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Antigua and Barbuda Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'A-League Men',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation Australia'
	)
),
(
	'CUP',
	'CLUB',
	'Australia Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation Australia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Österreichische Fußball-Bundesliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Admiral 2. Liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Austrian Regionalliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'CUP',
	'CLUB',
	'ÖFB-Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'ÖFB-Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Premyer Liqası',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Birinci Divizionu',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'CUP',
	'CLUB',
	'Azərbaycan Kuboku',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Azərbaycan Superkuboku',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Burundi Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération de Football du Burundi'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Burundi',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération de Football du Burundi'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jupiler Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Challenger Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belgian National Division 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Beker van België',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Belgische Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Bénin',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Béninoise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Bénin',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Béninoise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Faso',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Burkinabé de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Burkina Faso',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Burkinabé de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bangladesh Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bangladesh Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian First League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian Second League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Third Amateur Football League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bulgarian Football Union'
	)
),
(
	'CUP',
	'CLUB',
	'Bulgarian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bulgarian Football Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Bulgarian Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bahraini Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bahrain Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Bahraini King''s Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bahrain Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Bahraini Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bahrain Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'BFA Senior League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bahamas Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premijer Liga Bosne i Hercegovine',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga FBiH',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Republike Srpske',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'CUP',
	'CLUB',
	'Kup Bosne i Hercegovine',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian First League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Second League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Belarus'
	)
),
(
	'CUP',
	'CLUB',
	'Belarusian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Belarus'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Belarusian Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Belize',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Belize'
	)
),
(
	'LEAGUE',
	'CLUB',
	'División de Fútbol Profesional',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Boliviana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série A',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série B',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série C',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série D',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa do Brasil',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa do Brasil',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Barbados Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Barbados Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Barbados FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Barbados Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Brunei Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'CUP',
	'CLUB',
	'Brunei FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Brunei Super Cup',
	0,
	get_id
	(
		'@',
		'confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bhutan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Bhutan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botswana Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Botswana Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'FA Challenge Cup Botswana',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Botswana Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Central African Republic League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Centrafricaine de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Canadian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Canada Soccer'
	)
),
(
	'CUP',
	'CLUB',
	'Canadian Championship',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Canada Soccer'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Challenge League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Promotion League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Swiss Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Schweizer Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional Scotiabank',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera B',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Chile',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de Chile',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Chinese Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'China League One',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'China League Two',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Chinese Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Chinese FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Chinese Football Association'
	)
),
(
	'SUPER CUP',
	 'CLUB',
	'Chinese FA Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'MTN Ligue 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Ivoirienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe de Côte d''Ivoire',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Ivoirienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'MTN Elite One',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Camerounaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Cameroon Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Camerounaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Linafoot',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Congolaise de Football-Association'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du DR Congo',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Congolaise de Football-Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National MTN',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Congolaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Congo',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Congolaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Torneo BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Superliga BetPlay DIMAYOR',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Comoros Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Comorienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cape Verdean Football Championship',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Caboverdiana de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de Cabo Verde',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Caboverdiana de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Promerica',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División de Costa Rica',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Costa Rican Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional de Fútbol de Cuba',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación de Fútbol de Cuba'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Curaçao Promé Divishon',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federashon Futbòl Kòrsou'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Second Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Third Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Cyprus Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Cypriot Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. česká fotbalová liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fotbalová národní liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'CUP',
	'CLUB',
	'Czech Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Czech Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bundesliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. Bundesliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'3. Liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Regionalliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'CUP',
	'CLUB',
	'DFB-Pokal',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'DFL-Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Djibouti Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Djiboutienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Djibouti FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Djiboutienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Dominica Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Dominica Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'3F Superliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'NordicBet Liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'CUP',
	'CLUB',
	'Danish Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Danish SuperCup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Dominicana de Fútbol',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Dominicana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Professional League 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe d''Algérie de football',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coupe d''Algérie de football',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Pro Ecuador Serie A',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Categoría Serie B',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Ecuador',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Egyptian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Egyptian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Egypt Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Egyptian Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Egyptian Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Egyptian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL Championship',
	1,
	get_id
	(
		'@',
		'confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL League One',
	1,
	get_id
	(
		'@',
		'confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL League Two',
	1,
	get_id
	(
		'@',
		'confederation@long_name@The Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@The Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'FA Community Shield',
	1,
	get_id
	(
		'@',
		'confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eritrean Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Eritrean National Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'LaLiga EA Sports',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'LALIGA HYPERMOTION',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Federación',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda Federación',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa del Rey',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de España',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Federación',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Meistriliiga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Esiliiga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'CUP',
	'CLUB',
	'Estonian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Estonian Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ethiopian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Ethiopian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Ethiopian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Ethiopian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Veikkausliiga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ykkönen',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kakkonen',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Finnish Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fiji Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fiji Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Fiji Football Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fiji Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Française de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe de France',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Française de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Trophée des Champions',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pohnpei Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federated States of Micronesia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gabon Championnat National D1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Gabonaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Gabon Interclubs',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Gabonaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Georgian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Georgian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Georgian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Georgian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Georgian Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Georgian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ghana Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Ghana Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Ghana FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Ghana Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFA League First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Gambia Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Gambian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Gambia Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional da Guiné-Bissau',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação de Futebol da Guiné-Bissau'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional da Guiné Bissau',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação de Futebol da Guiné-Bissau'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Equatoguinean Primera División',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Ecuatoguineana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Equatoguinean Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Ecuatoguineana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gamma Ethniki',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hellenic Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Greek Football Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hellenic Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Cup of Friendship and Solidarity',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFA Premier Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Grenada Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol de Guatemala',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División de Ascenso',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'CUP',
	'CLUB',
	'Copa de Guatemala',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFF National Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Guyana Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Guyana Mayors Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Guyana Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol Profesional de Honduras',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras'
	)
),
(
	'CUP',
	'CLUB',
	'Honduran Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperSport Hrvatska nogometna liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva nogometna liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Druga nogometna liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'CUP',
	'CLUB',
	'Hrvatski nogometni kup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Hrvatski nogometni superkup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue Haïtienne',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Haïtienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe d''Haïti',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Haïtienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság I',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság II',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság III',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'CUP',
	'CLUB',
	'Magyar Kupa',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'BRI Liga 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Indonesian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Piala Indonesia',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Indonesian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Indian Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I-League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I-League 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All India Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'AIFF Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland Premier Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Ireland'
	)
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Ireland'
	)
),
(
	'CUP',
	'CLUB',
	'Sports Direct FAI Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Ireland'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Persian Gulf Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azadegan League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'CUP',
	'CLUB',
	'Hazfi Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Iran Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Iraq Stars League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Iraq Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Iraqi Premier Division League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Iraq Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Iraq FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Iraq Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Iraqi Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Iraq Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Besta deild karla',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. deild karla',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. deild karla',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'CUP',
	'CLUB',
	'Icelandic Men''s Football Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Icelandic Men''s Football Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligat Ha`Al',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Leumit',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Alef',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Israel Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Israel State Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Israel Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Israel Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie A',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie B',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie C',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie D',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Italia',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa Italiana',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Italia Serie C',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa di Serie C',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jamaica Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Jamaica Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'JFF Champions Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Jamaica Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jordanian Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Jordan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Jordan FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Jordan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Jordan Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Jordan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J1 League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J2 League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J3 League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Japan Football League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Japan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Emperor''s Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Japan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Japanese Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'CUP',
	'CLUB',
	'Kazakhstan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kazakhstan Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kenyan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Kenya Federation'
	)
),
(
	'CUP',
	'CLUB',
	'FKF President''s Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Kenya Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kenyan Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Kenya Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Pervaja Liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'CUP',
	'CLUB',
	'Kyrgyzstan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kyrgyzstan Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cambodian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Cambodia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kiribati National Championship',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Kiribati Islands Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SKNFA Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saint Kitts and Nevis Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Saint Kitts and Nevis National Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saint Kitts and Nevis Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'K League 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'K League 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Korea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Korean FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kuwait Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Kuwait Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Kuwait Emir Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Kuwait Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kuwait Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Kuwait Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lao League 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lao Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lebanese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Second Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lebanese Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Lebanese FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lebanese Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Lebanese Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lebanese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liberian First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Liberia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Liberian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Liberia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Libyan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Libyan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Libyan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Libyan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Libyan Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Libyan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SLFA First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saint Lucia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Saint Lucia FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saint Lucia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Liechtenstein Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Liechtensteiner Fussballverband'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sri Lanka Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Sri Lanka'
	)
),
(
	'CUP',
	'CLUB',
	'Sri Lanka FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of Sri Lanka'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lesotho Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lesotho Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Lesotho Independence Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lesotho Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'A Lyga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pirma lyga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Lithuanian Football Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Lithuanian Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg National Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg Division of Honour',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Luxembourg Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Virsliga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Latvijas Pirmā līga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'CUP',
	'CLUB',
	'Latvijas kauss',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Latvian Supercup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 1',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Moroccan Throne Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Challenge Prince Rainier III',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Monegasque de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Divizia Națională',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Divizia A',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'CUP',
	'CLUB',
	'Moldovan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Moldovan Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malagasy Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Malagasy de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Dhivehi Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Maldives'
	)
),
(
	'CUP',
	'CLUB',
	'Maldives FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Maldives'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga MX',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga de Expansión MX',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Premier de México',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'CUP',
	'CLUB',
	'Copa MX',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Campeón de Campeones MX',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva makedonska fudbalska liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Vtora makedonska fudbalska liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'CUP',
	'CLUB',
	'Kup na Makedonija',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Macedonian Supercup',
	0,
	get_id
	(
		'@',
		'confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malian Première Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Malienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Malian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Malienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Malta Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Challenge League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Malta Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Myanmar National League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Myanmar Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'General Aung San Shield',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Myanmar Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva crnogorska fudbalska liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Druga crnogorska fudbalska liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'CUP',
	'CLUB',
	'Crnogorski fudbalski kup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Mongolian National Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Mongolian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'MFF Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Mongolian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Moçambola',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Moçambicana de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça de Moçambique',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Moçambicana de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1 Mauritania',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération de Football de la République Islamique de Mauritanie'
	)
),
(
	'CUP',
	'CLUB',
	'Mauritanian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération de Football de la République Islamique de Mauritanie'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Mauritian League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Mauritius Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Mauritian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Mauritius Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malawi Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Malawi'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malaysia Super League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Malaysia'
	)
),
(
	'CUP',
	'CLUB',
	'Malaysia FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Malaysia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Namibia Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Namibia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Namibia FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Namibia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Niger Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Nigerienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Niger Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Nigerienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nigerian Premier Football League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Nigeria Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Nigerian FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Nigeria Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nicaraguan Primera División',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nicaragüense de Fútbol'
	)
),

(
	'CUP',
	'CLUB',
	'Copa de Nicaragua',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Nicaragüense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Irish Premiership',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Irish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'NIFL Championship',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Irish Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Irish Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Irish Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'NIFL Charity Shield',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Irish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Niue Soccer Tournament',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Niue Island Soccer Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eredivisie',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eerste Divisie',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tweede Divisie',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'CUP',
	'CLUB',
	'KNVB Beker',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Johan Cruijff Schaal',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eliteserien',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Norges Fotballforbund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Norwegian First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Norges Fotballforbund'
	)
),
(
	'CUP',
	'CLUB',
	'Norwegian Football Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Norges Fotballforbund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Mesterfinalen',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Norges Fotballforbund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial A-Division League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All Nepal Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial B-Division League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All Nepal Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Ncell Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@All Nepal Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'New Zealand National League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@New Zealand Football'
	)
),
(
	'CUP',
	'CLUB',
	'Chatham Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@New Zealand Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Oman Professional League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Oman Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Sultan Qaboos Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Oman Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pakistan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Pakistan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Pakistan National Football Challenge Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Pakistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Asociación Nacional Pro Fútbol',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Panameña de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Panamá',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Panameña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Betsson',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Peruvian Segunda División',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Bicentenario',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Peruana',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Philippines Football League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Philippine Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Paulino Alcantara',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Philippine Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Palau Soccer League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Palau Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Papua New Guinea National Soccer League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Papua New Guinea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Papua New Guinea FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Papua New Guinea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ekstraklasa',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I liga polska',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'II liga polska',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'CUP',
	'CLUB',
	'Polish Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Polish Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Puerto Rico',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Puertorriqueña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'DPR Korea Premier Football League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@DPR Korea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Hwaebul Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@DPR Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal Betclic',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Terceira Liga',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça de Portugal',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supertaça Cândido de Oliveira',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Paraguaya',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'División Intermedia',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Paraguay',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Paraguaya',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gaza Strip Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Palestine Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Palestine Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Palestine Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Qatar Stars League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Qatar Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Qatari Stars Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Qatar Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Sheikh Jassim Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Qatar Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga României',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga II',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga III',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'CUP',
	'CLUB',
	'Cupa României',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercupa României',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League 2',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Russian Football Union'
	)
),
(
	'CUP',
	'CLUB',
	'Russian Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Russian Football Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Russian Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Rwanda Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Rwandaise de Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Rwandan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Rwandaise de Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Saudi Pro League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Saudi League First Division',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'The Custodian of The Two Holy Mosques Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Saudi Super Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Premiership',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Championship',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish League One',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Scottish Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Scottish Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sudan Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Sudan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Sudan Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Sudan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Senegal Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Sénégalaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Senegal FA Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Fédération Sénégalaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Singapore Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Singapore'
	)
),
(
	'CUP',
	'CLUB',
	'Singapore Cup',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Singapore'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Singapore Community Shield',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Football Association of Singapore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Solomon Islands S-League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Solomon Islands Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sierra Leone National Premier League',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Sierra Leone Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Salvadoran Primera División',
	1,
	get_id
	(
		'@',
		'confederation@long_name@Federación Salvadoreña de Fútbol'
	)
);



INSERT INTO team (type, name, country_id, confederation_id)
VALUES
(
	'CLUB',
	'Atalanta',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Bologna FC',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Cremonese',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Empoli FC',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'ACF Fiorentina',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Inter',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Juventus FC',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'SS Lazio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Lecce',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'AC Milan',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'AC Monza',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'SSC Napoli',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'AS Roma',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Salernitana',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'UC Sampdoria',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Sassuolo',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Spezia Calcio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Torino FC',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Udinese Calcio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Hellas Verona',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Frosinone Calcio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Genoa CFC',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Cagliari Calcio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'VfL Wolfsburg',
	get_id('@', 'country@name@Germany'),
	get_id('@', 'confederation@long_name@Deutscher Fußball-Bund')
),
(
	'CLUB',
	'RSC Charleroi',
	get_id('@', 'country@name@Belgium'),
	get_id('@', 'confederation@long_name@Royal Belgian Football Association')
),
(
	'CLUB',
	'LOSC Lille',
	get_id('@', 'country@name@France'),
	get_id('@', 'confederation@long_name@Fédération Française de Football')
),
(
	'CLUB',
	'SPAL',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Federazione Italiana Giuoco Calcio')
);


INSERT INTO player (name, surname, dob, foot, country_id)
VALUES
(
	'Alex',
	'Meret',
	'1997-03-22',
	'LEFT',
	get_id('@', 'country@code@ITA')
),
(
	'Pierluigi',
	'Gollini',
	'1995-03-18',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Salvatore',
	'Sirigu',
	'1987-01-12',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Hubert',
	'Idasiak',
	'2002-02-03',
	'RIGHT',
	get_id('@', 'country@code@POL')
),
(
	'Valerio',
	'Boffelli',
	'2004-09-04',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Davide',
	'Marfella',
	'1999-09-15',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Min-jae',
	'Kim',
	'1996-11-15',
	'RIGHT',
	get_id('@', 'country@code@KOR')
),
(
	'Amir',
	'Rrahmani',
	'1994-02-24',
	'EITHER',
	get_id('@', 'country@code@YUG')
),
(
	'Leo Skiri',
	'Østigård',
	'1999-11-28',
	'RIGHT',
	get_id('@', 'country@code@NOR')
),
(
	'Juan Guilherme Nunes',
	'Jesus',
	'1991-06-10',
	'LEFT',
	get_id('@', 'country@code@BRA')
),
(
	'Mathías',
	'Olivera',
	'1991-05-27',
	'LEFT',
	get_id('@', 'country@code@URY')
),
(
	'Mário',
	'Rui',
	'1997-03-22',
	'LEFT',
	get_id('@', 'country@code@PRT')
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-08-04',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Alessandro',
	'Zanoli',
	'2000-10-03',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Bartosz',
	'Bereszyński',
	'1992-07-12',
	'RIGHT',
	get_id('@', 'country@code@POL')
),
(
	'Stanislav',
	'Lobotka',
	'1994-11-25',
	'EITHER',
	get_id('@', 'country@code@SVK')
),
(
	'Diego',
	'Demme',
	'1991-11-21',
	'RIGHT',
	get_id('@', 'country@code@DEU')
),
(
	'André-Frank Zambo',
	'Anguissa',
	'1995-11-16',
	'RIGHT',
	get_id('@', 'country@code@CMR')
),
(
	'Piotr Sebastian',
	'Zieliński',
	'1994-05-20',
	'EITHER',
	get_id('@', 'country@code@POL')
),
(
	'Tanguy',
	'Ndombélé',
	'1996-12-28',
	'RIGHT',
	get_id('@', 'country@code@FRA')
),
(
	'Karim',
	'Zedadka',
	'2000-06-09',
	'RIGHT',
	get_id('@', 'country@code@FRA')
),
(
	'Eljif',
	'Elmas',
	'1999-09-24',
	'RIGHT',
	get_id('@', 'country@code@MKD')
),
(
	'Gianluca',
	'Gaetano',
	'2000-05-05',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Khvicha',
	'Kvaratskhelia',
	'2001-02-12',
	'EITHER',
	get_id('@', 'country@code@GEO')
),
(
	'Alessio',
	'Zerbin',
	'1999-03-03',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Hirving Rodrigo',
	'Lozano',
	'1995-07-30',
	'RIGHT',
	get_id('@', 'country@code@MEX')
),
(
	'Matteo',
	'Politano',
	'1993-08-03',
	'LEFT',
	get_id('@', 'country@code@ITA')
),
(
	'Adam',
	'Ounas',
	'1996-11-11',
	'LEFT',
	get_id('@', 'country@code@FRA')
),
(
	'Giacomo',
	'Raspadori',
	'2000-02-18',
	'EITHER',
	get_id('@', 'country@code@ITA')
),
(
	'Victor James',
	'Osimhen',
	'1998-12-29',
	'RIGHT',
	get_id('@', 'country@code@NGA')
),
(
	'Giovanni Pablo',
	'Simeone',
	'1995-07-05',
	'RIGHT',
	get_id('@', 'country@code@ARG')
),
(
	'Ivan',
	'Provedel',
	'1994-03-17',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Christos',
	'Mandas',
	'2001-09-17',
	'RIGHT',
	get_id('@', 'country@code@GRC')
),
(
	'Luigi',
	'Sepe',
	'1991-05-08',
	'LEFT',
	get_id('@', 'country@code@ITA')
),
(
	'Nicolò',
	'Casale',
	'1998-02-14',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Alessio',
	'Romagnoli',
	'1995-01-12',
	'LEFT',
	get_id('@', 'country@code@ITA')
),
(
	'Patricio Gabarrón',
	'Gil',
	'1993-04-17',
	'RIGHT',
	get_id('@', 'country@code@ESP')
),
(
	'Mario',
	'Gila',
	'2000-08-29',
	'RIGHT',
	get_id('@', 'country@code@ESP')
),
(
	'Luca',
	'Pellegrini',
	'1999-03-07',
	'LEFT',
	get_id('@', 'country@code@ITA')
),
(
	'Dimitrije',
	'Kamenović',
	'2000-07-16',
	'LEFT',
	get_id('@', 'country@code@YUG')
),
(
	'Adam',
	'Marusic',
	'1992-10-17',
	'RIGHT',
	get_id('@', 'country@code@YUG')
),
(
	'Elseid Gëzim',
	'Hysaj',
	'1994-02-02',
	'RIGHT',
	get_id('@', 'country@code@ALB')
),
(
	'Nicolò',
	'Rovella',
	'2001-12-04',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Danilo',
	'Cataldi',
	'1994-08-06',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Mattéo Elias Kenzo',
	'Guendouzi',
	'1999-04-14',
	'RIGHT',
	get_id('@', 'country@code@FRA')
),
(
	'Luis',
	'Alberto',
	'1992-09-28',
	'RIGHT',
	get_id('@', 'country@code@ESP')
),
(
	'Matías',
	'Vecino',
	'1991-08-24',
	'RIGHT',
	get_id('@', 'country@code@URY')
),
(
	'Manuel',
	'Lazzari',
	'1993-11-29',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Daichi',
	'Kamada',
	'1996-08-05',
	'RIGHT',
	get_id('@', 'country@code@JPN')
),
(
	'André',
	'Anderson',
	'1999-09-23',
	'RIGHT',
	get_id('@', 'country@code@BRA')
),
(
	'Mattia',
	'Zaccagni',
	'1995-06-16',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Diego Luis',
	'González',
	'2003-01-07',
	'LEFT',
	get_id('@', 'country@code@PRY')
),
(
	'Saná Eusébio Mango',
	'Fernandes',
	'2006-03-10',
	'RIGHT',
	get_id('@', 'country@code@GNB')
),
(
	'Gustav Tang',
	'Isaksen',
	'2001-04-19',
	'EITHER',
	get_id('@', 'country@code@DNK')
),
(
	'Felipe',
	'Anderson',
	'1993-04-15',
	'RIGHT',
	get_id('@', 'country@code@BRA')
),
(
	'Pedro Eliezer',
	'Rodríguez',
	'1987-07-28',
	'EITHER',
	get_id('@', 'country@code@ESP')
),
(
	'Cristiano',
	'Lombardi',
	'1995-08-19',
	'RIGHT',
	get_id('@', 'country@code@ITA')
),
(
	'Taty',
	'Castellanos',
	'1998-10-03',
	'RIGHT',
	get_id('@', 'country@code@ARG')
),
(
	'Ciro',
	'Immobile',
	'1990-02-20',
	'RIGHT',
	get_id('@', 'country@code@ITA')
);


INSERT INTO militancy (date_range, player_id, team_id)
VALUES
(
	daterange('2017-01-01', '2018-08-22', '[]'),
	get_id
	(
		'@', 
		'player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'country@code@NGA')
	),
	get_id('@', 'team@name@VfL Wolfsburg')
),
(
	daterange('2018-08-23', '2019-06-30', '[]'),
	get_id
	(
		'@', 
		'player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'country@code@NGA')
	),
	get_id('@', 'team@name@RSC Charleroi')
),
(
	daterange('2019-07-1', '2019-07-1', '[]'),
	get_id
	(
		'@', 
		'player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'country@code@NGA')
	),
	get_id('@', 'team@name@VfL Wolfsburg')
),
(
	daterange('2019-07-2', '2019-08-1', '[]'),
	get_id
	(
		'@', 
		'player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'country@code@NGA')
	),
	get_id('@', 'team@name@RSC Charleroi')
),
(
	daterange('2019-08-2', '2020-09-01', '[]'),
	get_id
	(
		'@', 
		'player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'country@code@NGA')
	),
	get_id('@', 'team@name@LOSC Lille')
),
(
	daterange('2020-09-02', '2026-06-30', '[]'),
	get_id
	(
		'@', 
		'player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'country@code@NGA')
	),
	get_id('@', 'team@name@SSC Napoli')
),
(
	daterange('2014-07-01', '2016-07-14', '[]'),
	get_id
	(
		'@',
		'player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@Udinese Calcio')
),
(
	daterange('2016-07-15', '2018-06-30', '[]'),
	get_id
	(
		'@',
		'player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@SPAL')
),
(
	daterange('2018-07-01', '2018-07-05', '[]'),
	get_id
	(
		'@',
		'player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@Udinese Calcio')
),
(
	daterange('2018-07-06', '2019-06-30', '[]'),
	get_id
	(
		'@',
		'player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@SSC Napoli')
),
(
	daterange('2019-07-01','2019-07-01', '[]'),
	get_id
	(
		'@',
		'player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@Udinese Calcio')
),
(
	daterange('2019-07-02', '2024-06-30', '[]'),
	get_id
	(
		'@',
		'player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@SSC Napoli')
);



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
 * INSERT trophy
 ******************************************************************************/
INSERT INTO trophy (type, name, description)
VALUES
( 'TEAM'	, 'First place'			, 'TODO' ),
( 'PLAYER'	, 'Most Valuable Player', 'TODO' ),
( 'PLAYER'	, 'Best Young Player'	, 'TODO' ),
( 'PLAYER'	, 'Best Striker'		, 'TODO' ),
( 'PLAYER'	, 'Best Midfielder'		, 'TODO' ),
( 'PLAYER'	, 'Best Defender'		, 'TODO' ),
( 'PLAYER'	, 'Best Goalkeeper'		, 'TODO' ),
( 'PLAYER'	, 'Goal of the Season'	, 'TODO' );
--------------------------------------------------------------------------------




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
 * INSERT position
 ******************************************************************************/
INSERT INTO position (role, code, name)
VALUES
('GK', 'GK', 'Goalkeeper'),
('DF', 'CB', 'Centre-Back'),
('DF', 'RB', 'Right-Back'),
('DF', 'LB', 'Left-Back'),
('DF', 'LWB', 'Left-Wing-Back'),
('DF', 'RWB', 'Right-Wing-Back'),
('MF', 'RM', 'Right Midfielder'),
('MF', 'CM', 'Centre Midfielder'),
('MF', 'CDM', 'Defensive Midfielder'),
('MF', 'CAM', 'Attacking Midfielder'),
('MF', 'LM', 'Left Midfielder'),
('FW', 'RW', 'Right Winger'),
('FW', 'RF', 'Right Forward'),
('FW', 'ST', 'Striker'),
('FW', 'CF', 'Centre Forward'),
('FW', 'LF', 'Left Forward'),
('FW', 'LW', 'Left Winger');
--------------------------------------------------------------------------------


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
 * INSERT COMPETITION EDITION
 ******************************************************************************/

INSERT INTO competition_edition (start_year, end_year, total_team, competition_id)
VALUES
(
	2022,
	2023,
	20,
	get_id('@', 'competition@name@Serie A')
);
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


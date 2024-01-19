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
RETURNS NULL ON NULL INPUT
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
		(type_in_country = 'NATION' AND type_su_country = 'CONTINENT')
		OR
		(type_in_country = 'CONTINENT' AND type_su_country = 'WORLD')
		OR
		(type_in_country = 'WORLD' AND type_su_country IS NULL)
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
	IN	id_comp	competition.id%TYPE
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
			competition_id = id_comp
		LIMIT
			1
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
	
BEGIN
	
	tmp = get_attr('competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	IF (freq <= 1) THEN
		RETURN TRUE;
	ELSE
		IF (0 = (s_year - a_start_year(id_comp)) % freq) THEN
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

	tmp				text;
	id_conf_team	integer;

BEGIN

	tmp = get_attr('team', 'confederation_id', id_team);
	id_conf_team = CAST(tmp AS integer);

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_conf_team);
	id_conf_team = CAST(tmp AS integer);
	
	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_conf_team);
	id_conf_team = CAST(tmp AS integer);
	
	IF (id_conf_team = id_conf) THEN
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
	IN	id_pos		position.id%TYPE,
	IN	id_stat		statistic.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
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

	RETURN FALSE

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
	IN	id_country	country.id%TYPE,
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
	IN	tot_team	dm_usint,
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;
	id_conf			integer
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

	RETURN
	(
		SELECT
			id
		FROM
			competition
		WHERE
			type = rec_comp.type
			AND
			team_type = rec_comp.team_type
			AND
			confederation_id = rec_comp.confederation_id
	);
	
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

	RETURN
	(
		SELECT
			id
		FROM
			competition_edition
		WHERE
			start_year = rec_comp_ed.start_year
			AND
			end_year = rec_comp_ed.end_year
			AND
			competition_id IN similar_comp(rec_comp_ed.competition_id)
	);
	
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
	IN	id_team		team.id%TYPE
	IN	id_comp_ed	competition_edition.id%TYPE,
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
			competition_edition_id IN similar_comp_ed(id_comp_ed)
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
		RETURN NEW
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
		
		ELSIF ('NATIONAL' = NEW.type)

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

	type_country_conf = get_attr('country', 'type', id_country);

	IF (type_country_conf <> 'NATION' OR NEW.team_type <> 'NATIONAL') THEN

		RETURN NEW;
	
	END IF
	
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

		RETURN NEW
	
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

	tmp		text
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
			RETURN TRUE;
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
			RETURN TRUE;
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
	id_player_pos	integer	
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
BEFORE INSERT IN confederation
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
BEFORE INSERT IN team
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
BEFORE INSERT IN competition
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
BEFORE INSERT IN competition_edition
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
BEFORE INSERT IN partecipation
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
BEFORE INSERT IN player
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
BEFORE INSERT IN nationality
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
BEFORE INSERT IN militancy
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
BEFORE INSERT IN player_tag
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
BEFORE INSERT IN player_attribute
FOR EACH ROW
EXECUTE FUNCTION tg_bi_player_attribute();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_trophy_team_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_trophy_team_case
BEFORE INSERT IN trophy_team_case
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
BEFORE INSERT IN trophy_player_case
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
BEFORE INSERT IN prize_team_case
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
BEFORE INSERT IN play
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
BEFORE INSERT IN play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------

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
 * DESC : schema for football player database                                 
 ******************************************************************************/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
--------------------------------------------------------------------------------



/*******************************************************************************
 * DOMAIN 
 ******************************************************************************/


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_date
 * DESC : domain for dates before or equal to the current date
 ******************************************************************************/
CREATE DOMAIN dm_date AS date
CHECK
(
	value <= current_date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_year
 * DESC : domain for years before or equal to the current date year
 ******************************************************************************/
CREATE DOMAIN dm_year AS smallint
CHECK
(
	value BETWEEN 0 AND extract(year from current_date)
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_code
 * DESC : domain for a code made up of only capital letters
 *        of the alphabet with a length between 1 and 20 characters
 ******************************************************************************/
CREATE DOMAIN dm_code AS varchar(20)
CHECK
(
	value ~ '(?=^[A-Z]{1,20}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_scode
 * DESC : domain for a code made up of only capital letters
 *        of the alphabet with a length between 2 and 3 characters
 ******************************************************************************/
CREATE DOMAIN dm_scode AS varchar(3)
CHECK
(
	value ~ '(?=^[A-Z]{2,3}$)'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_spstr
 * DESC : domain for all text string containing
 *        letters of the alphabet (accented or not),
 *        hyphens [-] and spaces,
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_spstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\-\s]{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]$)'
			'(?!.*[\-\s]{2})'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_enstr
 * DESC : domain for all text string containing
 *        letters of the alphabet (accented or not),
 *        hyphens [-], periods [.], superscripts ['] and spaces,
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_enstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\.\-\s'']{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\.]$)'
			'(?!.*[\-''\s]{2})((?:(?!\.[^\s])'
			'(?![^a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]\.).)+)'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_anstr
 * DESC : domain for all text string containing
 *        letters of the alphabet (accented or not), digits,
 *        hyphens [-], periods [.], superscripts ['] and spaces,
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_anstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9\.\-\s'']{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9\.]$)'
			'(?!.*[\-''\s]{2})((?:(?!\.[^\s])'
			'(?![^a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9]\.).)+)'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_usr
 * DESC : domain for all text string containing
 *        letters of the alphabet, digits, underscores [_] and periods [.]
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_usr AS varchar(20)
CHECK
(
	value ~ '(^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_pwd
 * DESC : domain for all text string containing
 *        all ASCII visible characters,
 *        with a minimum length of 8 characters and
 *        with a maximum length of 255 characters
 ******************************************************************************/
CREATE DOMAIN dm_pwd AS varchar(20)
CHECK
(
	value ~ '(^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)'
			'(?=.*[~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<])'
			'[A-Za-z\\d~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<]{8,255}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_uint
 * DESC : domain for non-negative integers [0 - 32767]
 ******************************************************************************/
CREATE DOMAIN dm_uint AS smallint
CHECK
(
	value >= 0
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * ENUM TYPE
 ******************************************************************************/
 
 
/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_country
 * DESC : enum for possible country types (world is a country type)
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
 * NAME : ty_team
 * DESC : enum for the possible types of football teams
 ******************************************************************************/
CREATE TYPE ty_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_comp
 * DESC : enum for the possible types of football competitions
 ******************************************************************************/
CREATE TYPE ty_comp AS ENUM
(
	'INDIVIDUAL',
	'CHAMPIONSHIP',
	'SUPER CUP',
	'TOURNAMENT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_sex
 * DESC : enum for the possible types of football player sex
 ******************************************************************************/
CREATE TYPE ty_sex AS ENUM
(
	'FEMALE',
	'MALE'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_foot
 * DESC : enum for the possible types of football player preferred foot
 ******************************************************************************/
CREATE TYPE ty_foot AS ENUM
(
	'BOTH',
	'LEFT',
	'RIGHT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_role
 * DESC : enum for the possible types of football player role
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
 * NAME : ty_trophy
 * DESC : enum for the possible types of football trophies
 ******************************************************************************/
CREATE TYPE ty_trophy AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_tag
 * DESC : enum for the possible types of tags
 *        to be associated with a football player
 ******************************************************************************/
CREATE TYPE ty_tag AS ENUM
(
	'MENTAL',
	'TECHNIQUE',
	'SET PIECE',
	'GOALKEEPER',
	'DEFENSIVE',
	'PASSING',
	'DRIBBLING',
	'PHYSICAL',
	'FINISHING',
	'POSITIONAL'
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TABLES AND CONSTRAINTS
 ******************************************************************************/
 
 
/*******************************************************************************
 * TYPE : TABLE
 * NAME : pos
 * DESC : table containing football player positions
 ******************************************************************************/
CREATE TABLE pos
(
	role	ty_role		NOT NULL, -- role code
	code	dm_scode	NOT NULL, -- position code
	name	dm_spstr	NOT NULL  -- position name
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - pos TABLE
 * NAME : pk_pos
 * DESC : attribute code will be primary key for a football position
 ******************************************************************************/
ALTER TABLE	pos
ADD CONSTRAINT pk_pos
PRIMARY KEY
(
	code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - pos TABLE
 * NAME : uq_pos
 * DESC : attribute name will be unique for a football position
 ******************************************************************************/
ALTER TABLE	pos
ADD CONSTRAINT uq_pos
UNIQUE
(
	name
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : country
 * DESC : table containing countries
 ******************************************************************************/
CREATE TABLE country
(
	type	ty_country	NOT NULL, -- country type
	code	dm_scode	NOT NULL, -- country code
	name	dm_enstr	NOT NULL, -- country name
	s_year	dm_year		NOT NULL, -- country foundation year
	e_year	dm_year				, -- country suppression year
	super	dm_code				  -- containing country code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country TABLE
 * NAME : pk_country
 * DESC : attribute code will be primary key for a country
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT pk_country
PRIMARY KEY
(
	code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - country TABLE
 * NAME : uq_country_name
 * DESC : attribute name will be unique for a country
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT uq_country_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - country TABLE
 * NAME : uq_country_type
 * DESC : combination of attribute type and code
 *        will be unique for a country
 *
 *        NOTE. This unique constraint is needed for
 *              foreign key constraint of other table 
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT uq_country_type
UNIQUE
(
	type,
	code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - country TABLE
 * NAME : ck_country_year
 * DESC : check that a country is still active (year of suppression is null)
 *        or that the year of suppression is after or equal
 *        to the year of foundation
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT ck_country_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country TABLE
 * NAME : country_fk_country
 * DESC : the attribute super of a country is a foreign key
 *        to the attribute code of the country containing it
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT country_fk_country
FOREIGN KEY
(
	super
)
REFERENCES country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - country TABLE
 * NAME : ck_country_fk
 * DESC : checks that a country of type world
 *        is not contained in any other country,
 *        while the other types of countries
 *        are contained in other countries
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT ck_country_fk
CHECK
(
	((type = 'NATION' OR type = 'CONTINENT') AND super IS NOT NULL)
	OR
	(type = 'WORLD' AND super IS NULL)
);
--------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */


/*******************************************************************************
 * TYPE : TABLE
 * NAME : player
 * DESC : table containing football players
 ******************************************************************************/
CREATE TABLE player
(
	id		serial		NOT NULL, -- id player
	f_name	dm_enstr	NOT NULL, -- first name
	m_name	dm_enstr			, -- mid name
	l_name	dm_enstr	NOT NULL, -- last name
	sex		ty_sex		NOT NULL, -- sex
	b_date	dm_date		NOT NULL, -- birth date
	s_date	dm_date		NOT NULL, -- debut date
	e_date	dm_date				, -- retired date
	foot	ty_foot		NOT NULL, -- preferred foot
	country	dm_scode	NOT NULL  -- birth country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player TABLE
 * NAME : pk_player
 * DESC : attribute id will be primary key for a football player
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
 * DESC : combination of attribute first name, mid name, last name,
 *        sex, birth date, debut date, retirement date and native country
 *        will be unique for a football player
 ******************************************************************************/
ALTER TABLE	player
ADD CONSTRAINT uq_player
UNIQUE NULLS NOT DISTINCT -- null values will be considered ad distinct
(
	f_name,
	m_name,
	l_name,
	sex,
	b_date,
	s_date,
	country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player TABLE
 * NAME : player_fk_country
 * DESC : the attribute country of a football player is a foreign key
 *        to the attribute code of the country in witch he/she was born
 ******************************************************************************/
ALTER TABLE	player
ADD CONSTRAINT player_fk_country
FOREIGN KEY
(
	country
)
REFERENCES country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - player TABLE
 * NAME : ck_player_s_age
 * DESC : checks that a football player's age of debut is between 10 and 40
 ******************************************************************************/
ALTER TABLE	player
ADD CONSTRAINT ck_player_s_age
CHECK
(
	(extract(year from age(s_date, b_date)) BETWEEN 10 AND 40)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - player TABLE
 * NAME : ck_player_e_date
 * DESC : check that if a football player is still active
 *        then he is aged less than or equal to 50;
 *        if the football player has retired,
 *        check that the retirement date is after the debut date
 *        and that he retired at the latest at 50 years of age
 ******************************************************************************/
ALTER TABLE	 player
ADD CONSTRAINT ck_player_e_date
CHECK
(
	(
		(e_date IS NULL)
		AND
		(extract(year from age(b_date)) <= 50)
	)
	OR
	(
		(e_date IS NOT NULL)
		AND
		(e_date - s_date >= 0)
		AND
		(extract(year from age(e_date, b_date)) <= 50)
	)
);
--------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */


/*******************************************************************************
 * TYPE : TABLE
 * NAME : team
 * DESC : table containing football teams
 ******************************************************************************/
CREATE TABLE team
(
	id 		serial		NOT NULL, -- id
	type	ty_team		NOT NULL, -- team type
	name	dm_anstr	NOT NULL, -- name
	max_age	dm_uint				, -- football player maximum age
	sex		ty_sex		NOT NULL, -- football player sex
	s_year	dm_year		NOT NULL, -- foundation year
	e_year	dm_year				, -- suppression year
	country	dm_scode	NOT NULL  -- belonging country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team TABLE
 * NAME : pk_team
 * DESC : attribute id will be primary key for a football team
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
 * DESC : combination of attribute name, football players sex,
 *        football players max age and country
 *        will be unique for a football player
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT uq_team
UNIQUE NULLS NOT DISTINCT -- null values will be considered ad distinct
(
	name,
	sex,
	max_age,
	country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team TABLE
 * NAME : team_fk_country
 * DESC : the attribute country of a football team is a foreign key
 *        to the attribute code of the country to witch it belongs
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT team_fk_country
FOREIGN KEY
(
	country
)
REFERENCES country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - team TABLE
 * NAME : ck_team_year
 * DESC : checks that a football team is active,
 *        or that its year of suppression is after its founding year
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT ck_team_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - team TABLE
 * NAME : ck_team_max_age
 * DESC : check that the football player maximum age is between 10 and 21
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT ck_team_max_age
CHECK
(
	max_age BETWEEN 10 AND 21
);
--------------------------------------------------------------------------------

/* TODO trigger to CHECK that country IS a nation */
/* TODO trigger to CHECK end year is not null */



/*******************************************************************************
 * TYPE : TABLE
 * NAME : conf
 * DESC : table containing football confederations
 ******************************************************************************/
CREATE TABLE conf
(
	code	dm_code 	NOT NULL, -- code
	name	dm_enstr	NOT NULL, -- name
	type	ty_country	NOT NULL, -- type
	country	dm_scode	NOT NULL, -- belonging country
	s_year	dm_year		NOT NULL, -- foundation year
	e_year	dm_year				, -- suppression year
	super	dm_code				  -- containing confederation
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf TABLE
 * NAME : pk_conf
 * DESC : attribute code will be primary key for a football confederation
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT pk_conf
PRIMARY KEY
(
	code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - conf TABLE
 * NAME : uq_conf
 * DESC : combination of attribute name and country,
 *        will be unique for a football confederation
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT uq_conf
UNIQUE
(
	name,
	country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - conf TABLE
 * NAME : ck_conf_year
 * DESC : checks that a football confederation is active,
 *        or that its year of suppression is after its founding year
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT ck_conf_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf TABLE
 * NAME : conf_fk_country
 * DESC : the combination of attributes type and country
 *        of a football confederation is a foreign key
 *        to the combination of attributes type and code
 *        of the country to which the football confederation belongs
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT conf_fk_country
FOREIGN KEY
(
	type,
	country
)
REFERENCES country
(
	type,
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf TABLE 
 * NAME : conf_fk_conf
 * DESC : the attribute super of a football confederation is a foreign key
 *        to the attribute code of the football confederation containing it
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT conf_fk_conf
FOREIGN KEY
(
	super
)
REFERENCES conf
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - conf TABLE
 * NAME : ck_conf_super
 * DESC : checks that if the football confederation is global,
 *        it is not contained in any other confederation,
 *        otherwise it must be contained in another football confederation
 ******************************************************************************/
ALTER TABLE	conf
ADD CONSTRAINT ck_conf_super
CHECK
(
	((type = 'NATION' OR type = 'CONTINENT') AND super IS NOT NULL)
	OR
	(type = 'WORLD' AND super IS NULL)
);
--------------------------------------------------------------------------------


/* TODO trigger to CHECK end year is not null */


/*******************************************************************************
 * TYPE : TABLE
 * NAME : p_pos
 * DESC : table connecting football player and football player position
 *        and containing also the number of matches played by the
 *        football player in the specific football position
 ******************************************************************************/
CREATE TABLE p_pos
(
	player	integer		NOT NULL			 , -- football player id
	pos		dm_scode	NOT NULL			 , -- football position code
	n_match	dm_uint		NOT NULL	DEFAULT 0  -- num of matches
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - TABLE p_pos  
 * NAME : pk_p_pos
 * DESC : combination of attribute player id and position code,
 *        will be a primary key for a p_pos table record
 ******************************************************************************/
ALTER TABLE p_pos
ADD CONSTRAINT pk_p_pos
PRIMARY KEY
(
	player,
	pos
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - TABLE p_pos
 * NAME : p_pos_fk_player
 * DESC : the attribute player of a p_pos table record is a foreign key
 *        to the attribute id of the football player it refers to
 ******************************************************************************/
ALTER TABLE p_pos
ADD CONSTRAINT p_pos_fk_player
FOREIGN KEY
(
	player
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - TABLE p_pos
 * NAME : p_pos_fk_pos
 * DESC : the attribute pos of a p_pos table record is a foreign key
 *        to the attribute code of the football player position it refers to
 ******************************************************************************/
ALTER TABLE p_pos
ADD CONSTRAINT p_pos_fk_pos
FOREIGN KEY
(
	pos
)
REFERENCES pos
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : p_country
 * DESC : table connecting football player and country
 ******************************************************************************/
CREATE TABLE p_country
(
	player	integer		NOT NULL, -- football player id
	country	dm_scode	NOT NULL  -- country code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - TABLE p_country
 * NAME : pk_p_country
 * DESC : combination of attribute player and country,
 *        will be a primary key for a p_country table record
 ******************************************************************************/
ALTER TABLE p_country
ADD CONSTRAINT pk_p_country
PRIMARY KEY
(
	player,
	country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - TABLE p_country
 * NAME : p_country_fk_player
 * DESC : the attribute player of a p_country table record is a foreign key
 *        to the attribute id of the football player it refers to
 ******************************************************************************/
ALTER TABLE p_country
ADD CONSTRAINT p_country_fk_player
FOREIGN KEY
(
	player
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************	
 * TYPE : FOREIGN KEY CONSTRAINT - TABLE p_country
 * NAME : p_country_fk_country
 * DESC : the attribute country of a p_country table record is a foreign key
 *        to the attribute code of the country it refers to
 ******************************************************************************/
ALTER TABLE p_country
ADD CONSTRAINT p_country_fk_country
FOREIGN KEY
(
	country
)
REFERENCES country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : comp
 * DESC : table containing football competitions
 ******************************************************************************/
CREATE TABLE comp
(
	id		serial		NOT NULL, -- id
	conf	dm_code		NOT NULL, -- belonging confederation code
	t_type	ty_team				, -- team type
	type	ty_comp		NOT NULL, -- type
	name	dm_anstr	NOT NULL, -- name
	max_age	dm_uint				, -- max age
	sex		ty_sex		NOT NULL, -- sex
	tier	dm_uint				, -- tier
	freq	dm_uint		NOT NULL, -- frequency
	s_year	dm_year		NOT NULL, -- foundation year
	e_year	dm_year				  -- suppression year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp TABLE
 * NAME : pk_comp
 * DESC : attribute id will be primary key for a football competition
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT pk_comp
UNIQUE
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp TABLE
 * NAME : uq_comp_name
 * DESC : combination of attribute conf and name
 *        will be unique for a football confederation
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT uq_comp_name
UNIQUE
(
	conf,
	name
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - comp TABLE
 * NAME : uq_comp_tier
 * DESC : combination of attribute conf, type, max_age, sex and tier
 *        will be unique for a football confederation
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT uq_comp_tier
UNIQUE NULLS NOT DISTINCT    -- null values will be considered ad distinct
(
	conf,
	type,
	max_age,
	sex,
	tier
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp TABLE
 * NAME : comp_fk_conf
 * DESC : the attribute conf of a football competition is a foreign key
 *        to the attribute code of the football confederation it belongs to
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT comp_fk_conf
FOREIGN KEY
(
	conf
)
REFERENCES conf
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - comp TABLE
 * NAME : ck_comp_type
 * DESC : check that individual competitions are associated with no team,
 *        while non-individual competitions must have a valid team type
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT ck_comp_type
CHECK
(
	(type = 'INDIVIDUAL' AND t_type IS NULL)
	OR
	(type <> 'INDIVIDUAL' AND t_type IS NOT NULL)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - comp TABLE
 * NAME : ck_comp_nteam
 * DESC : check that competitions involving national teams
 *        are not championships
 ******************************************************************************/
ALTER TABLE	comp
ADD CONSTRAINT ck_comp_nteam
CHECK
(
	(t_type <> 'NATIONAL')
	OR
	(t_type = 'NATIONAL' AND type <> 'CHAMPIONSHIP')
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - comp TABLE
 * NAME : ck_comp_year
 * DESC : checks that a football competition is active,
 *        or that its year of suppression is after its founding year
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT ck_comp_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
--------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */



/*******************************************************************************
 * TYPE : TABLE
 * NAME : tag
 * DESC : table containing football player tags
 ******************************************************************************/
CREATE TABLE tag
(
	id		integer		NOT NULL, -- id
	type	ty_tag		NOT NULL, -- type
	name	dm_enstr	NOT NULL, -- name
	dsc		dm_enstr              -- description
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - tag TABLE 
 * NAME : pk_tag
 * DESC : attribute id will be primary key for a football player tag
 ******************************************************************************/
ALTER TABLE	tag
ADD CONSTRAINT pk_tag
PRIMARY KEY
(
	id
);


/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - tag TABLE
 * NAME : uq_tag
 * DESC : attribute name will be unique for a football player tag
 ******************************************************************************/
ALTER TABLE	tag
ADD CONSTRAINT uq_tag
UNIQUE
(
	name
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : IMMUTABLE FUNCTION
 * NAME : 
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION cal_tot
(
	IN nt_group dm_uint,
	IN n_group  dm_uint,
	IN pow2_k	dm_uint
)
RETURNS dm_uint
AS
$$
DECLARE

BEGIN

	IF (0 = n_group) THEN
		RETURN CAST(power(2, pow2_k) AS integer);	
	ELSE
		RETURN n_group * nt_group;
	END IF;
	
END;
$$
IMMUTABLE
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : IMMUTABLE FUNCTION
 * NAME : 
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION cal_min
(
	IN nt_group dm_uint,
	IN n_group  dm_uint,
	IN pow2_k	dm_uint,
	IN r_group  boolean,
	IN r_knock  boolean,
	IN op_cl  	boolean
)
RETURNS dm_uint
AS
$$
DECLARE

	min dm_uint := 0;

BEGIN

	IF (0 = n_group) THEN
		IF (r_knock) THEN
			min = min + 2;
		ELSE
			min = min + 1;
		END IF;
	ELSE
		IF (r_group) THEN
			min = min + (nt_group - 1) * 2;
		ELSE
			min = min + nt_group - 1;
		END IF;
	END IF;
	
	IF (op_cl) THEN
		min = min * 2;
	END IF;

	RETURN min;

END;
$$
IMMUTABLE
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : IMMUTABLE FUNCTION
 * NAME : 
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION cal_max
(
	IN nt_group dm_uint,
	IN n_group  dm_uint,
	IN pow2_k	dm_uint,
	IN r_group  boolean,
	IN r_knock  boolean,
	IN op_cl	boolean
)
RETURNS dm_uint
AS
$$
DECLARE

	max dm_uint := 0;

BEGIN

	IF (r_knock) THEN
		max = max + CAST((power(2, pow2_k + 2) - 1) AS integer);
	ELSIF (r_knock IS NOT NULL) THEN
		max = max +  CAST((power(2, pow2_k + 1) - 1) AS integer);
	END IF;
	
	IF (r_group) THEN
		max = max + (nt_group - 1) * 2;
	ELSIF (r_group IS NOT NULL) THEN
		max = max + nt_group - 1;
	END IF;
	
	IF (op_cl) THEN
		max = max * 2;
	END IF;

	RETURN max;	

END;
$$
IMMUTABLE
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : f_comp
 * DESC : table containing football competition formulas
 ******************************************************************************/
CREATE TABLE f_comp
(
	id			serial	NOT NULL, -- id
	tot_team	dm_uint	NOT NULL  -- total number of teams
		
		GENERATED ALWAYS AS
		(cal_tot(nt_group, n_group, pow2_k)) STORED,
	
	nt_group	dm_uint	NOT NULL, -- number of teams for each group
	n_group		dm_uint	NOT NULL, -- number of groups
	pow2_k		dm_uint	NOT NULL, -- 
	min_match	dm_uint NOT NULL  -- minimum number of matches for team
	
		GENERATED ALWAYS AS
		(cal_min(nt_group, n_group, pow2_k, r_group, r_knock, op_cl)) STORED,
	
	max_match	dm_uint NOT NULL  -- maximun number of matches for team
	
		GENERATED ALWAYS AS
		(cal_max(nt_group, n_group, pow2_k, r_group, r_knock, op_cl)) STORED,
	
	r_group		boolean			, -- 
	r_knock		boolean			, --
	op_cl		boolean NOT NULL  --
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - f_comp TABLE
 * NAME : pk_f_comp
 * DESC : attribute id will be primary key for a football competition formula
 ******************************************************************************/
ALTER TABLE	f_comp
ADD CONSTRAINT pk_f_comp
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - f_comp TABLE
 * NAME : uq_f_comp
 * DESC :
 ******************************************************************************/
ALTER TABLE	f_comp
ADD CONSTRAINT uq_f_comp
UNIQUE NULLS NOT DISTINCT  -- null values will be considered ad distinct
(
	nt_group,
	n_group,
	pow2_k,
	r_group,
	r_knock
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - f_comp TABLE
 * NAME : ck_f_comp_num
 * DESC :
 ******************************************************************************/
ALTER TABLE	f_comp
ADD CONSTRAINT ck_f_comp_num
CHECK
(
	(
		(nt_group BETWEEN 2 AND 100)
		AND
		(
			(n_group BETWEEN 1 AND 20)
			AND 
			(r_group IS NOT NULL)
		)
		AND
		(tot_team <= 200)
		AND
		(
			((pow2_k BETWEEN 1 AND 5) AND (r_knock IS NOT NULL))
			OR
			((0 = pow2_k) AND (r_knock IS NULL))
		)
	)
	OR
	(
		(
			(0 = nt_group)
			AND
			(0 = n_group)
		)
		AND
		(pow2_k BETWEEN 1 AND 5)
		AND
		(
			(r_group IS NULL)
			AND
			(r_knock IS NOT NULL)
		)
		AND
		(FALSE = op_cl)
	)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : comp_ed
 * DESC : table containing football competition editions
 ******************************************************************************/
CREATE TABLE comp_ed
(
	comp	integer	NOT NULL, -- referring competition
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL, -- end year
	formula	integer           -- formula
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed TABLE
 * NAME : pk_comp_ed
 * DESC : combination of attribute comp, s_year and e_year
 *        will be primary key for a football competition edition
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT pk_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_ed TABLE
 * NAME : comp_ed_fk_comp
 * DESC : the attribute comp of a football competition edition is a foreign key
 *        to the attribute id of the football competition it refers to
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT comp_ed_fk_comp
FOREIGN KEY
(
	comp
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
 * NAME : comp_ed_fk_f_comp
 * DESC : the attribute formula of a football competition edition is
 *        a foreign key to the attribute id of
 *        the football competition formula it refers to
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT comp_ed_fk_f_comp
FOREIGN KEY
(
	formula
)
REFERENCES f_comp
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - comp_ed TABLE
 * NAME : ck_comp_ed_year
 * DESC : check that the end year of the football competition edition
 *        is the same as the start year, or at most the following year
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT ck_comp_ed_year
CHECK
(
	((e_year - s_year) BETWEEN 0 AND 1)
);
--------------------------------------------------------------------------------

/* TODO competizione individuale => formula null */
/* TODO trigger to check competition team type */
/* TODO trigger to check competition type and calculate max matches */
/* TODO trigger to check frequency */
/* TODO trigger to check national competition */



/*******************************************************************************
 * TYPE : TABLE
 * NAME : t_comp_ed
 * DESC : table connecting football player competition edition
 *        and football team
 *        and containing also the number of matches played by the
 *        football team in the specific competition edition
 ******************************************************************************/
CREATE TABLE t_comp_ed
(
	comp	integer	NOT NULL, -- referring competition ed
	s_year	dm_year	NOT NULL, -- start year of referring competition ed
	e_year	dm_year	NOT NULL, -- end year of referring competition ed
	team	integer	NOT NULL, -- referring football team
	n_match	dm_uint	NOT NULL  -- number of matches
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - t_comp_ed TABLE
 * NAME : pk_t_comp_ed
 * DESC : combination of attribute comp, s_year, e_year and team
 *        will be primary key for a t_comp_ed table record
 ******************************************************************************/
ALTER TABLE	t_comp_ed
ADD CONSTRAINT pk_t_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year,
	team
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - t_comp_ed TABLE
 * NAME : t_comp_ed_fk_comp_ed
 * DESC : the combination of attributes comp, s_year and e_year
 *        of a t_comp_ed table record is a foreign key
 *        to the combination of attributes comp, s_year and e_year
 *        of the football competition edition it refers to
 ******************************************************************************/
ALTER TABLE	t_comp_ed
ADD CONSTRAINT t_comp_ed_fk_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year
)
REFERENCES comp_ed
(
	comp,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - t_comp_ed TABLE
 * NAME : t_comp_ed_fk_team
 * DESC : the attribute team of a t_comp_ed table record is a foreign key
 *        to the attribute id of the football team it refers to
 ******************************************************************************/
ALTER TABLE	t_comp_ed
ADD CONSTRAINT t_comp_ed_fk_team
FOREIGN KEY
(
	team
)
REFERENCES team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/* TODO trigger to check that competition is for team */
/* TODO trigger to check that competition is valid */
/* TODO trigger to check that team is valid */
/* TODO trigger to check number of matches */






/*******************************************************************************
 * TYPE : TABLE
 * NAME : trophy
 * DESC : table containing football competition edition trophies
 ******************************************************************************/
CREATE TABLE trophy
(
	id		serial		NOT NULL, -- id
	comp	integer		NOT NULL, -- referring competition ed
	s_year	dm_year		NOT NULL, -- start year of referring competition ed 
	e_year	dm_year		NOT NULL, -- end year of referring competition ed
	type	ty_trophy	NOT NULL, -- type
	name	dm_anstr	NOT NULL  -- name
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy TABLE
 * NAME : pk_trophy
 * DESC : attribute id will be primary key for a trophy
 ******************************************************************************/
ALTER TABLE	trophy
ADD CONSTRAINT pk_trophy
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy TABLE
 * NAME : trophy_fk_comp_ed
 * DESC : the combination of attributes comp, s_year and e_year
 *        of a trophy is a foreign key
 *        to the combination of attributes comp, s_year and e_year
 *        of the football competition edition it refers to
 ******************************************************************************/
ALTER TABLE	trophy
ADD CONSTRAINT trophy_fk_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year
)
REFERENCES comp_ed
(
	comp,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/* TODO trigger to check that trophy type is compatible with competition team type */



/*******************************************************************************
 * TYPE : TABLE
 * NAME : t_trophy
 * DESC : table connecting football team
 *        and football competition edition trophy
 ******************************************************************************/
CREATE TABLE t_trophy
(
	trophy	integer	NOT NULL, -- referring football competition ed trophy
	team	integer	NOT NULL  -- referring football team
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - t_trophy TABLE
 * NAME : pk_t_trophy
 * DESC : attribute trophy will be primary key for a t_trophy table record
 ******************************************************************************/
ALTER TABLE	t_trophy
ADD CONSTRAINT pk_t_trophy
PRIMARY KEY
(
	trophy
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - t_trophy TABLE
 * NAME : t_trophy_fk_trophy
 * DESC : the attribute trophy of a t_trophy table record is a foreign key
 *        to the attribute id of the football competition edition trophy
 *        it refers to
 ******************************************************************************/
ALTER TABLE	t_trophy
ADD CONSTRAINT t_trophy_fk_trophy
FOREIGN KEY
(
	trophy
)
REFERENCES trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - t_trophy TABLE
 * NAME : t_trophy_fk_team
 * DESC : the attribute team of a t_trophy table record is a foreign key
 *        to the attribute id of the football team it refers to
 ******************************************************************************/
ALTER TABLE	t_trophy
ADD CONSTRAINT t_trophy_fk_team
FOREIGN KEY
(
	team
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
 * NAME : p_trophy
 * DESC : table connecting football player
 *        and football competition edition trophy
 ******************************************************************************/
CREATE TABLE p_trophy
(
	trophy	integer	NOT NULL, -- referring football competition ed trophy
	player	integer	NOT NULL  -- referring football player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_trophy TABLE
 * NAME : pk_p_trophy
 * DESC : combination of attribute trophy and player
 *        will be primary key for a p_trophy table record
 ******************************************************************************/
ALTER TABLE	p_trophy
ADD CONSTRAINT pk_p_trophy
PRIMARY KEY
(
	trophy,
	player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_trophy TABLE
 * NAME : p_trophy_fk_trophy
 * DESC : the attribute trophy of a p_trophy table record is a foreign key
 *        to the attribute id of the football competition edition trophy
 *        it refers to
 ******************************************************************************/
ALTER TABLE	p_trophy
ADD CONSTRAINT p_trophy_fk_trophy
FOREIGN KEY
(
	trophy
)
REFERENCES trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_trophy TABLE
 * NAME : p_trophy_fk_player
 * DESC : the attribute player of a p_trophy table record is a foreign key
 *        to the attribute id of the football player it refers to
 ******************************************************************************/
ALTER TABLE	p_trophy
ADD CONSTRAINT p_trophy_fk_player
FOREIGN KEY
(
	player
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
 * NAME : p_tag
 * DESC : table connecting football player
 *        and football player tag
 ******************************************************************************/
CREATE TABLE p_tag
(
	tag		integer	NOT NULL, -- referring football player tag
	player	integer	NOT NULL  -- referring football player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_tag TABLE
 * NAME : pk_p_tag
 * DESC : combination of attribute tag and player
 *        will be primary key for a p_tag table record
 ******************************************************************************/
ALTER TABLE	p_tag
ADD CONSTRAINT pk_p_tag
PRIMARY KEY
(
	tag,
	player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_tag TABLE
 * NAME : p_tag_fk_tag
 * DESC : the attribute tag of a p_tag table record is a foreign key
 *        to the attribute id of the football player tag it refers to
 ******************************************************************************/
ALTER TABLE	p_tag
ADD CONSTRAINT p_tag_fk_tag
FOREIGN KEY
(
	tag
)
REFERENCES tag
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_tag TABLE
 * NAME : p_tag_fk_player
 * DESC : the attribute player of a p_tag table record is a foreign key
 *        to the attribute id of the football player it refers to
 ******************************************************************************/
ALTER TABLE	p_tag
ADD CONSTRAINT p_tag_fk_player
FOREIGN KEY
(
	player
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
 * DESC : table connecting the football team
 *        and the football player and also containing
 *        the date on which the player started playing for the team
 *        and the date on which the player finished playing for the team
 ******************************************************************************/
CREATE TABLE play
(
	s_date	dm_date	NOT NULL, -- start date
	e_date	date	NOT NULL, -- end date
	team	integer	NOT NULL, -- referring football team
	player	integer	NOT NULL  -- referring football player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONTRAINT - play TABLE
 * NAME : pk_play
 * DESC : combination of attribute s_daye, e_date, team, player
 *        will be primary key for a play table record
 ******************************************************************************/
ALTER TABLE	play
ADD CONSTRAINT pk_play
PRIMARY KEY
(
	s_date,
	e_date,
	team,
	player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONTRAINT - play TABLE
 * NAME : play_fk_team
 * DESC : the attribute team of a play table record is a foreign key
 *        to the attribute id of the football team it refers to
 ******************************************************************************/
ALTER TABLE	play
ADD CONSTRAINT play_fk_team
FOREIGN KEY
(
	team
)
REFERENCES team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONTRAINT - play TABLE
 * NAME : play_fk_player
 * DESC : the attribute player of a play table record is a foreign key
 *        to the attribute id of the football player it refers to
 ******************************************************************************/
ALTER TABLE	play
ADD CONSTRAINT play_fk_player
FOREIGN KEY
(
	player
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONTRAINT - play TABLE
 * NAME : ck_play_date
 * DESC : check that the end date is later than the start date
 ******************************************************************************/
ALTER TABLE	play
ADD CONSTRAINT ck_play_date
CHECK
(
	e_date - s_date >= 0
);
--------------------------------------------------------------------------------

/* TODO trigger to check if everything is valid */


/*******************************************************************************
 * TYPE : TABLE
 * NAME : p_pos_t_comp_ed
 * DESC : table connecting the t_comp_ed table,
 *        the football player, the football player position
 *        and also containing the number of games played by the football player
 *        in the specific position, in the football team while playng
 *        in the football competition edition
 *        with various associated statistics
 ******************************************************************************/
CREATE TABLE p_pos_t_comp_ed
(
	comp		integer		NOT NULL, -- referring football competition ed
	s_year		dm_year		NOT NULL, -- start year of referring competition ed 
	e_year		dm_year		NOT NULL, -- end year of referring competition ed 
	team		integer		NOT NULL, -- referring football team
	player		integer		NOT NULL, -- referring football player
	pos			dm_scode	NOT NULL, -- referring football player position
	match		dm_uint				, -- number of matches
	goal		dm_uint				, -- goal scored
	ass			dm_uint				, -- assist maded
	p_scored	dm_uint				, -- penalities scored
	y_card		dm_uint				, -- yellow cards
	r_card		dm_uint				, -- red cards
	g_conceded	dm_uint				, -- goal conceded [GK only]
	c_sheet		dm_uint				, -- clean sheet [GK only]
	p_saved		dm_uint	              -- penalities saved [GK only]
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONTRAINT - p_pos_t_comp_ed TABLE
 * NAME : pk_p_pos_t_comp_ed
 * DESC : combination of attribute comp, s_year, e_year, team, player and pos
 *        will be primary key for a p_pos_t_comp_ed table record
 ******************************************************************************/
ALTER TABLE	p_pos_t_comp_ed
ADD CONSTRAINT pk_p_pos_t_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year,
	team,
	player,
	pos
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONTRAINT - p_pos_t_comp_ed TABLE
 * NAME : p_pos_t_comp_ed_fk_t_comp_ed
 * DESC : the combination of attributes comp, s_year, e_year and team
 *        of a a p_pos_t_comp_ed table record is a foreign key
 *        to the combination of attributes comp, s_year, e_year and team
 *        of the t_comp_ed table record it refers to
 ******************************************************************************/
ALTER TABLE	p_pos_t_comp_ed
ADD CONSTRAINT p_pos_t_comp_ed_fk_t_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year,
	team
)
REFERENCES t_comp_ed
(
	comp,
	s_year,
	e_year,
	team
)
ON DELETE RESTRICT ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONTRAINT - p_pos_t_comp_ed TABLE
 * NAME : p_pos_t_comp_ed_fk_player
 * DESC : the attribute player of a p_pos_t_comp_ed table record is
 *        a foreign key to the attribute id
 *        of the football player it refers to
 ******************************************************************************/
ALTER TABLE	p_pos_t_comp_ed
ADD CONSTRAINT p_pos_t_comp_ed_fk_player
FOREIGN KEY
(
	player
)
REFERENCES player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONTRAINT - p_pos_t_comp_ed TABLE
 * NAME : p_pos_t_comp_ed_fk_pos
 * DESC : the attribute pos of a p_pos_t_comp_ed table record is
 *        a foreign key to the attribute code
 *        of the football player position it refers to
 ******************************************************************************/
ALTER TABLE	p_pos_t_comp_ed
ADD CONSTRAINT p_pos_t_comp_ed_fk_pos
FOREIGN KEY
(
	pos
)
REFERENCES pos
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/* TODO controllo validita */
/* TODO controllo che il giocatore sia nella squadra */



/*******************************************************************************
 * TYPE : TABLE
 * NAME : usr
 * DESC : table containing users
 ******************************************************************************/
CREATE TABLE usr
(
	id		serial	NOT NULL			 , -- id
	name	dm_usr	NOT NULL			 , -- username
	pwd		dm_pwd	NOT NULL		     , -- password
	priv	dm_uint	NOT NULL	DEFAULT 0  -- level of priviledge					
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - usr TABLE
 * NAME : pk_usr
 * DESC : attribute id will be primary key for an user
 ******************************************************************************/
ALTER TABLE	usr
ADD CONSTRAINT pk_usr
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------
	

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - usr TABLE
 * NAME : uq_usr
 * DESC : attribute name will be unique for a football position
 ******************************************************************************/
ALTER TABLE	usr
ADD CONSTRAINT uq_usr
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

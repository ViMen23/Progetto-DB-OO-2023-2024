--****************************************************************************************
--* FOOTBALL PLAYER DATABASE
--****************************************************************************************

------------------------------------------------------------------------------------------
-- UNIVERSITY : FEDERICO II - NAPOLI
-- FIELD      : COMPUTER SCIENCE
-- CLASS      : DATA BASES I
-- THEACHER   : SILVIO BARRA
-- YEAR       : 2023-2024
------------------------------------------------------------------------------------------

--****************************************************************************************
--* SCHEMA
--****************************************************************************************

------------------------------------------------------------------------------------------
-- PREPARING SCHEMA
------------------------------------------------------------------------------------------
DROP SCHEMA IF EXISTS fp CASCADE;
CREATE SCHEMA fp;
------------------------------------------------------------------------------------------



--****************************************************************************************
--* DOMANINS
--****************************************************************************************

------------------------------------------------------------------------------------------
-- DOMAIN FOR DATE: dm_date
------------------------------------------------------------------------------------------
-- domanin values will be dates previous of current date 
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_date AS date
CHECK
(
	value <= current_date
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR YEAR: dm_year
------------------------------------------------------------------------------------------
-- domanin values will be not negative small integer previous of current year
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_year AS smallint
CHECK
(
	value >= 0
	AND
	value <= extract(year from (current_date))
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR CODE: dm_code
------------------------------------------------------------------------------------------
-- domain values will be string of uppercase alphabetic char of lenght in [1, 20] 
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_code AS varchar(20)
CHECK
(
	value ~ '(?=^[A-Z]{1,20}$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR SIMPLE ENGLISH STRING: dm_spstr
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_spstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\-\s]{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]$)'
			'(?!.*[\-\s]{2})'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR ENGLISH STRING: dm_enstr
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_enstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\.\-\s'']{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\.]$)'
			'(?!.*[\-''\s]{2})((?:(?!\.[^\s])'
			'(?![^a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]\.).)+)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR ALPHANUMERIC ENGLISH STRING: dm_anstr
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_anstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9\.\-\s'']{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9\.]$)'
			'(?!.*[\-''\s]{2})((?:(?!\.[^\s])'
			'(?![^a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9]\.).)+)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR USERNAME: dm_usr
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_usr AS varchar(20)
CHECK
(
	value ~ '(^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR PASSWORD: dm_pwd
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_pwd AS varchar(20)
CHECK
(
	value ~ '(^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)'
			'(?=.*[~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<])'
			'[A-Za-z\\d~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<]{8,255}$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR UNSIGNED INTEGER: dm_uint
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_uint AS smallint
CHECK
(
	value >= 0
);
------------------------------------------------------------------------------------------



--****************************************************************************************
--* ENUM TYPES
--****************************************************************************************

------------------------------------------------------------------------------------------
-- ENUM TYPE FOR COUNTRY: ty_cty
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_cty AS ENUM
(
	'NATION',
	'CONTINENT',
	'WORLD'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR TEAM: ty_team
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR COMPETITION: ty_comp
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_comp AS ENUM
(
	'INDIVIDUAL',
	'LEAGUE',
	'CUP',
	'SUPER CUP'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR SEX: ty_sex
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_sex AS ENUM
(
	'FEMALE',
	'MALE'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR FOOT: ty_foot
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_foot AS ENUM
(
	'BOTH',
	'LEFT',
	'RIGHT'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR ROLE: ty_role
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_role AS ENUM
(
	'GK', -- GK : goalkeeper
	'DF', -- DF : defender
	'MF', -- MF : midfield
	'FW'  -- FW : forward
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR TROPHY: ty_tpy
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_tpy AS ENUM
(
	'PLAYER',
	'TEAM'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR TAG: ty_tag
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_tag AS ENUM
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
------------------------------------------------------------------------------------------


--****************************************************************************************
--* TABLES AND CONSTRAINTS
--****************************************************************************************

------------------------------------------------------------------------------------------
-- POSITION TABLE: pos
------------------------------------------------------------------------------------------
-- the position of a football player on the football pitch
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.pos
(
	role	fpdb.fp.ty_role			NOT NULL, -- role code
	code	fpdb.fp.dm_code			NOT NULL, -- position code
	name	fpdb.fp.dm_spstr	NOT NULL  -- position name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.pos
ADD CONSTRAINT pk_pos
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.pos
ADD CONSTRAINT uq_pos
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- COUNTRY TABLE: cty
------------------------------------------------------------------------------------------
-- a country represents an abstract concept that summarizes the concept
-- of a nation, continent and even the world
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.cty
(
	type		fpdb.fp.ty_cty		NOT NULL, -- country type
	code		fpdb.fp.dm_code			NOT NULL, -- country code
	name		fpdb.fp.dm_enstr	NOT NULL, -- country name
	s_year		fpdb.fp.dm_year			NOT NULL, -- country foundation year
	e_year		fpdb.fp.dm_year					, -- country suppression year
	super		fpdb.fp.dm_code					  -- containing country code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.cty
ADD CONSTRAINT pk_cty
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.cty
ADD CONSTRAINT uq_cty_name
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.cty
ADD CONSTRAINT uq_cty_type
UNIQUE
(
	type,
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- check whether the country currently exists or it was suppressed after being founded
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.cty
ADD CONSTRAINT ck_cty_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.cty
ADD CONSTRAINT cty_fk_cty
FOREIGN KEY
(
	super
)
REFERENCES fpdb.fp.cty
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- checks that a nation or continent is contained in a country
-- and that the world is not contained in any country
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.cty
ADD CONSTRAINT ck_cty_fk
CHECK
(
	((type = 'NATION' OR type = 'CONTINENT') AND super IS NOT NULL)
	OR
	(type = 'WORLD' AND super IS NULL)
);
------------------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */


------------------------------------------------------------------------------------------
-- PLAYER TABLE: fply
------------------------------------------------------------------------------------------
-- a football player
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.fply
(
	id		serial					NOT NULL, -- id player
	f_name	fpdb.fp.dm_enstr	NOT NULL, -- first name
	m_name	fpdb.fp.dm_enstr			, -- mid name
	l_name	fpdb.fp.dm_enstr	NOT NULL, -- last name
	sex		fpdb.fp.ty_sex			NOT NULL, -- sex
	b_date	fpdb.fp.dm_date			NOT NULL, -- birth date
	s_date	fpdb.fp.dm_date			NOT NULL, -- debut date
	e_date	fpdb.fp.dm_date					, -- retired date
	foot	fpdb.fp.ty_foot			NOT NULL, -- preferred foot
	cty	fpdb.fp.dm_code			NOT NULL  -- birth country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply
ADD CONSTRAINT pk_fply
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.fply
ADD CONSTRAINT uq_fply
UNIQUE NULLS NOT DISTINCT
(
	f_name,
	m_name,
	l_name,
	sex,
	b_date,
	s_date,
	cty
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.fply
ADD CONSTRAINT fply_fk_cty
FOREIGN KEY
(
	cty
)
REFERENCES fpdb.fp.cty
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.fply
ADD CONSTRAINT ck_fply_s_age
CHECK
(
	(extract(year from age(s_date, b_date)) >= 10)
	AND
	(extract(year from age(s_date, b_date)) <= 40)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	 fpdb.fp.fply
ADD CONSTRAINT ck_fply_e_date
CHECK
(
	((e_date IS NULL) OR (e_date - s_date >= 0))
	AND
	(extract(year from age(s_date, b_date)) <= 50)
);
------------------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */


------------------------------------------------------------------------------------------
-- TEAM TABLE: team
------------------------------------------------------------------------------------------
-- a football team
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.team
(
	id 		serial					NOT NULL,
	type	fpdb.fp.ty_team			NOT NULL,
	name	fpdb.fp.dm_anstr	NOT NULL,
	m_age	fpdb.fp.dm_uint				,
	sex		fpdb.fp.ty_sex			NOT NULL,
	s_year	fpdb.fp.dm_year			NOT NULL,
	e_year	fpdb.fp.dm_year					,
	cty	fpdb.fp.dm_code			NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team
ADD CONSTRAINT pk_team
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team
ADD CONSTRAINT uq_team
UNIQUE NULLS NOT DISTINCT
(
	name,
	sex,
	m_age,
	cty
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team
ADD CONSTRAINT team_fk_cty
FOREIGN KEY
(
	cty
)
REFERENCES fpdb.fp.cty
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team
ADD CONSTRAINT ck_team_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

/* TODO trigger to CHECK that country IS a nation */
/* TODO trigger to CHECK end year is not null */



------------------------------------------------------------------------------------------
-- CONFEDERATION TABLE: conf
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.conf
(
	code	fpdb.fp.dm_code 		NOT NULL,
	name	fpdb.fp.dm_enstr	NOT NULL,
	type	fpdb.fp.ty_cty		NOT NULL,
	cty	fpdb.fp.dm_code			NOT NULL,
	s_year	fpdb.fp.dm_year			NOT NULL,
	e_year	fpdb.fp.dm_year					,
	super	fpdb.fp.dm_code				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.conf
ADD CONSTRAINT pk_conf
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.conf
ADD CONSTRAINT uq_conf
UNIQUE
(
	name,
	cty
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.conf
ADD CONSTRAINT ck_conf_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.conf
ADD CONSTRAINT conf_fk_cty
FOREIGN KEY
(
	type,
	cty
)
REFERENCES fpdb.fp.cty
(
	type,
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.conf
ADD CONSTRAINT conf_fk_conf
FOREIGN KEY
(
	super
)
REFERENCES fpdb.fp.conf
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.conf
ADD CONSTRAINT ck_conf_super
CHECK
(
	((type = 'NATION' OR type = 'CONTINENT') AND super IS NOT NULL)
	OR
	(type = 'WORLD' AND super IS NULL)
);
------------------------------------------------------------------------------------------
	
/* TODO trigger to CHECK that a national IS inside a continental AND a continental IS inside a  world */
/* TODO trigger to CHECK end year is not null */



------------------------------------------------------------------------------------------
-- PLAYER POSITION TABLE: fply_pos
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.fply_pos
(
	fply		integer		NOT NULL			 ,
	pos	fpdb.fp.dm_code		NOT NULL			 ,
	n_mtc		fpdb.fp.dm_uint	NOT NULL	DEFAULT 0	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply_pos
ADD CONSTRAINT pk_fply_pos
PRIMARY KEY
(
	fply,
	pos
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply_pos
ADD CONSTRAINT fply_pos_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply_pos
ADD CONSTRAINT fply_pos_fk_pos
FOREIGN KEY
(
	pos
)
REFERENCES fpdb.fp.pos
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAYER COUNTRY TABLE: fply_cty
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.fply_cty
(
	fply	integer	NOT NULL,
	cty	fpdb.fp.dm_code	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply_cty
ADD CONSTRAINT pk_fply_cty
PRIMARY KEY
(
	fply,
	cty
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply_cty
ADD CONSTRAINT fply_cty_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------
		
------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.fply_cty
ADD CONSTRAINT fply_cty_fk_cty
FOREIGN KEY
(
	cty
)
REFERENCES fpdb.fp.cty
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/*TODO trigger to CHECK that country IS a nation */



------------------------------------------------------------------------------------------
-- COMPETITION TABLE: comp
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.comp
(
	id				serial					NOT NULL,
	conf	fpdb.fp.dm_code			NOT NULL,
	t_type		fpdb.fp.ty_team					,
	type			fpdb.fp.ty_comp	NOT NULL,
	name			fpdb.fp.dm_anstr	NOT NULL,
	m_age			fpdb.fp.dm_uint				,
	sex				fpdb.fp.ty_sex			NOT NULL,
	tier			fpdb.fp.dm_uint				,
	freq		fpdb.fp.dm_uint		NOT NULL,
	s_year			fpdb.fp.dm_year			NOT NULL,
	e_year			fpdb.fp.dm_year				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp 
ADD CONSTRAINT pk_comp
UNIQUE
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp 
ADD CONSTRAINT uq_comp_name
UNIQUE
(
	conf,
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp 
ADD CONSTRAINT uq_comp_tier
UNIQUE NULLS NOT DISTINCT
(
	conf,
	type,
	m_age,
	sex,
	tier
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp 
ADD CONSTRAINT comp_fk_conf
FOREIGN KEY
(
	conf
)
REFERENCES fpdb.fp.conf
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp 
ADD CONSTRAINT ck_comp_type
CHECK
(
	(type <> 'INDIVIDUAL' AND t_type IS NOT NULL)
	OR
	(type = 'INDIVIDUAL' AND t_type IS NULL)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp
ADD CONSTRAINT ck_comp_nteam
CHECK
(
	(t_type <> 'NATIONAL')
	OR
	(t_type = 'NATIONAL' AND type <> 'LEAGUE')
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp 
ADD CONSTRAINT ck_comp_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

/* TODO trigger to check that a nation confederation cannot have national team competition */
/* TODO trigger to CHECK end year is not null */




------------------------------------------------------------------------------------------
-- TAG TABLE: tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.tag
(
	id		integer					NOT NULL,
	type	fpdb.fp.ty_tag			NOT NULL,
	tag		fpdb.fp.dm_enstr	NOT NULL,
	dsc	fpdb.fp.dm_enstr
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.tag
ADD CONSTRAINT pk_tag
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.tag
ADD CONSTRAINT uq_tag
UNIQUE
(
	tag
);
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- COMPETITION EDITION TABLE: comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.comp_ed
(
	comp		integer				NOT NULL,
	s_year			fpdb.fp.dm_year		NOT NULL,
	e_year			fpdb.fp.dm_year		NOT NULL,
	n_team	fpdb.fp.dm_uint	NOT NULL,
	m_mtc		fpdb.fp.dm_uint			
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp_ed
ADD CONSTRAINT pk_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp_ed
ADD CONSTRAINT comp_ed_fk_comp
FOREIGN KEY
(
	comp
)
REFERENCES fpdb.fp.comp
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.comp_ed
ADD CONSTRAINT ck_comp_ed_year
CHECK
(
	(e_year - s_year = 0)
	OR
	(e_year - s_year = 1)
);
------------------------------------------------------------------------------------------
	
/* TODO trigger to check competition team type */
/* TODO trigger to check competition type and calculate max matches */
/* TODO trigger to check frequency */
/* TODO trigger to check national competition */



------------------------------------------------------------------------------------------
-- TEAM COMPETITION EDITION TABLE: t_comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.t_comp_ed
(
	comp	integer				NOT NULL,
	s_year		fpdb.fp.dm_year		NOT NULL,
	e_year		fpdb.fp.dm_year		NOT NULL,
	team		integer				NOT NULL,
	n_mtc		fpdb.fp.dm_uint	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.t_comp_ed
ADD CONSTRAINT pk_t_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year,
	team
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.t_comp_ed
ADD CONSTRAINT t_comp_ed_fk_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year
)
REFERENCES fpdb.fp.comp_ed
(
	comp,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.t_comp_ed
ADD CONSTRAINT t_comp_ed_fk_team
FOREIGN KEY
(
	team
)
REFERENCES fpdb.fp.team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/* TODO trigger to check that competition is for team */
/* TODO trigger to check that competition is valid */
/* TODO trigger to check that team is valid */
/* TODO trigger to check number of matches */



------------------------------------------------------------------------------------------
-- PLAYER COMPETITION EDITION TABLE: p_comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.p_comp_ed
(
	comp	integer			NOT NULL,
	s_year		fpdb.fp.dm_year	NOT NULL,
	e_year		fpdb.fp.dm_year	NOT NULL,
	fply		integer			NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_comp_ed
ADD CONSTRAINT pk_p_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year,
	fply
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_comp_ed
ADD CONSTRAINT p_comp_ed_fk_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year
)
REFERENCES fpdb.fp.comp_ed
(
	comp,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_comp_ed
ADD CONSTRAINT p_comp_ed_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------
		
/* TODO trigger to check that competition is for player */
/* TODO trigger to check that competition is valid */
/* TODO trigger to check that player is valid */




------------------------------------------------------------------------------------------
-- TROPHY TABLE: tpy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.tpy
(
	id			serial					NOT NULL,
	comp	integer					NOT NULL,
	s_year		fpdb.fp.dm_year			NOT NULL,
	e_year		fpdb.fp.dm_year			NOT NULL,
	type		fpdb.fp.ty_tpy		NOT NULL,
	name		fpdb.fp.dm_anstr	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.tpy
ADD CONSTRAINT pk_tpy
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.tpy
ADD CONSTRAINT tpy_fk_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year
)
REFERENCES fpdb.fp.comp_ed
(
	comp,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/* TODO trigger to check that trophy type is compatible with competition team type */




------------------------------------------------------------------------------------------
-- TEAM TROPHY TABLE: t_tpy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.t_tpy
(
	tpy	integer	NOT NULL,
	team	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.t_tpy
ADD CONSTRAINT pk_t_tpy
PRIMARY KEY
(
	tpy,
	team
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.t_tpy
ADD CONSTRAINT t_tpy_fk_tpy
FOREIGN KEY
(
	tpy
)
REFERENCES fpdb.fp.tpy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.t_tpy
ADD CONSTRAINT t_tpy_fk_team
FOREIGN KEY
(
	team
)
REFERENCES fpdb.fp.team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAYER TROPHY TABLE: p_tpy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.p_tpy
(
	tpy	integer	NOT NULL,
	fply	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_tpy
ADD CONSTRAINT pk_p_tpy
PRIMARY KEY
(
	tpy,
	fply
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_tpy
ADD CONSTRAINT p_tpy_fk_tpy
FOREIGN KEY
(
	tpy
)
REFERENCES fpdb.fp.tpy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_tpy
ADD CONSTRAINT p_tpy_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------
		


------------------------------------------------------------------------------------------
-- PLAYER TAG TABLE: p_tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.p_tag
(
	tag		integer	NOT NULL,
	fply	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_tag
ADD CONSTRAINT pk_p_tag
PRIMARY KEY
(
	tag,
	fply
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_tag
ADD CONSTRAINT p_tag_fk_tag
FOREIGN KEY
(
	tag
)
REFERENCES fpdb.fp.tag
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_tag
ADD CONSTRAINT p_tag_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAY TABLE: play
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.play
(
	s_date	fpdb.fp.dm_date	NOT NULL,
	e_date	date			NOT NULL,
	team	integer			NOT NULL,
	fply	integer			NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.play
ADD CONSTRAINT pk_play
PRIMARY KEY
(
	s_date,
	e_date,
	team,
	fply
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.play
ADD CONSTRAINT play_fk_team
FOREIGN KEY
(
	team
)
REFERENCES fpdb.fp.team
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.play
ADD CONSTRAINT play_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.play
ADD CONSTRAINT ck_play_date
CHECK
(
	e_date - s_date >= 0
);
------------------------------------------------------------------------------------------

/* TODO trigger to check if everything is valid */


	
------------------------------------------------------------------------------------------
-- PLAYER POSITION TEAM COMPETITION TABLE: p_pos_t_comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.p_pos_t_comp_ed
(
	comp		integer				NOT NULL,
	s_year			fpdb.fp.dm_year		NOT NULL,
	e_year			fpdb.fp.dm_year		NOT NULL,
	team			integer				NOT NULL,
	fply			integer				NOT NULL,
	pos		fpdb.fp.dm_code		NOT NULL,
	mtc			fpdb.fp.dm_uint			,
	goal			fpdb.fp.dm_uint			,
	ass			fpdb.fp.dm_uint			,
	p_scr	fpdb.fp.dm_uint			,
	y_crd		fpdb.fp.dm_uint			,
	r_crd		fpdb.fp.dm_uint			,
	g_cnc	fpdb.fp.dm_uint			,
	c_sht		fpdb.fp.dm_uint			,
	p_svd	fpdb.fp.dm_uint	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_pos_t_comp_ed
ADD CONSTRAINT pk_p_pos_t_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year,
	team,
	fply,
	pos
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_pos_t_comp_ed
ADD CONSTRAINT p_pos_t_comp_ed_fk_t_comp_ed
FOREIGN KEY
(
	comp,
	s_year,
	e_year,
	team
)
REFERENCES fpdb.fp.t_comp_ed
(
	comp,
	s_year,
	e_year,
	team
)
ON DELETE RESTRICT ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_pos_t_comp_ed
ADD CONSTRAINT p_pos_t_comp_ed_fk_fply
FOREIGN KEY
(
	fply
)
REFERENCES fpdb.fp.fply
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.p_pos_t_comp_ed
ADD CONSTRAINT p_pos_t_comp_ed_fk_pos
FOREIGN KEY
(
	pos
)
REFERENCES fpdb.fp.pos
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/* TODO controllo validita */
/* TODO controllo che il giocatore sia nella squadra */


------------------------------------------------------------------------------------------
-- USER ACCOUNT TABLE: usr
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.usr
(
	id			serial					NOT NULL				,
	name	fpdb.fp.dm_usr		NOT NULL				,
	pwd	fpdb.fp.dm_pwd		NOT NULL				,
	per	fpdb.fp.dm_uint		NOT NULL	DEFAULT 0					
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.usr
ADD CONSTRAINT pk_usr
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.usr
ADD CONSTRAINT uq_usr
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------
				

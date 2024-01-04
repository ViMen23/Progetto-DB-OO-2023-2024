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
-- DOMAIN FOR SIMPLE ENGLISH STRING: dm_sp_string
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_sp_string AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\-\s]{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]$)'
			'(?!.*[\-\s]{2})'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR ENGLISH STRING: dm_en_string
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_en_string AS varchar(100)
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
-- DOMAIN FOR ALPHANUMERIC ENGLISH STRING: dm_an_string
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_an_string AS varchar(100)
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
-- DOMAIN FOR USERNAME: dm_username
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_username AS varchar(20)
CHECK
(
	value ~ '(^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR PASSWORD: dm_password
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_password AS varchar(20)
CHECK
(
	value ~ '(^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)'
			'(?=.*[~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<])'
			'[A-Za-z\\d~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<]{8,255}$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR UNSIGNED INTEGER: dm_unsigned
------------------------------------------------------------------------------------------
CREATE DOMAIN fpdb.fp.dm_unsigned AS smallint
CHECK
(
	value >= 0
);
------------------------------------------------------------------------------------------



--****************************************************************************************
--* ENUM TYPES
--****************************************************************************************

------------------------------------------------------------------------------------------
-- ENUM TYPE FOR COUNTRY: ty_country
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_country AS ENUM
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
-- ENUM TYPE FOR COMPETITION: ty_competition
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_competition AS ENUM
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
-- ENUM TYPE FOR TROPHY: ty_trophy
------------------------------------------------------------------------------------------
CREATE TYPE fpdb.fp.ty_trophy AS ENUM
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
-- POSITION TABLE: position
------------------------------------------------------------------------------------------
-- the position of a football player on the football pitch
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.position
(
	role	fpdb.fp.ty_role			NOT NULL, -- role code
	code	fpdb.fp.dm_code			NOT NULL, -- position code
	name	fpdb.fp.dm_sp_string	NOT NULL  -- position name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.position
ADD CONSTRAINT pk_position
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.position
ADD CONSTRAINT uq_position
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- COUNTRY TABLE: country
------------------------------------------------------------------------------------------
-- a country represents an abstract concept that summarizes the concept
-- of a nation, continent and even the world
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.country
(
	type		fpdb.fp.ty_country		NOT NULL, -- country type
	code		fpdb.fp.dm_code			NOT NULL, -- country code
	name		fpdb.fp.dm_en_string	NOT NULL, -- country name
	s_year		fpdb.fp.dm_year			NOT NULL, -- country foundation year
	e_year		fpdb.fp.dm_year					, -- country suppression year
	super		fpdb.fp.dm_code					  -- containing country code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.country
ADD CONSTRAINT pk_country
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.country
ADD CONSTRAINT uq_country_name
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.country
ADD CONSTRAINT uq_country_type
UNIQUE
(
	type,
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- check whether the country currently exists or it was suppressed after being founded
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.country
ADD CONSTRAINT ck_country_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.country
ADD CONSTRAINT fk_country_country
FOREIGN KEY
(
	super
)
REFERENCES fpdb.fp.country
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
ALTER TABLE	fpdb.fp.country
ADD CONSTRAINT ck_country_fk
CHECK
(
	((type = 'NATION' OR type = 'CONTINENT') AND super IS NOT NULL)
	OR
	(type = 'WORLD' AND super IS NULL)
);
------------------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */


------------------------------------------------------------------------------------------
-- PLAYER TABLE: player
------------------------------------------------------------------------------------------
-- a football player
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.player
(
	id		serial					NOT NULL, -- id player
	f_name	fpdb.fp.dm_en_string	NOT NULL, -- first name
	m_name	fpdb.fp.dm_en_string			, -- mid name
	l_name	fpdb.fp.dm_en_string	NOT NULL, -- last name
	sex		fpdb.fp.ty_sex			NOT NULL, -- sex
	b_date	fpdb.fp.dm_date			NOT NULL, -- birth date
	s_date	fpdb.fp.dm_date			NOT NULL, -- debut date
	e_date	fpdb.fp.dm_date					, -- retired date
	foot	fpdb.fp.ty_foot			NOT NULL, -- preferred foot
	country	fpdb.fp.dm_code			NOT NULL  -- birth country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player
ADD CONSTRAINT pk_player
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player
ADD CONSTRAINT uq_player
UNIQUE NULLS NOT DISTINCT
(
	f_name,
	m_name,
	l_name,
	sex,
	b_date,
	s_date,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player
ADD CONSTRAINT fk_player_country
FOREIGN KEY
(
	country
)
REFERENCES fpdb.fp.country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player
ADD CONSTRAINT ck_player_start_age
CHECK
(
	(extract(year from age(s_date, b_date)) >= 10)
	AND
	(extract(year from age(s_date, b_date)) <= 40)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	 fpdb.fp.player
ADD CONSTRAINT ck_player_end_date
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
	name	fpdb.fp.dm_an_string	NOT NULL,
	max_age	fpdb.fp.dm_unsigned				,
	sex		fpdb.fp.ty_sex			NOT NULL,
	s_year	fpdb.fp.dm_year			NOT NULL,
	e_year	fpdb.fp.dm_year					,
	country	fpdb.fp.dm_code			NOT NULL
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
	max_age,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team
ADD CONSTRAINT fk_team_country
FOREIGN KEY
(
	country
)
REFERENCES fpdb.fp.country
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
-- CONFEDERATION TABLE: confederation
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.confederation
(
	code	fpdb.fp.dm_code 		NOT NULL,
	name	fpdb.fp.dm_en_string	NOT NULL,
	type	fpdb.fp.ty_country		NOT NULL,
	country	fpdb.fp.dm_code			NOT NULL,
	s_year	fpdb.fp.dm_year			NOT NULL,
	e_year	fpdb.fp.dm_year					,
	super	fpdb.fp.dm_code				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.confederation
ADD CONSTRAINT pk_confederation
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.confederation
ADD CONSTRAINT uq_confederation
UNIQUE
(
	name,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.confederation
ADD CONSTRAINT ck_confederation_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.confederation
ADD CONSTRAINT fk_confederation_country
FOREIGN KEY
(
	type,
	country
)
REFERENCES fpdb.fp.country
(
	type,
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.confederation
ADD CONSTRAINT fk_confederation_confederation
FOREIGN KEY
(
	super
)
REFERENCES fpdb.fp.confederation
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.confederation
ADD CONSTRAINT ck_confederation_super
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
-- PLAYER POSITION TABLE: player_position
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.player_position
(
	player		integer		NOT NULL			 ,
	position	fpdb.fp.dm_code		NOT NULL			 ,
	n_match		fpdb.fp.dm_unsigned	NOT NULL	DEFAULT 0	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player_position
ADD CONSTRAINT pk_player_position
PRIMARY KEY
(
	player,
	position
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player_position
ADD CONSTRAINT player_position_fk_player
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player_position
ADD CONSTRAINT fk_player_position_position
FOREIGN KEY
(
	position
)
REFERENCES fpdb.fp.position
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAYER COUNTRY TABLE: player_country
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.player_country
(
	player	integer	NOT NULL,
	country	fpdb.fp.dm_code	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player_country
ADD CONSTRAINT pk_player_country
PRIMARY KEY
(
	player,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player_country
ADD CONSTRAINT fk_player_country_player
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------
		
------------------------------------------------------------------------------------------
ALTER TABLE fpdb.fp.player_country
ADD CONSTRAINT fk_player_country_country
FOREIGN KEY
(
	country
)
REFERENCES fpdb.fp.country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/*TODO trigger to CHECK that country IS a nation */



------------------------------------------------------------------------------------------
-- COMPETITION TABLE: competition
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.competition
(
	id				serial					NOT NULL,
	confederation	fpdb.fp.dm_code			NOT NULL,
	team_type		fpdb.fp.ty_team					,
	type			fpdb.fp.ty_competition	NOT NULL,
	name			fpdb.fp.dm_an_string	NOT NULL,
	max_age			fpdb.fp.dm_unsigned				,
	sex				fpdb.fp.ty_sex			NOT NULL,
	tier			fpdb.fp.dm_unsigned				,
	frequency		fpdb.fp.dm_unsigned		NOT NULL,
	s_year			fpdb.fp.dm_year			NOT NULL,
	e_year			fpdb.fp.dm_year				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT pk_competition
UNIQUE
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT uq_competition_name
UNIQUE
(
	confederation,
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT uq_competition_tier
UNIQUE NULLS NOT DISTINCT
(
	confederation,
	type,
	max_age,
	sex,
	tier
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT fk_competition_confederation
FOREIGN KEY
(
	confederation
)
REFERENCES fpdb.fp.confederation
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT ck_competition_type
CHECK
(
	(type <> 'INDIVIDUAL' AND team_type IS NOT NULL)
	OR
	(type = 'INDIVIDUAL' AND team_type IS NULL)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT ck_competition_national_team
CHECK
(
	(team_type <> 'NATIONAL')
	OR
	(team_type = 'NATIONAL' AND type <> 'LEAGUE')
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition 
ADD CONSTRAINT ck_competition_year
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
	tag		fpdb.fp.dm_en_string	NOT NULL,
	descr	fpdb.fp.dm_en_string
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
-- COMPETITION EDITION TABLE: competition_edition
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.competition_edition
(
	competition		integer				NOT NULL,
	s_year			fpdb.fp.dm_year		NOT NULL,
	e_year			fpdb.fp.dm_year		NOT NULL,
	n_competitor	fpdb.fp.dm_unsigned	NOT NULL,
	n_max_match		fpdb.fp.dm_unsigned			
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition_edition
ADD CONSTRAINT pk_competition_edition
PRIMARY KEY
(
	competition,
	s_year,
	e_year
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition_edition
ADD CONSTRAINT fk_competition_edition_competition
FOREIGN KEY
(
	competition
)
REFERENCES fpdb.fp.competition
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.competition_edition
ADD CONSTRAINT ck_competition_edition_year
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
-- TEAM COMPETITION EDITION TABLE: team_competition_edition
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.team_competition_edition
(
	competition	integer				NOT NULL,
	s_year		fpdb.fp.dm_year		NOT NULL,
	e_year		fpdb.fp.dm_year		NOT NULL,
	team		integer				NOT NULL,
	n_match		fpdb.fp.dm_unsigned	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team_competition_edition
ADD CONSTRAINT pk_team_competition_edition
PRIMARY KEY
(
	competition,
	s_year,
	e_year,
	team
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team_competition_edition
ADD CONSTRAINT fk_team_competition_edition_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year
)
REFERENCES fpdb.fp.competition_edition
(
	competition,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team_competition_edition
ADD CONSTRAINT fk_team_competition_edition_team
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
-- PLAYER COMPETITION EDITION TABLE: player_competition_edition
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.player_competition_edition
(
	competition	integer			NOT NULL,
	s_year		fpdb.fp.dm_year	NOT NULL,
	e_year		fpdb.fp.dm_year	NOT NULL,
	player		integer			NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_competition_edition
ADD CONSTRAINT pk_player_competition_edition
PRIMARY KEY
(
	competition,
	s_year,
	e_year,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_competition_edition
ADD CONSTRAINT fk_player_competition_edition_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year
)
REFERENCES fpdb.fp.competition_edition
(
	competition,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_competition_edition
ADD CONSTRAINT fk_player_competition_edition_team
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
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
-- TROPHY TABLE: trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.trophy
(
	id			serial					NOT NULL,
	competition	integer					NOT NULL,
	s_year		fpdb.fp.dm_year			NOT NULL,
	e_year		fpdb.fp.dm_year			NOT NULL,
	type		fpdb.fp.ty_trophy		NOT NULL,
	name		fpdb.fp.dm_an_string	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.trophy
ADD CONSTRAINT pk_trophy
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.trophy
ADD CONSTRAINT fk_trophy_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year
)
REFERENCES fpdb.fp.competition_edition
(
	competition,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/* TODO trigger to check that trophy type is compatible with competition team type */




------------------------------------------------------------------------------------------
-- TEAM TROPHY TABLE: team_trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.team_trophy
(
	trophy	integer	NOT NULL,
	team	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team_trophy
ADD CONSTRAINT pk_team_trophy
PRIMARY KEY
(
	trophy,
	team
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team_trophy
ADD CONSTRAINT fk_team_trophy_trophy
FOREIGN KEY
(
	trophy
)
REFERENCES fpdb.fp.trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.team_trophy
ADD CONSTRAINT fk_team_trophy_team
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
-- PLAYER TROPHY TABLE: player_trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.player_trophy
(
	trophy	integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_trophy
ADD CONSTRAINT pk_player_trophy
PRIMARY KEY
(
	trophy,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_trophy
ADD CONSTRAINT fk_player_trophy_trophy
FOREIGN KEY
(
	trophy
)
REFERENCES fpdb.fp.trophy
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_trophy
ADD CONSTRAINT fk_player_trophy_team
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------
		


------------------------------------------------------------------------------------------
-- PLAYER TAG TABLE: player_tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.player_tag
(
	tag		integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_tag
ADD CONSTRAINT pk_player_tag
PRIMARY KEY
(
	tag,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.player_tag
ADD CONSTRAINT fk_player_tag_tag
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
ALTER TABLE	fpdb.fp.player_tag
ADD CONSTRAINT fk_player_tag_player
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
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
	player	integer			NOT NULL
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
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.play
ADD CONSTRAINT fk_play_team
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
ADD CONSTRAINT fk_play_player
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
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
-- PLAYER POSITION TEAM COMPETITION TABLE: ply_pos_season_stat
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.ply_pos_season_stat
(
	competition		integer				NOT NULL,
	s_year			fpdb.fp.dm_year		NOT NULL,
	e_year			fpdb.fp.dm_year		NOT NULL,
	team			integer				NOT NULL,
	player			integer				NOT NULL,
	position		fpdb.fp.dm_code		NOT NULL,
	match			fpdb.fp.dm_unsigned			,
	goal			fpdb.fp.dm_unsigned			,
	assist			fpdb.fp.dm_unsigned			,
	penalty_scored	fpdb.fp.dm_unsigned			,
	yellow_card		fpdb.fp.dm_unsigned			,
	red_card		fpdb.fp.dm_unsigned			,
	goal_conceded	fpdb.fp.dm_unsigned			,
	clean_sheet		fpdb.fp.dm_unsigned			,
	penalty_saved	fpdb.fp.dm_unsigned	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.ply_pos_season_stat
ADD CONSTRAINT pk_ply_pos_season_stat
PRIMARY KEY
(
	competition,
	s_year,
	e_year,
	team,
	player,
	position
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.ply_pos_season_stat
ADD CONSTRAINT fk_ply_pos_season_stat_team_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year,
	team
)
REFERENCES fpdb.fp.team_competition_edition
(
	competition,
	s_year,
	e_year,
	team
)
ON DELETE RESTRICT ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.ply_pos_season_stat
ADD CONSTRAINT fk_ply_pos_season_stat_player
FOREIGN KEY
(
	player
)
REFERENCES fpdb.fp.player
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.ply_pos_season_stat
ADD CONSTRAINT fk_ply_pos_season_stat_position
FOREIGN KEY
(
	position
)
REFERENCES fpdb.fp.position
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

/* TODO controllo validita */
/* TODO controllo che il giocatore sia nella squadra */


------------------------------------------------------------------------------------------
-- USER ACCOUNT TABLE: account
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE fpdb.fp.account
(
	id			serial					NOT NULL				,
	username	fpdb.fp.dm_username		NOT NULL				,
	password	fpdb.fp.dm_password		NOT NULL				,
	privilege	fpdb.fp.dm_unsigned		NOT NULL	DEFAULT 0					
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.account
ADD CONSTRAINT pk_account
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	fpdb.fp.account
ADD CONSTRAINT uq_account
UNIQUE
(
	username
);
------------------------------------------------------------------------------------------
				

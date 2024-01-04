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


------------------------------------------------------------------------------------------
-- PREPARING SCHEMA
------------------------------------------------------------------------------------------
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
------------------------------------------------------------------------------------------



--****************************************************************************************
--* DOMANINS
--****************************************************************************************

------------------------------------------------------------------------------------------
-- DOMAIN FOR DATE: dm_date
------------------------------------------------------------------------------------------
-- domanin values will be dates previous of current date 
------------------------------------------------------------------------------------------
CREATE DOMAIN dm_date AS date
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
CREATE DOMAIN dm_year AS smallint
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
CREATE DOMAIN dm_code AS varchar(20)
CHECK
(
	value ~ '(?=^[A-Z]{1,20}$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR SIMPLE ENGLISH STRING: dm_sp_string
------------------------------------------------------------------------------------------
CREATE DOMAIN dm_sp_string AS varchar(100)
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
CREATE DOMAIN dm_en_string AS varchar(100)
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
CREATE DOMAIN dm_an_string AS varchar(100)
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
CREATE DOMAIN dm_username AS varchar(20)
CHECK
(
	value ~ '(^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR PASSWORD: dm_password
------------------------------------------------------------------------------------------
CREATE DOMAIN dm_password AS varchar(20)
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
CREATE DOMAIN dm_unsigned AS smallint
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
CREATE TYPE ty_country AS ENUM
(
	'NATION',
	'CONTINENT',
	'WORLD'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR TEAM: ty_team
------------------------------------------------------------------------------------------
CREATE TYPE ty_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR COMPETITION: ty_competition
------------------------------------------------------------------------------------------
CREATE TYPE ty_competition AS ENUM
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
CREATE TYPE ty_sex AS ENUM
(
	'FEMALE',
	'MALE'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR FOOT: ty_foot
------------------------------------------------------------------------------------------
CREATE TYPE ty_foot AS ENUM
(
	'BOTH',
	'LEFT',
	'RIGHT'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR ROLE: ty_role
------------------------------------------------------------------------------------------
CREATE TYPE ty_role AS ENUM
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
CREATE TYPE ty_trophy AS ENUM
(
	'PLAYER',
	'TEAM'
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
CREATE TABLE position
(
	role	ty_role			NOT NULL, -- role code
	code	dm_code			NOT NULL, -- position code
	name	dm_sp_string	NOT NULL  -- position name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	position
ADD CONSTRAINT pk_position
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	position
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
CREATE TABLE country
(
	type		ty_country		NOT NULL, -- country type
	code		dm_code			NOT NULL, -- country code
	name		dm_en_string	NOT NULL, -- country name
	s_year		dm_year			NOT NULL, -- country foundation year
	e_year		dm_year					, -- country suppression year
	super		dm_code					  -- containing country code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	country
ADD CONSTRAINT pk_country
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	country
ADD CONSTRAINT uq_country_name
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	country
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
ALTER TABLE	country
ADD CONSTRAINT ck_country_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	country
ADD CONSTRAINT fk_country_country
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- checks that a nation or continent is contained in a country
-- and that the world is not contained in any country
------------------------------------------------------------------------------------------
ALTER TABLE	country
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
CREATE TABLE player
(
	id		serial			NOT NULL, -- id player
	f_name	dm_en_string	NOT NULL, -- first name
	m_name	dm_en_string			, -- mid name
	l_name	dm_en_string	NOT NULL, -- last name
	sex		ty_sex			NOT NULL, -- sex
	b_date	dm_date			NOT NULL, -- birth date
	s_date	dm_date			NOT NULL, -- debut date
	e_date	dm_date					, -- retired date
	foot	ty_foot			NOT NULL, -- preferred foot
	country	dm_code			NOT NULL  -- birth country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player
ADD CONSTRAINT pk_player
PRIMARY KEY (id);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player
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
ALTER TABLE	player
ADD CONSTRAINT fk_player_country
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player
ADD CONSTRAINT ck_player_start_age
CHECK
(
	(extract(year from age(s_date, b_date)) >= 10)
	AND
	(extract(year from age(s_date, b_date)) <= 40)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	 player
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
CREATE TABLE team
(
	id 		serial			NOT NULL,
	type	ty_team			NOT NULL,
	name	dm_an_string	NOT NULL,
	max_age	dm_unsigned				,
	sex		ty_sex			NOT NULL,
	s_year	dm_year			NOT NULL,
	e_year	dm_year					,
	country	dm_code			NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team
ADD CONSTRAINT pk_team
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team
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
ALTER TABLE	team
ADD CONSTRAINT fk_team_country
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team
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
CREATE TABLE confederation
(
	code	dm_code 		NOT NULL,
	name	dm_en_string	NOT NULL,
	type	ty_country		NOT NULL,
	country	dm_code			NOT NULL,
	s_year	dm_year			NOT NULL,
	e_year	dm_year					,
	super	dm_code				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	confederation
ADD CONSTRAINT pk_confederation
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	confederation
ADD CONSTRAINT uq_confederation
UNIQUE
(
	name,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	confederation
ADD CONSTRAINT ck_confederation_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	confederation
ADD CONSTRAINT fk_confederation_country
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	confederation
ADD CONSTRAINT fk_confederation_confederation
FOREIGN KEY
(
	super
)
REFERENCES confederation
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	confederation
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
CREATE TABLE player_position
(
	player		integer		NOT NULL			 ,
	position	dm_code		NOT NULL			 ,
	n_match		dm_unsigned	NOT NULL	DEFAULT 0	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player_position
ADD CONSTRAINT pk_player_position
PRIMARY KEY
(
	player,
	position
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player_position
ADD CONSTRAINT player_position_fk_player
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player_position
ADD CONSTRAINT fk_player_position_position
FOREIGN KEY
(
	position
)
REFERENCES position
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
CREATE TABLE player_country
(
	player	integer	NOT NULL,
	country	dm_code	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player_country
ADD CONSTRAINT pk_player_country
PRIMARY KEY
(
	player,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player_country
ADD CONSTRAINT fk_player_country_player
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
------------------------------------------------------------------------------------------
		
------------------------------------------------------------------------------------------
ALTER TABLE player_country
ADD CONSTRAINT fk_player_country_country
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
------------------------------------------------------------------------------------------

/*TODO trigger to CHECK that country IS a nation */



------------------------------------------------------------------------------------------
-- COMPETITION TABLE: competition
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE competition
(
	id				serial			NOT NULL,
	confederation	dm_code			NOT NULL,
	team_type		ty_team					,
	type			ty_competition	NOT NULL,
	name			dm_an_string	NOT NULL,
	max_age			dm_unsigned				,
	sex				ty_sex			NOT NULL,
	tier			dm_unsigned				,
	frequency		dm_unsigned		NOT NULL,
	s_year			dm_year			NOT NULL,
	e_year			dm_year				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition 
ADD CONSTRAINT pk_competition
UNIQUE
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition 
ADD CONSTRAINT uq_competition_name
UNIQUE
(
	confederation,
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition 
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
ALTER TABLE	competition 
ADD CONSTRAINT fk_competition_confederation
FOREIGN KEY
(
	confederation
)
REFERENCES confederation
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition 
ADD CONSTRAINT ck_competition_type
CHECK
(
	(type <> 'INDIVIDUAL' AND team_type IS NOT NULL)
	OR
	(type = 'INDIVIDUAL' AND team_type IS NULL)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition 
ADD CONSTRAINT ck_competition_national_team
CHECK
(
	(team_type <> 'NATIONAL')
	OR
	(team_type = 'NATIONAL' AND type <> 'LEAGUE')
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition 
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
CREATE TABLE tag
(
	id	integer			NOT NULL,
	tag	dm_en_string	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	tag
ADD CONSTRAINT pk_tag
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	tag
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
CREATE TABLE competition_edition
(
	competition		integer		NOT NULL,
	s_year			dm_year		NOT NULL,
	e_year			dm_year		NOT NULL,
	n_competitor	dm_unsigned	NOT NULL,
	n_max_match		dm_unsigned			
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition_edition
ADD CONSTRAINT pk_competition_edition
PRIMARY KEY
(
	competition,
	s_year,
	e_year
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition_edition
ADD CONSTRAINT fk_competition_edition_competition
FOREIGN KEY
(
	competition
)
REFERENCES competition
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	competition_edition
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
CREATE TABLE team_competition_edition
(
	competition	integer		NOT NULL,
	s_year		dm_year		NOT NULL,
	e_year		dm_year		NOT NULL,
	team		integer		NOT NULL,
	n_match		dm_unsigned	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team_competition_edition
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
ALTER TABLE	team_competition_edition
ADD CONSTRAINT fk_team_competition_edition_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year
)
REFERENCES competition_edition
(
	competition,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team_competition_edition
ADD CONSTRAINT fk_team_competition_edition_team
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
CREATE TABLE player_competition_edition
(
	competition	integer	NOT NULL,
	s_year		dm_year	NOT NULL,
	e_year		dm_year	NOT NULL,
	player		integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_competition_edition
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
ALTER TABLE	player_competition_edition
ADD CONSTRAINT fk_player_competition_edition_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year
)
REFERENCES competition_edition
(
	competition,
	s_year,
	e_year
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_competition_edition
ADD CONSTRAINT fk_player_competition_edition_team
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
------------------------------------------------------------------------------------------
		
/* TODO trigger to check that competition is for player */
/* TODO trigger to check that competition is valid */
/* TODO trigger to check that player is valid */




------------------------------------------------------------------------------------------
-- TROPHY TABLE: trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE trophy
(
	id			serial			NOT NULL,
	competition	integer			NOT NULL,
	s_year		dm_year			NOT NULL,
	e_year		dm_year			NOT NULL,
	type		ty_trophy		NOT NULL,
	name		dm_an_string	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	trophy
ADD CONSTRAINT pk_trophy
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	trophy
ADD CONSTRAINT fk_trophy_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year
)
REFERENCES competition_edition
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
CREATE TABLE team_trophy
(
	trophy	integer	NOT NULL,
	team	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team_trophy
ADD CONSTRAINT pk_team_trophy
PRIMARY KEY
(
	trophy,
	team
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team_trophy
ADD CONSTRAINT fk_team_trophy_trophy
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	team_trophy
ADD CONSTRAINT fk_team_trophy_team
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
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAYER TROPHY TABLE: player_trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE player_trophy
(
	trophy	integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_trophy
ADD CONSTRAINT pk_player_trophy
PRIMARY KEY
(
	trophy,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_trophy
ADD CONSTRAINT fk_player_trophy_trophy
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_trophy
ADD CONSTRAINT fk_player_trophy_team
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
------------------------------------------------------------------------------------------
		


------------------------------------------------------------------------------------------
-- PLAYER TAG TABLE: player_tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE player_tag
(
	tag		integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_tag
ADD CONSTRAINT pk_player_tag
PRIMARY KEY
(
	tag,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_tag
ADD CONSTRAINT fk_player_tag_tag
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player_tag
ADD CONSTRAINT fk_player_tag_player
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
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- TAG TABLE: tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE position_tag
(
	tag			integer	NOT NULL,
	position	dm_code NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	position_tag
ADD CONSTRAINT pk_position_tag
PRIMARY KEY
(
	tag,
	position
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	position_tag
ADD CONSTRAINT fk_position_tag_tag
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	position_tag
ADD CONSTRAINT fk_position_tag_position
FOREIGN KEY
(
	position
)
REFERENCES position
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAY TABLE: play
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE play
(
	s_date	dm_date	NOT NULL,
	e_date	date	NOT NULL,
	team	integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	play
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
ALTER TABLE	play
ADD CONSTRAINT fk_play_team
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	play
ADD CONSTRAINT fk_play_player
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
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	play
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
CREATE TABLE ply_pos_season_stat
(
	competition		integer		NOT NULL,
	s_year			dm_year		NOT NULL,
	e_year			dm_year		NOT NULL,
	team			integer		NOT NULL,
	player			integer		NOT NULL,
	position		dm_code		NOT NULL,
	match			dm_unsigned			,
	goal			dm_unsigned			,
	assist			dm_unsigned			,
	penalty_scored	dm_unsigned			,
	yellow_card		dm_unsigned			,
	red_card		dm_unsigned			,
	goal_conceded	dm_unsigned			,
	clean_sheet		dm_unsigned			,
	penalty_saved	dm_unsigned	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	ply_pos_season_stat
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
ALTER TABLE	ply_pos_season_stat
ADD CONSTRAINT fk_ply_pos_season_stat_team_competition_edition
FOREIGN KEY
(
	competition,
	s_year,
	e_year,
	team
)
REFERENCES team_competition_edition
(
	competition,
	s_year,
	e_year,
	team
)
ON DELETE RESTRICT ON UPDATE CASCADE;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	ply_pos_season_stat
ADD CONSTRAINT fk_ply_pos_season_stat_player
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	ply_pos_season_stat
ADD CONSTRAINT fk_ply_pos_season_stat_position
FOREIGN KEY
(
	position
)
REFERENCES position
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
CREATE TABLE account
(
	id			serial			NOT NULL				,
	username	dm_username		NOT NULL				,
	password	dm_password		NOT NULL				,
	privilege	dm_unsigned		NOT NULL	DEFAULT 0					
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	account
ADD CONSTRAINT pk_account
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	account
ADD CONSTRAINT uq_account
UNIQUE
(
	username
);
------------------------------------------------------------------------------------------
				

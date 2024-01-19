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

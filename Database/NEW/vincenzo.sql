
/*******************************************************************************
 * TYPE : TABLE
 * NAME : country
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country
(
	type	ty_country	NOT NULL, -- type
	code	dm_scode	NOT NULL, -- code
	name	dm_enstr	NOT NULL, -- name
	year	dm_year		NOT NULL  -- foundation year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country TABLE
 * NAME : pk_country
 * DESC : TODO
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country_s
(
	country	dm_scode	NOT NULL, -- country code
	year	dm_year		NOT NULL  -- suppression year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_s TABLE
 * NAME : pk_country_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country
ADD CONSTRAINT pk_country
PRIMARY KEY
(
	country
	
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - country_s TABLE
 * NAME : country_s_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_s
ADD CONSTRAINT country_s_fk_country
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
 * NAME : t_nation
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE t_nation
(
	team	integer		NOT NULL, -- team id
	nation	dm_scode	NOT NULL, -- country code
	year	dm_year		NOT NULL  -- start year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - t_nation TABLE
 * NAME : pk_t_nation
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation
ADD CONSTRAINT pk_t_nation
PRIMARY KEY
(
	team	
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - t_nation TABLE
 * NAME : t_nation_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation
ADD CONSTRAINT t_nation_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - t_nation TABLE
 * NAME : t_nation_fk_nation
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation
ADD CONSTRAINT t_nation_fk_nation
FOREIGN KEY
(
	nation
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
 * NAME : t_nation_h
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE t_nation_h
(
	team	integer		NOT NULL, -- team id
	nation	dm_scode	NOT NULL, -- country code
	s_year	dm_year		NOT NULL, -- start year
	e_year	dm_year		NOT NULL  -- end year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - t_nation_h TABLE
 * NAME : pk_t_nation_h
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation_h
ADD CONSTRAINT pk_t_nation_h
PRIMARY KEY
(
	team,
	nation,
	s_year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - t_nation_h TABLE
 * NAME : t_nation_h_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation_h
ADD CONSTRAINT t_nation_h_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - t_nation_h TABLE
 * NAME : t_nation_h_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation_h
ADD CONSTRAINT t_nation_h_fk_country
FOREIGN KEY
(
	nation
)
REFERENCES country
(
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - t_nation_h TABLE
 * NAME : ck_t_nation_h_year
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	t_nation_h
ADD CONSTRAINT ck_t_nation_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : conf_country
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_country
(
	conf	dm_code		NOT NULL, -- confederation code
	country	dm_scode	NOT NULL, -- country code
	year	dm_year		NOT NULL  -- start year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_country TABLE
 * NAME : pk_conf_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country
ADD CONSTRAINT pk_conf_country
PRIMARY KEY
(
	conf	
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_country TABLE
 * NAME : conf_country_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country
ADD CONSTRAINT conf_country_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_country TABLE
 * NAME : conf_country_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country
ADD CONSTRAINT conf_country_fk_country
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
 * NAME : conf_country_h
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_country_h
(
	conf	dm_code		NOT NULL, -- confederation code
	country	dm_scode	NOT NULL, -- country code
	s_year	dm_year		NOT NULL, -- start year
	e_year	dm_year		NOT NULL  -- end year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_country_h TABLE
 * NAME : pk_conf_country_h
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country_h
ADD CONSTRAINT pk_conf_country_h
PRIMARY KEY
(
	conf,
	country,
	s_year
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_country_h TABLE
 * NAME : conf_country_h_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country_h
ADD CONSTRAINT conf_country_h_fk_conf
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
 * TYPE : FOREIGN KEY CONSTRAINT - conf_country_h TABLE
 * NAME : conf_country_h_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country_h
ADD CONSTRAINT conf_country_h_fk_country
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
 * TYPE : CHECK CONSTRAINT - conf_country_h TABLE
 * NAME : ck_conf_country_h_year
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_country_h
ADD CONSTRAINT ck_conf_country_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : player
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player
(
	id		serial		NOT NULL, -- id player
	name	dm_enstr	NOT NULL, -- name
	surname	dm_enstr	NOT NULL, -- surname
	sex		ty_sex		NOT NULL, -- sex
	dob		dm_date		NOT NULL, -- birth date
	foot	ty_foot		NOT NULL, -- preferred foot
	country	dm_scode	NOT NULL  -- birth country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player TABLE
 * NAME : pk_player
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
	country
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player TABLE
 * NAME : player_fk_country
 * DESC : TODO
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
 * TYPE : TABLE
 * NAME : player_s
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_s
(
	player	integer	NOT NULL, -- player id
	r_date	dm_date	NOT NULL -- retired date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_s TABLE
 * NAME : pk_player_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_s
ADD CONSTRAINT pk_player_s
PRIMARY KEY
(
	player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_s TABLE
 * NAME : player_s_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_s
ADD CONSTRAINT player_s_fk_player
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
 * NAME : p_nation
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE p_nation
(
	player	integer		NOT NULL, -- player id
	nation	dm_scode	NOT NULL  -- country code
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_nation TABLE
 * NAME : pk_p_nation
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_nation
ADD CONSTRAINT pk_p_nation
PRIMARY KEY
(
	player,
	nation
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_nation TABLE
 * NAME : p_nation_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	p_nation
ADD CONSTRAINT p_nation_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - p_nation TABLE
 * NAME : p_nation_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	p_nation
ADD CONSTRAINT p_nation_fk_country
FOREIGN KEY
(
	nation
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
 * NAME : play
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE play
(
	player	integer	NOT NULL, -- player id
	team	integer	NOT NULL, -- team id
	s_date	dm_date	NOT NULL, -- start date
	e_date	date	NOT NULL  -- end date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - play TABLE
 * NAME : pk_play
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE play
ADD CONSTRAINT pk_play
PRIMARY KEY
(
	player,
	team,
	s_date,
	e_date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE
 * NAME : play_fk_player
 * DESC : TODO
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
 * TYPE : FOREIGN KEY CONSTRAINT - play TABLE
 * NAME : play_fk_team
 * DESC : TODO
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
 * TYPE : CHECK CONTRAINT - play TABLE
 * NAME : ck_play_date
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
 * TYPE : TABLE
 * NAME : tag
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE tag
(
	id		integer		NOT NULL, -- id
	type	ty_tag		NOT NULL, -- type
	name	dm_enstr	NOT NULL, -- name
	dsc		dm_enstr	NOT NULL, -- description
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - tag TABLE 
 * NAME : pk_tag
 * DESC : TODO
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
 * NAME : p_tag
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE p_tag
(
	player	integer	NOT NULL, -- player id
	tag		integer	NOT NULL  -- tag id
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_tag TABLE 
 * NAME : pk_p_tag
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	p_tag
ADD CONSTRAINT pk_p_tag
PRIMARY KEY
(
	player,
	tag
);


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_tag TABLE
 * NAME : p_tag_fk_player
 * DESC : TODO
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
 * TYPE : FOREIGN KEY CONSTRAINT - p_tag TABLE
 * NAME : p_tag_fk_tag
 * DESC : TODO
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
 * TYPE : TABLE
 * NAME : pos
 * DESC : TODO
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
 * DESC : TODO
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
 * DESC : TODO
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
 * NAME : p_pos
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE p_pos
(
	player		integer		NOT NULL,			  -- player id
	pos			dm_scode	NOT NULL,			  -- position code
	num_match	dm_uint		NOT NULL	DEFAULT 0 -- number of match
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_pos TABLE  
 * NAME : pk_p_pos
 * DESC : TODO
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
 * TYPE : FOREIGN KEY CONSTRAINT - p_pos TABLE 
 * NAME : p_pos_fk_player
 * DESC : TODO
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
 * TYPE : FOREIGN KEY CONSTRAINT - p_pos TABLE
 * NAME : p_pos_fk_pos
 * DESC : TODO
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
 * NAME : attr
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE attr
(
	id		serial		NOT NULL, -- attribute id
	type	ty_attr		NOT NULL, -- attribute type
	name	dm_enstr	NOT NULL, -- name
	dsc		dm_enstr	NOT NULL, -- description
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - attr TABLE   
 * NAME : pk_attr
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
 * NAME : p_attr
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE p_attr
(
	player	integer	NOT NULL,		   -- player id
	attr	integer	NOT NULL,		   -- attribute id
	value	dm_uint	NOT NULL DEFAULT 0 -- value of attribute for player
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_attr TABLE  
 * NAME : pk_p_attr
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_attr
ADD CONSTRAINT pk_p_attr
PRIMARY KEY
(
	player,
	attr
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_attr TABLE
 * NAME : p_attr_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_attr
ADD CONSTRAINT p_attr_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - p_attr TABLE
 * NAME : p_attr_fk_attr
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_attr
ADD CONSTRAINT p_attr_fk_attr
FOREIGN KEY
(
	attr
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE stat
(
	id		serial		NOT NULL, -- id
	name	dm_enstr	NOT NULL, -- name
	dsc		dm_enstr	NOT NULL  -- description
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - stat TABLE  
 * NAME : pk_stat
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
 * NAME : stat_role
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE stat_role
(
	stat	integer	NOT NULL, -- statistic id
	role	ty_role	NOT NULL  -- role
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - stat_role TABLE  
 * NAME : pk_stat_role
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE stat_role
ADD CONSTRAINT pk_stat_role
PRIMARY KEY
(
	stat,
	role
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - stat_role TABLE
 * NAME : stat_role_fk_stat
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE stat_role
ADD CONSTRAINT stat_role_fk_stat
FOREIGN KEY
(
	stat
)
REFERENCES stat
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : p_season_stat
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE p_season_stat
(
	stat		integer	NOT NULL,			  -- statistic id
	p_season	integer	NOT NULL,			  -- p_season id
	value		dm_uint	NOT NULL	DEFAULT 0 -- value
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - p_season_stat TABLE  
 * NAME : pk_p_season_stat
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_season_stat
ADD CONSTRAINT pk_p_season_stat
PRIMARY KEY
(
	stat,
	p_season
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_season_stat TABLE
 * NAME : p_season_stat_fk_stat
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_season_stat
ADD CONSTRAINT p_season_stat_fk_stat
FOREIGN KEY
(
	stat
)
REFERENCES stat
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - p_season_stat TABLE
 * NAME : p_season_stat_fk_p_season
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE p_season_stat
ADD CONSTRAINT p_season_stat_fk_p_season
FOREIGN KEY
(
	p_season
)
REFERENCES p_season
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



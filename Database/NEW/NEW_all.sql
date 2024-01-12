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
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_alnum AS varchar(100)
CHECK
(
	value ~ '(?=^([\p{L}\p{M}\p{N}][\p{L}\p{M}\p{N}\.\-'' \/]{0,98}'
			'[\p{L}\p{M}\p{N}\.])$)(?!.*([\-'' \/]{2}|[\-''\.\/]{2}| \.))'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_code
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_code AS varchar(20)
CHECK
(
	value ~ '(?=^[A-Z]{1,20}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_date
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_date AS date
CHECK
(
	value <= current_date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_string
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_string AS varchar(100)
CHECK
(
	value ~ '(?=^([\p{L}\p{M}][\p{L}\p{M}\.\-'' ]{0,98}[\p{L}\p{M}\.])$)'
			'(?!.*([\-'' ]{2}|[\-''\.]{2}| \.))'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_pwd
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_pwd AS varchar(255)
CHECK
(
	value ~ '(?=^([\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]{8,255})$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_scode
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_scode AS varchar(3)
CHECK
(
	value ~ '(?=^[A-Z]{2,3}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_uint
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_uint AS smallint
CHECK
(
	value >= 0
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_usr
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_usr AS varchar(20)
CHECK
(
	value ~ '(?=^([\p{L}\p{M}\p{N}][\p{L}\p{M}\p{N}\.\-_]{2,18}'
			'[\p{L}\p{M}\p{N}])$)(?!.*[\-\._]{2})'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_year
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_year AS smallint
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
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_age_cap AS ENUM
(
	'U-15',
	'U-16',
	'U-17',
	'U-18',
	'U-19',
	'U-20',
	'U-21',
	'U-22',
	'U-23',
	'MAJOR'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_attr
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
 * DESC : TODO
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
 * NAME : ty_freq
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_freq AS ENUM
(
	'EACH YEAR',
	'EACH 2 YEAR',
	'EACH 3 YEAR',
	'EACH 4 YEAR',
	'IRREGULAR'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_role
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
 * NAME : ty_tier
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_tier AS ENUM
(
	'1ST-TIER',
	'2ND-TIER',
	'3RD-TIER',
	'4TH-TIER',
	'5TH-TIER'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_trophy
 * DESC : TODO
 ******************************************************************************/
CREATE TYPE ty_trophy AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------




/*******************************************************************************
 * TABLES AND CONSTRAINTS
 ******************************************************************************/
 
 

/*******************************************************************************
 * TYPE : TABLE
 * NAME : country
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE country
(
	id		serial		NOT NULL, -- id
	type	ty_country	NOT NULL, -- type
	code	dm_scode	NOT NULL, -- code
	name	dm_string	NOT NULL, -- name
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
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - country TABLE
 * NAME : uq_country_code
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
	country	integer	NOT NULL, -- country code
	year	dm_year	NOT NULL  -- suppression year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - country_s TABLE
 * NAME : pk_country_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	country_s
ADD CONSTRAINT pk_country_s
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
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : conf
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf
(
	id		serial		NOT NULL, -- id
	type	ty_country	NOT NULL, -- type
	code	dm_code 	NOT NULL, -- code
	name	dm_string	NOT NULL, -- name
	year	dm_year		NOT NULL  -- foundation year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf TABLE
 * NAME : pk_conf
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_s
(
	conf	integer NOT NULL, -- confederation
	year	dm_year	NOT NULL  -- suppression year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_s TABLE
 * NAME : pk_conf_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_s
ADD CONSTRAINT pk_conf_s
PRIMARY KEY
(
	conf
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_s TABLE
 * NAME : conf_s_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_s
ADD CONSTRAINT conf_s_fk_conf
FOREIGN KEY
(
	conf
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_conf
(
	member	integer	NOT NULL, -- member confederation
	super	integer	NOT NULL, -- having member confederation
	year	dm_year NOT NULL  -- start year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_conf TABLE
 * NAME : pk_conf_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_conf
ADD CONSTRAINT pk_conf_conf
PRIMARY KEY
(
	member,
	super
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - conf_conf TABLE
 * NAME : conf_conf_member_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf
ADD CONSTRAINT conf_conf_member_fk_conf
FOREIGN KEY
(
	member
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
 * NAME : conf_conf_super_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf
ADD CONSTRAINT conf_conf_super_fk_conf
FOREIGN KEY
(
	super
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_conf_h
(
	member	integer	NOT NULL, -- member confederation
	super	integer	NOT NULL, -- having member confederation
	s_year	dm_year NOT NULL, -- start year
	e_year	dm_year	NOT NULL  -- end year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_conf_h TABLE
 * NAME : pk_conf_conf_h
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	conf_conf_h
ADD CONSTRAINT pk_conf_conf_h
PRIMARY KEY
(
	member,
	super,
	s_year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - conf_conf_h TABLE
 * NAME : ck_conf_conf_h_year
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
 * NAME : conf_conf_h_member_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf_h
ADD CONSTRAINT conf_conf_h_member_fk_conf
FOREIGN KEY
(
	member
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
 * NAME : conf_conf_h_super_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE conf_conf_h
ADD CONSTRAINT conf_conf_h_super_fk_conf
FOREIGN KEY
(
	super
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
 * NAME : conf_country
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_country
(
	conf	integer	NOT NULL, -- confederation code
	country	integer	NOT NULL, -- country code
	year	dm_year	NOT NULL  -- start year
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
	id
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
	id
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
	conf	integer	NOT NULL, -- confederation code
	country	integer	NOT NULL, -- country code
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL  -- end year
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
	id
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
	id
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
 * NAME : team
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team
(
	id		serial		NOT NULL, -- id
	type	ty_team 	NOT NULL, -- type
	name	dm_alnum	NOT NULL, -- name
	age_cap	ty_age_cap	NOT NULL, -- age cap
	sex		ty_sex		NOT NULL, -- sex
	year	dm_year		NOT NULL  -- foundation year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team TABLE
 * NAME : pk_team
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
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team
ADD CONSTRAINT uq_team
UNIQUE
(
	name,
	age_cap,
	sex,
	year	
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : team_s
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_s
(
	team	integer	NOT NULL, -- team
	year	dm_year	NOT NULL  -- suppression year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_s TABLE
 * NAME : pk_team_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_s
ADD CONSTRAINT pk_team_s
PRIMARY KEY
(
	team
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_s TABLE
 * NAME : team_s_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_s
ADD CONSTRAINT team_s_fk_team
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
 * NAME : team_nation
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_nation
(
	team	integer	NOT NULL, -- team id
	nation	integer	NOT NULL, -- country code
	year	dm_year	NOT NULL  -- start year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_nation TABLE
 * NAME : pk_team_nation
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation
ADD CONSTRAINT pk_team_nation
PRIMARY KEY
(
	team	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_nation TABLE
 * NAME : team_nation_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation
ADD CONSTRAINT team_nation_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_nation TABLE
 * NAME : team_nation_fk_nation
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation
ADD CONSTRAINT team_nation_fk_nation
FOREIGN KEY
(
	nation
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
 * NAME : team_nation_h
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_nation_h
(
	team	integer	NOT NULL, -- team id
	nation	integer	NOT NULL, -- country code
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL  -- end year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_nation_h TABLE
 * NAME : pk_team_nation_h
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation_h
ADD CONSTRAINT pk_team_nation_h
PRIMARY KEY
(
	team,
	nation,
	s_year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_nation_h TABLE
 * NAME : team_nation_h_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation_h
ADD CONSTRAINT team_nation_h_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_nation_h TABLE
 * NAME : team_nation_h_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation_h
ADD CONSTRAINT team_nation_h_fk_country
FOREIGN KEY
(
	nation
)
REFERENCES country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - team_nation_h TABLE
 * NAME : ck_team_nation_h_year
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_nation_h
ADD CONSTRAINT ck_team_nation_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : team_conf
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_conf
(
	team	integer	NOT NULL, -- team
	conf	integer	NOT NULL, -- confederation
	year	dm_year	NOT NULL  -- start year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_conf TABLE
 * NAME : pk_team_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf
ADD CONSTRAINT pk_team_conf
PRIMARY KEY
(
	team,
	conf
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_conf TABLE
 * NAME : team_conf_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf
ADD CONSTRAINT team_conf_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_conf TABLE
 * NAME : team_conf_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf
ADD CONSTRAINT team_conf_fk_conf
FOREIGN KEY
(
	conf
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
 * NAME : team_conf_h
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_conf_h
(
	team	integer	NOT NULL, -- team
	conf	integer	NOT NULL, -- confederation
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL  -- end year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_conf_h TABLE
 * NAME : pk_team_conf_h
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf_h
ADD CONSTRAINT pk_team_conf_h
PRIMARY KEY
(
	team,
	conf,
	s_year
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_conf_h TABLE
 * NAME : ck_team_conf_h_year
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf_h
ADD CONSTRAINT ck_team_conf_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_conf_h TABLE
 * NAME : team_conf_h_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf_h
ADD CONSTRAINT team_conf_h_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_conf_h TABLE
 * NAME : team_conf_h_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_conf_h
ADD CONSTRAINT team_conf_h_fk_conf
FOREIGN KEY
(
	conf
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp
(
	id			serial		NOT NULL, -- id
	type		ty_comp		NOT NULL, -- type
	team_type	ty_team		NOT NULL, -- team type
	name		dm_string	NOT NULL, -- name
	age_cap		ty_age_cap	NOT NULL, -- age cap
	sex			ty_sex		NOT NULL, -- sex
	freq		ty_freq		NOT NULL, -- frequency
	year		dm_year		NOT NULL  -- foundation year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp TABLE
 * NAME : pk_comp
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_s
(
	comp	integer	NOT NULL, -- competition
	year	dm_year	NOT NULL  -- suppression year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_s TABLE
 * NAME : pk_comp_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_s
ADD CONSTRAINT pk_comp_s
PRIMARY KEY
(
	comp
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_s TABLE
 * NAME : comp_s_fk_comp
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_s
ADD CONSTRAINT comp_s_fk_comp
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
 * TYPE : TABLE
 * NAME : comp_conf
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_conf
(
	comp	integer	NOT NULL, -- competition
	conf	integer	NOT NULL, -- confederation
	year	dm_year	NOT NULL  -- start year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_conf TABLE
 * NAME : pk_comp_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf
ADD CONSTRAINT pk_comp_conf
PRIMARY KEY
(
	comp,
	conf
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_conf TABLE
 * NAME : comp_conf_fk_comp
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf
ADD CONSTRAINT comp_conf_fk_comp
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
 * TYPE : FOREIGN KEY CONSTRAINT - comp_conf TABLE
 * NAME : comp_conf_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf
ADD CONSTRAINT comp_conf_fk_conf
FOREIGN KEY
(
	conf
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
 * NAME : comp_conf_h
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_conf_h
(
	comp	integer	NOT NULL, -- competition
	conf	integer	NOT NULL, -- confederation
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL  -- end year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_conf_h TABLE
 * NAME : pk_team_conf_h
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf_h
ADD CONSTRAINT pk_comp_conf_h
PRIMARY KEY
(
	comp,
	conf,
	s_year
); 
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_conf_h TABLE
 * NAME : ck_comp_conf_h_year
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf_h
ADD CONSTRAINT ck_comp_conf_h_year
CHECK
(
	e_year - s_year >= 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp_conf_h TABLE
 * NAME : comp_conf_h_fk_comp
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf_h
ADD CONSTRAINT comp_conf_h_fk_comp
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
 * TYPE : FOREIGN KEY CONSTRAINT - comp_conf_h TABLE
 * NAME : comp_conf_h_fk_conf
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_conf_h
ADD CONSTRAINT comp_conf_h_fk_conf
FOREIGN KEY
(
	conf
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE formula
(
	id			serial	NOT NULL, -- id
	total_team	dm_uint	NOT NULL, -- total number of football teams
	num_group	dm_uint	NOT NULL, -- number of groups
	team_group	dm_uint	NOT NULL, -- number of teams for each group
	team_knock	dm_uint	NOT NULL, -- number of teams for knock out phase
	min_match	dm_uint NOT NULL, -- minimum number of matches for team
	max_match	dm_uint NOT NULL, -- maximum number of matches for team
	ha_group	boolean			, -- home and away group phase
	ha_knock	boolean			, -- home and away knockout phase
	oc_group	boolean  		  -- open and closure group phase
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - formula TABLE
 * NAME : pk_formula
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
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT uq_formula
UNIQUE NULLS NOT DISTINCT  -- null values will not be considered as distinct
(
	num_group,
	team_group,
	team_knock,
	ha_group,
	ha_knock,
	oc_group
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_group
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_group
CHECK
(
	(
		(0 = num_group)
		AND
		(0 = team_group)
		AND
		(ha_group IS NULL)
		AND
		(oc_group IS NULL)
	)
	OR
	(
		(num_group <= 20)
		AND
		(team_group BETWEEN 2 AND 100)
		AND
		(ha_group IS NOT NULL)
		AND
		(oc_group IS NOT NULL)
	)
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_knock
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_knock
CHECK
(
	(
		(0 = team_knock)
		AND
		(ha_knock IS NULL)
	)
	OR
	(
		(team_knock <= 256)
		AND
		(floor(log(2, team_knock)) = ceil(log(2, team_knock)))
		AND
		(ha_knock IS NOT NULL)
	)
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_exist
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	formula
ADD CONSTRAINT ck_formula_exist
CHECK
(
	(team_knock <> 0) OR (num_group <> 0)
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - formula TABLE
 * NAME : ck_formula_total_team
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed
(
	id		serial	NOT NULL, -- id
	comp	integer	NOT NULL, -- referring competition
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL, -- end year
	tier		ty_tier		NOT NULL, -- tier
	formula	integer NOT NULL  -- formula
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - comp_ed TABLE
 * NAME : pk_comp_ed
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
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT uq_comp_ed
UNIQUE
(
	comp,
	s_year,
	e_year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - comp_ed TABLE
 * NAME : ck_comp_ed_year
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
 * DESC : TODO
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
 * NAME : comp_ed_fk_formula
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp_ed
ADD CONSTRAINT comp_ed_fk_formula
FOREIGN KEY
(
	formula
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
 * NAME : team_comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_comp_ed
(
	id		serial	NOT NULL, -- id
	team	integer	NOT NULL, -- team
	comp_ed	integer	NOT NULL  -- competition edition
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_comp_ed TABLE
 * NAME : pk_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_comp_ed
ADD CONSTRAINT pk_team_comp_ed
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - team_comp_ed TABLE
 * NAME : uq_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_comp_ed
ADD CONSTRAINT uq_team_comp_ed
UNIQUE
(
	team,
	comp_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed TABLE
 * NAME : team_comp_ed_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_comp_ed
ADD CONSTRAINT team_comp_ed_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed TABLE
 * NAME : team_comp_ed_fk_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_comp_ed
ADD CONSTRAINT team_comp_ed_fk_comp_ed
FOREIGN KEY
(
	comp_ed
)
REFERENCES comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player
(
	id		serial		NOT NULL, -- id player
	name	dm_string	NOT NULL, -- name
	surname	dm_string	NOT NULL, -- surname
	sex		ty_sex		NOT NULL, -- sex
	dob		dm_date		NOT NULL, -- birth date
	foot	ty_foot		NOT NULL, -- preferred foot
	nation	integer		NOT NULL  -- birth nation
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
	nation
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
	nation
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_s
(
	player	integer	NOT NULL, -- player id
	r_date	dm_date	NOT NULL  -- retired date
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
 * NAME : player_nation
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_nation
(
	player	integer	NOT NULL, -- player id
	nation	integer	NOT NULL  -- country code
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_nation TABLE
 * NAME : pk_player_nation
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_nation
ADD CONSTRAINT pk_player_nation
PRIMARY KEY
(
	player,
	nation
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_nation TABLE
 * NAME : player_nation_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_nation
ADD CONSTRAINT player_nation_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_nation TABLE
 * NAME : player_nation_fk_country
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_nation
ADD CONSTRAINT player_nation_fk_country
FOREIGN KEY
(
	nation
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
	s_date
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
	e_date - s_date >= 0 -- TODO: periodo minimo contratto
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : tag
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_tag
(
	player	integer	NOT NULL, -- player id
	tag		integer	NOT NULL  -- tag id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_tag TABLE 
 * NAME : pk_player_tag
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_tag
ADD CONSTRAINT pk_player_tag
PRIMARY KEY
(
	player,
	tag
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_tag TABLE
 * NAME : player_tag_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_tag
ADD CONSTRAINT player_tag_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_tag TABLE
 * NAME : player_tag_fk_tag
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_tag
ADD CONSTRAINT player_tag_fk_tag
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
	id		serial		NOT NULL, -- id
	role	ty_role		NOT NULL, -- role code
	code	dm_scode	NOT NULL, -- position code
	name	dm_string	NOT NULL  -- position name
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
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - pos TABLE
 * NAME : uq_pos_code
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_pos
(
	player	integer	NOT NULL, -- player id
	pos		integer	NOT NULL, -- position code
	match	dm_uint	NOT NULL  -- number of match TODO: funzione
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_pos TABLE  
 * NAME : pk_player_pos
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_pos
ADD CONSTRAINT pk_player_pos
PRIMARY KEY
(
	player,
	pos
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_pos TABLE 
 * NAME : player_pos_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_pos
ADD CONSTRAINT player_pos_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_pos TABLE
 * NAME : player_pos_fk_pos
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_pos
ADD CONSTRAINT player_pos_fk_pos
FOREIGN KEY
(
	pos
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
 * NAME : player_attr
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_attr
(
	player	integer	NOT NULL, -- player id
	attr	integer	NOT NULL, -- attribute id
	value	dm_uint	NOT NULL  -- value of attribute for player
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_attr TABLE  
 * NAME : pk_player_attr
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attr
ADD CONSTRAINT pk_player_attr
PRIMARY KEY
(
	player,
	attr
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_attr TABLE
 * NAME : player_attr_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attr
ADD CONSTRAINT player_attr_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_attr TABLE
 * NAME : player_attr_fk_attr
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_attr
ADD CONSTRAINT player_attr_fk_attr
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
	role	ty_stat		NOT NULL, -- associated role
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL  -- description
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
 * NAME : trophy
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
 * NAME : trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_comp_ed
(
	id		serial	NOT NULL, -- id
	trophy	integer	NOT NULL, -- trophy
	comp_ed	integer	NOT NULL  -- competition edition
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy_comp_ed TABLE
 * NAME : pk_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_comp_ed
ADD CONSTRAINT pk_trophy_comp_ed
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - trophy_comp_ed TABLE
 * NAME : uq_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_comp_ed
ADD CONSTRAINT uq_trophy_comp_ed
UNIQUE
(
	trophy,
	comp_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_comp_ed TABLE
 * NAME : trophy_comp_ed_fk_trophy
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_comp_ed
ADD CONSTRAINT trophy_comp_ed_fk_trophy
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
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_comp_ed TABLE
 * NAME : trophy_comp_ed_fk_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_comp_ed
ADD CONSTRAINT trophy_comp_ed_fk_comp_ed
FOREIGN KEY
(
	comp_ed
)
REFERENCES comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : team_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_trophy_comp_ed
(
	team			integer	NOT NULL, -- team
	trophy_comp_ed	integer	NOT NULL  -- trophy competition edition
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_trophy_comp_ed TABLE
 * NAME : pk_team_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_trophy_comp_ed
ADD CONSTRAINT pk_team_trophy_comp_ed
PRIMARY KEY
(
	team,
	trophy_comp_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_trophy_comp_ed TABLE
 * NAME : team_trophy_comp_ed_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_trophy_comp_ed
ADD CONSTRAINT team_trophy_comp_ed_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_trophy_comp_ed TABLE
 * NAME : team_trophy_comp_ed_fk_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_trophy_comp_ed
ADD CONSTRAINT team_trophy_comp_ed_fk_trophy_comp_ed
FOREIGN KEY
(
	trophy_comp_ed
)
REFERENCES trophy_comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_team_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_team_trophy_comp_ed
(
	player			integer NOT NULL, -- player
	team			integer	NOT NULL, -- team
	trophy_comp_ed	integer	NOT NULL  -- trophy competition edition
	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_team_trophy_comp_ed TABLE
 * NAME : pk_player_team_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_team_trophy_comp_ed
ADD CONSTRAINT pk_player_team_trophy_comp_ed
PRIMARY KEY
(
	player,
	team,
	trophy_comp_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_team_trophy_comp_ed TABLE
 * NAME : player_team_trophy_comp_ed_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_team_trophy_comp_ed
ADD CONSTRAINT player_team_trophy_comp_ed_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_team_trophy_comp_ed TABLE
 * NAME : player_team_trophy_comp_ed_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_team_trophy_comp_ed
ADD CONSTRAINT player_team_trophy_comp_ed_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_team_trophy_comp_ed TABLE
 * NAME : player_team_trophy_comp_ed_fk_trophy_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	player_team_trophy_comp_ed
ADD CONSTRAINT player_team_trophy_comp_ed_fk_trophy_comp_ed
FOREIGN KEY
(
	trophy_comp_ed
)
REFERENCES trophy_comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : prize
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize
(
	id		serial		NOT NULL, -- id
	type	ty_trophy	NOT NULL, -- type
	name	dm_string	NOT NULL, -- name
	descr	dm_string	NOT NULL, -- description
	given	dm_string	NOT NULL, -- give the prize
	year	dm_year		NOT NULL  -- starting year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize TABLE
 * NAME : pk_prize
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_s
(
	prize	integer	NOT NULL, -- prize
	year	dm_year	NOT NULL  -- suppression year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize_s TABLE
 * NAME : pk_prize_s
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_s
ADD CONSTRAINT pk_prize_s
PRIMARY KEY
(
	prize
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_s TABLE
 * NAME : prize_s_fk_prize
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_s
ADD CONSTRAINT prize_s_fk_prize
FOREIGN KEY
(
	prize
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
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE prize_ed
(
	id		serial	NOT NULL, -- id
	prize	integer	NOT NULL, -- prize
	year	dm_year	NOT NULL  -- assigning year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - prize_ed TABLE
 * NAME : pk_prize_ed
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
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_ed
ADD CONSTRAINT uq_prize_ed
UNIQUE
(
	prize
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - prize_ed TABLE
 * NAME : prize_ed_fk_prize
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE prize_ed
ADD CONSTRAINT prize_ed_fk_prize
FOREIGN KEY
(
	prize
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
 * NAME : team_prize_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_prize_ed
(
	team		integer	NOT NULL, -- team
	prize_ed	integer	NOT NULL  -- prize
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_prize_ed TABLE
 * NAME : pk_team_prize_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_prize_ed
ADD CONSTRAINT pk_team_prize_ed
PRIMARY KEY
(
	team,
	prize_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_prize_ed TABLE
 * NAME : team_prize_ed_fk_team
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_prize_ed
ADD CONSTRAINT team_prize_ed_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_prize_ed TABLE
 * NAME : team_prize_ed_fk_prize_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_prize_ed
ADD CONSTRAINT team_prize_ed_fk_prize_ed
FOREIGN KEY
(
	prize_ed
)
REFERENCES prize_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : player_prize_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE player_prize_ed
(
	player		integer	NOT NULL, -- player
	prize_ed	integer	NOT NULL  -- prize
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - player_prize_ed TABLE
 * NAME : pk_player_prize_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_prize_ed
ADD CONSTRAINT pk_player_prize_ed
PRIMARY KEY
(
	player,
	prize_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - player_prize_ed TABLE
 * NAME : player_prize_ed_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_prize_ed
ADD CONSTRAINT player_prize_ed_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - player_prize_ed TABLE
 * NAME : player_prize_ed_fk_prize_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE player_prize_ed
ADD CONSTRAINT player_prize_ed_fk_prize_ed
FOREIGN KEY
(
	prize_ed
)
REFERENCES prize_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : team_comp_ed_player_pos
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_comp_ed_player_pos
(
	id				serial	NOT NULL, -- id
	team_comp_ed	integer	NOT NULL, -- team competition edition
	player			integer	NOT NULL, -- player
	pos				integer	NOT NULL  -- position
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_comp_ed_player_pos TABLE  
 * NAME : pk_team_comp_ed_player_pos
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos
ADD CONSTRAINT pk_team_comp_ed_player_pos
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - team_comp_ed_player_pos TABLE  
 * NAME : uq_team_comp_ed_player_pos
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos
ADD CONSTRAINT uq_team_comp_ed_player_pos
UNIQUE
(
	team_comp_ed,
	player,
	pos
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed_player_pos TABLE  
 * NAME : team_comp_ed_player_pos_fk_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos
ADD CONSTRAINT team_comp_ed_player_pos_fk_team_comp_ed
FOREIGN KEY
(
	team_comp_ed
)
REFERENCES team_comp_ed
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed_player_pos TABLE  
 * NAME : team_comp_ed_player_pos_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos
ADD CONSTRAINT team_comp_ed_player_pos_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed_player_pos TABLE  
 * NAME : team_comp_ed_player_pos_fk_pos
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos
ADD CONSTRAINT team_comp_ed_player_pos_fk_pos
FOREIGN KEY
(
	pos
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
 * NAME : team_comp_ed_player_pos_stat
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_comp_ed_player_pos_stat
(
	team_comp_ed_player_pos	integer	NOT NULL, -- p_season id
	stat					integer	NOT NULL, -- statistic id
	value					dm_uint	NOT NULL  -- value
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - team_comp_ed_player_pos_stat TABLE  
 * NAME : pk_team_comp_ed_player_pos_stat
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos_stat
ADD CONSTRAINT pk_team_comp_ed_player_pos_stat
PRIMARY KEY
(
	team_comp_ed_player_pos,
	stat
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed_player_pos_stat TABLE
 * NAME : team_comp_ed_player_pos_stat_fk_stat
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos_stat
ADD CONSTRAINT team_comp_ed_player_pos_stat_fk_stat
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
 * TYPE : FOREIGN KEY CONSTRAINT - team_comp_ed_player_pos_stat TABLE
 * NAME : team_comp_ed_player_pos_stat_fk_team_comp_ed_player_pos
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE team_comp_ed_player_pos_stat
ADD CONSTRAINT team_comp_ed_player_pos_stat_fk_team_comp_ed_player_pos
FOREIGN KEY
(
	team_comp_ed_player_pos
)
REFERENCES team_comp_ed_player_pos
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : usr
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE usr
(
	id		serial	NOT NULL, -- id
	name	dm_usr	NOT NULL, -- username
	pwd		dm_pwd	NOT NULL, -- password
	priv	dm_uint	NOT NULL  -- level of priviledge					
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - usr TABLE
 * NAME : pk_usr
 * DESC : TODO
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
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	usr
ADD CONSTRAINT uq_usr
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

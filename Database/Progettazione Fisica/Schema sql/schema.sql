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
DROP SCHEMA IF EXISTS public CASCADE;
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
	value BETWEEN 0 AND extract(year from current_date)
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
-- DOMAIN FOR SHORT CODE: dm_scode
------------------------------------------------------------------------------------------
-- domain values will be string of uppercase alphabetic char of lenght in [2, 3] 
------------------------------------------------------------------------------------------
CREATE DOMAIN dm_scode AS varchar(3)
CHECK
(
	value ~ '(?=^[A-Z]{2,3}$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR SIMPLE ENGLISH STRING: dm_spstr
------------------------------------------------------------------------------------------
CREATE DOMAIN dm_spstr AS varchar(100)
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
CREATE DOMAIN dm_enstr AS varchar(100)
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
CREATE DOMAIN dm_anstr AS varchar(100)
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
CREATE DOMAIN dm_usr AS varchar(20)
CHECK
(
	value ~ '(^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$)'
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- DOMAIN FOR PASSWORD: dm_pwd
------------------------------------------------------------------------------------------
CREATE DOMAIN dm_pwd AS varchar(20)
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
CREATE DOMAIN dm_uint AS smallint
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
-- ENUM TYPE FOR COMPETITION: ty_comp
------------------------------------------------------------------------------------------
CREATE TYPE ty_comp AS ENUM
(
	'INDIVIDUAL',
	'CHAMPIONSHIP',
	'SUPER CUP',
	'TOURNAMENT'
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


------------------------------------------------------------------------------------------
-- ENUM TYPE FOR TAG: ty_tag
------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------


--****************************************************************************************
--* TABLES AND CONSTRAINTS
--****************************************************************************************

------------------------------------------------------------------------------------------
-- POSITION TABLE: pos
------------------------------------------------------------------------------------------
-- the position of a football player on the football pitch
------------------------------------------------------------------------------------------
CREATE TABLE pos
(
	role	ty_role		NOT NULL, -- role code
	code	dm_scode	NOT NULL, -- position code
	name	dm_spstr	NOT NULL  -- position name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	pos
ADD CONSTRAINT pk_pos
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	pos
ADD CONSTRAINT uq_pos
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
	type	ty_country	NOT NULL, -- country type
	code	dm_scode	NOT NULL, -- country code
	name	dm_enstr	NOT NULL, -- country name
	s_year	dm_year		NOT NULL, -- country foundation year
	e_year	dm_year				, -- country suppression year
	super	dm_code				  -- containing country code
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE player
ADD CONSTRAINT pk_player
PRIMARY KEY
(
	id
);
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	player
ADD CONSTRAINT ck_player_s_age
CHECK
(
	( extract(year from age( s_date, b_date ) ) BETWEEN 10 AND 40 )
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	 player
ADD CONSTRAINT ck_player_e_date
CHECK
(
	((e_date IS NULL) OR (e_date - s_date >= 0))
	AND
	(extract(year from age(e_date, b_date)) <= 50)
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
	id 		serial		NOT NULL,
	type	ty_team		NOT NULL,
	name	dm_anstr	NOT NULL,
	max_age	dm_uint				,
	sex		ty_sex		NOT NULL,
	s_year	dm_year		NOT NULL,
	e_year	dm_year				,
	country	dm_scode	NOT NULL
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

------------------------------------------------------------------------------------------
ALTER TABLE	team
ADD CONSTRAINT ck_team_max_age
CHECK
(
	max_age BETWEEN 10 AND 21
);
------------------------------------------------------------------------------------------

/* TODO trigger to CHECK that country IS a nation */
/* TODO trigger to CHECK end year is not null */



------------------------------------------------------------------------------------------
-- CONFEDERATION TABLE: conf
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE conf
(
	code	dm_code 	NOT NULL,
	name	dm_enstr	NOT NULL,
	type	ty_country	NOT NULL,
	country	dm_scode	NOT NULL,
	s_year	dm_year		NOT NULL,
	e_year	dm_year				,
	super	dm_code				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	conf
ADD CONSTRAINT pk_conf
PRIMARY KEY
(
	code
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	conf
ADD CONSTRAINT uq_conf
UNIQUE
(
	name,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	conf
ADD CONSTRAINT ck_conf_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	conf
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
-- PLAYER POSITION TABLE: p_pos
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE p_pos
(
	player	integer		NOT NULL			 ,
	pos		dm_scode	NOT NULL			 ,
	n_match	dm_uint		NOT NULL	DEFAULT 0	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE p_pos
ADD CONSTRAINT pk_p_pos
PRIMARY KEY
(
	player,
	pos
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAYER COUNTRY TABLE: p_country
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE p_country
(
	player	integer		NOT NULL,
	country	dm_scode	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE p_country
ADD CONSTRAINT pk_p_country
PRIMARY KEY
(
	player,
	country
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------
		
------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

/*TODO trigger to CHECK that country IS a nation */



------------------------------------------------------------------------------------------
-- COMPETITION TABLE: comp
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE comp
(
	id		serial		NOT NULL,
	conf	dm_code		NOT NULL,
	t_type	ty_team				,
	type	ty_comp		NOT NULL,
	name	dm_anstr	NOT NULL,
	max_age	dm_uint				,
	sex		ty_sex		NOT NULL,
	tier	dm_uint				,
	freq	dm_uint		NOT NULL,
	s_year	dm_year		NOT NULL,
	e_year	dm_year				
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp 
ADD CONSTRAINT pk_comp
UNIQUE
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp 
ADD CONSTRAINT uq_comp_name
UNIQUE
(
	conf,
	name
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp 
ADD CONSTRAINT uq_comp_tier
UNIQUE NULLS NOT DISTINCT
(
	conf,
	type,
	max_age,
	sex,
	tier
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp 
ADD CONSTRAINT ck_comp_type
CHECK
(
	(type <> 'INDIVIDUAL' AND t_type IS NOT NULL)
	OR
	(type = 'INDIVIDUAL' AND t_type IS NULL)
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- TODO: controllare questo check
ALTER TABLE	comp
ADD CONSTRAINT ck_comp_nteam
CHECK
(
	(t_type <> 'NATIONAL')
	OR
	(t_type = 'NATIONAL' AND type <> 'TOURNAMENT')
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp 
ADD CONSTRAINT ck_comp_year
CHECK
(
	(e_year IS NULL)
	OR
	(e_year - s_year >= 0)
);
------------------------------------------------------------------------------------------

/* TODO trigger to CHECK end year is not null */




------------------------------------------------------------------------------------------
-- TAG TABLE: tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE tag
(
	id		integer		NOT NULL,
	type	ty_tag		NOT NULL,
	name	dm_enstr	NOT NULL,
	dsc		dm_enstr
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
	name
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: cal_tot
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: cal_min
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: cal_max
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FORMULA COMPETITION TABLE: f_comp
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE f_comp
(
	id			serial	NOT NULL,
	tot_team	dm_uint	NOT NULL	GENERATED ALWAYS AS (cal_tot(nt_group, n_group, pow2_k)) STORED,
	nt_group		dm_uint	NOT NULL,
	n_group	dm_uint	NOT NULL,
	pow2_k	dm_uint	NOT NULL,
	min_match	dm_uint NOT NULL	GENERATED ALWAYS AS (cal_min(nt_group, n_group, pow2_k, r_group, r_knock, op_cl)) STORED,
	max_match	dm_uint NOT NULL	GENERATED ALWAYS AS (cal_max(nt_group, n_group, pow2_k, r_group, r_knock, op_cl)) STORED,
	r_group		boolean			,
	r_knock		boolean	,
	op_cl		boolean NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	f_comp
ADD CONSTRAINT pk_f_comp
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	f_comp
ADD CONSTRAINT uq_f_comp
UNIQUE NULLS NOT DISTINCT
(
	nt_group,
	n_group,
	pow2_k,
	r_group,
	r_knock
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	f_comp
ADD CONSTRAINT ck_f_comp_num
CHECK
(
	(
		(nt_group BETWEEN 2 AND 100)
		AND
		((n_group BETWEEN 1 AND 20) AND (r_group IS NOT NULL))
		AND
		(tot_team <= 200)
		AND
		((pow2_k BETWEEN 1 AND 5 AND r_knock IS NOT NULL) OR (0 = pow2_k AND r_knock IS NULL))
	)
	OR
	(
		(0 = nt_group AND 0 = n_group)
		AND
		(pow2_k BETWEEN 1 AND 5)
		AND
		(r_group IS NULL AND r_knock IS NOT NULL)
		AND
		(FALSE = op_cl)
	)
);
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
/* TODO: eliminare questo check perche' numero team viene generato
ALTER TABLE	f_comp
ADD CONSTRAINT ck_f_comp_tot_team
CHECK
(
	(nt_group <= tot_team)
	AND
	(nt_knock <= tot_team)
);
*/
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
/* TODO: eliminare questo check perche' min e max viene generato
ALTER TABLE	f_comp
ADD CONSTRAINT ck_f_comp_n_match
CHECK
(
	mi_match <= ma_match
);
*/
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
/* TODO: controllo inutile gia' fatto con il check del f_comp_num
ALTER TABLE	f_comp
ADD CONSTRAINT ck_f_comp_type
CHECK
(
	(
		0 = nt_knock
		AND
		nt_group = n_team
		AND
		r_group IS NOT NULL
		AND
		r_knock IS NULL
	)
	OR
	(
		(nt_knock <> 0 AND r_knock IS NOT NULL)
		AND
		(
			(nt_group <> 0 AND 0 = n_team % nt_group AND r_group IS NOT NULL)
			OR
			(0 = nt_group AND r_group IS NULL)
		)
	)
);
*/
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- COMPETITION EDITION TABLE: comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE comp_ed
(
	comp	integer	NOT NULL,
	s_year	dm_year	NOT NULL,
	e_year	dm_year	NOT NULL,
	formula	integer
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp_ed
ADD CONSTRAINT pk_comp_ed
PRIMARY KEY
(
	comp,
	s_year,
	e_year
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	comp_ed
ADD CONSTRAINT ck_comp_ed_year
CHECK
(
	( ( e_year - s_year ) BETWEEN 0 AND 1 )
);
------------------------------------------------------------------------------------------

/* TODO competizione individuale => formula null */
/* TODO trigger to check competition team type */
/* TODO trigger to check competition type and calculate max matches */
/* TODO trigger to check frequency */
/* TODO trigger to check national competition */




------------------------------------------------------------------------------------------
-- TEAM COMPETITION EDITION TABLE: t_comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE t_comp_ed
(
	comp	integer	NOT NULL,
	s_year	dm_year	NOT NULL,
	e_year	dm_year	NOT NULL,
	team	integer	NOT NULL,
	n_match	dm_uint	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	t_comp_ed
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

/* TODO trigger to check that competition is for team */
/* TODO trigger to check that competition is valid */
/* TODO trigger to check that team is valid */
/* TODO trigger to check number of matches */







------------------------------------------------------------------------------------------
-- TROPHY TABLE: trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE trophy
(
	id		serial		NOT NULL,
	comp	integer		NOT NULL,
	s_year	dm_year		NOT NULL,
	e_year	dm_year		NOT NULL,
	type	ty_trophy	NOT NULL,
	name	dm_anstr	NOT NULL
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
------------------------------------------------------------------------------------------

/* TODO trigger to check that trophy type is compatible with competition team type */




------------------------------------------------------------------------------------------
-- TEAM TROPHY TABLE: t_trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE t_trophy
(
	trophy	integer	NOT NULL,
	team	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	t_trophy
ADD CONSTRAINT pk_t_trophy
PRIMARY KEY
(
	trophy,
	team
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- PLAYER TROPHY TABLE: p_trophy
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE p_trophy
(
	trophy	integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	p_trophy
ADD CONSTRAINT pk_p_trophy
PRIMARY KEY
(
	trophy,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------
		


------------------------------------------------------------------------------------------
-- PLAYER TAG TABLE: p_tag
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE p_tag
(
	tag		integer	NOT NULL,
	player	integer	NOT NULL
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	p_tag
ADD CONSTRAINT pk_p_tag
PRIMARY KEY
(
	tag,
	player
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
-- PLAYER POSITION TEAM COMPETITION TABLE: p_pos_t_comp_ed
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE p_pos_t_comp_ed
(
	comp		integer		NOT NULL,
	s_year		dm_year		NOT NULL,
	e_year		dm_year		NOT NULL,
	team		integer		NOT NULL,
	player		integer		NOT NULL,
	pos			dm_scode	NOT NULL,
	match		dm_uint				,
	goal		dm_uint				,
	ass			dm_uint				,
	p_scored	dm_uint				,
	y_card		dm_uint				,
	r_card		dm_uint				,
	g_conceded	dm_uint				,
	c_sheet		dm_uint				,
	p_saved		dm_uint	
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

/* TODO controllo validita */
/* TODO controllo che il giocatore sia nella squadra */


------------------------------------------------------------------------------------------
-- USER ACCOUNT TABLE: usr
------------------------------------------------------------------------------------------
-- TODO: insert table comment
------------------------------------------------------------------------------------------
CREATE TABLE usr
(
	id		serial	NOT NULL				,
	name	dm_usr	NOT NULL				,
	pwd		dm_pwd	NOT NULL				,
	priv	dm_uint	NOT NULL	DEFAULT 0					
);
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
ALTER TABLE	usr
ADD CONSTRAINT pk_usr
PRIMARY KEY
(
	id
);
------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
ALTER TABLE	usr
ADD CONSTRAINT uq_usr
UNIQUE
(
	name
);
------------------------------------------------------------------------------------------

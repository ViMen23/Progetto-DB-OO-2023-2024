-- Pasquale
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
 * TYPE : TABLE
 * NAME : conf
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf
(
	type	ty_country	NOT NULL, -- type
	code	dm_code 	NOT NULL, -- code
	name	dm_enstr	NOT NULL, -- name
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
	code
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
 * NAME : conf_conf
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_conf
(
	member	dm_code	NOT NULL, -- member confederation
	super	dm_code	NOT NULL, -- having member confederation
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
	code
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
	code
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
	member	dm_code	NOT NULL, -- member confederation
	super	dm_code	NOT NULL, -- having member confederation
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
	code
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
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TODO : trigger to check that confederation type is valid
 *
 *        eg.
 *            nation member of continent [YES]
 *            nation member of nation    [NO]
 ******************************************************************************/
 
/*******************************************************************************
 * TODO : trigger to check that years are valid
 ******************************************************************************/
 


/*******************************************************************************
 * TYPE : TABLE
 * NAME : conf_s
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE conf_s
(
	conf	dm_code 	NOT NULL, -- confederation
	year	dm_year		NOT NULL  -- suppression year
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
	code
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
	code
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TABLE
 * NAME : team
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team
(
	id		serial		NOT NULL, -- id
	type	dm_team 	NOT NULL, -- type
	name	dm_anstr	NOT NULL, -- name
	age_cap	dm_age_cup	NOT NULL, -- age cap
	sex		dm_sex		NOT NULL, -- sex
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
	team	integer		NOT NULL, -- team
	year	dm_year		NOT NULL  -- suppression year
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
 * NAME : team_conf
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE team_conf
(
	team	integer		NOT NULL, -- team
	conf	dm_code		NOT NULL, -- confederation
	year	dm_year		NOT NULL  -- start year
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
	code
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
	team	integer		NOT NULL, -- team
	conf	dm_code		NOT NULL, -- confederation
	s_year	dm_year		NOT NULL, -- start year
	e_year	dm_year		NOT NULL  -- end year
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
	code
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
	id		serial		NOT NULL, -- id
	conf	dm_code		NOT NULL, -- referring confederation
	type	ty_comp		NOT NULL, -- type
	t_type	ty_team		NOT NULL, -- team type
	name	dm_enstr	NOT NULL, -- name
	tier	dm_uint		NOT NULL, -- tier
	age_cap	dm_age_cap	NOT NULL, -- age cap
	sex		dm_sex		NOT NULL, -- sex
	freq	dm_uint		NOT NULL, -- frequency
	year	dm_year		NOT NULL  -- foundation year
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
 * TYPE : UNIQUE CONSTRAINT - comp TABLE
 * NAME : uq_comp
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	comp 
ADD CONSTRAINT uq_comp
UNIQUE
(
	conf
	type
	t_type
	tier
	age_cap
	sex
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - comp TABLE
 * NAME : comp_fk_conf
 * DESC : TODO
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
 * TYPE : TABLE
 * NAME : comp_s
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_s
(
	comp	integer		NOT NULL, -- competition
	year	dm_year		NOT NULL  -- suppression year
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
 * NAME : comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed
(
	comp	integer	NOT NULL, -- referring competition
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL, -- end year
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
 * NAME : comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE comp_ed
(
	id		serial	NOT NULL, -- id
	comp	integer	NOT NULL, -- referring competition
	s_year	dm_year	NOT NULL, -- start year
	e_year	dm_year	NOT NULL, -- end year
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
	team	integer	NOT NULL, -- team
	comp_ed	integer	NOT NULL, -- competition edition
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
 * NAME : team_comp_ed_fk_comp
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	team_comp_ed
ADD CONSTRAINT team_comp_ed_fk_comp
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
 * NAME : trophy
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy
(
	id		serial		NOT NULL, -- id
	type	ty_trophy	NOT NULL, -- type
	name	dm_enstr	NOT NULL, -- name
	dsc		dm_enstr	NOT NULL  -- description
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
 * NAME : trophy_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_team_comp_ed
(
	trophy	integer	NOT NULL, -- trophy
	team	integer	NOT NULL, -- team
	comp_ed	integer	NOT NULL  -- competition edition
	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy_team_comp_ed TABLE
 * NAME : pk_trophy_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_comp_ed
ADD CONSTRAINT pk_trophy_team_comp_ed
PRIMARY KEY
(
	trophy,
	team,
	comp_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_team_comp_ed TABLE
 * NAME : trophy_team_comp_ed_fk_trophy
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_comp_ed
ADD CONSTRAINT trophy_team_comp_ed_fk_trophy
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
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_team_comp_ed TABLE
 * NAME : trophy_team_comp_ed_fk_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_team_comp_ed
ADD CONSTRAINT trophy_team_comp_ed_fk_team_comp_ed
FOREIGN KEY
(
	team,
	comp_ed
)
REFERENCES team_comp_ed
(
	team,
	comp_ed
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : trophy_player_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
CREATE TABLE trophy_player_team_comp_ed
(
	trophy	integer	NOT NULL, -- trophy
	player	integer NOT NULL, -- player
	team	integer	NOT NULL, -- team
	comp_ed	integer	NOT NULL  -- competition edition
	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - trophy_player_team_comp_ed TABLE
 * NAME : pk_trophy_player_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_team_comp_ed
ADD CONSTRAINT pk_trophy_player_team_comp_ed
PRIMARY KEY
(
	trophy,
	player,
	team,
	comp_ed
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_team_comp_ed TABLE
 * NAME : trophy_player_team_comp_ed_fk_trophy
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_team_comp_ed
ADD CONSTRAINT trophy_player_team_comp_ed_fk_trophy
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
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_team_comp_ed TABLE
 * NAME : trophy_player_team_comp_ed_fk_player
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_team_comp_ed
ADD CONSTRAINT trophy_player_team_comp_ed_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - trophy_player_team_comp_ed TABLE
 * NAME : trophy_player_team_comp_ed_fk_team_comp_ed
 * DESC : TODO
 ******************************************************************************/
ALTER TABLE	trophy_player_team_comp_ed
ADD CONSTRAINT trophy_player_team_comp_ed_fk_team_comp_ed
FOREIGN KEY
(
	team,
	comp_ed
)
REFERENCES team_comp_ed
(
	team,
	comp_ed
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

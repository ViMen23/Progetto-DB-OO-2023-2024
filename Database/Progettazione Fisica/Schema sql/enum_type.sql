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
 * DESC :
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
 * DESC : enum for the possible types of football competitions
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

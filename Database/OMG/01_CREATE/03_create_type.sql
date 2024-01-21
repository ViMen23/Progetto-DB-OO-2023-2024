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
 * NAME : ty_attribute
 *
 * DESC : Enum of the football player attribute type
 ******************************************************************************/
CREATE TYPE ty_attribute AS ENUM
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
 * NAME : ty_competition
 *
 * DESC : Enum of the football competition type
 ******************************************************************************/
CREATE TYPE ty_competition AS ENUM
(
	'CUP',
	'LEAGUE',
	'SUPER CUP'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_country
 *
 * DESC : Enum of the country type
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
 *
 * DESC : Enum of the football player preferred foot
 ******************************************************************************/
CREATE TYPE ty_foot AS ENUM
(
	'EITHER',
	'LEFT',
	'RIGHT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_role
 *
 * DESC : Enum of the football player role type
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
 * NAME : ty_statistic
 *
 * DESC : Enum of all possible combinations of football player role.
 *        It is useful for directly subjecting a particular statistic
 *        to one or more roles without having to define different associations
 ******************************************************************************/
CREATE TYPE ty_statistic AS ENUM
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
 *
 * DESC : Enum of the football team type
 ******************************************************************************/
CREATE TYPE ty_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : ty_trophy
 *
 * DESC : Enum of the football prize and football trophy type
 ******************************************************************************/
CREATE TYPE ty_trophy AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------

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
 * NAME : en_award
 *
 * DESC : Enum delle possibili tipologie di trofeo e premio calcistico
 ******************************************************************************/
CREATE TYPE en_award AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_competition
 *
 * DESC : Enum delle possibili tipologie di competizione calcistica
 ******************************************************************************/
CREATE TYPE en_competition AS ENUM
(
	'CUP',
	'LEAGUE',
	'SUPER CUP'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_country
 *
 * DESC : Enum delle possibili tipologie di paese
 ******************************************************************************/
CREATE TYPE en_country AS ENUM
(
	'NATION',
	'CONTINENT',
	'WORLD'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_feature
 *
 * DESC : Enum delle possibili tipologie di attributo per un calciatore
 ******************************************************************************/
CREATE TYPE en_feature AS ENUM
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
 * NAME : en_foot
 *
 * DESC : Enum delle possibili tipologie di piede preferito di un calciatore
 ******************************************************************************/
CREATE TYPE en_foot AS ENUM
(
	'EITHER',
	'LEFT',
	'RIGHT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_role
 *
 * DESC : Enum delle possibili tipologie di ruolo di un calciatore
 ******************************************************************************/
CREATE TYPE en_role AS ENUM
(
	'GK', -- portiere
	'DF', -- difensore
	'MF', -- centrocampista
	'FW'  -- attaccante
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_role_mix
 *
 * DESC : Enum formato da tutte le possibili combinazioni di ruoli
 *        di un calciatore
 ******************************************************************************/
CREATE TYPE en_role_mix AS ENUM
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
 * NAME : en_season
 *
 * DESC : Enum delle possibili tipologie di militanza riferite ad una stagione
 ******************************************************************************/
CREATE TYPE en_season AS ENUM
(
	'I PART',	-- solo prima parte di stagione
	'II PART',	-- solo seconda parte di stagione
	'FULL'		-- tutta la stagione
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_team
 *
 * DESC : Enum delle possibili tipologie di squadra di calcio
 ******************************************************************************/
CREATE TYPE en_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
--------------------------------------------------------------------------------

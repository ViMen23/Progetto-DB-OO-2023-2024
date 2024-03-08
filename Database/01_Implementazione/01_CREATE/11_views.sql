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
 * VIEW
 ******************************************************************************/

/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_positions
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_positions
AS
	SELECT
		fp_position.id::text AS position_id,
		fp_position.role::text AS position_role,
		fp_position.code::text AS position_code,
		fp_position.name::text AS position_name
	FROM
		fp_position
	WHERE
		TRUE
	ORDER BY
		fp_position.role,
		fp_position.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_team_trophy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_team_trophy
AS
	SELECT
		fp_trophy.id::text AS trophy_id,
		fp_trophy.name::text AS trophy_name
	FROM
		fp_trophy
	WHERE
		fp_trophy.type = 'TEAM'
	ORDER BY
		fp_trophy.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_player_trophy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_player_trophy
AS
	SELECT
		fp_trophy.id::text AS trophy_id,
		fp_trophy.role::text AS trophy_role,
		fp_trophy.name::text AS trophy_name
	FROM
		fp_trophy
	WHERE
		fp_trophy.type = 'PLAYER'
	ORDER BY
		fp_trophy.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_team_prize
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_team_prize
AS
	SELECT
		fp_prize.id::text AS prize_id,
		fp_prize.name::text AS prize_name
	FROM
		fp_prize
	WHERE
		fp_prize.type = 'TEAM'
	ORDER BY
		fp_prize.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_player_prize
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_player_prize
AS
	SELECT
		fp_prize.id::text AS prize_id,
		fp_prize.role::text AS prize_role,
		fp_prize.name::text AS prize_name
	FROM
		fp_prize
	WHERE
		fp_prize.type = 'PLAYER'
	ORDER BY
		fp_prize.name;

--------------------------------------------------------------------------------

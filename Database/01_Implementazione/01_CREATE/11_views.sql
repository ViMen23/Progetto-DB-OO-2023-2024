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
CREATE VIEW vi_all_positions
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
		fp_position.name

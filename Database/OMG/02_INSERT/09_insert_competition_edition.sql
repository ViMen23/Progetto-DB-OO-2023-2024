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
 * INSERT COMPETITION EDITION
 ******************************************************************************/

INSERT INTO competition_edition (start_year, end_year, total_team, competition_id)
VALUES
(
	2022,
	2023,
	20,
	get_id('@', 'competition@name@Serie A')
);
--------------------------------------------------------------------------------



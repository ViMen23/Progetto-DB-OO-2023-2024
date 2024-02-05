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
 * INSERT team_trophy_case
 ******************************************************************************/
INSERT INTO fp_team_trophy_case (team_id, trophy_id, competition_id, start_year)
VALUES
(
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	get_id('@', 'fp_trophy@name@First place'),
	get_id('@', 'fp_competition@name@Serie A'),
	2022
);
--------------------------------------------------------------------------------


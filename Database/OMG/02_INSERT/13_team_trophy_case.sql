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
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column('@', 'fp_trophy@name@First place', 'id')::integer,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022
),
(
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer,
	get_column('@', 'fp_trophy@name@Second place', 'id')::integer,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022
);
--------------------------------------------------------------------------------


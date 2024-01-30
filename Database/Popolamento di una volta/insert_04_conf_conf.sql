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
 * INSERT CONFEDERTION CONFEDERATION
 ******************************************************************************/
INSERT INTO conf_conf (member, super, year)
VALUES
(
	get_id('@', 'conf@name@Union of European Football Associations'),
	get_id('@', 'conf@name@Fédération Internationale de Football Association'),
	1954
),
(
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	get_id('@', 'conf@name@Fédération Internationale de Football Association'),
	1905
),
(
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	get_id('@', 'conf@name@Union of European Football Associations'),
	1954
);
--------------------------------------------------------------------------------


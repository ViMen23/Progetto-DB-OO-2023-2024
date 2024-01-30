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
 * INSERT COMPETITION CONFEDERATION
 ******************************************************************************/
INSERT INTO comp_conf (comp, conf, year)
VALUES
(
	get_id('@', 'comp@name@Serie A'),
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	1923
);
--------------------------------------------------------------------------------


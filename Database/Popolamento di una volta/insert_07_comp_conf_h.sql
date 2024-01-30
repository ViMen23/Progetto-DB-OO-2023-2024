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
 * INSERT COMPETITION CONFEDERATION HISTORY
 ******************************************************************************/
INSERT INTO comp_conf_h (comp, conf, s_year, e_year)
VALUES
(
	get_id('@', 'comp@name@Serie A'),
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	1898,
	1922
);
--------------------------------------------------------------------------------


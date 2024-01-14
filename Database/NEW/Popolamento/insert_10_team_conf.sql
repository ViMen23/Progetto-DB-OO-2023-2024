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
 * INSERT team_conf
 ******************************************************************************/
INSERT INTO team_conf (team, conf, year)
VALUES
(
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	1926
),
(
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	1899
);

--------------------------------------------------------------------------------


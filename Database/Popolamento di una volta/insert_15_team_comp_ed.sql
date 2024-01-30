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
 * INSERT team_comp_ed
 ******************************************************************************/
INSERT INTO team_comp_ed (team, comp_ed)
VALUES
(
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
);
--------------------------------------------------------------------------------



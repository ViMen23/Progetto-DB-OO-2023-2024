
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
 * INSERT team_trophy_comp_ed
 ******************************************************************************/
INSERT INTO team_trophy_comp_ed (team, trophy_comp_ed)
VALUES
(
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	get_id
	(
		'@',
		'trophy_comp_ed@trophy@' ||
		get_id('@', 'trophy@name@First place') ||
		'@comp_ed@' ||
		get_id
		(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
		)
	)
);
--------------------------------------------------------------------------------



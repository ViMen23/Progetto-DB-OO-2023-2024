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
 * INSERT team_comp_ed_player_pos
 ******************************************************************************/
INSERT INTO team_comp_ed_player_pos (team_comp_ed, player, pos)
VALUES
(
	get_id
	(
		'@',
		'team_comp_ed@team@' ||
		get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899') ||
		'@comp_ed@'||
		get_id
		(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
		)
	),
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@' ||
		get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'pos@code@ST')
	
);

--------------------------------------------------------------------------------


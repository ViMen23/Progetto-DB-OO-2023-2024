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
 * INSERT team_comp_ed_player_pos_stat
 ******************************************************************************/
INSERT INTO team_comp_ed_player_pos_stat (team_comp_ed_player_pos, stat, value)
VALUES
(
	get_id
	(
		'@',
		'team_comp_ed_player_pos@team_comp_ed@' ||
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
		) ||
		'@player@' ||
		get_id
		(
			'@',
			'player@name@Zlatan@surname@Ibrahimović'
			'@sex@MALE@dob@1981-10-03@nation@' ||
			get_id('@', 'country@code@SWE') 
		) ||
		'@pos@' || get_id('@', 'pos@code@ST')
	),
	get_id('@', 'stat@name@match'),
	4
),
(
	get_id
	(
		'@',
		'team_comp_ed_player_pos@team_comp_ed@' ||
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
		) ||
		'@player@' ||
		get_id
		(
			'@',
			'player@name@Zlatan@surname@Ibrahimović'
			'@sex@MALE@dob@1981-10-03@nation@' ||
			get_id('@', 'country@code@SWE') 
		) ||
		'@pos@' || get_id('@', 'pos@code@ST')
	),
	get_id('@', 'stat@name@goal'),
	1
),
(
	get_id
	(
		'@',
		'team_comp_ed_player_pos@team_comp_ed@' ||
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
		) ||
		'@player@' ||
		get_id
		(
			'@',
			'player@name@Zlatan@surname@Ibrahimović'
			'@sex@MALE@dob@1981-10-03@nation@' ||
			get_id('@', 'country@code@SWE') 
		) ||
		'@pos@' || get_id('@', 'pos@code@ST')
	),
	get_id('@', 'stat@name@assist'),
	0
),
(
	get_id
	(
		'@',
		'team_comp_ed_player_pos@team_comp_ed@' ||
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
		) ||
		'@player@' ||
		get_id
		(
			'@',
			'player@name@Zlatan@surname@Ibrahimović'
			'@sex@MALE@dob@1981-10-03@nation@' ||
			get_id('@', 'country@code@SWE') 
		) ||
		'@pos@' || get_id('@', 'pos@code@ST')
	),
	get_id('@', 'stat@name@penalty scored'),
	1
),
(
	get_id
	(
		'@',
		'team_comp_ed_player_pos@team_comp_ed@' ||
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
		) ||
		'@player@' ||
		get_id
		(
			'@',
			'player@name@Zlatan@surname@Ibrahimović'
			'@sex@MALE@dob@1981-10-03@nation@' ||
			get_id('@', 'country@code@SWE') 
		) ||
		'@pos@' || get_id('@', 'pos@code@ST')
	),
	get_id('@', 'stat@name@yellow card'),
	0
),
(
	get_id
	(
		'@',
		'team_comp_ed_player_pos@team_comp_ed@' ||
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
		) ||
		'@player@' ||
		get_id
		(
			'@',
			'player@name@Zlatan@surname@Ibrahimović'
			'@sex@MALE@dob@1981-10-03@nation@' ||
			get_id('@', 'country@code@SWE') 
		) ||
		'@pos@' || get_id('@', 'pos@code@ST')
	),
	get_id('@', 'stat@name@red card'),
	0
);
--------------------------------------------------------------------------------


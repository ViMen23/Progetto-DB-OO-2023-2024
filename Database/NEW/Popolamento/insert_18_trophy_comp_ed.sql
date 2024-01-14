
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
 * INSERT trophy_comp_ed
 ******************************************************************************/
INSERT INTO trophy_comp_ed (trophy, comp_ed)
VALUES
(
	get_id('@', 'trophy@name@First place'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Most Valuable Player'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Best Young Player'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Best Striker'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Best Midfielder'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Best Defender'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Best Goalkeeper'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
),
(
	get_id('@', 'trophy@name@Goal of the Season'),
	get_id
	(
		'@',
		'comp_ed@comp@' || get_id('@', 'comp@name@Serie A') ||
		'@s_year@2022@e_year@2023'
	)
);
--------------------------------------------------------------------------------



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
 * INSERT MILITANCY
 ******************************************************************************/

INSERT INTO fp_militancy (start_year, type, player_id, team_id, team_type)
VALUES
(
	2017,
	'II PART',
	get_id
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@long_name@VfL Wolfsburg'),
	'CLUB'
	
),
(
	2018,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@long_name@RSC Charleroi'),
	'CLUB'
),
(
	2019,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@long_name@LOSC Lille'),
	'CLUB'
),
(
	2013,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@long_name@Fudbalski klub Vojvodina'),
	'CLUB'
),
(
	2014,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@long_name@Koninklijke Racing Club Genk'),
	'CLUB'
),
(
	2023,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@long_name@Al-Hilal SFC'),
	'CLUB'
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT MILITANCY FROM Function
 ******************************************************************************/

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2024 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@Udinese Calcio'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@SPAL'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2016 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2017 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2018 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@SS Lazio'),
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2022 AS smallint),
	CAST('FULL' AS en_season)
);




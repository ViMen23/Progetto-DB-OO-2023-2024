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
	get_id('@', 'fp_team@name@VfL Wolfsburg'),
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
	get_id('@', 'fp_team@name@RSC Charleroi'),
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
	get_id('@', 'fp_team@name@LOSC Lille'),
	'CLUB'
),
(
	2020,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2021,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2022,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2023,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2024,
	'FULL',
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2014,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@Udinese Calcio'),
	'CLUB'
),
(
	2015,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@Udinese Calcio'),
	'CLUB'
),
(
	2016,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SPAL'),
	'CLUB'
),
(
	2017,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SPAL'),
	'CLUB'
),
(
	2018,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2019,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2020,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2021,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2022,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
	'CLUB'
),
(
	2023,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@name@SSC Napoli'),
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
	get_id('@', 'fp_team@name@Fudbalski klub Vojvodina'),
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
	get_id('@', 'fp_team@name@Koninklijke Racing Club Genk'),
	'CLUB'
),
(
	2015,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2016,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2017,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2018,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2019,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2020,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2021,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
	'CLUB'
),
(
	2022,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_team@name@SS Lazio'),
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
	get_id('@', 'fp_team@name@Al-Hilal SFC'),
	'CLUB'
);
--------------------------------------------------------------------------------


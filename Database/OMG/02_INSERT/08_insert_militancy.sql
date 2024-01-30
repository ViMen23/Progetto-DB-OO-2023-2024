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
	get_id('@', 'fp_team@name@VfL Wolfsburg'),
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
	daterange('2014-07-01', '2016-07-14', '[]'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@code@ITA')
	),
	get_id('@', 'fp_team@name@Udinese Calcio')
),
(
	daterange('2016-07-15', '2018-06-30', '[]'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@code@ITA')
	),
	get_id('@', 'fp_team@name@SPAL')
),
(
	daterange('2018-07-01', '2018-07-05', '[]'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@code@ITA')
	),
	get_id('@', 'fp_team@name@Udinese Calcio')
),
(
	daterange('2018-07-06', '2019-06-30', '[]'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@code@ITA')
	),
	get_id('@', 'fp_team@name@SSC Napoli')
),
(
	daterange('2019-07-01','2019-07-01', '[]'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@code@ITA')
	),
	get_id('@', 'fp_team@name@Udinese Calcio')
),
(
	daterange('2019-07-02', '2024-06-30', '[]'),
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@code@ITA')
	),
	get_id('@', 'fp_team@name@SSC Napoli')
);

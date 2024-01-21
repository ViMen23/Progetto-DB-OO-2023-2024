INSERT INTO fp_militancy (date_range, player_id, team_id)
VALUES
(
	daterange('2017-01-01', '2018-08-22', '[]'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@code@NGA')
	),
	get_id('@', 'fp_team@name@VfL Wolfsburg')
),
(
	daterange('2018-08-23', '2019-06-30', '[]'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@code@NGA')
	),
	get_id('@', 'fp_team@name@RSC Charleroi')
),
(
	daterange('2019-07-1', '2019-07-1', '[]'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@code@NGA')
	),
	get_id('@', 'fp_team@name@VfL Wolfsburg')
),
(
	daterange('2019-07-2', '2019-08-1', '[]'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@code@NGA')
	),
	get_id('@', 'fp_team@name@RSC Charleroi')
),
(
	daterange('2019-08-2', '2020-09-01', '[]'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@code@NGA')
	),
	get_id('@', 'fp_team@name@LOSC Lille')
),
(
	daterange('2020-09-02', '2026-06-30', '[]'),
	get_id
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@code@NGA')
	),
	get_id('@', 'fp_team@name@SSC Napoli')
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

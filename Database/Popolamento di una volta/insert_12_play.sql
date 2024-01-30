
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
 * INSERT play
 ******************************************************************************/
INSERT INTO play (player, team, s_date, e_date)
VALUES
(
	get_id
	(
		'@',
		'player@name@Mike Peterson@surname@Maignan'
		'@sex@MALE@dob@1995-07-03@nation@' ||
		get_id('@', 'country@code@FRA') 
	),
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	'01-07-2021',
	'30-06-2026'
),
(
	get_id
	(
		'@',
		'player@name@Matteo@surname@Politano'
		'@sex@MALE@dob@1993-08-03@nation@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	'2021-07-01',
	'2025-06-30'
),
(
	get_id
	(
		'@',
		'player@name@Giovanni@surname@Di Lorenzo'
		'@sex@MALE@dob@1993-08-04@nation@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	'2019-07-01',
	'2028-06-30'
),
(
	get_id
	(
		'@',
		'player@name@Piotr@surname@Zielinski'
		'@sex@MALE@dob@1994-05-20@nation@' ||
		get_id('@', 'country@code@POL')
	),
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	'2016-08-04',
	'2024-06-30'

),
(
	
	get_id
	(
		'@',
		'player@name@Davide@surname@Calabria'
		'@sex@MALE@dob@1996-12-06@nation@' ||
		get_id('@', 'country@code@ITA')
	),
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	'2015-07-01',
	'2025-06-30'
),
(
	get_id
	(
		'@',
		'player@name@Diego Armando@surname@Maradona'
		'@sex@MALE@dob@1960-10-30@nation@' ||
		get_id('@', 'country@code@ARG') 
	),
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	'1984-07-01',
	'1991-04-02'
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@' ||
		get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	'2010-08-28',
	'2011-06-30'
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@' ||
		get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	'2011-07-01',
	'2012-07-18'
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@' ||
		get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	'2020-01-02',
	'2023-07-01'
),
(
	get_id
	(
		'@',
		'player@name@Aitana Bonmatí@surname@Conca'
		'@sex@FEMALE@dob@1998-01-18@nation@' ||
		get_id('@', 'country@code@ESP') 
	),
	get_id('@', 'team@name@Barcelona@age_cap@0@sex@FEMALE@year@1988'),
	'2017-11-21',
	'2025-06-30'
)
--------------------------------------------------------------------------------

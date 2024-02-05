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
),
(
	2016,
	'I PART',
	get_id
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@Aston Villa'),
	'CLUB'
),
(
	2021,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@Tottenham Hotspur FC'),
	'CLUB'
),
(
	2022,
	'I PART',
	get_id
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@ACF Fiorentina'),
	'CLUB'
),
(
	2006,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@Palermo FC'),
	'CLUB'
),
(
	2007,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@US Cremonese'),
	'CLUB'
),
(
	2008,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@US Ancona'),
	'CLUB'
),
(
	2016,
	'I PART',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@Siviglia FC'),
	'CLUB'
),
(
	2016,
	'II PART',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@CA Osasuna'),
	'CLUB'
),
(
	2021,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@Genoa CFC'),
	'CLUB'
),
(
	2022,
	'I PART',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	'CLUB'
),
(
	2022,
	'II PART',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@ACF Fiorentina'),
	'CLUB'
),
(
	2023,
	'I PART',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@OGC Nizza'),
	'CLUB'
),
(
	2023,
	'II PART',
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_team@long_name@Fatih Karagümrük'),
	'CLUB'
),
(
	2021,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_id('@', 'fp_country@name@South Korea')
	),
	get_id('@', 'fp_team@long_name@Fenerbahce'),
	'CLUB'
),
(
	2022,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_id('@', 'fp_country@name@South Korea')
	),
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	'CLUB'
),
(
	2023,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_id('@', 'fp_country@name@South Korea')
	),
	get_id('@', 'fp_team@long_name@FC Bayern Monaco'),
	'CLUB'
),
(
	2015,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_id('@', 'fp_country@name@Jugoslavia')
	),
	get_id('@', 'fp_team@long_name@FK Partizani'),
	'CLUB'
),
(
	2016,
	'FULL',
	get_id
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_id('@', 'fp_country@name@Jugoslavia')
	),
	get_id('@', 'fp_team@long_name@GNK Dinamo Zagabria'),
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

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@Hellas Verona'),
	get_id
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
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
	get_id('@', 'fp_team@long_name@Atalanta'),
	get_id
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2016 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	get_id
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2022 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@Palermo FC'),
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2009 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2010 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@FC Paris Saint-Germain'),
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2011 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@Torino FC'),
	get_id
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	CAST(2017 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@SSC Napoli'),
	get_id
	(
		'@',
		'fp_player@name@Hubert@surname@Idasiak'
		'@dob@2002-02-03@country_id@' ||
		get_id('@', 'fp_country@name@Poland')
	),
	CAST(2022 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@Jeonbuk Hyundai Motors'),
	get_id
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_id('@', 'fp_country@name@South Korea')
	),
	CAST(2016 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2018 AS smallint),
	CAST('I PART' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@Beijing Guoan'),
	get_id
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_id('@', 'fp_country@name@South Korea')
	),
	CAST(2018 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);


SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_id('@', 'fp_team@long_name@FK Partizani'),
	get_id
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_id('@', 'fp_country@name@Jugoslavia')
	),
	CAST(2013 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season)
);
--------------------------------------------------------------------------------


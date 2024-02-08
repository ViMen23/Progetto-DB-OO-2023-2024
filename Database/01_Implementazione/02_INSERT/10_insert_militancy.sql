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
	get_column
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@VfL Wolfsburg', 'id')::integer,
	'CLUB'
	
),
(
	2018,
	'FULL',
	get_column
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@RSC Charleroi', 'id')::integer,
	'CLUB'
),
(
	2019,
	'FULL',
	get_column
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@LOSC Lille', 'id')::integer,
	'CLUB'
),
(
	2013,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Fudbalski klub Vojvodina', 'id')::integer,
	'CLUB'
),
(
	2014,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Koninklijke Racing Club Genk', 'id')::integer,
	'CLUB'
),
(
	2023,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Al-Hilal SFC', 'id')::integer,
	'CLUB'
),
(
	2016,
	'I PART',
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Aston Villa', 'id')::integer,
	'CLUB'
),
(
	2021,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Tottenham Hotspur FC', 'id')::integer,
	'CLUB'
),
(
	2022,
	'I PART',
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer,
	'CLUB'
),
(
	2006,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Palermo FC', 'id')::integer,
	'CLUB'
),
(
	2007,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@US Cremonese', 'id')::integer,
	'CLUB'
),
(
	2008,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@US Ancona', 'id')::integer,
	'CLUB'
),
(
	2016,
	'I PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Siviglia FC', 'id')::integer,
	'CLUB'
),
(
	2016,
	'II PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@CA Osasuna', 'id')::integer,
	'CLUB'
),
(
	2021,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Genoa CFC', 'id')::integer,
	'CLUB'
),
(
	2022,
	'I PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	'CLUB'
),
(
	2022,
	'II PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer,
	'CLUB'
),
(
	2023,
	'I PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@OGC Nizza', 'id')::integer,
	'CLUB'
),
(
	2023,
	'II PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Fatih Karagümrük', 'id')::integer,
	'CLUB'
),
(
	2021,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Fenerbahce', 'id')::integer,
	'CLUB'
),
(
	2022,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	'CLUB'
),
(
	2023,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@FC Bayern Monaco', 'id')::integer,
	'CLUB'
),
(
	2015,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_column('@', 'fp_country@name@Jugoslavia', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@FK Partizani', 'id')::integer,
	'CLUB'
),
(
	2016,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_column('@', 'fp_country@name@Jugoslavia', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@GNK Dinamo Zagabria', 'id')::integer,
	'CLUB'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT MILITANCY FROM Function
 ******************************************************************************/

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2024 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Udinese Calcio', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SPAL', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2016 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2017 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2018 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2022 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Hellas Verona', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Atalanta', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2016 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2022 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Palermo FC', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2009 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2010 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@FC Paris Saint-Germain', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2011 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Torino FC', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2017 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Hubert@surname@Idasiak'
		'@dob@2002-02-03@country_id@' ||
		get_column('@', 'fp_country@name@Poland', 'id')::text,
		'id'
	)::integer,
	CAST(2022 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Jeonbuk Hyundai Motors', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	CAST(2016 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2018 AS smallint),
	CAST('I PART' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Beijing Guoan', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	CAST(2018 AS smallint),
	CAST('II PART' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);


SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@FK Partizani', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_column('@', 'fp_country@name@Jugoslavia', 'id')::text,
		'id'
	)::integer,
	CAST(2013 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season)
);
--------------------------------------------------------------------------------


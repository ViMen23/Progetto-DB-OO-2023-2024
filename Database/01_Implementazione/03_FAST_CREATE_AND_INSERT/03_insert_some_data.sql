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
 * INSERT TEAM
 ******************************************************************************/
INSERT INTO fp_team (type, short_name, long_name, country_id)
VALUES
(
	'CLUB',
	'ATA',
	'Atalanta',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'BOL',
	'Bologna FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'CRE',
	'US Cremonese',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'EMP',
	'Empoli FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'FIO',
	'ACF Fiorentina',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'INT',
	'Inter',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'JUV',
	'Juventus FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'LAZ',
	'SS Lazio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'LEC',
	'US Lecce',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'MIL',
	'AC Milan',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'MON',
	'AC Monza',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'NAP',
	'SSC Napoli',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'ROM',
	'AS Roma',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SAL',
	'US Salernitana',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SAM',
	'UC Sampdoria',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SAS',
	'US Sassuolo',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SPE',
	'Spezia Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'TOR',
	'Torino FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'UDI',
	'Udinese Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'VER',
	'Hellas Verona',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'FRO',
	'Frosinone Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'GEN',
	'Genoa CFC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'CAG',
	'Cagliari Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'WOL',
	'VfL Wolfsburg',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'CLUB',
	'CHA',
	'RSC Charleroi',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer
),
(
	'CLUB',
	'LIL',
	'LOSC Lille',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'CLUB',
	'SPA',
	'SPAL',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'VOJ',
	'Fudbalski klub Vojvodina',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer
),
(
	'CLUB',
	'GEN',
	'Koninklijke Racing Club Genk',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer
),
(
	'CLUB',
	'HIL',
	'Al-Hilal SFC',
	get_column('@', 'fp_country@name@Saudi Arabia', 'id')::integer
),
(
	'CLUB',
	'AST',
	'Aston Villa',
	get_column('@', 'fp_country@name@England', 'id')::integer
),
(
	'CLUB',
	'TOT',
	'Tottenham Hotspur FC',
	get_column('@', 'fp_country@name@England', 'id')::integer
),
(
	'CLUB',
	'PAL',
	'Palermo FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'PAL',
	'US Ancona',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'PSG',
	'FC Paris Saint-Germain',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'CLUB',
	'SIV',
	'Siviglia FC',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'CLUB',
	'SIV',
	'CA Osasuna',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'CLUB',
	'NIZ',
	'OGC Nizza',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'CLUB',
	'KAR',
	'Fatih Karagümrük',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer
),
(
	'CLUB',
	'JHM',
	'Jeonbuk Hyundai Motors',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer
),
(
	'CLUB',
	'BEG',
	'Beijing Guoan',
	get_column('@', 'fp_country@name@China', 'id')::integer
),
(
	'CLUB',
	'FEN',
	'Fenerbahce',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer
),
(
	'CLUB',
	'BAM',
	'FC Bayern Monaco',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'CLUB',
	'PAR',
	'FK Partizani',
	get_column('@', 'fp_country@name@Albania', 'id')::integer
),
(
	'CLUB',
	'SPA',
	'RNK Spalato',	
	get_column('@', 'fp_country@name@Croatia', 'id')::integer
),
(
	'CLUB',
	'ZAG',
	'GNK Dinamo Zagabria',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer
);
--------------------------------------------------------------------------------


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
 * INSERT FP_PLAYER
 ******************************************************************************/


INSERT INTO fp_player (name, surname, dob, foot, position_id, role, country_id)
VALUES
(
	'Alex',
	'Meret',
	'1997-03-22',
	'LEFT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Pierluigi',
	'Gollini',
	'1995-03-18',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Salvatore',
	'Sirigu',
	'1987-01-12',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Hubert',
	'Idasiak',
	'2002-02-03',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Valerio',
	'Boffelli',
	'2004-09-04',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Davide',
	'Marfella',
	'1999-09-15',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Min-jae',
	'Kim',
	'1996-11-15',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer
),
(
	'Amir',
	'Rrahmani',
	'1994-02-24',
	'EITHER',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Leo Skiri',
	'Østigård',
	'1999-11-28',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Norway', 'id')::integer
),
(
	'Juan Guilherme Nunes',
	'Jesus',
	'1991-06-10',
	'LEFT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Mathías',
	'Olivera',
	'1991-05-27',
	'LEFT',
	get_column('@', 'fp_position@name@Left-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer
),
(
	'Mário',
	'Rui',
	'1997-03-22',
	'LEFT',
	get_column('@', 'fp_position@name@Left-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-08-04',
	'RIGHT',
	get_column('@', 'fp_position@name@Right-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Alessandro',
	'Zanoli',
	'2000-10-03',
	'RIGHT',
	get_column('@', 'fp_position@name@Right-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Bartosz',
	'Bereszyński',
	'1992-07-12',
	'RIGHT',
	get_column('@', 'fp_position@name@Right-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Stanislav',
	'Lobotka',
	'1994-11-25',
	'EITHER',
	get_column('@', 'fp_position@name@Defensive Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer
),
(
	'Diego',
	'Demme',
	'1991-11-21',
	'RIGHT',
	get_column('@', 'fp_position@name@Defensive Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'André-Frank Zambo',
	'Anguissa',
	'1995-11-16',
	'RIGHT',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer
),
(
	'Piotr Sebastian',
	'Zieliński',
	'1994-05-20',
	'EITHER',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Tanguy',
	'Ndombélé',
	'1996-12-28',
	'RIGHT',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Karim',
	'Zedadka',
	'2000-06-09',
	'RIGHT',
	get_column('@', 'fp_position@name@Left Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Eljif',
	'Elmas',
	'1999-09-24',
	'RIGHT',
	get_column('@', 'fp_position@name@Attacking Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer
),
(
	'Gianluca',
	'Gaetano',
	'2000-05-05',
	'RIGHT',
	get_column('@', 'fp_position@name@Attacking Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Khvicha',
	'Kvaratskhelia',
	'2001-02-12',
	'EITHER',
	get_column('@', 'fp_position@name@Left Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer
),
(
	'Alessio',
	'Zerbin',
	'1999-03-03',
	'RIGHT',
	get_column('@', 'fp_position@name@Left Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Hirving Rodrigo',
	'Lozano',
	'1995-07-30',
	'RIGHT',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Mexico', 'id')::integer
),
(
	'Matteo',
	'Politano',
	'1993-08-03',
	'LEFT',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Adam',
	'Ounas',
	'1996-11-11',
	'LEFT',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Giacomo',
	'Raspadori',
	'2000-02-18',
	'EITHER',
	get_column('@', 'fp_position@name@Second Striker', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Victor James',
	'Osimhen',
	'1998-12-29',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre Forward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer
),
(
	'Giovanni Pablo',
	'Simeone',
	'1995-07-05',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre Forward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer
),
(
	'Ivan',
	'Provedel',
	'1994-03-17',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Christos',
	'Mandas',
	'2001-09-17',
	'RIGHT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Greece', 'id')::integer
),
(
	'Luigi',
	'Sepe',
	'1991-05-08',
	'LEFT',
	get_column('@', 'fp_position@name@Goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Nicolò',
	'Casale',
	'1998-02-14',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Alessio',
	'Romagnoli',
	'1995-01-12',
	'LEFT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Patricio Gabarrón',
	'Gil',
	'1993-04-17',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Mario',
	'Gila',
	'2000-08-29',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Luca',
	'Pellegrini',
	'1999-03-07',
	'LEFT',
	get_column('@', 'fp_position@name@Left-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Dimitrije',
	'Kamenović',
	'2000-07-16',
	'LEFT',
	get_column('@', 'fp_position@name@Left-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Adam',
	'Marusic',
	'1992-10-17',
	'RIGHT',
	get_column('@', 'fp_position@name@Right-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Elseid Gëzim',
	'Hysaj',
	'1994-02-02',
	'RIGHT',
	get_column('@', 'fp_position@name@Right-Back', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Albania', 'id')::integer
),
(
	'Nicolò',
	'Rovella',
	'2001-12-04',
	'RIGHT',
	get_column('@', 'fp_position@name@Defensive Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Danilo',
	'Cataldi',
	'1994-08-06',
	'RIGHT',
	get_column('@', 'fp_position@name@Defensive Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Mattéo Elias Kenzo',
	'Guendouzi',
	'1999-04-14',
	'RIGHT',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Luis',
	'Alberto',
	'1992-09-28',
	'RIGHT',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Matías',
	'Vecino',
	'1991-08-24',
	'RIGHT',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer
),
(
	'Manuel',
	'Lazzari',
	'1993-11-29',
	'RIGHT',
	get_column('@', 'fp_position@name@Right Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Daichi',
	'Kamada',
	'1996-08-05',
	'RIGHT',
	get_column('@', 'fp_position@name@Attacking Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Japan', 'id')::integer
),
(
	'André',
	'Anderson',
	'1999-09-23',
	'RIGHT',
	get_column('@', 'fp_position@name@Attacking Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Mattia',
	'Zaccagni',
	'1995-06-16',
	'RIGHT',
	get_column('@', 'fp_position@name@Left Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Diego Luis',
	'González',
	'2003-01-07',
	'LEFT',
	get_column('@', 'fp_position@name@Left Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer
),
(
	'Saná Eusébio Mango',
	'Fernandes',
	'2006-03-10',
	'RIGHT',
	get_column('@', 'fp_position@name@Left Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Guinea-Bissau', 'id')::integer
),
(
	'Gustav Tang',
	'Isaksen',
	'2001-04-19',
	'EITHER',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer
),
(
	'Felipe',
	'Anderson',
	'1993-04-15',
	'RIGHT',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Pedro Eliezer',
	'Rodríguez',
	'1987-07-28',
	'EITHER',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Cristiano',
	'Lombardi',
	'1995-08-19',
	'RIGHT',
	get_column('@', 'fp_position@name@Right Winger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Taty',
	'Castellanos',
	'1998-10-03',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre Forward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer
),
(
	'Ciro',
	'Immobile',
	'1990-02-20',
	'RIGHT',
	get_column('@', 'fp_position@name@Centre Forward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Sergej',
	'Milinkovic-Savic',
	'1995-02-27',
	'RIGHT',
	get_column('@', 'fp_position@name@Central Midfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
);
--------------------------------------------------------------------------------


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
 * INSERT COMPETITION EDITION
 ******************************************************************************/

INSERT INTO fp_competition_edition (start_year, competition_id)
VALUES
(
	2022,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer
);
--------------------------------------------------------------------------------



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
 * INSERT PARTECIPATION
 ******************************************************************************/
INSERT INTO fp_partecipation (competition_id, start_year, team_id)
VALUES
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Inter', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AC Milan', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Juventus FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AS Roma', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Atalanta', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Sassuolo', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Torino FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Udinese Calcio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Bologna FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AC Monza', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Empoli FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Hellas Verona', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Salernitana', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Spezia Calcio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Lecce', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Cremonese', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@UC Sampdoria', 'id')::integer
);
--------------------------------------------------------------------------------


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
 * INSERT team_trophy_case
 ******************************************************************************/
INSERT INTO fp_team_trophy_case (team_id, trophy_id, competition_id, start_year)
VALUES
(
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column('@', 'fp_trophy@name@First place', 'id')::integer,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022
),
(
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer,
	get_column('@', 'fp_trophy@name@Second place', 'id')::integer,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022
);
--------------------------------------------------------------------------------



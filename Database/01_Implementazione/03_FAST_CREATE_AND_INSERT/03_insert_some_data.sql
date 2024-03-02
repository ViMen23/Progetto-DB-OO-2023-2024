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
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Pierluigi',
	'Gollini',
	'1995-03-18',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Salvatore',
	'Sirigu',
	'1987-01-12',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Hubert',
	'Idasiak',
	'2002-02-03',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Valerio',
	'Boffelli',
	'2004-09-04',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Davide',
	'Marfella',
	'1999-09-15',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Min-jae',
	'Kim',
	'1996-11-15',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer
),
(
	'Amir',
	'Rrahmani',
	'1994-02-24',
	'EITHER',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Leo Skiri',
	'Østigård',
	'1999-11-28',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Norway', 'id')::integer
),
(
	'Juan Guilherme Nunes',
	'Jesus',
	'1991-06-10',
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Mathías',
	'Olivera',
	'1991-05-27',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer
),
(
	'Mário',
	'Rui',
	'1997-03-22',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-08-04',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Alessandro',
	'Zanoli',
	'2000-10-03',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Bartosz',
	'Bereszyński',
	'1992-07-12',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Stanislav',
	'Lobotka',
	'1994-11-25',
	'EITHER',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer
),
(
	'Diego',
	'Demme',
	'1991-11-21',
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'André-Frank Zambo',
	'Anguissa',
	'1995-11-16',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer
),
(
	'Piotr Sebastian',
	'Zieliński',
	'1994-05-20',
	'EITHER',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Tanguy',
	'Ndombélé',
	'1996-12-28',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Karim',
	'Zedadka',
	'2000-06-09',
	'RIGHT',
	get_column('@', 'fp_position@name@leftMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Eljif',
	'Elmas',
	'1999-09-24',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer
),
(
	'Gianluca',
	'Gaetano',
	'2000-05-05',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Khvicha',
	'Kvaratskhelia',
	'2001-02-12',
	'EITHER',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer
),
(
	'Alessio',
	'Zerbin',
	'1999-03-03',
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Hirving Rodrigo',
	'Lozano',
	'1995-07-30',
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Mexico', 'id')::integer
),
(
	'Matteo',
	'Politano',
	'1993-08-03',
	'LEFT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Adam',
	'Ounas',
	'1996-11-11',
	'LEFT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Giacomo',
	'Raspadori',
	'2000-02-18',
	'EITHER',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Victor James',
	'Osimhen',
	'1998-12-29',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer
),
(
	'Giovanni Pablo',
	'Simeone',
	'1995-07-05',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer
),
(
	'Ivan',
	'Provedel',
	'1994-03-17',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Christos',
	'Mandas',
	'2001-09-17',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Greece', 'id')::integer
),
(
	'Luigi',
	'Sepe',
	'1991-05-08',
	'LEFT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Nicolò',
	'Casale',
	'1998-02-14',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Alessio',
	'Romagnoli',
	'1995-01-12',
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Patricio Gabarrón',
	'Gil',
	'1993-04-17',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Mario',
	'Gila',
	'2000-08-29',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Luca',
	'Pellegrini',
	'1999-03-07',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Dimitrije',
	'Kamenović',
	'2000-07-16',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Adam',
	'Marusic',
	'1992-10-17',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Elseid Gëzim',
	'Hysaj',
	'1994-02-02',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Albania', 'id')::integer
),
(
	'Nicolò',
	'Rovella',
	'2001-12-04',
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Danilo',
	'Cataldi',
	'1994-08-06',
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Mattéo Elias Kenzo',
	'Guendouzi',
	'1999-04-14',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Luis',
	'Alberto',
	'1992-09-28',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Matías',
	'Vecino',
	'1991-08-24',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer
),
(
	'Manuel',
	'Lazzari',
	'1993-11-29',
	'RIGHT',
	get_column('@', 'fp_position@name@rightMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Daichi',
	'Kamada',
	'1996-08-05',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Japan', 'id')::integer
),
(
	'André',
	'Anderson',
	'1999-09-23',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Mattia',
	'Zaccagni',
	'1995-06-16',
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Diego Luis',
	'González',
	'2003-01-07',
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer
),
(
	'Saná Eusébio Mango',
	'Fernandes',
	'2006-03-10',
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Guinea-Bissau', 'id')::integer
),
(
	'Gustav Tang',
	'Isaksen',
	'2001-04-19',
	'EITHER',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer
),
(
	'Felipe',
	'Anderson',
	'1993-04-15',
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Pedro Eliezer',
	'Rodríguez',
	'1987-07-28',
	'EITHER',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Cristiano',
	'Lombardi',
	'1995-08-19',
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Taty',
	'Castellanos',
	'1998-10-03',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer
),
(
	'Ciro',
	'Immobile',
	'1990-02-20',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Sergej',
	'Milinkovic-Savic',
	'1995-02-27',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
);


INSERT INTO fp_player (name, surname, dob, country_id, foot, position_id, role)
VALUES
(
	'Jude',
	'Bellingham',
	'2003-06-29',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'EITHER',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Erling',
	'Haaland',
	'2000-07-21',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kylian',
	'Mbappe',
	'1998-12-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Vinicius',
	'Junior',
	'2000-07-12',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bukayo',
	'Saka',
	'2001-09-05',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Jamal',
	'Musiala',
	'2003-02-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'EITHER',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Phil',
	'Foden',
	'2000-05-28',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Lautaro',
	'Martinez',
	'1997-07-22',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Declan',
	'Rice',
	'1994-01-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Harry',
	'Kane',
	'1993-07-28',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Florian',
	'Wirtz',
	'2003-01-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'EITHER',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Federico',
	'Valverde',
	'1998-07-22',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Moises',
	'Caicedo',
	'1997-11-02',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Eduardo',
	'Camavinga',
	'2002-01-10',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Julian',
	'Alvarez',
	'2000-1-31',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Aurelien',
	'Tchouameni',
	'2000-01-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Rafael',
	'Leao',
	'1999-07-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Martin',
	'Odegaard',
	'1998-12-17',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Gabriel',
	'Martinelli',
	'2001-06-18',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bruno',
	'Guimaraes',
	'1997-02-09',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Enzo',
	'Fernandez',
	'2001-01-17',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Josko',
	'Gvardiol',
	'2002-01-23',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Frenkie',
	'de Jong',
	'1997-05-19',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ruben',
	'Dias',
	'1997-05-14',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Bernardo',
	'Silva',
	'1994-08-11',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Leroy',
	'Sane',
	'1996-01-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'William',
	'Saliba',
	'2001-02-05',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Luis',
	'Diaz',
	'1997-01-13',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Dominik',
	'Szoboszlai',
	'2000-10-25',
	get_column('@', 'fp_country@name@Hungary', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Christopher',
	'Nkunku',
	'1997-11-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolo',
	'Barella',
	'1997-02-07',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joshua',
	'Kimmich',
	'1995-02-08',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Xavi',
	'Simons',
	'2003-04-21',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Randal',
	'Kolo Muani',
	'1998-02-12',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Ronald',
	'Araujo',
	'1999-03-27',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Alphonso',
	'Davies',
	'2000-11-02',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Eder',
	'Militao',
	'1998-01-18',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Gabriel',
	'Jesus',
	'1997-04-03',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Alexander',
	'Isak',
	'1999-09-21',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Trent',
	'Alexander-Arnold',
	'1998-10-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'James',
	'Maddison',
	'1997-11-21',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Marcus',
	'Rashford',
	'1997-10-31',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bruno',
	'Fernandes',
	'1994-08-08',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jack',
	'Grealish',
	'1995-09-10',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Evan',
	'Ferguson',
	'2004-10-06',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Rasmus',
	'Hojlund',
	'2003-08-08',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Darwin',
	'Nunez',
	'1999-06-24',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Alexis',
	'Mac Allister',
	'1998-12-24',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jeremy',
	'Doku',
	'2002-12-17',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Lucas',
	'Paqueta',
	'1997-08-23',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Achraf',
	'Hakimi',
	'1998-11-04',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Cristian',
	'Romero',
	'1992-04-16',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Matthijs',
	'de Ligt',
	'1999-08-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Kingsley',
	'Coman',
	'1996-06-23',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mohamed',
	'Salah',
	'1992-06-15',
	get_column('@', 'fp_country@name@Egypt', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Lamime',
	'Yamal',
	'2000-11-28',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Warren',
	'Zaire-Emery',
	'2002-06-08',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Nuno',
	'Mendes',
	'2002-03-19',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Min-jae',
	'Kim',
	'1996-03-15',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Manuel',
	'Ugarte',
	'2001-04-11',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Douglas',
	'Luiz',
	'1994-05-09',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Gabriel',
	'Magalhaes',
	'1997-02-19',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jules',
	'Kounde',
	'1997-11-24',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Takefusa',
	'Kubo',
	'2001-06-20',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Moussa',
	'Diaby',
	'1996-07-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Dusan',
	'Vlahovic',
	'2000-01-20',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Dayot',
	'Upamecano',
	'1998-10-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ollie',
	'Watkins',
	'1994-12-30',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Alessandro',
	'Bastoni',
	'1999-04-13',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ousmane',
	'Dembele',
	'1997-02-08',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Joao',
	'Palhinha',
	'1995-03-09',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Kevin',
	'De Bruyne',
	'1991-06-28',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Levi',
	'Colwill',
	'2002-02-26',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Matheus',
	'Nunes',
	'2000-08-27',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Dejan',
	'Kulusevski',
	'2000-04-20',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Lois',
	'Openda',
	'2000-02-16',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Theo',
	'Hernandez',
	'1997-10-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Ben',
	'White',
	'1997-07-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Marcus',
	'Thuram',
	'1997-08-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kai',
	'Havertz',
	'1999-06-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Mathys',
	'Tel',
	'2005-04-12',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Nico',
	'Williams',
	'2002-07-12',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Alejandro',
	'Balde',
	'2002-10-18',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Romeo',
	'Lavia',
	'2002-01-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Michael',
	'Olise',
	'2001-12-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Santiago',
	'Gimenez',
	'2001-04-09',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Goncalo',
	'Ramos',
	'2001-06-20',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Jonathan',
	'David',
	'2000-01-14',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kaoru',
	'Mitoma',
	'1997-05-20',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Anthony',
	'Gordon',
	'2001-02-23',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Amadou',
	'Onana',
	'2000-02-04',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Jeremie',
	'Frimpong',
	'2000-08-22',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Lisandro',
	'Martinez',
	'1998-01-18',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Reece',
	'James',
	'1999-05-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Cody',
	'Gakpo',
	'1999-05-03',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Martin',
	'Zubimendi',
	'1998-02-16',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Mikel',
	'Oyarzabal',
	'1997-04-08',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Federico',
	'Chiesa',
	'1997-10-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Diogo',
	'Jota',
	'1991-12-04',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mikel',
	'Merino',
	'1991-06-20',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jarrod',
	'Bowen',
	'1996-12-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Dani',
	'Olmo',
	'1998-01-07',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Federico',
	'Dimarco',
	'1997-11-10',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Heung-Min',
	'Son',
	'1992-07-08',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Eberechi',
	'Eze',
	'1998-01-31',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Brennan',
	'Johnson',
	'2001-10-23',
	get_column('@', 'fp_country@name@Wales', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Joao',
	'Neves',
	'1997-03-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Antonio',
	'Silva',
	'1999-10-31',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Cole',
	'Palmer',
	'2002-05-06',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Micky',
	'van de Ven',
	'2000-04-04',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Pedro',
	'Porro',
	'1999-09-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Mohammed',
	'Kudus',
	'2000-02-02',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nahuel',
	'Molina',
	'1998-04-06',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Pau',
	'Torres',
	'1997-02-16',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Sven',
	'Botman',
	'2000-12-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Diogo',
	'Costa',
	'1999-09-09',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Mason',
	'Mount',
	'1999-01-10',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Viktor',
	'Gyokeres',
	'1991-04-29',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Lucas',
	'Hernandez',
	'1996-02-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Milan',
	'Skriniar',
	'1995-02-11',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Mike',
	'Maignan',
	'1995-05-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Serge',
	'Gnabry',
	'1995-07-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Raheem',
	'Sterling',
	'1993-12-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Jacob',
	'Ramsey',
	'2001-01-04',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Conor',
	'Gallagher',
	'2000-02-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Pedro',
	'Neto',
	'2000-03-09',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Axel',
	'Disasi',
	'1998-03-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Manuel',
	'Akanji',
	'1995-07-16',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Oleksandr',
	'Zinchenko',
	'1996-07-15',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Ousmane',
	'Diomande',
	'1998-02-22',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Vitor',
	'Roque',
	'2004-02-28',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Elye',
	'Wahi',
	'2003-01-22',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Victor',
	'Boniface',
	'2000-12-12',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Castello',
	'Lukeba',
	'2002-04-17',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Giorgio',
	'Scalvini',
	'2003-04-14',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Johan',
	'Bakayoko',
	'2001-07-14',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Edmond',
	'Tapsoba',
	'1997-02-15',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Destiny',
	'Udogie',
	'2002-11-18',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Goncalo',
	'Inacio',
	'2001-01-25',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Mykhaylo',
	'Mudryk',
	'2001-05-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Nicolas',
	'Gonzalez',
	'1998-04-23',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Khephren',
	'Thuram',
	'2001-03-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joao',
	'Felix',
	'1999-11-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Morgan',
	'Gibbs-White',
	'1999-01-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jurrien',
	'Timber',
	'2000-06-17',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Exequiel',
	'Palacios',
	'1998-10-5',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Sandro',
	'Tonali',
	'2000-05-08',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Teun',
	'Koopmeiners',
	'1998-08-28',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Benjamin',
	'Pavard',
	'1993-10-28',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Robin',
	'Le Normand',
	'1996-04-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Gianluigi',
	'Donnarumma',
	'1999-02-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Brais',
	'Mendez',
	'1997-01-17',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Fikayo',
	'Tomori',
	'1997-12-19',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Serhou',
	'Guirassy',
	'1994-02-12',
	get_column('@', 'fp_country@name@Guinea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Gregor',
	'Kobel',
	'1997-12-06',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Andre',
	'Onana',
	'1996-04-02',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Ruben',
	'Neves',
	'1997-03-13',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Andreas',
	'Christensen',
	'1996-04-10',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Julian',
	'Brandt',
	'1996-05-02',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Adrien',
	'Rabiot',
	'1995-02-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joao',
	'Cancelo',
	'1994-05-27',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Nathan',
	'Ake',
	'1995-02-18',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Leon',
	'Goretzka',
	'1995-02-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Hakan',
	'Calhanoglu',
	'1994-02-08',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Rico',
	'Lewis',
	'2004-11-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Bryan',
	'Mbeumo',
	'1999-08-07',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Boubacar',
	'Kamara',
	'1999-10-21',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Marc',
	'Guehi',
	'2000-07-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Nayef',
	'Aguerd',
	'1995-03-30',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ibrahima',
	'Konate',
	'1999-05-29',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'John',
	'Stones',
	'1994-05-28',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Luke',
	'Shaw',
	'1995-07-12',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'James',
	'Ward-Prowse',
	'1994-11-01',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Leandro',
	'Trossard',
	'1994-12-04',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mateo',
	'Kovacic',
	'1994-05-06',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolas',
	'Jackson',
	'2001-11-20',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Mohamed',
	'Simakan',
	'1996-03-25',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Piero',
	'Hincapie',
	'2002-01-09',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Odilon',
	'Kosounou',
	'1998-01-04',
	get_column('@', 'fp_country@name@Benin', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Joao',
	'Pedro',
	'2000-09-20',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Manu',
	'Koné',
	'1999-05-17',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jean-Clair',
	'Todibo',
	'1999-01-30',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Oihan',
	'Sancet',
	'2000-04-25',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Pape Matar',
	'Sarr',
	'2002-09-14',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Cheick',
	'Doucoure',
	'2000-01-01',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Max',
	'Kilman',
	'1997-07-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Tino',
	'Livramento',
	'2002-11-18',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Ryan',
	'Gravenberch',
	'2002-05-16',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Benoit',
	'Badiashile',
	'2000-04-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Lutsharel',
	'Geertruida',
	'2000-11-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Ezri',
	'Konsa',
	'1992-11-23',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'David',
	'Hancko',
	'1997-12-13',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Edson',
	'Alvarez',
	'1997-11-24',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Ferran',
	'Torres',
	'2000-02-21',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Harvey',
	'Barnes',
	'1997-07-19',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Nico',
	'Schlotterbeck',
	'1996-12-12',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Diogo',
	'Dalot',
	'1999-10-18',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Rodrigo',
	'Bentancur',
	'1997-06-25',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Frank',
	'Anguissa',
	'1995-04-25',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ismael',
	'Bennacer',
	'1997-12-01',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Pervis',
	'Estupiñán',
	'1998-01-21',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Joe',
	'Willock',
	'1999-08-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Eddie',
	'Nketiah',
	'1998-05-30',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Tammy',
	'Abraham',
	'1997-10-02',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Donyell',
	'Malen',
	'1999-01-21',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Tomas',
	'Soucek',
	'1995-02-27',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Sergej',
	'Milinkovic-Savic',
	'1997-02-20',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'David',
	'Raya',
	'1995-09-15',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Joachim',
	'Andersen',
	'1996-02-13',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ivan',
	'Toney',
	'1998-10-16',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Andrew',
	'Robertson',
	'1994-03-11',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Alejandro',
	'Grimaldo',
	'1991-09-20',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Jan',
	'Oblak',
	'1993-01-07',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Thibaut',
	'Courtois',
	'1992-05-11',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Romelu',
	'Lukaku',
	'1993-05-13',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Marc-André',
	'ter Stegen',
	'1992-04-30',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Lionel',
	'Messi',
	'1987-06-24',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Manuel',
	'Locatelli',
	'1998-01-08',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Matheus',
	'Cunha',
	'1994-05-27',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Wesley',
	'Fofana',
	'2000-12-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ibrahim',
	'Sangare',
	'1997-09-16',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Christian',
	'Pulisic',
	'1998-09-17',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Virgil',
	'van Dijk',
	'1991-07-08',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Arthur',
	'Vermeeren',
	'2001-03-14',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Alejandro',
	'Garnacho',
	'2004-07-01',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bradley',
	'Barcola',
	'2002-02-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Gabri',
	'Veiga',
	'1999-07-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Benjamin',
	'Sesko',
	'2003-05-31',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Aaron',
	'Hickey',
	'2002-06-10',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Yeremy',
	'Pino',
	'2002-01-20',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Harvey',
	'Elliott',
	'2003-04-04',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Malick',
	'Thiaw',
	'2001-08-04',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Folarin',
	'Balogun',
	'2001-07-03',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Giorgi',
	'Mamardashvili',
	'2000-09-16',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Kiernan',
	'Dewsbury-Hall',
	'1998-09-21',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Youssoufa',
	'Moukoko',
	'2004-11-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Ansu',
	'Fati',
	'2002-10-31',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Orkun',
	'Kokcu',
	'2001-01-25',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joshua',
	'Zirkzee',
	'2001-05-22',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Curtis',
	'Jones',
	'2000-04-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Yves',
	'Bissouma',
	'1996-08-15',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ademola',
	'Lookman',
	'1995-10-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Robert',
	'Sanchez',
	'1997-11-18',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Davide',
	'Frattesi',
	'1994-07-22',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Leon',
	'Bailey',
	'1997-08-03',
	get_column('@', 'fp_country@name@Jamaica', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Fabian',
	'Ruiz',
	'1996-04-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Noussair',
	'Mazraoui',
	'1997-11-14',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Takehiro',
	'Tomiyasu',
	'1998-11-16',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Denzel',
	'Dumfries',
	'1995-04-18',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightMidfield', 'id')::integer,
	'MF'
),
(
	'Mathias',
	'Jensen',
	'1999-01-23',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ben',
	'Chilwell',
	'1996-12-21',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Guglielmo',
	'Vicario',
	'1996-04-27',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Marcos',
	'Llorente',
	'1995-01-01',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Miguel',
	'Almiron',
	'1994-02-10',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Aleksandr',
	'Golovin',
	'1996-05-30',
	get_column('@', 'fp_country@name@Russian Federation', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Rodrigo',
	'de Paul',
	'1994-05-27',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jose Maria',
	'Gimenez',
	'1995-01-20',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jose',
	'Gaya',
	'1993-05-25',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'John',
	'McGinnis',
	'1994-10-18',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'David',
	'Alaba',
	'1992-06-24',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Hugo',
	'Larsson',
	'1998-04-20',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jamie',
	'Bynoe-Gittens',
	'2002-08-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Rayan',
	'Ait-Nouri',
	'2001-06-06',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Armando',
	'Broja',
	'1999-09-06',
	get_column('@', 'fp_country@name@Albania', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Youssouf',
	'Fofana',
	'1999-10-28',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Fabio',
	'Vieira',
	'2001-06-13',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Karim',
	'Adeyemi',
	'2002-01-18',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Aaron',
	'Ramsdale',
	'1998-05-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Pedro',
	'Goncalves',
	'2000-06-19',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Matty',
	'Cash',
	'1993-07-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Amine',
	'Gouiri',
	'2001-02-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Vitaliy',
	'Mykolenko',
	'1999-05-29',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Kalvin',
	'Phillips',
	'1995-12-04',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Artem',
	'Dovbyk',
	'1996-06-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Scott',
	'McTominay',
	'1996-04-12',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Marcus',
	'Edwards',
	'2003-05-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Taiwo',
	'Awoniyi',
	'1998-08-10',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Sofyan',
	'Amrabat',
	'1996-02-21',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Alex',
	'Iwobi',
	'1996-05-14',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Xaver',
	'Schlager',
	'1995-09-28',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Konrad',
	'Laimer',
	'1997-01-24',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Pierre-Emile',
	'Højbjerg',
	'1995-08-05',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Emiliano',
	'Martinez',
	'1992-09-1',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Aleksandar',
	'Mitrović',
	'1994-09-16',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Thiago',
	'Almada',
	'2001-04-20',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Morten',
	'Hjulmand',
	'1999-08-25',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Leny',
	'Yoro',
	'1999-08-24',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Pablo',
	'Barrios',
	'2005-01-31',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Lesley',
	'Ugochukwu',
	'2004-04-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Samuel',
	'Lino',
	'2002-05-23',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Matias',
	'Soulé',
	'2003-08-15',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Marcos',
	'Leonardo',
	'2000-02-02',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Jarrad',
	'Branthwaite',
	'2003-06-17',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ilya',
	'Zabarnyi',
	'2002-09-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Simon',
	'Adingra',
	'2002-03-01',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Malo',
	'Gusto',
	'2003-05-06',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Rayan',
	'Cherki',
	'2003-02-17',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Pierre',
	'Kalulu',
	'2000-06-05',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Strahinja',
	'Pavlović',
	'1995-05-20',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Enzo',
	'Millot',
	'2001-11-25',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Alex',
	'Baena',
	'2001-10-07',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Mohamed',
	'Camara',
	'2000-01-07',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Terem',
	'Moffi',
	'1994-05-25',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Anatoliy',
	'Trubin',
	'2001-08-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Amine',
	'Adli',
	'2000-05-10',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Roger',
	'Ibanez',
	'1993-11-23',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jesper',
	'Lindstrom',
	'1999-02-27',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Noni',
	'Madueke',
	'2002-04-10',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Juan',
	'Foyth',
	'1998-01-12',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Kevin',
	'Schade',
	'2003-08-25',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'David',
	'Neres',
	'1997-03-03',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Nathan',
	'Collins',
	'1999-08-30',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Rodrigo',
	'Riquelme',
	'2000-05-12',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Charles',
	'De Ketelaere',
	'2001-03-10',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jakub',
	'Kiwior',
	'1998-02-26',
	get_column('@', 'fp_country@name@Poland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Perr',
	'Schuurs',
	'1999-11-26',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Felix',
	'Nmecha',
	'1997-05-10',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jadon',
	'Sancho',
	'2000-03-25',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Emile',
	'Smith Rowe',
	'2000-12-16',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolò',
	'Zaniolo',
	'1999-07-22',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jonas',
	'Wind',
	'1999-02-03',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Yoane',
	'Wissa',
	'1996-01-12',
	get_column('@', 'fp_country@name@Democratic Republic of the Congo', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Lovro',
	'Majer',
	'1998-01-17',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Sean',
	'Longstaff',
	'1997-01-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Rico',
	'Henry',
	'1993-10-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Vangelis',
	'Pavlidis',
	'1998-11-22',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Gianluca',
	'Scamacca',
	'1999-01-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Lorenzo',
	'Pellegrini',
	'1993-06-19',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Marc',
	'Cucurella',
	'1998-07-22',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Mattia',
	'Zaccagni',
	'1994-05-17',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mario',
	'Hermoso',
	'1995-04-18',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Viktor',
	'Tsygankov',
	'1991-11-17',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Unai',
	'Simon',
	'1997-02-21',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Dominic',
	'Solanke',
	'1997-01-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Iñaki',
	'Williams',
	'1994-06-12',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Enes',
	'Ünal',
	'1997-05-10',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Thomas',
	'Partey',
	'1993-06-13',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Paulo',
	'Dybala',
	'1993-11-21',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Ruben',
	'Loftus-Cheek',
	'1991-01-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jonathan',
	'Tah',
	'1991-02-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Aymeric',
	'Laporte',
	'1994-05-27',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Raphaël',
	'Varane',
	'1993-04-25',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Kurt',
	'Zouma',
	'1994-03-27',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Antoine',
	'Griezmann',
	'1991-03-05',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Marco',
	'Verratti',
	'1992-11-05',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Antonio',
	'Rüdiger',
	'1993-03-31',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Willian',
	'Pacho',
	'1998-04-17',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Joey',
	'Veerman',
	'1998-11-29',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Eljif',
	'Elmas',
	'1994-03-24',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Guido',
	'Rodríguez',
	'1989-04-10',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Christoph',
	'Baumgartner',
	'1999-08-12',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Quilindschy',
	'Hartman',
	'1998-01-13',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Yunus',
	'Musah',
	'2002-11-29',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Tijjani',
	'Reijnders',
	'2000-10-17',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Samuel',
	'Chukwueze',
	'1998-05-22',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Nathan',
	'Tella',
	'1999-07-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Weston',
	'McKennie',
	'1998-08-28',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jorrel',
	'Hato',
	'1997-04-07',
	get_column('@', 'fp_country@name@Curaçao', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'João',
	'Gomes',
	'2001-07-20',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Tyrick',
	'Mitchell',
	'1994-01-20',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Julio',
	'Enciso',
	'2000-07-24',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Bilal',
	'El Khannouss',
	'2000-05-10',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Kang-in',
	'Lee',
	'2001-02-03',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Taylor',
	'Harwood-Bellis',
	'2002-01-30',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Sacha',
	'Boey',
	'2002-09-16',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Facundo',
	'Medina',
	'1990-08-28',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Martin',
	'Terrier',
	'1991-03-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Quinten',
	'Timber',
	'2000-06-21',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jack',
	'Harrison',
	'1996-05-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Alessandro',
	'Buongiorno',
	'1999-02-03',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Igor',
	'Zubeldia',
	'1997-08-31',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Hiroki',
	'Ito',
	'1999-05-12',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jerdy',
	'Schouten',
	'1991-01-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Konstantinos',
	'Tsimikas',
	'1991-10-12',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Denis',
	'Zakaria',
	'1996-11-20',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Emiliano',
	'Buendia',
	'1989-12-16',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Philip',
	'Billing',
	'1996-09-11',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Hirving',
	'Lozano',
	'1992-07-30',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Dominic',
	'Calvert-Lewin',
	'1997-03-16',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Hee-Chan',
	'Hwang',
	'1996-01-26',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Said',
	'Benrahma',
	'1995-08-19',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Orel',
	'Mangala',
	'1993-02-18',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Issa',
	'Diop',
	'1997-01-06',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Vitaly',
	'Janelt',
	'1998-03-10',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Kevin',
	'Danso',
	'1997-09-19',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Joe',
	'Gomez',
	'1997-04-23',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Patrik',
	'Schick',
	'1992-01-24',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Solly',
	'March',
	'1994-07-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-07-17',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Niklas',
	'Süle',
	'1995-09-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jordan',
	'Pickford',
	'1994-03-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Samu',
	'Omordion',
	'1999-01-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Carlos',
	'Baleba',
	'2000-12-16',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Alex',
	'Scott',
	'1998-08-25',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Javi',
	'Guerra',
	'1998-01-29',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Dango',
	'Ouattara',
	'2001-01-06',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Milos',
	'Kerkez',
	'2003-06-26',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'El Bilal',
	'Touré',
	'1996-05-03',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Enzo',
	'Le Fée',
	'2000-02-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Ander',
	'Barrenetxea',
	'2001-12-28',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Arnaud',
	'Kalimuendo',
	'2002-01-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Dwight',
	'McNeil',
	'1993-11-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Radu',
	'Dragusin',
	'2002-02-03',
	get_column('@', 'fp_country@name@Romania', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Lazar',
	'Samardžić',
	'2002-03-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Miguel',
	'Gutiérrez',
	'2002-07-15',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Dani',
	'Vivian',
	'1999-08-17',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Amar',
	'Dedić',
	'1999-07-28',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'James',
	'Garner',
	'2001-03-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Giovanni',
	'Reyna',
	'2002-11-13',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Ian',
	'Maatsen',
	'2002-04-15',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Aaron',
	'Wan-Bissaka',
	'1997-11-26',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Renan',
	'Lodi',
	'1999-04-08',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Marcos',
	'Sénesi',
	'1997-05-10',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Samuele',
	'Ricci',
	'2000-08-19',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Matteo',
	'Guendouzi',
	'1999-04-13',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Maxence',
	'Lacroix',
	'2000-04-04',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Caio',
	'Henrique',
	'1997-08-31',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Ismaila',
	'Sarr',
	'1998-02-23',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Nicolas',
	'Seiwald',
	'2001-06-04',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Angel',
	'Gomes',
	'2000-08-31',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolò',
	'Casale',
	'1998-12-14',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Yangel',
	'Herrera',
	'1991-01-07',
	get_column('@', 'fp_country@name@Venezuela', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'André',
	'Almeida',
	'1990-09-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Carlos',
	'Soler',
	'1997-01-02',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ferdi',
	'Kadıoğlu',
	'1996-07-13',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Arthur',
	'Theate',
	'2000-04-25',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Daichi',
	'Kamada',
	'1996-01-06',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Antonee',
	'Robinson',
	'1997-08-28',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Noah',
	'Okafor',
	'1999-05-10',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Odsonne',
	'Édouard',
	'1998-01-01',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kyle',
	'Walker-Peters',
	'1997-04-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Noa',
	'Lang',
	'1999-06-17',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Ermedin',
	'Demirović',
	'1998-03-03',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Sander',
	'Berge',
	'1994-02-02',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
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
	'II_PART',
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
	'I_PART',
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
	'I_PART',
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
	'I_PART',
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
	'II_PART',
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
	'I_PART',
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
	'II_PART',
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
	'I_PART',
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
	'II_PART',
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
	CAST('II_PART' AS en_season),
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
	CAST('II_PART' AS en_season),
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
	CAST('II_PART' AS en_season),
	CAST(2018 AS smallint),
	CAST('I_PART' AS en_season)
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
	CAST('II_PART' AS en_season),
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



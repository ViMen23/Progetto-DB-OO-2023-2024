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
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Pierluigi',
	'Gollini',
	'1995-03-18',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Salvatore',
	'Sirigu',
	'1987-01-12',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Hubert',
	'Idasiak',
	'2002-02-03',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Poland')
),
(
	'Valerio',
	'Boffelli',
	'2004-09-04',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Davide',
	'Marfella',
	'1999-09-15',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Min-jae',
	'Kim',
	'1996-11-15',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@South Korea')
),
(
	'Amir',
	'Rrahmani',
	'1994-02-24',
	'EITHER',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Jugoslavia')
),
(
	'Leo Skiri',
	'Østigård',
	'1999-11-28',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Norway')
),
(
	'Juan Guilherme Nunes',
	'Jesus',
	'1991-06-10',
	'LEFT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Brazil')
),
(
	'Mathías',
	'Olivera',
	'1991-05-27',
	'LEFT',
	get_id('@', 'fp_position@name@Left-Back'),
	'DF',
	get_id('@', 'fp_country@name@Uruguay')
),
(
	'Mário',
	'Rui',
	'1997-03-22',
	'LEFT',
	get_id('@', 'fp_position@name@Left-Back'),
	'DF',
	get_id('@', 'fp_country@name@Portugal')
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-08-04',
	'RIGHT',
	get_id('@', 'fp_position@name@Right-Back'),
	'DF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Alessandro',
	'Zanoli',
	'2000-10-03',
	'RIGHT',
	get_id('@', 'fp_position@name@Right-Back'),
	'DF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Bartosz',
	'Bereszyński',
	'1992-07-12',
	'RIGHT',
	get_id('@', 'fp_position@name@Right-Back'),
	'DF',
	get_id('@', 'fp_country@name@Poland')
),
(
	'Stanislav',
	'Lobotka',
	'1994-11-25',
	'EITHER',
	get_id('@', 'fp_position@name@Defensive Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Slovakia')
),
(
	'Diego',
	'Demme',
	'1991-11-21',
	'RIGHT',
	get_id('@', 'fp_position@name@Defensive Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Germany')
),
(
	'André-Frank Zambo',
	'Anguissa',
	'1995-11-16',
	'RIGHT',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Cameroon')
),
(
	'Piotr Sebastian',
	'Zieliński',
	'1994-05-20',
	'EITHER',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Poland')
),
(
	'Tanguy',
	'Ndombélé',
	'1996-12-28',
	'RIGHT',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@France')
),
(
	'Karim',
	'Zedadka',
	'2000-06-09',
	'RIGHT',
	get_id('@', 'fp_position@name@Left Midfield'),
	'MF',
	get_id('@', 'fp_country@name@France')
),
(
	'Eljif',
	'Elmas',
	'1999-09-24',
	'RIGHT',
	get_id('@', 'fp_position@name@Attacking Midfield'),
	'MF',
	get_id('@', 'fp_country@name@North Macedonia')
),
(
	'Gianluca',
	'Gaetano',
	'2000-05-05',
	'RIGHT',
	get_id('@', 'fp_position@name@Attacking Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Khvicha',
	'Kvaratskhelia',
	'2001-02-12',
	'EITHER',
	get_id('@', 'fp_position@name@Left Winger'),
	'FW',
	get_id('@', 'fp_country@name@Georgia')
),
(
	'Alessio',
	'Zerbin',
	'1999-03-03',
	'RIGHT',
	get_id('@', 'fp_position@name@Left Winger'),
	'FW',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Hirving Rodrigo',
	'Lozano',
	'1995-07-30',
	'RIGHT',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@Mexico')
),
(
	'Matteo',
	'Politano',
	'1993-08-03',
	'LEFT',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Adam',
	'Ounas',
	'1996-11-11',
	'LEFT',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@France')
),
(
	'Giacomo',
	'Raspadori',
	'2000-02-18',
	'EITHER',
	get_id('@', 'fp_position@name@Second Striker'),
	'FW',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Victor James',
	'Osimhen',
	'1998-12-29',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre Forward'),
	'FW',
	get_id('@', 'fp_country@name@Nigeria')
),
(
	'Giovanni Pablo',
	'Simeone',
	'1995-07-05',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre Forward'),
	'FW',
	get_id('@', 'fp_country@name@Argentina')
),
(
	'Ivan',
	'Provedel',
	'1994-03-17',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Christos',
	'Mandas',
	'2001-09-17',
	'RIGHT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Greece')
),
(
	'Luigi',
	'Sepe',
	'1991-05-08',
	'LEFT',
	get_id('@', 'fp_position@name@Goalkeeper'),
	'GK',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Nicolò',
	'Casale',
	'1998-02-14',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Alessio',
	'Romagnoli',
	'1995-01-12',
	'LEFT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Patricio Gabarrón',
	'Gil',
	'1993-04-17',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Spain')
),
(
	'Mario',
	'Gila',
	'2000-08-29',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre-Back'),
	'DF',
	get_id('@', 'fp_country@name@Spain')
),
(
	'Luca',
	'Pellegrini',
	'1999-03-07',
	'LEFT',
	get_id('@', 'fp_position@name@Left-Back'),
	'DF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Dimitrije',
	'Kamenović',
	'2000-07-16',
	'LEFT',
	get_id('@', 'fp_position@name@Left-Back'),
	'DF',
	get_id('@', 'fp_country@name@Jugoslavia')
),
(
	'Adam',
	'Marusic',
	'1992-10-17',
	'RIGHT',
	get_id('@', 'fp_position@name@Right-Back'),
	'DF',
	get_id('@', 'fp_country@name@Jugoslavia')
),
(
	'Elseid Gëzim',
	'Hysaj',
	'1994-02-02',
	'RIGHT',
	get_id('@', 'fp_position@name@Right-Back'),
	'DF',
	get_id('@', 'fp_country@name@Albania')
),
(
	'Nicolò',
	'Rovella',
	'2001-12-04',
	'RIGHT',
	get_id('@', 'fp_position@name@Defensive Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Danilo',
	'Cataldi',
	'1994-08-06',
	'RIGHT',
	get_id('@', 'fp_position@name@Defensive Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Mattéo Elias Kenzo',
	'Guendouzi',
	'1999-04-14',
	'RIGHT',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@France')
),
(
	'Luis',
	'Alberto',
	'1992-09-28',
	'RIGHT',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Spain')
),
(
	'Matías',
	'Vecino',
	'1991-08-24',
	'RIGHT',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Uruguay')
),
(
	'Manuel',
	'Lazzari',
	'1993-11-29',
	'RIGHT',
	get_id('@', 'fp_position@name@Right Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Daichi',
	'Kamada',
	'1996-08-05',
	'RIGHT',
	get_id('@', 'fp_position@name@Attacking Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Japan')
),
(
	'André',
	'Anderson',
	'1999-09-23',
	'RIGHT',
	get_id('@', 'fp_position@name@Attacking Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Brazil')
),
(
	'Mattia',
	'Zaccagni',
	'1995-06-16',
	'RIGHT',
	get_id('@', 'fp_position@name@Left Winger'),
	'FW',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Diego Luis',
	'González',
	'2003-01-07',
	'LEFT',
	get_id('@', 'fp_position@name@Left Winger'),
	'FW',
	get_id('@', 'fp_country@name@Paraguay')
),
(
	'Saná Eusébio Mango',
	'Fernandes',
	'2006-03-10',
	'RIGHT',
	get_id('@', 'fp_position@name@Left Winger'),
	'FW',
	get_id('@', 'fp_country@name@Guinea-Bissau')
),
(
	'Gustav Tang',
	'Isaksen',
	'2001-04-19',
	'EITHER',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@Denmark')
),
(
	'Felipe',
	'Anderson',
	'1993-04-15',
	'RIGHT',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@Brazil')
),
(
	'Pedro Eliezer',
	'Rodríguez',
	'1987-07-28',
	'EITHER',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@Spain')
),
(
	'Cristiano',
	'Lombardi',
	'1995-08-19',
	'RIGHT',
	get_id('@', 'fp_position@name@Right Winger'),
	'FW',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Taty',
	'Castellanos',
	'1998-10-03',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre Forward'),
	'FW',
	get_id('@', 'fp_country@name@Argentina')
),
(
	'Ciro',
	'Immobile',
	'1990-02-20',
	'RIGHT',
	get_id('@', 'fp_position@name@Centre Forward'),
	'FW',
	get_id('@', 'fp_country@name@Italy')
),
(
	'Sergej',
	'Milinkovic-Savic',
	'1995-02-27',
	'RIGHT',
	get_id('@', 'fp_position@name@Central Midfield'),
	'MF',
	get_id('@', 'fp_country@name@Spain')
);
--------------------------------------------------------------------------------

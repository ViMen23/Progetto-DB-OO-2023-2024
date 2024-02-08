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

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


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
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'BOL',
	'Bologna FC',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'CRE',
	'US Cremonese',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'EMP',
	'Empoli FC',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'FIO',
	'ACF Fiorentina',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'INT',
	'Inter',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'JUV',
	'Juventus FC',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'LAZ',
	'SS Lazio',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'LEC',
	'US Lecce',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'MIL',
	'AC Milan',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'MON',
	'AC Monza',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'NAP',
	'SSC Napoli',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'ROM',
	'AS Roma',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'SAL',
	'US Salernitana',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'SAM',
	'UC Sampdoria',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'SAS',
	'US Sassuolo',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'SPE',
	'Spezia Calcio',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'TOR',
	'Torino FC',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'UDI',
	'Udinese Calcio',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'VER',
	'Hellas Verona',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'FRO',
	'Frosinone Calcio',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'GEN',
	'Genoa CFC',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'CAG',
	'Cagliari Calcio',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'WOL',
	'VfL Wolfsburg',
	get_id('@', 'fp_country@name@Germany')
),
(
	'CLUB',
	'CHA',
	'RSC Charleroi',
	get_id('@', 'fp_country@name@Belgium')
),
(
	'CLUB',
	'LIL',
	'LOSC Lille',
	get_id('@', 'fp_country@name@France')
),
(
	'CLUB',
	'SPA',
	'SPAL',
	get_id('@', 'fp_country@name@Italy')
),
(
	'CLUB',
	'VOJ',
	'Fudbalski klub Vojvodina',
	get_id('@', 'fp_country@name@Serbia')
),
(
	'CLUB',
	'GEN',
	'Koninklijke Racing Club Genk',
	get_id('@', 'fp_country@name@Belgium')
),
(
	'CLUB',
	'HIL',
	'Al-Hilal SFC',
	get_id('@', 'fp_country@name@Saudi Arabia')
);
--------------------------------------------------------------------------------


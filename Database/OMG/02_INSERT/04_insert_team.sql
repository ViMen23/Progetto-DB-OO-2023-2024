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
 * INSERT FP_TEAM
 ******************************************************************************/


INSERT INTO fp_team (type, name, country_id, confederation_id)
VALUES
(
	'CLUB',
	'Atalanta',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Bologna FC',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Cremonese',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Empoli FC',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'ACF Fiorentina',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Inter',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Juventus FC',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'SS Lazio',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Lecce',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'AC Milan',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'AC Monza',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'SSC Napoli',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'AS Roma',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Salernitana',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'UC Sampdoria',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'US Sassuolo',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Spezia Calcio',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Torino FC',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Udinese Calcio',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Hellas Verona',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Frosinone Calcio',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Genoa CFC',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'Cagliari Calcio',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'CLUB',
	'VfL Wolfsburg',
	get_id('@', 'fp_country@name@Germany'),
	get_id('@', 'fp_confederation@long_name@Deutscher Fußball-Bund')
),
(
	'CLUB',
	'RSC Charleroi',
	get_id('@', 'fp_country@name@Belgium'),
	get_id('@', 'fp_confederation@long_name@Royal Belgian Football Association')
),
(
	'CLUB',
	'LOSC Lille',
	get_id('@', 'fp_country@name@France'),
	get_id('@', 'fp_confederation@long_name@Fédération Française de Football')
),
(
	'CLUB',
	'SPAL',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
),
(
	'NATIONAL',
	'ITALIA',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Federazione Italiana Giuoco Calcio')
);
--------------------------------------------------------------------------------


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
 * INSERT CONFEDERATION
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'FIFA',
	'Fédération Internationale de Football Association',
	get_id('@', 'country@name@World'),
	NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT CONTINENT TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'CAF',
	'Confederation of African Football',
	get_id('@', 'country@name@Africa'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
	
),
(
	'AFC',
	'Asian Football Confederation',
	get_id('@', 'country@name@Asia'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'CONCACAF',
	'Confederation of North and Central America and Caribbean Association Football',
	get_id('@', 'country@name@North Center America'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'CONMEBOL',
	'Confederación Sudamericana de Fútbol',
	get_id('@', 'country@name@South America'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'OFC',
	'Oceania Football Confederation',
	get_id('@', 'country@name@Oceania'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
),
(
	'UEFA',
	'Union of European Football Associations',
	get_id('@', 'country@name@Europe'),
	get_id('@', 'confederation@long_name@Fédération Internationale de Football Association')
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT NATION TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'AFF',
	'Afghanistan Football Federation',
	get_id('@', 'country@name@Afghanistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')	
),
(
	'FAF',
	'Angolan Football Federation',
	get_id('@', 'country@name@Angola'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSHF',
	'Federata Shqiptare e Futbollit',
	get_id('@', 'country@name@Albania'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FAF',
	'Federació Andorrana de Futbol',
	get_id('@', 'country@name@Andorra'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'UAEFA',
	'UAE Football Association',
	get_id('@', 'country@name@United Arab Emirates'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'AFA',
	'Asociación del Fútbol Argentino',
	get_id('@', 'country@name@Argentina'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'FFA',
	'Football Federation of Armenia',
	get_id('@', 'country@name@Armenia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'ABFA',
	'Antigua and Barbuda Football Association',
	get_id('@', 'country@name@Antigua and Barbuda'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FFA',
	'Football Federation Australia',
	get_id('@', 'country@name@Australia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'ÖFB',
	'Österreichischer Fußball-Bund',
	get_id('@', 'country@name@Austria'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'AFFA',
	'Association of Football Federations of Azerbaijan',
	get_id('@', 'country@name@Azerbaijan'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFB',
	'Fédération de Football du Burundi',
	get_id('@', 'country@name@Burundi'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'KBVB',
	'Royal Belgian Football Association',
	get_id('@', 'country@name@Belgium'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FBF',
	'Fédération Béninoise de Football',
	get_id('@', 'country@name@Benin'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FBF',
	'Fédération Burkinabé de Football',
	get_id('@', 'country@name@Burkina Faso'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'BFF',
	'Bangladesh Football Federation',
	get_id('@', 'country@name@Bangladesh'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFU',
	'Bulgarian Football Union',
	get_id('@', 'country@name@Bulgaria'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'BFA',
	'Bahrain Football Association',
	get_id('@', 'country@name@Bahrain'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFA',
	'Bahamas Football Association',
	get_id('@', 'country@name@Bahamas'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'N/FSBiH',
	'Nogometni/Fudbalski Savez Bosne i Hercegovine',
	get_id('@', 'country@name@Bosnia and Herzegovina'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'BFF',
	'Football Federation of Belarus',
	get_id('@', 'country@name@Belarus'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFB',
	'Football Federation of Belize',
	get_id('@', 'country@name@Belize'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FBF',
	'Federación Boliviana de Fútbol',
	get_id('@', 'country@name@Bolivia'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'CBF',
	'Confederação Brasileira de Futebol',
	get_id('@', 'country@name@Brazil'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'BFA',
	'Barbados Football Association',
	get_id('@', 'country@name@Barbados'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'NFABD',
	'National Football Association of Brunei Darussalam',
	get_id('@', 'country@name@Brunei'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFF',
	'Bhutan Football Federation',
	get_id('@', 'country@name@Bhutan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'BFA',
	'Botswana Football Association',
	get_id('@', 'country@name@Botswana'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),

(
	'FCF',
	'Fédération Centrafricaine de Football',
	get_id('@', 'country@name@Central African Republic'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'CSA',
	'Canada Soccer',
	get_id('@', 'country@name@Canada'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'SFV',
	'Swiss Football Association',
	get_id('@', 'country@name@Switzerland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFCh',
	'Federación de Fútbol de Chile',
	get_id('@', 'country@name@Chile'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'CFA',
	'Chinese Football Association',
	get_id('@', 'country@name@China'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FIF',
	'Fédération Ivoirienne de Football',
	get_id('@', 'country@name@Côte d''Ivoire'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FECAFOOT',
	'Fédération Camerounaise de Football',
	get_id('@', 'country@name@Cameroon'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FECOFA',
	'Fédération Congolaise de Football-Association',
	get_id('@', 'country@name@Democratic Republic of the Congo'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FECOFOOT',
	'Fédération Congolaise de Football',
	get_id('@', 'country@name@Congo'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FCF',
	'Federación Colombiana de Fútbol',
	get_id('@', 'country@name@Colombia'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'FFC',
	'Fédération Comorienne de Football',
	get_id('@', 'country@name@Comoros'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FCF',
	'Federação Caboverdiana de Futebol',
	get_id('@', 'country@name@Cabo Verde'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FEDEFUTBOL',
	'Federación Costarricense de Fútbol',
	get_id('@', 'country@name@Costa Rica'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'AFC',
	'Asociación de Fútbol de Cuba',
	get_id('@', 'country@name@Cuba'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FFK',
	'Federashon Futbòl Kòrsou',
	get_id('@', 'country@name@Curaçao'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'CFA',
	'Cyprus Football Association',
	get_id('@', 'country@name@Cyprus'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FAČR',
	'Fotbalová asociace České republiky',
	get_id('@', 'country@name@Czech Republic'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'DFB',
	'Deutscher Fußball-Bund',
	get_id('@', 'country@name@Germany'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FDF',
	'Fédération Djiboutienne de Football',
	get_id('@', 'country@name@Djibouti'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'DFA',
	'Dominica Football Association',
	get_id('@', 'country@name@Dominica'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'DBU',
	'Dansk Boldspil-Union',
	get_id('@', 'country@name@Denmark'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FEDOFUTBOL',
	'Federación Dominicana de Fútbol',
	get_id('@', 'country@name@Dominican Republic'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FAF',
	'Fédération Algérienne de Football',
	get_id('@', 'country@name@Algeria'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FEF',
	'Federación Ecuatoriana de Fútbol',
	get_id('@', 'country@name@Ecuador'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'EFA',
	'Egyptian Football Association',
	get_id('@', 'country@name@Egypt'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FA',
	'The Football Association',
	get_id('@', 'country@name@England'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'ENFF',
	'Eritrean National Football Federation',
	get_id('@', 'country@name@Eritrea'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'RFEF',
	'Real Federación Española de Fútbol',
	get_id('@', 'country@name@Spain'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'EJL',
	'Eesti Jalgpalli Liit',
	get_id('@', 'country@name@Estonia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'EFF',
	'Ethiopian Football Federation',
	get_id('@', 'country@name@Ethiopia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SPL',
	'Suomen Palloliitto',
	get_id('@', 'country@name@Finland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFA',
	'Fiji Football Association',
	get_id('@', 'country@name@Fiji'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FFF',
	'Fédération Française de Football',
	get_id('@', 'country@name@France'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FSMFA',
	'Federated States of Micronesia Football Association',
	get_id('@', 'country@name@Micronesia'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FEGAFOOT',
	'Fédération Gabonaise de Football',
	get_id('@', 'country@name@Gabon'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'GFF',
	'Georgian Football Federation',
	get_id('@', 'country@name@Georgia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'GFA',
	'Ghana Football Association',
	get_id('@', 'country@name@Ghana'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FGF',
	'Fédération Guinéenne de Football',
	get_id('@', 'country@name@Guinea'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'GFF',
	'Gambia Football Federation',
	get_id('@', 'country@name@Gambia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FFGB',
	'Federação de Futebol da Guiné-Bissau',
	get_id('@', 'country@name@Guinea-Bissau'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FEGUIFUT',
	'Federación Ecuatoguineana de Fútbol',
	get_id('@', 'country@name@Equatorial Guinea'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'EPO',
	'Hellenic Football Federation',
	get_id('@', 'country@name@Greece'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'GFA',
	'Grenada Football Association',
	get_id('@', 'country@name@Grenada'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FENAFUTH',
	'Federación Nacional de Fútbol de Guatemala',
	get_id('@', 'country@name@Guatemala'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'GFF',
	'Guyana Football Federation',
	get_id('@', 'country@name@Guyana'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FENAFUTH',
	'Federación Nacional Autónoma de Fútbol de Honduras',
	get_id('@', 'country@name@Honduras'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'HNS',
	'Hrvatski nogometni savez',
	get_id('@', 'country@name@Croatia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FHF',
	'Fédération Haïtienne de Football',
	get_id('@', 'country@name@Haiti'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'MLSZ',
	'Magyar Labdarúgó Szövetség',
	get_id('@', 'country@name@Hungary'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'PSSI',
	'Indonesian Football Association',
	get_id('@', 'country@name@Indonesia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'AIFF',
	'All India Football Federation',
	get_id('@', 'country@name@India'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FAI',
	'Football Association of Ireland',
	get_id('@', 'country@name@Ireland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFIRI',
	'Football Federation Islamic Republic of Iran',
	get_id('@', 'country@name@Iran'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'IFA',
	'Iraq Football Association',
	get_id('@', 'country@name@Iraq'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'KSÍ',
	'Knattspyrnusamband Íslands',
	get_id('@', 'country@name@Iceland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'IFA',
	'Israel Football Association',
	get_id('@', 'country@name@Israel'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FIGC',
	'Federazione Italiana Giuoco Calcio',
	get_id('@', 'country@name@Italy'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'JFF',
	'Jamaica Football Federation',
	get_id('@', 'country@name@Jamaica'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'JFA',
	'Jordan Football Association',
	get_id('@', 'country@name@Jordan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'JFA',
	'Japan Football Association',
	get_id('@', 'country@name@Japan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFK',
	'Football Federation of Kazakhstan',
	get_id('@', 'country@name@Kazakhstan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FKF',
	'Football Kenya Federation',
	get_id('@', 'country@name@Kenya'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FFKR',
	'Football Federation of the Kyrgyz Republic',
	get_id('@', 'country@name@Kyrgyzstan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFC',
	'Football Federation of Cambodia',
	get_id('@', 'country@name@Cambodia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'KIFA',
	'Kiribati Islands Football Association',
	get_id('@', 'country@name@Kiribati'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'SKNFA',
	'Saint Kitts and Nevis Football Association',
	get_id('@', 'country@name@Saint Kitts and Nevis'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'KFA',
	'Korea Football Association',
	get_id('@', 'country@name@South Korea'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'KFA',
	'Kuwait Football Association',
	get_id('@', 'country@name@Kuwait'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFF',
	'Lao Football Federation',
	get_id('@', 'country@name@Lao People''s Democratic Republic'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Lebanese Football Association',
	get_id('@', 'country@name@Lebanon'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Liberia Football Association',
	get_id('@', 'country@name@Liberia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'LFF',
	'Libyan Football Federation',
	get_id('@', 'country@name@Libya'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SLFA',
	'Saint Lucia Football Association',
	get_id('@', 'country@name@Saint Lucia'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'LFV',
	'Liechtensteiner Fussballverband',
	get_id('@', 'country@name@Liechtenstein'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFSL',
	'Football Federation of Sri Lanka',
	get_id('@', 'country@name@Sri Lanka'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Lesotho Football Association',
	get_id('@', 'country@name@Lesotho'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'LFF',
	'Lithuanian Football Federation',
	get_id('@', 'country@name@Lithuania'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FLF',
	'Luxembourg Football Federation',
	get_id('@', 'country@name@Luxembourg'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'LFF',
	'Latvijas Futbola federācija',
	get_id('@', 'country@name@Latvia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FRMF',
	'Royal Moroccan Football Federation',
	get_id('@', 'country@name@Morocco'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FMF',
	'Fédération Monegasque de Football',
	get_id('@', 'country@name@Monaco'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FMF',
	'Federația Moldovenească de Fotbal',
	get_id('@', 'country@name@Moldova'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FMF',
	'Fédération Malagasy de Football',
	get_id('@', 'country@name@Madagascar'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Maldives',
	get_id('@', 'country@name@Maldives'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FMF',
	'Federación Mexicana de Fútbol Asociación',
	get_id('@', 'country@name@Mexico'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'MISA',
	'Marshall Islands Soccer Association',
	get_id('@', 'country@name@Marshall Islands'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FFM',
	'Football Federation of North Macedonia',
	get_id('@', 'country@name@North Macedonia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FEMAFOOT',
	'Fédération Malienne de Football',
	get_id('@', 'country@name@Mali'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'MFA',
	'Malta Football Association',
	get_id('@', 'country@name@Malta'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'MFF',
	'Myanmar Football Federation',
	get_id('@', 'country@name@Myanmar'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FSCG',
	'Fudbalski Savez Crne Gore',
	get_id('@', 'country@name@Montenegro'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'MFF',
	'Mongolian Football Federation',
	get_id('@', 'country@name@Mongolia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FMF',
	'Federação Moçambicana de Futebol',
	get_id('@', 'country@name@Mozambique'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FFRIM',
	'Fédération de Football de la République Islamique de Mauritanie',
	get_id('@', 'country@name@Mauritania'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'MFA',
	'Mauritius Football Association',
	get_id('@', 'country@name@Mauritius'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Malawi',
	get_id('@', 'country@name@Malawi'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Malaysia',
	get_id('@', 'country@name@Malaysia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'NFA',
	'Namibia Football Association',
	get_id('@', 'country@name@Namibia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FENIFOOT',
	'Fédération Nigerienne de Football',
	get_id('@', 'country@name@Niger'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'NFF',
	'Nigeria Football Federation',
	get_id('@', 'country@name@Nigeria'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FENIFUT',
	'Federación Nicaragüense de Fútbol',
	get_id('@', 'country@name@Nicaragua'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'IFA',
	'Irish Football Association',
	get_id('@', 'country@name@Northern Ireland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'NISA',
	'Niue Island Soccer Association',
	get_id('@', 'country@name@Niue'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'KNVB',
	'Koninklijke Nederlandse Voetbalbond',
	get_id('@', 'country@name@Netherlands'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'NFF',
	'Norges Fotballforbund',
	get_id('@', 'country@name@Norway'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'ANFA',
	'All Nepal Football Association',
	get_id('@', 'country@name@Nepal'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')	
),
(
	'NFA',
	'Nauru Football Association',
	get_id('@', 'country@name@Nauru'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'NZF',
	'New Zealand Football',
	get_id('@', 'country@name@New Zealand'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'OFA',
	'Oman Football Association',
	get_id('@', 'country@name@Oman'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'PFF',
	'Pakistan Football Federation',
	get_id('@', 'country@name@Pakistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FEPAFUT',
	'Federación Panameña de Fútbol',
	get_id('@', 'country@name@Panama'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FPF',
	'Federación Peruana de Futbol',
	get_id('@', 'country@name@Peru'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'PFF',
	'Philippine Football Federation',
	get_id('@', 'country@name@Philippines'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'PFA',
	'Palau Football Association',
	get_id('@', 'country@name@Palau'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'PNGFA',
	'Papua New Guinea Football Association',
	get_id('@', 'country@name@Papua New Guinea'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'PZPN',
	'Polski Związek Piłki Nożnej',
	get_id('@', 'country@name@Poland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FPF',
	'Federación Puertorriqueña de Fútbol',
	get_id('@', 'country@name@Puerto Rico'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'DPRK FA',
	'DPR Korea Football Association',
	get_id('@', 'country@name@North Korea'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FPF',
	'Federação Portuguesa de Futebol',
	get_id('@', 'country@name@Portugal'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'APF',
	'Asociación Paraguaya de Fútbol',
	get_id('@', 'country@name@Paraguay'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'PFA',
	'Palestine Football Association',
	get_id('@', 'country@name@Palestine'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'QFA',
	'Qatar Football Association',
	get_id('@', 'country@name@Qatar'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FRF',
	'Federația Română de Fotbal',
	get_id('@', 'country@name@Romania'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'RFU',
	'Russian Football Union',
	get_id('@', 'country@name@Russian Federation'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FERWAFA',
	'Fédération Rwandaise de Football Association',
	get_id('@', 'country@name@Rwanda'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SAFF',
	'Saudi Arabian Football Federation',
	get_id('@', 'country@name@Saudi Arabia'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SFA',
	'Scottish Football Association',
	get_id('@', 'country@name@Scotland'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SFA',
	'Sudan Football Association',
	get_id('@', 'country@name@Sudan'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSF',
	'Fédération Sénégalaise de Football',
	get_id('@', 'country@name@Senegal'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAS',
	'Football Association of Singapore',
	get_id('@', 'country@name@Singapore'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SIFF',
	'Solomon Islands Football Federation',
	get_id('@', 'country@name@Solomon Islands'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'SLFA',
	'Sierra Leone Football Association',
	get_id('@', 'country@name@Sierra Leone'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FESFUT',
	'Federación Salvadoreña de Fútbol',
	get_id('@', 'country@name@El Salvador'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FSGC',
	'Federazione Sammarinese Giuoco Calcio',
	get_id('@', 'country@name@San Marino'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SFF',
	'Somali Football Federation',
	get_id('@', 'country@name@Somalia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSS',
	'Football Association of Serbia',
	get_id('@', 'country@name@Serbia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SSFA',
	'South Sudan Football Association',
	get_id('@', 'country@name@South Sudan'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FSF',
	'Federação Santomense de Futebol',
	get_id('@', 'country@name@São Tomé and Príncipe'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SVB',
	'Surinaamse Voetbal Bond',
	get_id('@', 'country@name@Suriname'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'SFZ',
	'Slovenský futbalový zväz',
	get_id('@', 'country@name@Slovak Republic'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'NZS',
	'Nogometna zveza Slovenije',
	get_id('@', 'country@name@Slovenia'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'SvFF',
	'Svenska Fotbollförbundet',
	get_id('@', 'country@name@Sweden'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'EFA',
	'Eswatini Football Association',
	get_id('@', 'country@name@Eswatini'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SFF',
	'Seychelles Football Federation',
	get_id('@', 'country@name@Seychelles'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'SAFA',
	'Syrian Arab Football Association',
	get_id('@', 'country@name@Syria'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FTFA',
	'Fédération Tchadienne de Football',
	get_id('@', 'country@name@Chad'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FTF',
	'Fédération Togolaise de Football',
	get_id('@', 'country@name@Togo'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAT',
	'Football Association of Thailand',
	get_id('@', 'country@name@Thailand'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'TFF',
	'Tajikistan Football Federation',
	get_id('@', 'country@name@Tajikistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFT',
	'Football Federation of Turkmenistan',
	get_id('@', 'country@name@Turkmenistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'FFTL',
	'Federação de Futebol de Timor-Leste',
	get_id('@', 'country@name@Timor-Leste'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'TFA',
	'Tonga Football Association',
	get_id('@', 'country@name@Tonga'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'TTFA',
	'Trinidad and Tobago Football Association',
	get_id('@', 'country@name@Trinidad and Tobago'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FTF',
	'Fédération Tunisienne de Football',
	get_id('@', 'country@name@Tunisia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'TFF',
	'Türkiye Futbol Federasyonu',
	get_id('@', 'country@name@Türkiye'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'CTFA',
	'Chinese Taipei Football Association',
	get_id('@', 'country@name@Taiwan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'TFF',
	'Tanzania Football Federation',
	get_id('@', 'country@name@Tanzania'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FUFA',
	'Federation of Uganda Football Associations',
	get_id('@', 'country@name@Uganda'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'UAF',
	'Ukrainian Association of Football',
	get_id('@', 'country@name@Ukraine'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'AUF',
	'Asociación Uruguaya de Fútbol',
	get_id('@', 'country@name@Uruguay'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'USSF',
	'United States Soccer Federation',
	get_id('@', 'country@name@United States'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'UFA',
	'Uzbekistan Football Association',
	get_id('@', 'country@name@Uzbekistan'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SVGFF',
	'Saint Vincent and the Grenadines Football Federation',
	get_id('@', 'country@name@Saint Vincent and the Grenadines'),
	get_id('@', 'confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FVF',
	'Federación Venezolana de Fútbol',
	get_id('@', 'country@name@Venezuela'),
	get_id('@', 'confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'VFF',
	'Vietnam Football Federation',
	get_id('@', 'country@name@Vietnam'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'VFF',
	'Vanuatu Football Federation',
	get_id('@', 'country@name@Vanuatu'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FAW',
	'Football Association of Wales',
	get_id('@', 'country@name@Wales'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'FFS',
	'Football Federation Samoa',
	get_id('@', 'country@name@Samoa'),
	get_id('@', 'confederation@long_name@Oceania Football Confederation')
),
(
	'FFK',
	'Football Federation of Kosovo',
	get_id('@', 'country@name@Kosovo'),
	get_id('@', 'confederation@long_name@Union of European Football Associations')
),
(
	'YFA',
	'Yemen Football Association',
	get_id('@', 'country@name@Yemen'),
	get_id('@', 'confederation@long_name@Asian Football Confederation')
),
(
	'SAFA',
	'South African Football Association',
	get_id('@', 'country@name@South Africa'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'FAZ',
	'Football Association of Zambia',
	get_id('@', 'country@name@Zambia'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
),
(
	'ZIFA',
	'Zimbabwe Football Association',
	get_id('@', 'country@name@Zimbabwe'),
	get_id('@', 'confederation@long_name@Confederation of African Football')
);
--------------------------------------------------------------------------------

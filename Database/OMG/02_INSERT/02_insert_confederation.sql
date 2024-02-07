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
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'FIFA',
	'Fédération Internationale de Football Association',
	get_column('@', 'fp_country@name@World', 'id')::integer,
	NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT CONTINENT TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'CAF',
	'Confederation of African Football',
	get_column('@', 'fp_country@name@Africa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
	
),
(
	'AFC',
	'Asian Football Confederation',
	get_column('@', 'fp_country@name@Asia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'CONCACAF',
	'Confederation of North and Central America and Caribbean Association Football',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'CONMEBOL',
	'Confederación Sudamericana de Fútbol',
	get_column('@', 'fp_country@name@South America', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'OFC',
	'Oceania Football Confederation',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'UEFA',
	'Union of European Football Associations',
	get_column('@', 'fp_country@name@Europe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT NATION TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'AFF',
	'Afghanistan Football Federation',
	get_column('@', 'fp_country@name@Afghanistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer	
),
(
	'FAF',
	'Angolan Football Federation',
	get_column('@', 'fp_country@name@Angola', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSHF',
	'Federata Shqiptare e Futbollit',
	get_column('@', 'fp_country@name@Albania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FAF',
	'Federació Andorrana de Futbol',
	get_column('@', 'fp_country@name@Andorra', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'UAEFA',
	'UAE Football Association',
	get_column('@', 'fp_country@name@United Arab Emirates', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'AFA',
	'Asociación del Fútbol Argentino',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'FFA',
	'Football Federation of Armenia',
	get_column('@', 'fp_country@name@Armenia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ABFA',
	'Antigua and Barbuda Football Association',
	get_column('@', 'fp_country@name@Antigua and Barbuda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FFA',
	'Football Federation Australia',
	get_column('@', 'fp_country@name@Australia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'ÖFB',
	'Österreichischer Fußball-Bund',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'AFFA',
	'Association of Football Federations of Azerbaijan',
	get_column('@', 'fp_country@name@Azerbaijan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFB',
	'Fédération de Football du Burundi',
	get_column('@', 'fp_country@name@Burundi', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'KBVB',
	'Royal Belgian Football Association',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FBF',
	'Fédération Béninoise de Football',
	get_column('@', 'fp_country@name@Benin', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FBF',
	'Fédération Burkinabé de Football',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'BFF',
	'Bangladesh Football Federation',
	get_column('@', 'fp_country@name@Bangladesh', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFU',
	'Bulgarian Football Union',
	get_column('@', 'fp_country@name@Bulgaria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'BFA',
	'Bahrain Football Association',
	get_column('@', 'fp_country@name@Bahrain', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFA',
	'Bahamas Football Association',
	get_column('@', 'fp_country@name@Bahamas', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'N/FSBiH',
	'Nogometni/Fudbalski Savez Bosne i Hercegovine',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'BFF',
	'Football Federation of Belarus',
	get_column('@', 'fp_country@name@Belarus', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFB',
	'Football Federation of Belize',
	get_column('@', 'fp_country@name@Belize', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FBF',
	'Federación Boliviana de Fútbol',
	get_column('@', 'fp_country@name@Bolivia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'CBF',
	'Confederação Brasileira de Futebol',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'BFA',
	'Barbados Football Association',
	get_column('@', 'fp_country@name@Barbados', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'NFABD',
	'National Football Association of Brunei Darussalam',
	get_column('@', 'fp_country@name@Brunei', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFF',
	'Bhutan Football Federation',
	get_column('@', 'fp_country@name@Bhutan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFA',
	'Botswana Football Association',
	get_column('@', 'fp_country@name@Botswana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),

(
	'FCF',
	'Fédération Centrafricaine de Football',
	get_column('@', 'fp_country@name@Central African Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'CSA',
	'Canada Soccer',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'SFV',
	'Swiss Football Association',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFCh',
	'Federación de Fútbol de Chile',
	get_column('@', 'fp_country@name@Chile', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'CFA',
	'Chinese Football Association',
	get_column('@', 'fp_country@name@China', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FIF',
	'Fédération Ivoirienne de Football',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECAFOOT',
	'Fédération Camerounaise de Football',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECOFA',
	'Fédération Congolaise de Football-Association',
	get_column('@', 'fp_country@name@Democratic Republic of the Congo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECOFOOT',
	'Fédération Congolaise de Football',
	get_column('@', 'fp_country@name@Congo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FCF',
	'Federación Colombiana de Fútbol',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'FFC',
	'Fédération Comorienne de Football',
	get_column('@', 'fp_country@name@Comoros', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FCF',
	'Federação Caboverdiana de Futebol',
	get_column('@', 'fp_country@name@Cabo Verde', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEDEFUTBOL',
	'Federación Costarricense de Fútbol',
	get_column('@', 'fp_country@name@Costa Rica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'AFC',
	'Asociación de Fútbol de Cuba',
	get_column('@', 'fp_country@name@Cuba', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FFK',
	'Federashon Futbòl Kòrsou',
	get_column('@', 'fp_country@name@Curaçao', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'CFA',
	'Cyprus Football Association',
	get_column('@', 'fp_country@name@Cyprus', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FAČR',
	'Fotbalová asociace České republiky',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'DFB',
	'Deutscher Fußball-Bund',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FDF',
	'Fédération Djiboutienne de Football',
	get_column('@', 'fp_country@name@Djibouti', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'DFA',
	'Dominica Football Association',
	get_column('@', 'fp_country@name@Dominica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'DBU',
	'Dansk Boldspil-Union',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FEDOFUTBOL',
	'Federación Dominicana de Fútbol',
	get_column('@', 'fp_country@name@Dominican Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FAF',
	'Fédération Algérienne de Football',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEF',
	'Federación Ecuatoriana de Fútbol',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'EFA',
	'Egyptian Football Association',
	get_column('@', 'fp_country@name@Egypt', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FA',
	'The Football Association',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ENFF',
	'Eritrean National Football Federation',
	get_column('@', 'fp_country@name@Eritrea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'RFEF',
	'Real Federación Española de Fútbol',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EJL',
	'Eesti Jalgpalli Liit',
	get_column('@', 'fp_country@name@Estonia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EFF',
	'Ethiopian Football Federation',
	get_column('@', 'fp_country@name@Ethiopia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SPL',
	'Suomen Palloliitto',
	get_column('@', 'fp_country@name@Finland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFA',
	'Fiji Football Association',
	get_column('@', 'fp_country@name@Fiji', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFF',
	'Fédération Française de Football',
	get_column('@', 'fp_country@name@France', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FSMFA',
	'Federated States of Micronesia Football Association',
	get_column('@', 'fp_country@name@Micronesia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FEGAFOOT',
	'Fédération Gabonaise de Football',
	get_column('@', 'fp_country@name@Gabon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'GFF',
	'Georgian Football Federation',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'GFA',
	'Ghana Football Association',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FGF',
	'Fédération Guinéenne de Football',
	get_column('@', 'fp_country@name@Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'GFF',
	'Gambia Football Federation',
	get_column('@', 'fp_country@name@Gambia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFGB',
	'Federação de Futebol da Guiné-Bissau',
	get_column('@', 'fp_country@name@Guinea-Bissau', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEGUIFUT',
	'Federación Ecuatoguineana de Fútbol',
	get_column('@', 'fp_country@name@Equatorial Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'EPO',
	'Hellenic Football Federation',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'GFA',
	'Grenada Football Association',
	get_column('@', 'fp_country@name@Grenada', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FENAFUTH',
	'Federación Nacional de Fútbol de Guatemala',
	get_column('@', 'fp_country@name@Guatemala', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'GFF',
	'Guyana Football Federation',
	get_column('@', 'fp_country@name@Guyana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FENAFUTH',
	'Federación Nacional Autónoma de Fútbol de Honduras',
	get_column('@', 'fp_country@name@Honduras', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'HNS',
	'Hrvatski nogometni savez',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FHF',
	'Fédération Haïtienne de Football',
	get_column('@', 'fp_country@name@Haiti', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'MLSZ',
	'Magyar Labdarúgó Szövetség',
	get_column('@', 'fp_country@name@Hungary', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'PSSI',
	'Indonesian Football Association',
	get_column('@', 'fp_country@name@Indonesia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'AIFF',
	'All India Football Federation',
	get_column('@', 'fp_country@name@India', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FAI',
	'Football Association of Ireland',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFIRI',
	'Football Federation Islamic Republic of Iran',
	get_column('@', 'fp_country@name@Iran', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'IFA',
	'Iraq Football Association',
	get_column('@', 'fp_country@name@Iraq', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'KSÍ',
	'Knattspyrnusamband Íslands',
	get_column('@', 'fp_country@name@Iceland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'IFA',
	'Israel Football Association',
	get_column('@', 'fp_country@name@Israel', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FIGC',
	'Federazione Italiana Giuoco Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'JFF',
	'Jamaica Football Federation',
	get_column('@', 'fp_country@name@Jamaica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'JFA',
	'Jordan Football Association',
	get_column('@', 'fp_country@name@Jordan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'JFA',
	'Japan Football Association',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFK',
	'Football Federation of Kazakhstan',
	get_column('@', 'fp_country@name@Kazakhstan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FKF',
	'Football Kenya Federation',
	get_column('@', 'fp_country@name@Kenya', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFKR',
	'Football Federation of the Kyrgyz Republic',
	get_column('@', 'fp_country@name@Kyrgyzstan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFC',
	'Football Federation of Cambodia',
	get_column('@', 'fp_country@name@Cambodia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'KIFA',
	'Kiribati Islands Football Association',
	get_column('@', 'fp_country@name@Kiribati', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'SKNFA',
	'Saint Kitts and Nevis Football Association',
	get_column('@', 'fp_country@name@Saint Kitts and Nevis', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'KFA',
	'Korea Football Association',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'KFA',
	'Kuwait Football Association',
	get_column('@', 'fp_country@name@Kuwait', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFF',
	'Lao Football Federation',
	get_column('@', 'fp_country@name@Lao People''s Democratic Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Lebanese Football Association',
	get_column('@', 'fp_country@name@Lebanon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Liberia Football Association',
	get_column('@', 'fp_country@name@Liberia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'LFF',
	'Libyan Football Federation',
	get_column('@', 'fp_country@name@Libya', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SLFA',
	'Saint Lucia Football Association',
	get_column('@', 'fp_country@name@Saint Lucia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'LFV',
	'Liechtensteiner Fussballverband',
	get_column('@', 'fp_country@name@Liechtenstein', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFSL',
	'Football Federation of Sri Lanka',
	get_column('@', 'fp_country@name@Sri Lanka', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Lesotho Football Association',
	get_column('@', 'fp_country@name@Lesotho', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'LFF',
	'Lithuanian Football Federation',
	get_column('@', 'fp_country@name@Lithuania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FLF',
	'Luxembourg Football Federation',
	get_column('@', 'fp_country@name@Luxembourg', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'LFF',
	'Latvijas Futbola federācija',
	get_column('@', 'fp_country@name@Latvia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FRMF',
	'Royal Moroccan Football Federation',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FMF',
	'Fédération Monegasque de Football',
	get_column('@', 'fp_country@name@Monaco', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FMF',
	'Federația Moldovenească de Fotbal',
	get_column('@', 'fp_country@name@Moldova', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FMF',
	'Fédération Malagasy de Football',
	get_column('@', 'fp_country@name@Madagascar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Maldives',
	get_column('@', 'fp_country@name@Maldives', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FMF',
	'Federación Mexicana de Fútbol Asociación',
	get_column('@', 'fp_country@name@Mexico', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'MISA',
	'Marshall Islands Soccer Association',
	get_column('@', 'fp_country@name@Marshall Islands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFM',
	'Football Federation of North Macedonia',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FEMAFOOT',
	'Fédération Malienne de Football',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'MFA',
	'Malta Football Association',
	get_column('@', 'fp_country@name@Malta', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'MFF',
	'Myanmar Football Federation',
	get_column('@', 'fp_country@name@Myanmar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FSCG',
	'Fudbalski Savez Crne Gore',
	get_column('@', 'fp_country@name@Montenegro', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'MFF',
	'Mongolian Football Federation',
	get_column('@', 'fp_country@name@Mongolia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FMF',
	'Federação Moçambicana de Futebol',
	get_column('@', 'fp_country@name@Mozambique', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFRIM',
	'Fédération de Football de la République Islamique de Mauritanie',
	get_column('@', 'fp_country@name@Mauritania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'MFA',
	'Mauritius Football Association',
	get_column('@', 'fp_country@name@Mauritius', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Malawi',
	get_column('@', 'fp_country@name@Malawi', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Malaysia',
	get_column('@', 'fp_country@name@Malaysia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'NFA',
	'Namibia Football Association',
	get_column('@', 'fp_country@name@Namibia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FENIFOOT',
	'Fédération Nigerienne de Football',
	get_column('@', 'fp_country@name@Niger', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'NFF',
	'Nigeria Football Federation',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FENIFUT',
	'Federación Nicaragüense de Fútbol',
	get_column('@', 'fp_country@name@Nicaragua', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'IFA',
	'Irish Football Association',
	get_column('@', 'fp_country@name@Northern Ireland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NISA',
	'Niue Island Soccer Association',
	get_column('@', 'fp_country@name@Niue', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'KNVB',
	'Koninklijke Nederlandse Voetbalbond',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NFF',
	'Norges Fotballforbund',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ANFA',
	'All Nepal Football Association',
	get_column('@', 'fp_country@name@Nepal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer	
),
(
	'NZF',
	'New Zealand Football',
	get_column('@', 'fp_country@name@New Zealand', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'OFA',
	'Oman Football Association',
	get_column('@', 'fp_country@name@Oman', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'PFF',
	'Pakistan Football Federation',
	get_column('@', 'fp_country@name@Pakistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FEPAFUT',
	'Federación Panameña de Fútbol',
	get_column('@', 'fp_country@name@Panama', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FPF',
	'Federación Peruana de Futbol',
	get_column('@', 'fp_country@name@Peru', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'PFF',
	'Philippine Football Federation',
	get_column('@', 'fp_country@name@Philippines', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'PFA',
	'Palau Football Association',
	get_column('@', 'fp_country@name@Palau', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'PNGFA',
	'Papua New Guinea Football Association',
	get_column('@', 'fp_country@name@Papua New Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'PZPN',
	'Polski Związek Piłki Nożnej',
	get_column('@', 'fp_country@name@Poland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FPF',
	'Federación Puertorriqueña de Fútbol',
	get_column('@', 'fp_country@name@Puerto Rico', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'DPRK FA',
	'DPR Korea Football Association',
	get_column('@', 'fp_country@name@North Korea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FPF',
	'Federação Portuguesa de Futebol',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'APF',
	'Asociación Paraguaya de Fútbol',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'PFA',
	'Palestine Football Association',
	get_column('@', 'fp_country@name@Palestine', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'QFA',
	'Qatar Football Association',
	get_column('@', 'fp_country@name@Qatar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FRF',
	'Federația Română de Fotbal',
	get_column('@', 'fp_country@name@Romania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'RFU',
	'Russian Football Union',
	get_column('@', 'fp_country@name@Russian Federation', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FERWAFA',
	'Fédération Rwandaise de Football Association',
	get_column('@', 'fp_country@name@Rwanda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SAFF',
	'Saudi Arabian Football Federation',
	get_column('@', 'fp_country@name@Saudi Arabia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SFA',
	'Scottish Football Association',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SFA',
	'Sudan Football Association',
	get_column('@', 'fp_country@name@Sudan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSF',
	'Fédération Sénégalaise de Football',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAS',
	'Football Association of Singapore',
	get_column('@', 'fp_country@name@Singapore', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SIFF',
	'Solomon Islands Football Federation',
	get_column('@', 'fp_country@name@Solomon Islands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'SLFA',
	'Sierra Leone Football Association',
	get_column('@', 'fp_country@name@Sierra Leone', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FESFUT',
	'Federación Salvadoreña de Fútbol',
	get_column('@', 'fp_country@name@El Salvador', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FSGC',
	'Federazione Sammarinese Giuoco Calcio',
	get_column('@', 'fp_country@name@San Marino', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SFF',
	'Somali Football Federation',
	get_column('@', 'fp_country@name@Somalia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSS',
	'Football Association of Serbia',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SSFA',
	'South Sudan Football Association',
	get_column('@', 'fp_country@name@South Sudan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSF',
	'Federação Santomense de Futebol',
	get_column('@', 'fp_country@name@São Tomé and Príncipe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SVB',
	'Surinaamse Voetbal Bond',
	get_column('@', 'fp_country@name@Suriname', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'SFZ',
	'Slovenský futbalový zväz',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NZS',
	'Nogometna zveza Slovenije',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SvFF',
	'Svenska Fotbollförbundet',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EFA',
	'Eswatini Football Association',
	get_column('@', 'fp_country@name@Eswatini', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SFF',
	'Seychelles Football Federation',
	get_column('@', 'fp_country@name@Seychelles', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SAFA',
	'Syrian Arab Football Association',
	get_column('@', 'fp_country@name@Syria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FTFA',
	'Fédération Tchadienne de Football',
	get_column('@', 'fp_country@name@Chad', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FTF',
	'Fédération Togolaise de Football',
	get_column('@', 'fp_country@name@Togo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAT',
	'Football Association of Thailand',
	get_column('@', 'fp_country@name@Thailand', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFF',
	'Tajikistan Football Federation',
	get_column('@', 'fp_country@name@Tajikistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFT',
	'Football Federation of Turkmenistan',
	get_column('@', 'fp_country@name@Turkmenistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFTL',
	'Federação de Futebol de Timor-Leste',
	get_column('@', 'fp_country@name@Timor-Leste', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFA',
	'Tonga Football Association',
	get_column('@', 'fp_country@name@Tonga', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'TTFA',
	'Trinidad and Tobago Football Association',
	get_column('@', 'fp_country@name@Trinidad and Tobago', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FTF',
	'Fédération Tunisienne de Football',
	get_column('@', 'fp_country@name@Tunisia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'TFF',
	'Türkiye Futbol Federasyonu',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'CTFA',
	'Chinese Taipei Football Association',
	get_column('@', 'fp_country@name@Taiwan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFF',
	'Tanzania Football Federation',
	get_column('@', 'fp_country@name@Tanzania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FUFA',
	'Federation of Uganda Football Associations',
	get_column('@', 'fp_country@name@Uganda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'UAF',
	'Ukrainian Association of Football',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'AUF',
	'Asociación Uruguaya de Fútbol',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'USSF',
	'United States Soccer Federation',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'UFA',
	'Uzbekistan Football Association',
	get_column('@', 'fp_country@name@Uzbekistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SVGFF',
	'Saint Vincent and the Grenadines Football Federation',
	get_column('@', 'fp_country@name@Saint Vincent and the Grenadines', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FVF',
	'Federación Venezolana de Fútbol',
	get_column('@', 'fp_country@name@Venezuela', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'VFF',
	'Vietnam Football Federation',
	get_column('@', 'fp_country@name@Vietnam', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'VFF',
	'Vanuatu Football Federation',
	get_column('@', 'fp_country@name@Vanuatu', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FAW',
	'Football Association of Wales',
	get_column('@', 'fp_country@name@Wales', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFS',
	'Football Federation Samoa',
	get_column('@', 'fp_country@name@Samoa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFK',
	'Football Federation of Kosovo',
	get_column('@', 'fp_country@name@Kosovo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'YFA',
	'Yemen Football Association',
	get_column('@', 'fp_country@name@Yemen', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SAFA',
	'South African Football Association',
	get_column('@', 'fp_country@name@South Africa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAZ',
	'Football Association of Zambia',
	get_column('@', 'fp_country@name@Zambia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'ZIFA',
	'Zimbabwe Football Association',
	get_column('@', 'fp_country@name@Zimbabwe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
);
--------------------------------------------------------------------------------


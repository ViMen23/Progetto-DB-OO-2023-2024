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
 * INSERT INTERNATIONAL COMPETITION
 ******************************************************************************/
INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'CUP',
	'NATIONAL',
	'FIFA World Cup',
	4,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Internationale de Football Association'
	)
),
(
	'CUP',
	'NATIONAL',
	'AFC Asian Cup',
	4,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation'
	)
),
(
	'CUP',
	'CLUB',
	'AFC Champions League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation'
	)
),
(
	'CUP',
	'CLUB',
	'AFC Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation'
	)
),
(
	'CUP',
	'NATIONAL',
	'Africa Cup of Nations',
	2,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football'
	)
),
(
	'CUP',
	'CLUB',
	'CAF Champions League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football'
	)
),
(
	'CUP',
	'CLUB',
	'CAF Confederation Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'CAF Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football'	
	)
),
(
	'CUP',
	'NATIONAL',
	'CONCACAF Gold Cup',
	2,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football'	
	)
),
(
	'CUP',
	'CLUB',
	'CONCACAF Champions Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football'	
	)
),
(
	'CUP',
	'NATIONAL',
	'CONMEBOL Copa América',
	4,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Libertadores de América',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Sudamericana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'CONMEBOL Recopa Sudamericana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol'
	)
),
(
	'CUP',
	'NATIONAL',
	'OFC Nations Cup',
	4,
	get_id
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation'
	)
),
(
	'CUP',
	'CLUB',
	'OFC Champions League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation'
	)
),
(
	'CUP',
	'NATIONAL',
	'UEFA European Championship',
	4,
	get_id
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations'
	)
),
(
	'CUP',
	'CLUB',
	'UEFA Champions League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations'
	)
),
(
	'CUP',
	'CLUB',
	'UEFA Europa League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations'
	)
),
(
	'CUP',
	'CLUB',
	'UEFA Conference League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations'
	)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT NATIONAL COMPETITION
 ******************************************************************************/
INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'LEAGUE',
	'CLUB',
	'Afghan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Afghanistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria Superiore',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Parë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Dytë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Superkupa e Shqipërisë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'CUP',
	'CLUB',
	'Kupa e Shqipërisë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Girabola',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segundona',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Angolan SuperCup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Angolan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Divisió',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segona Divisió',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Andorran Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Constitució',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE First Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE Second Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'UAE President''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'UAE Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Profesional de Fútbol',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Nacional',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Argentina',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Argentina',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Centenario de la AFA',
	100,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Armenian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Armenian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Armenian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'CUP',
	'CLUB',
	'Armenian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Antigua and Barbuda Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Antigua and Barbuda FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'A-League Men',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia'
	)
),
(
	'CUP',
	'CLUB',
	'Australia Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Österreichische Fußball-Bundesliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Admiral 2. Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Austrian Regionalliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'CUP',
	'CLUB',
	'ÖFB-Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'ÖFB-Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Premyer Liqası',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Birinci Divizionu',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'CUP',
	'CLUB',
	'Azərbaycan Kuboku',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Azərbaycan Superkuboku',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Burundi Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Burundi',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jupiler Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Challenger Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belgian National Division 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Beker van België',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Belgische Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Bénin',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Bénin',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Faso',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Burkina Faso',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bangladesh Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bangladesh Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian Second League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Third Amateur Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'CUP',
	'CLUB',
	'Bulgarian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Bulgarian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bahraini Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Bahraini King''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Bahraini Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'BFA Senior League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahamas Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premijer Liga Bosne i Hercegovine',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga FBiH',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Republike Srpske',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'CUP',
	'CLUB',
	'Kup Bosne i Hercegovine',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Second League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'CUP',
	'CLUB',
	'Belarusian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Belarusian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Belize',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belize'
	)
),
(
	'LEAGUE',
	'CLUB',
	'División de Fútbol Profesional',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Boliviana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série D',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa do Brasil',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa do Brasil',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Barbados Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Barbados FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Brunei Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'CUP',
	'CLUB',
	'Brunei FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Brunei Super Cup',
	0,
	get_id
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bhutan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bhutan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botswana Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'FA Challenge Cup Botswana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Central African Republic League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Centrafricaine de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Canadian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Canada Soccer'
	)
),
(
	'CUP',
	'CLUB',
	'Canadian Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Canada Soccer'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Challenge League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Promotion League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Schweizer Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional Scotiabank',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Chile',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de Chile',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Chinese Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'China League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'China League Two',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Chinese FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'SUPER CUP',
	 'CLUB',
	'Chinese FA Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'MTN Ligue 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe de Côte d''Ivoire',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'MTN Elite One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Cameroon Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Linafoot',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du DR Congo',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National MTN',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Congo',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Torneo BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Superliga BetPlay DIMAYOR',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Comoros Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Comorienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cape Verdean Football Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de Cabo Verde',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Promerica',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División de Costa Rica',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Costa Rican Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional de Fútbol de Cuba',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación de Fútbol de Cuba'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Curaçao Promé Divishon',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federashon Futbòl Kòrsou'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Second Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Third Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Cypriot Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. česká fotbalová liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fotbalová národní liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'CUP',
	'CLUB',
	'Czech Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Czech Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bundesliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. Bundesliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'3. Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Regionalliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'CUP',
	'CLUB',
	'DFB-Pokal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'DFL-Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Djibouti Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Djibouti FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Dominica Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dominica Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'3F Superliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'NordicBet Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'CUP',
	'CLUB',
	'Danish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Danish SuperCup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Dominicana de Fútbol',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Dominicana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Professional League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Algerian Ligue 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe d''Algérie de football',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coupe d''Algérie de football',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Pro Ecuador Serie A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Categoría Serie B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Ecuador',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Egyptian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Egypt Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Egyptian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL League Two',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'FA Community Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eritrean Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eritrean National Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'LaLiga EA Sports',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'LALIGA HYPERMOTION',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Federación',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda Federación',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa del Rey',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de España',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Federación',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Meistriliiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Esiliiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'CUP',
	'CLUB',
	'Estonian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Estonian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ethiopian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Ethiopian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Veikkausliiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ykkönen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kakkonen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Finnish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fiji Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Fiji Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe de France',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Trophée des Champions',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pohnpei Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federated States of Micronesia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gabon Championnat National D1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Gabon Interclubs',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Georgian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Georgian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ghana Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Ghana FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFA League First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Gambian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional da Guiné-Bissau',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional da Guiné Bissau',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Equatoguinean Primera División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Equatoguinean Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gamma Ethniki',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Greek Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Cup of Friendship and Solidarity',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFA Premier Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Grenada Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol de Guatemala',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División de Ascenso',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'CUP',
	'CLUB',
	'Copa de Guatemala',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFF National Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Guyana Mayors Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol Profesional de Honduras',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras'
	)
),
(
	'CUP',
	'CLUB',
	'Honduran Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperSport Hrvatska nogometna liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva nogometna liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Druga nogometna liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'CUP',
	'CLUB',
	'Hrvatski nogometni kup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Hrvatski nogometni superkup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue Haïtienne',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe d''Haïti',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság I',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság II',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság III',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'CUP',
	'CLUB',
	'Magyar Kupa',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'BRI Liga 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Piala Indonesia',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Indian Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I-League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I-League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'AIFF Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland Premier Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland'
	)
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland'
	)
),
(
	'CUP',
	'CLUB',
	'Sports Direct FAI Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Persian Gulf Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azadegan League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'CUP',
	'CLUB',
	'Hazfi Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Iran Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Iraq Stars League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Iraqi Premier Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Iraq FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Iraqi Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Besta deild karla',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. deild karla',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. deild karla',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'CUP',
	'CLUB',
	'Icelandic Men''s Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Icelandic Men''s Football Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligat Ha`Al',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Leumit',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Alef',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Israel State Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Israel Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie D',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Italia',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa Italiana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Italia Serie C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa di Serie C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jamaica Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'JFF Champions Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jordanian Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Jordan FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Jordan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J1 League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J2 League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J3 League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Japan Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Emperor''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Japanese Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'CUP',
	'CLUB',
	'Kazakhstan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kazakhstan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kenyan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation'
	)
),
(
	'CUP',
	'CLUB',
	'FKF President''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kenyan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Pervaja Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'CUP',
	'CLUB',
	'Kyrgyzstan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kyrgyzstan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cambodian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Cambodia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kiribati National Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kiribati Islands Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SKNFA Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Saint Kitts and Nevis National Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'K League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'K League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Korea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Korean FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kuwait Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Kuwait Emir Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kuwait Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lao League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lao Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Second Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Lebanese FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Lebanese Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liberian First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Liberian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Libyan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Libyan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Libyan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SLFA First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Saint Lucia FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Liechtenstein Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Liechtensteiner Fussballverband'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sri Lanka Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka'
	)
),
(
	'CUP',
	'CLUB',
	'Sri Lanka FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lesotho Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Lesotho Independence Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'A Lyga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pirma lyga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Lithuanian Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Lithuanian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg National Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg Division of Honour',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Luxembourg Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Virsliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Latvijas Pirmā līga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'CUP',
	'CLUB',
	'Latvijas kauss',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Latvian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Moroccan Throne Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Challenge Prince Rainier III',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Monegasque de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Divizia Națională',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Divizia A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'CUP',
	'CLUB',
	'Moldovan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Moldovan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malagasy Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Malagasy de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Dhivehi Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives'
	)
),
(
	'CUP',
	'CLUB',
	'Maldives FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga de Expansión MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Premier de México',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'CUP',
	'CLUB',
	'Copa MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Campeón de Campeones MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva makedonska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Vtora makedonska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'CUP',
	'CLUB',
	'Kup na Makedonija',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Macedonian Supercup',
	0,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malian Première Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Malian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Malta Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Challenge League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Malta Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Myanmar National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'General Aung San Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva crnogorska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Druga crnogorska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'CUP',
	'CLUB',
	'Crnogorski fudbalski kup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Mongolian National Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'MFF Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Moçambola',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça de Moçambique',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1 Mauritania',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie'
	)
),
(
	'CUP',
	'CLUB',
	'Mauritanian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Mauritian League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Mauritian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malawi Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Malawi'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malaysia Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia'
	)
),
(
	'CUP',
	'CLUB',
	'Malaysia FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Namibia Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Namibia FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Niger Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Niger Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nigerian Premier Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Nigerian FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nicaraguan Primera División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol'
	)
),

(
	'CUP',
	'CLUB',
	'Copa de Nicaragua',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Irish Premiership',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'NIFL Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Irish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'NIFL Charity Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Niue Soccer Tournament',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Niue Island Soccer Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eredivisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eerste Divisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tweede Divisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'CUP',
	'CLUB',
	'KNVB Beker',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Johan Cruijff Schaal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eliteserien',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Norwegian First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'CUP',
	'CLUB',
	'Norwegian Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Mesterfinalen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial A-Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial B-Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Ncell Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'New Zealand National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@New Zealand Football'
	)
),
(
	'CUP',
	'CLUB',
	'Chatham Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@New Zealand Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Oman Professional League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Oman Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Sultan Qaboos Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Oman Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pakistan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Pakistan National Football Challenge Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Asociación Nacional Pro Fútbol',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Panamá',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Betsson',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Peruvian Segunda División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Bicentenario',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Peruana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Philippines Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Paulino Alcantara',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Palau Soccer League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Palau Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Papua New Guinea National Soccer League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Papua New Guinea FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ekstraklasa',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I liga polska',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'II liga polska',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'CUP',
	'CLUB',
	'Polish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Polish Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Puerto Rico',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Puertorriqueña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'DPR Korea Premier Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Hwaebul Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal Betclic',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Terceira Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça de Portugal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supertaça Cândido de Oliveira',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Paraguaya',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'División Intermedia',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Paraguay',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Paraguaya',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gaza Strip Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Palestine Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Qatar Stars League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Qatari Stars Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Sheikh Jassim Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga României',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga II',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga III',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'CUP',
	'CLUB',
	'Cupa României',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercupa României',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'CUP',
	'CLUB',
	'Russian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Russian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Rwanda Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Rwandan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Saudi Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Saudi League First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'The Custodian of The Two Holy Mosques Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Saudi Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Premiership',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Scottish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sudan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Sudan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Senegal Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Senegal FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Singapore Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore'
	)
),
(
	'CUP',
	'CLUB',
	'Singapore Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Singapore Community Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Solomon Islands S-League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Solomon Islands Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sierra Leone National Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Sierra Leone Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Salvadoran Primera División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Salvadoreña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campionato Sammarinese di Calcio',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Titano',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coppa Sammarinese',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Somali First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Somali Second Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Somalia Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Somalia Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Srbije',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Srpska Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia'
	)
),
(
	'CUP',
	'CLUB',
	'Kup Srbije',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'South Sudan Football Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'South Sudan National Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'São Tomé and Príncipe Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de São Tomé e Principe',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'São Tomé and Príncipe Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SVB Eerste Divisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond'
	)
),
(
	'CUP',
	'CLUB',
	'Beker van Suriname',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Suriname President''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fortuna Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz'
	)
),
(
	'CUP',
	'CLUB',
	'Slovak Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Slovak Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. SNL',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. SNL',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije'
	)
),
(
	'CUP',
	'CLUB',
	'Hervis Pokal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Allsvenskan',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Superettan',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Division 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Division 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet'
	)
),
(
	'CUP',
	'CLUB',
	'Svenska Cupen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Eswatini',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Swazi Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Swazi Charity Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Seychelles First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Seychelles FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Syrian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Syrian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Syrian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Chad Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Tchadienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National de Premiere Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Togolaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand'
	)
),
(
	'CUP',
	'CLUB',
	'Thai FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Thailand Champions Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand'
	)

),
(
	'LEAGUE',
	'CLUB',
	'Vysšaja Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tajikistan First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Tajikistan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Tajikistan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation'
	)

),
(
	'LEAGUE',
	'CLUB',
	'Turkmenistan Higher League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan'
	)
),
(
	'CUP',
	'CLUB',
	'Turkmenistan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Turkmenistan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Futebol Amadora Primeira Divisão',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste'
	)
),
(
	'CUP',
	'CLUB',
	'Taça 12 de Novembro',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'LFA Super Taça',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste'
	)

),
(
	'LEAGUE',
	'CLUB',
	'Tonga Major League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tonga Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'TT Premier Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Trinidad and Tobago FA Trophy',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Trinidad and Tobago Charity Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Tunisian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Tunisian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Süper Lig',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 1. Lig',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 2. Lig',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 3. Lig',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu'
	)
),
(
	'CUP',
	'CLUB',
	'Turkish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Turkish Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Taiwan Football Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Taipei Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tanzanian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Tanzania FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Uganda Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations'
	)
),
(
	'CUP',
	'CLUB',
	'Ugandan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Second League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football'
	)
),
(
	'CUP',
	'CLUB',
	'Ukrainian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Ukrainian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Profesional de Uruguay',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División Profesional de Uruguay',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Uruguay',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Uruguaya',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Major League Soccer',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'USL Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'USL League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Lamar Hunt U.S. Open Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Uzbekistan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Uzbekistan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Venezolana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga FUTVE 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Venezuela',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eximbank V League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Vietnamese National Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Vietnamese Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cymru Premier',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales'
	)
),
(
	'CUP',
	'CLUB',
	'Welsh Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Samoa National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa'
	)
),
(
	'CUP',
	'CLUB',
	'Samoa Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Superliga e Futbollit të Kosovës',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga e Parë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo'
	)
),
(
	'CUP',
	'CLUB',
	'Kosovar Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kosovar Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Yemeni League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Yemeni President Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Yemeni Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'South African Premier Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@South African Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'National First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@South African Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Nedbank Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@South African Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Zambia Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Zambia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Zimbabwe Premier Soccer League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Cup of Zimbabwe',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association'
	)
);
--------------------------------------------------------------------------------


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
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Internationale de Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'AFC Asian Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AFC Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AFC Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'Africa Cup of Nations',
	2,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'CAF Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'CAF Confederation Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'CAF Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'CONCACAF Gold Cup',
	2,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football',
		'id'
	)::integer	
),
(
	'CUP',
	'CLUB',
	'CONCACAF Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'CONMEBOL Copa América',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Libertadores de América',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Sudamericana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'CONMEBOL Recopa Sudamericana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'OFC Nations Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'OFC Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'UEFA European Championship',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Europa League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Conference League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
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
	get_column
	(
		'@',
		'fp_confederation@long_name@Afghanistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria Superiore',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Parë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Dytë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Superkupa e Shqipërisë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kupa e Shqipërisë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Girabola',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segundona',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Angolan SuperCup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Angolan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Divisió',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segona Divisió',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Andorran Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Constitució',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE First Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE Second Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UAE President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'UAE Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Profesional de Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Nacional',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Argentina',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Argentina',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Centenario de la AFA',
	100,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Armenian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Armenian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Armenian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Armenian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Antigua and Barbuda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Antigua and Barbuda FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'A-League Men',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Australia Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Österreichische Fußball-Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Admiral 2. Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Austrian Regionalliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'ÖFB-Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'ÖFB-Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Premyer Liqası',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Birinci Divizionu',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Azərbaycan Kuboku',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Azərbaycan Superkuboku',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Burundi Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Burundi',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jupiler Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Challenger Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belgian National Division 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Beker van België',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Belgische Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Bénin',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Bénin',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Faso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Burkina Faso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bangladesh Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bangladesh Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Third Amateur Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Bulgarian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Bulgarian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bahraini Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Bahraini King''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Bahraini Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'BFA Senior League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahamas Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premijer Liga Bosne i Hercegovine',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga FBiH',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Republike Srpske',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup Bosne i Hercegovine',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Belarusian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Belarusian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Belize',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belize',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'División de Fútbol Profesional',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Boliviana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série D',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa do Brasil',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa do Brasil',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Barbados Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Barbados FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Brunei Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Brunei FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Brunei Super Cup',
	0,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bhutan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bhutan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botswana Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FA Challenge Cup Botswana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Central African Republic League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Centrafricaine de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Canadian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Canada Soccer',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Canadian Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Canada Soccer',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Challenge League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Promotion League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Schweizer Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional Scotiabank',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Chile',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de Chile',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Chinese Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'China League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'China League Two',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Chinese FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	 'CLUB',
	'Chinese FA Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'MTN Ligue 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe de Côte d''Ivoire',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'MTN Elite One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cameroon Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Linafoot',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du DR Congo',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National MTN',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Congo',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Torneo BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Superliga BetPlay DIMAYOR',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Comoros Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Comorienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cape Verdean Football Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de Cabo Verde',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Promerica',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División de Costa Rica',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Costa Rican Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional de Fútbol de Cuba',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación de Fútbol de Cuba',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Curaçao Promé Divishon',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federashon Futbòl Kòrsou',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Third Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cypriot Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. česká fotbalová liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fotbalová národní liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Czech Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Czech Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'3. Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Regionalliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'DFB-Pokal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'DFL-Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Djibouti Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Djibouti FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Dominica Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dominica Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'3F Superliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'NordicBet Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Danish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Danish SuperCup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Dominicana de Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Dominicana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Professional League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Algerian Ligue 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe d''Algérie de football',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coupe d''Algérie de football',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Pro Ecuador Serie A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Categoría Serie B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Ecuador',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Egyptian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Egypt Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Egyptian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL League Two',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'FA Community Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eritrean Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eritrean National Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'LaLiga EA Sports',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'LALIGA HYPERMOTION',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa del Rey',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de España',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Meistriliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Esiliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Estonian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Estonian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ethiopian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ethiopian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Veikkausliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ykkönen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kakkonen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Finnish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fiji Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Fiji Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe de France',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Trophée des Champions',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pohnpei Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federated States of Micronesia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gabon Championnat National D1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Gabon Interclubs',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Georgian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Georgian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ghana Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ghana FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFA League First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Gambian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional da Guiné-Bissau',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional da Guiné Bissau',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Equatoguinean Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Equatoguinean Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gamma Ethniki',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Greek Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Cup of Friendship and Solidarity',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFA Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Grenada Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol de Guatemala',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División de Ascenso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa de Guatemala',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFF National Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Guyana Mayors Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol Profesional de Honduras',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Honduran Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperSport Hrvatska nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Druga nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hrvatski nogometni kup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Hrvatski nogometni superkup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue Haïtienne',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe d''Haïti',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság I',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság II',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Magyar Kupa',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'BRI Liga 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Piala Indonesia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Indian Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I-League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I-League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AIFF Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sports Direct FAI Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Persian Gulf Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azadegan League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hazfi Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Iran Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Iraq Stars League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Iraqi Premier Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Iraq FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Iraqi Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Besta deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Icelandic Men''s Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Icelandic Men''s Football Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligat Ha`Al',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Leumit',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Alef',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Israel State Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Israel Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie D',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Italia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa Italiana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Italia Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa di Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jamaica Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'JFF Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jordanian Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Jordan FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Jordan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J1 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J2 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J3 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Japan Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Emperor''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Japanese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kazakhstan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kazakhstan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kenyan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FKF President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kenyan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Pervaja Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kyrgyzstan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kyrgyzstan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cambodian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Cambodia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kiribati National Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kiribati Islands Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SKNFA Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Saint Kitts and Nevis National Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'K League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'K League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Korean FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kuwait Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kuwait Emir Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kuwait Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lao League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lao Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lebanese FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Lebanese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liberian First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Liberian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Libyan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Libyan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Libyan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SLFA First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Saint Lucia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Liechtenstein Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liechtensteiner Fussballverband',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sri Lanka Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sri Lanka FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lesotho Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lesotho Independence Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'A Lyga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pirma lyga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lithuanian Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Lithuanian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg National Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg Division of Honour',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Luxembourg Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Virsliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Latvijas Pirmā līga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Latvijas kauss',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Latvian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Moroccan Throne Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Challenge Prince Rainier III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Monegasque de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Divizia Națională',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Divizia A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Moldovan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Moldovan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malagasy Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malagasy de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Dhivehi Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Maldives FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga de Expansión MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Premier de México',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Campeón de Campeones MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva makedonska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Vtora makedonska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup na Makedonija',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Macedonian Supercup',
	0,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malian Première Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Malian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Malta Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Challenge League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Malta Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Myanmar National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'General Aung San Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva crnogorska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Druga crnogorska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Crnogorski fudbalski kup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Mongolian National Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'MFF Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Moçambola',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça de Moçambique',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1 Mauritania',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Mauritanian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Mauritian League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Mauritian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malawi Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malawi',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malaysia Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Malaysia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Namibia Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Namibia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Niger Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Niger Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nigerian Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Nigerian FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nicaraguan Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol',
		'id'
	)::integer
),

(
	'CUP',
	'CLUB',
	'Copa de Nicaragua',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Irish Premiership',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'NIFL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Irish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'NIFL Charity Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Niue Soccer Tournament',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Niue Island Soccer Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eredivisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eerste Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tweede Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'KNVB Beker',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Johan Cruijff Schaal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eliteserien',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Norwegian First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Norwegian Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Mesterfinalen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial A-Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial B-Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ncell Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'New Zealand National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@New Zealand Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Chatham Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@New Zealand Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Oman Professional League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oman Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sultan Qaboos Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oman Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pakistan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Pakistan National Football Challenge Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Asociación Nacional Pro Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Panamá',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Betsson',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Peruvian Segunda División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Bicentenario',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Peruana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Philippines Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Paulino Alcantara',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Palau Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palau Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Papua New Guinea National Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Papua New Guinea FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ekstraklasa',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I liga polska',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'II liga polska',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Polish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Polish Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Puerto Rico',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Puertorriqueña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'DPR Korea Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hwaebul Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal Betclic',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Terceira Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça de Portugal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supertaça Cândido de Oliveira',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Paraguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'División Intermedia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Paraguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Paraguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gaza Strip Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Palestine Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Qatar Stars League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Qatari Stars Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Sheikh Jassim Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga II',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cupa României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercupa României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Russian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Russian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Rwanda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Rwandan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Saudi Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Saudi League First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'The Custodian of The Two Holy Mosques Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Saudi Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Premiership',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Scottish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sudan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sudan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Senegal Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Senegal FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Singapore Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Singapore Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Singapore Community Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Solomon Islands S-League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Solomon Islands Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sierra Leone National Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sierra Leone Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Salvadoran Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Salvadoreña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campionato Sammarinese di Calcio',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Titano',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coppa Sammarinese',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Somali First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Somali Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Somalia Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Somalia Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Srbije',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Srpska Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup Srbije',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'South Sudan Football Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'South Sudan National Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'São Tomé and Príncipe Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de São Tomé e Principe',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'São Tomé and Príncipe Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SVB Eerste Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Beker van Suriname',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Suriname President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fortuna Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Slovak Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Slovak Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. SNL',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. SNL',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hervis Pokal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Allsvenskan',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Superettan',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Division 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Division 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Svenska Cupen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Eswatini',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Swazi Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Swazi Charity Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Seychelles First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Seychelles FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Syrian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Syrian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Syrian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Chad Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tchadienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National de Premiere Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Togolaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Thai FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Thailand Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Vysšaja Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tajikistan First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tajikistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Tajikistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Turkmenistan Higher League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Turkmenistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Turkmenistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Futebol Amadora Primeira Divisão',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça 12 de Novembro',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'LFA Super Taça',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Tonga Major League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tonga Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'TT Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Trinidad and Tobago FA Trophy',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Trinidad and Tobago Charity Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tunisian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Tunisian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Süper Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 1. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 2. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 3. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Turkish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Turkish Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Taiwan Football Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Taipei Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tanzanian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tanzania FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uganda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ugandan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ukrainian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Ukrainian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Profesional de Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División Profesional de Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Uruguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Major League Soccer',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'USL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'USL League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lamar Hunt U.S. Open Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Uzbekistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Uzbekistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Venezolana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga FUTVE 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Venezuela',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eximbank V League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Vietnamese National Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Vietnamese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cymru Premier',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Welsh Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Samoa National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Samoa Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Superliga e Futbollit të Kosovës',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga e Parë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kosovar Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kosovar Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Yemeni League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Yemeni President Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Yemeni Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'South African Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'National First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Nedbank Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Zambia Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Zambia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Zimbabwe Premier Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cup of Zimbabwe',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association',
		'id'
	)::integer
);
--------------------------------------------------------------------------------


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
 * INSERT team_nation
 ******************************************************************************/
INSERT INTO team_nation (team, nation, year)
VALUES
(
	get_id('@', 'team@name@SSC Napoli@age_cap@0@sex@MALE@year@1926'),
	get_id('@', 'country@code@ITA'),
	1926
),
(
	get_id('@', 'team@name@AC Milan@age_cap@0@sex@MALE@year@1899'),
	get_id('@', 'country@code@ITA'),
	1899
),
(
	get_id('@', 'team@name@Barcelona@age_cap@0@sex@FEMALE@year@1988'),
	get_id('@', 'country@code@ESP'),
	1988
),
(
	get_id('@', 'team@name@Italia@age_cap@0@sex@MALE@year@1910'),
	get_id('@', 'country@code@ITA'),
	1910
);

--------------------------------------------------------------------------------



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
 * INSERT fp_partecipation
 ******************************************************************************/
INSERT INTO fp_partecipation (competition_edition_id, team_id)
VALUES
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@SSC Napoli')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Inter')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@AC Milan')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Juventus FC')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@AS Roma')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Atalanta')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@SS Lazio')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@ACF Fiorentina')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@US Sassuolo')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Torino FC')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Udinese Calcio')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Bologna FC')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@AC Monza')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Empoli FC')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Hellas Verona')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@US Salernitana')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@Spezia Calcio')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@US Lecce')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@US Cremonese')
),
(
	get_id
	(
		'@', 
		'fp_competition_edition@start_year@2022@'
		'end_year@2023@competition_id@' ||
		get_id('@', 'fp_competition@name@Serie A')
	),
	get_id('@', 'fp_team@name@UC Sampdoria')
);
--------------------------------------------------------------------------------


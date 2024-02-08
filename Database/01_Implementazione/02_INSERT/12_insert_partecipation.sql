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
 * INSERT PARTECIPATION
 ******************************************************************************/
INSERT INTO fp_partecipation (competition_id, start_year, team_id)
VALUES
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Inter', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AC Milan', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Juventus FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AS Roma', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Atalanta', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Sassuolo', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Torino FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Udinese Calcio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Bologna FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AC Monza', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Empoli FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Hellas Verona', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Salernitana', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Spezia Calcio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Lecce', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Cremonese', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@UC Sampdoria', 'id')::integer
);
--------------------------------------------------------------------------------


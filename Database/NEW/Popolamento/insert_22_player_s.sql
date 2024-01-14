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
 * INSERT player_s
 ******************************************************************************/
INSERT INTO player_s (player, r_date)
VALUES
(
	get_id
	(
		'@',
		'player@name@Diego Armando@surname@Maradona'
		'@sex@MALE@dob@1960-10-30@nation@' ||
		get_id('@', 'country@code@ARG') 
	),
	'1997-10-25'
),
(
	
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@' ||
		get_id('@', 'country@code@SWE') 
	),
	'2023-07-01'
);
	
--------------------------------------------------------------------------------



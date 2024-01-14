
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
 * INSERT player_nation
 ******************************************************************************/
INSERT INTO player_nation (player, nation)
VALUES
(
	get_id
	(
		'@', 
		'player@name@Piotr@surname@Zielinski@sex@MALE@dob@1994-05-20@nation@'
		|| get_id('@', 'country@code@POL')
	),
	get_id('@', 'country@code@ITA')
);
--------------------------------------------------------------------------------



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
 * INSERT player
 ******************************************************************************/
INSERT INTO player (name, surname, sex, dob, foot, nation)
VALUES
(
	'Mike Peterson',
	'Maignan',
	'MALE',
	'03-07-1995',
	'RIGHT',
	get_id('@', 'country@code@FRA')
),
(
	'Matteo',
	'Politano',
	'MALE',
	'03-08-1993',
	'LEFT',
	get_id('@', 'country@code@ITA')

),
(
	'Giovanni',
	'Di Lorenzo',
	'MALE',
	'04-08-1993',
	'RIGHT',
	get_id('@', 'country@code@ITA')

),
(
	'Piotr',
	'Zielinski',
	'MALE',
	'20-05-1994',
	'BOTH',
	get_id('@', 'country@code@POL')

),
(
	
	'Davide',
	'Calabria',
	'MALE',
	'06-12-1996',
	'RIGHT',
	get_id('@', 'country@code@ITA')
);

--------------------------------------------------------------------------------



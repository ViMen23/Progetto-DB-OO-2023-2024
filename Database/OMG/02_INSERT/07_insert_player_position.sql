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
 * INSERT player_position
 ******************************************************************************/


INSERT INTO fp_player_position (player_id, position_id)
VALUES
(
	get_id
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_position@name@Centre Forward')
),
(
	get_id
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_position@name@Left Winger')
),
(
	get_id
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_position@name@Right Winger')
),
(
	get_id
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_id('@', 'fp_country@name@Nigeria')
	),
	get_id('@', 'fp_position@name@Second Striker')
),
(
	get_id
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_id('@', 'fp_country@name@Italy')
	),
	get_id('@', 'fp_position@name@Goalkeeper')
),
(
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_position@name@Central Midfield')
),
(
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_position@name@Attacking Midfield')
),
(
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_position@name@Defensive Midfield')
),
(
	get_id
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_id('@', 'fp_country@name@Spain')
	),
	get_id('@', 'fp_position@name@Second Striker')
);
--------------------------------------------------------------------------------


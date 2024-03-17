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
 * INSERT PLAYER_POSITION
 ******************************************************************************/
INSERT INTO fp_player_position (player_id, position_id)
VALUES
(
	get_column
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer
),
(
	get_column
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer
),
(
	get_column
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer
),
(
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer
),
(
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer
),
(
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer
);
--------------------------------------------------------------------------------


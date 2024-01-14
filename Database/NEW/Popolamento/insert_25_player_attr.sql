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
 * INSERT player_attr
 ******************************************************************************/
INSERT INTO player_attr (player, attr, value)
VALUES
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Corners'),
	4
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Crossing'),
	12
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Dribbling'),
	12
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Finishing'),
	19
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@First Touch'),
	20
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Free Kick Taking'),
	15
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Heading'),
	16
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Long Shots'),
	15
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Long Throws'),
	6
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Marking'),
	4
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Passing'),
	15
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Penalty Taking'),
	14
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Tackling'),
	3
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Technique'),
	19
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Aggression'),
	16
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Anticipation'),
	17
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Bravery'),
	18
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Composure'),
	16
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Concentration'),
	17
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Decisions'),
	16
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Determination'),
	20
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Flair'),
	20
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Leadership'),
	20
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Off the Ball'),
	15
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Positioning'),
	4
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Teamwork'),
	14
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Vision'),
	15
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Work Rate'),
	6
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Acceleration'),
	6
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Agility'),
	9
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Balance'),
	19
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Jumping Reach'),
	18
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Natural Fitness'),
	20
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Pace'),
	8
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Stamina'),
	7
),
(
	get_id
	(
		'@',
		'player@name@Zlatan@surname@Ibrahimović'
		'@sex@MALE@dob@1981-10-03@nation@'
		|| get_id('@', 'country@code@SWE') 
	),
	get_id('@', 'attr@name@Strength'),
	18
);
--------------------------------------------------------------------------------


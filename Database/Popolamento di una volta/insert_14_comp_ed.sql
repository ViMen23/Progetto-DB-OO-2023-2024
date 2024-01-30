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
 * INSERT comp_ed
 ******************************************************************************/
INSERT INTO comp_ed (comp, s_year, e_year, tier, age_cap, formula)
VALUES
(
	get_id('@', 'comp@name@Serie A'),
	2022,
	2023,
	1,
	0,
	get_id
	(
		'@', 
		'formula@num_group@1@team_group@20@team_knock@0@'
		'ha_group@TRUE@ha_knock@NULL@oc_group@FALSE'
	)
);
--------------------------------------------------------------------------------


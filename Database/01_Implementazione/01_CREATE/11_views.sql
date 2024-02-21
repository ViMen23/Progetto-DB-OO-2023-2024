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
 * VIEW
 ******************************************************************************/

/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_continents
 *
 * DESC : TODO
 ******************************************************************************/
CREATE VIEW vi_all_continents
AS
	SELECT
		fp_country.id::text,
		fp_country.type::text,
		fp_country.code::text,
		fp_country.name::text
	FROM
		fp_country
	WHERE
		fp_country.type = 'CONTINENT'
	ORDER BY
		fp_country.name;
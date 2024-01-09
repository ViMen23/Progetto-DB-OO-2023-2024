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
 * FUNCTION
 ******************************************************************************/



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : no_world
 * DESC : returns true if there are no active world type countries,
 *        false otherwise
 *
 *        IN      : void
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION no_world
(
)
RETURNS boolean
AS
$$
DECLARE

	num_world integer; -- number of active world type country

BEGIN

	-- count all active world type country
	SELECT count(*)
	INTO num_world
	FROM country
	WHERE (type = 'WORLD') AND (e_year IS NULL);

	-- if there are not active world type country
	IF (0 = num_world)THEN
		RETURN TRUE;
	END IF;
	
	-- ..otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : insu_country
 * DESC : returns true if the inside country type and super country type
 *        follow the containment relationship
 *
 *        IN      : country.type%TYPE, country.type%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION insu_country
(
	IN in_country_type country.type%TYPE, -- inside country type
	IN su_country_type country.type%TYPE  -- super country type
)
RETURNS boolean
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
BEGIN

	IF
	(
		-- if a type nation country
		-- is inside a type continent country
		(in_country_type = 'NATION' AND su_country_type = 'CONTINENT')
		OR
		-- ..or if a type continent country
		-- is inside a type world country
		(in_country_type = 'CONTINENT' AND su_country_type = 'WORLD')
	)
	THEN
		-- the containment relationship
		-- between the two countries is correct
		RETURN TRUE;
	END IF;
	
	-- otherwise
	-- the containment relationship
	-- between the two countries is not correct
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 * DESC : returns true if the country identified by the input code country
 *        is a nation
 *
 *        IN      : country.code%TYPE 
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN country_code country.code%TYPE -- country code
)
RETURNS boolean
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
BEGIN
	
	-- if the country identified by the input country code
	-- is of type nation 
	IF (get_country_type(country_code) = 'NATION') THEN
		RETURN TRUE;
	END IF;
	
	-- .. otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : el_in_range
 * DESC : returns true if the given element is contained in the given range 
 *
 *        IN      : integer, integer, integer
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION el_in_range
(
	IN el      integer, -- element
	IN s_ragge integer, -- start range
	IN e_range integer  -- end range
)
RETURNS boolean
AS
$$
BEGIN

	-- return the output of range1_in_range2 function
	-- given as first range [el, el]
	-- and given as second range [s_range, e_range] 
	RETURN range1_in_range2(el, el, s_range, s_range); 
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : range1_in_range2
 * DESC : returns true if the first range is contained in the second range
 *
 *        IN      : integer, integer, integer, integer
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION r1_in_r2
(
	IN s_range1 integer, -- start of the first range
	IN e_range1 integer, -- end of the first range
	IN s_range2 integer, -- start of the second range
	IN e_range2 integer  -- end of the second range
)
RETURNS boolean
AS
$$
BEGIN
	
	-- to create a range it is used the function int4range
	-- see offical postgresql documentation for more info
	
	-- if the first range is contained in the second range
	IF (int4range(sr1, er1) <@ int4range(sr2, er2)) THEN
		RETURN TRUE;
	END IF;
	
	-- .. otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_country
 * DESC : returns true if the given year is contained
 *        into the year's range of the country identified by the given code
 *
 *        IN      : dm_year, country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_country
(
	IN year         dm_year,          -- year to check
	IN country_code	country.code%TYPE -- country code
)
RETURNS boolean
AS
$$
BEGIN

	-- return is_in_country function output giving as
	-- year range [year, year]
	RETURN is_in_country(year, year, country_code);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_country
 * DESC : returns true if the given year range is contained into
 *        the country year range of the country
 *        identified by the input country code
 *
 *        IN      : dm_year, dm_year, country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_country
(
	IN s_year       dm_year,          -- start year range to check
	IN e_year       dm_year,          -- end year range to check
	IN country_code	country.code%TYPE -- country code
)
RETURNS boolean
AS
$$
BEGIN

	-- if the first range is contained in the second one
	IF
	(
		range1_in_range2
		(
			s_year, 
			e_year,
			get_country_s_year(country_code),
			get_country_e_year(country_code)
		)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	-- .. otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_conf
 * DESC : returns true if the given year range is contained into
 *        the confederation year range of the confederation
 *        identified by the input condeferation code
 *
 *        IN      : dm_year, dm_year, conf.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_conf
(
	IN s_year    dm_year,       -- start year range to check
	IN e_year    dm_year,       -- end year range to check
	IN conf_code conf.code%TYPE -- confederation code
)
RETURNS boolean
AS
$$
BEGIN
	
	-- if the first range is contained in the second one
	IF
	(
		range1_in_range2
		(
			s_year,
			e_year,
			get_conf_s_year(conf_code),
			get_conf_e_year(conf_code)
		)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	-- .. otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_comp
 * DESC : returns true if the given year range is contained into
 *        the competition year range of the competition
 *        identified by the input competition id
 *
 *        IN      : dm_year, dm_year, comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_comp
(
	IN s_year  dm_year,     -- start year range to check
	IN e_year  dm_year,     -- end year range to check
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS boolean
AS
$$
BEGIN

	-- if the first range is contained in the second one
	IF
	(
		range1_in_range2
		(
			s_year,
			e_year,
			get_comp_s_year(comp_id),
			get_comp_e_year(comp_id)
		)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	-- .. otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_team
 * DESC : returns true if the given year range is contained into
 *        the team year range of the team
 *        identified by the input team id
 *
 *        IN      : dm_year, dm_year, team.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_team
(
	IN s_year  dm_year,     -- start year range to check
	IN e_year  dm_year,     -- end year range to check
	IN team_id team.id%TYPE -- team id
)
RETURNS boolean
AS
$$
BEGIN
	
	-- if the first range is contained in the second one
	IF
	(
		range1_in_range2
		(
			s_year,
			e_year,
			get_team_s_year(team_id),
			get_team_e_year(team_id)
		)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	-- .. otherwise
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

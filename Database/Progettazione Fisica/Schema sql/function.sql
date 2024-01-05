--****************************************************************************************
--* FOOTBALL PLAYER DATABASE
--****************************************************************************************

------------------------------------------------------------------------------------------
-- UNIVERSITY : FEDERICO II - NAPOLI
-- FIELD      : COMPUTER SCIENCE
-- CLASS      : DATA BASES I
-- THEACHER   : SILVIO BARRA
-- YEAR       : 2023-2024
------------------------------------------------------------------------------------------

--****************************************************************************************
--* FUNCTIONS
--****************************************************************************************

------------------------------------------------------------------------------------------
-- FUNCTION: no_world
------------------------------------------------------------------------------------------
-- input   : none
-- returns : boolean
------------------------------------------------------------------------------------------
-- if there are no countries of type world it returns true,
-- false otherwise 
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.no_world()
RETURNS boolean
AS
$$
DECLARE

	n_world integer;

BEGIN

	SELECT count(*)
	INTO n_world
	FROM fpdb.fp.cty AS c
	WHERE c.type = 'WORLD';

	IF (0 = n_world)THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: get_country_type
------------------------------------------------------------------------------------------
-- input   : country code
-- returns : country type
------------------------------------------------------------------------------------------
-- given a country code as input,
-- it returns its type
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.get_country_type
(
	IN country_code fpdb.fp.cty.code%TYPE
)
RETURNS fpdb.fp.cty.type%TYPE
AS
$$
DECLARE

	country_type fp.cty.type%TYPE ; -- TODO: Error in pgadmin ho dovuto togliere fpdb

BEGIN

	SELECT c.type
	INTO country_type
	FROM fpdb.fp.cty AS c
	WHERE c.code = country_code;
	
	RETURN country_type;
	
END;
$$
RETURNS NULL ON NULL INPUT -- the function returns null when one or more inputs of the function is null
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: get_country_range
------------------------------------------------------------------------------------------
-- input   : country_code code
-- output  : s_year dm_year, e_year dm_year  
-- returns : record
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.get_country_range
(
	IN  c_code fpdb.fp.cty.code%TYPE,
	OUT s_year fpdb.fp.cty.s_year%TYPE,
	OUT e_year fpdb.fp.cty.e_year%TYPE
)
RETURNS record
AS
$$
DECLARE

BEGIN

	SELECT c.s_year, c.e_year
	INTO s_year, e_year
	FROM fpdb.fp.cty AS c
	WHERE c.code = c_code;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- FUNCTION: get_country_name
------------------------------------------------------------------------------------------
-- input   : country_code code  
-- returns : country_name dm_enstr
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.get_country_name
(
	IN  c_code fpdb.fp.cty.code%TYPE
)
RETURNS fpdb.fp.cty.name%TYPE
AS
$$
DECLARE
	c_name fp.cty.name%TYPE;
BEGIN

	SELECT c.name
	INTO c_name
	FROM fpdb.fp.cty AS c
	WHERE c.code = c_code;
	
	RETURN c_name;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: in_correct_country
------------------------------------------------------------------------------------------
-- input   : content country type, containing country type
-- returns : boolean
------------------------------------------------------------------------------------------
-- takes the types of two countries and evaluates whether the first type
-- can be contained in the second
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.in_correct_country
(
	IN in_ct fpdb.fp.cty.type%TYPE,
	IN su_ct fpdb.fp.cty.type%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (in_ct = 'NATION' AND su_ct = 'CONTINENT') THEN
		RETURN TRUE;
	END IF;
	
	IF (in_ct = 'CONTINENT' AND su_ct = 'WORLD') THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_nation
------------------------------------------------------------------------------------------
-- input   : country code
-- returns : boolean
------------------------------------------------------------------------------------------
-- given a country code as input,
-- it returns true if the country is a nation
-- otherwise false
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.is_nation
(
	IN country_code fpdb.fp.cty.code%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (fpdb.fp.get_country_type(country_code) = 'NATION') THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_element_in_range
------------------------------------------------------------------------------------------
-- input   : element integer, start_range integer, end_range integer  
-- returns : boolean
------------------------------------------------------------------------------------------
-- takes as input an integer and a range of integers
-- and returns true if the integer is contained in the range,
-- false otherwise
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.is_element_in_range
(
	IN element integer,
	IN start_range integer,
	IN end_range integer
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (int4range(start_range, end_range) @> element) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_range1_in_range2
------------------------------------------------------------------------------------------
-- input   : start_range1 integer, end_range1 integer, 
-- 			 start_range2 integer, end_range2 integer  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.is_range1_in_range2
(
	IN start_range1 integer,
	IN end_range1 integer,
	IN start_range2 integer,
	IN end_range2 integer
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF ( int4range(start_range1, end_range1) <@ int4range(start_range2, end_range2) ) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_born
------------------------------------------------------------------------------------------
-- input   : birth_date date, country_code code  
-- returns : boolean
------------------------------------------------------------------------------------------
-- takes as input an integer and a range of integers
-- and returns true if the integer is contained in the range,
-- false otherwise
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.is_born
(
	IN b_date fpdb.fp.fply.b_date%TYPE,
	IN c_code fp.dm_code
)
RETURNS boolean
AS
$$
DECLARE

	s_year fp.dm_year := NULL;
	e_year fp.dm_year := NULL;
	p_year INTEGER :=  extract( year from(b_date) );

BEGIN

	SELECT * INTO s_year, e_year FROM fpdb.fp.get_country_range(c_code);
	
	IF ( fpdb.fp.is_element_in_range( p_year, s_year , e_year ) )THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_cteam_after_cty
------------------------------------------------------------------------------------------
-- input   : s_year dm_year, e_year dm_year, country_code dm_code  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.is_cteam_after_cty -- TODO: generalize this name
(
	IN in_s_year fpdb.fp.team.s_year%TYPE,
	IN in_e_year fpdb.fp.team.e_year%TYPE,
	IN c_code fpdb.fp.team.cty%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	s_year fp.cty.s_year%TYPE := NULL;
	e_year fp.cty.e_year%TYPE := NULL;

BEGIN

	SELECT * INTO s_year, e_year FROM fpdb.fp.get_country_range(c_code);
	
	IF ( fpdb.fp.is_range1_in_range2( in_s_year, in_e_year, s_year, e_year ) ) THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_nteam_after_cty
------------------------------------------------------------------------------------------
-- input   : s_year dm_year, e_year dm_year, country_code dm_code  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.is_nteam_after_cty
(
	IN in_s_year fpdb.fp.team.s_year%TYPE,
	IN in_e_year fpdb.fp.team.e_year%TYPE,
	IN c_code fpdb.fp.team.cty%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	s_year fp.cty.s_year%TYPE := NULL;
	e_year fp.cty.e_year%TYPE := NULL;

BEGIN

	SELECT * INTO s_year, e_year FROM fpdb.fp.get_country_range(c_code);
	
	IF ( fpdb.fp.is_element_in_range( in_s_year, s_year, e_year ) AND
		 ( e_year IS NOT DISTINCT FROM in_e_year ) ) THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: get_confederation_type
------------------------------------------------------------------------------------------
-- input   : confederation code
-- returns : confederation type
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.get_confederation_type
(
	IN conf_code fpdb.fp.conf.code%TYPE
)
RETURNS fpdb.fp.conf.type%TYPE
AS
$$
DECLARE

	conf_type fp.conf.type%TYPE;

BEGIN

	SELECT c.type
	INTO conf_type
	FROM fpdb.fp.conf AS c
	WHERE c.code = conf_code;
	
	RETURN conf_type;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------



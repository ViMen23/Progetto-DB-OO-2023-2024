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

	country_type fpdb.fp.cty.type%TYPE;

BEGIN

	SELECT c.type
	INTO country_type
	FROM fpdb.fp.cty AS c
	WHERE c.code = country_code;
	
	RETURN country_type;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: get_country_range
------------------------------------------------------------------------------------------
-- input   : country_code code
-- output  : s_year dm_year, e_year dm_year  
-- returns : none
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.get_country_range
(
	IN  c_code fpdb.fp.cty.code%TYPE,
	OUT s_year fpdb.fp.cty.s_year%TYPE,
	OUT s_year fpdb.fp.cty.e_year%TYPE
)
RETURNS void
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
	IN in_ct fpdb.fp.cty.code%TYPE,
	IN su_ct fpdb.fp.cty.code%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (in_ct = 'NATION' AND su_ct = 'CONTINENT') THEN
		RETURN TRUE;
	END IF
	
	IF (in_ct = 'CONTINENT' AND su_ct = 'WORLD') THEN
		RETURN TRUE;
	END IF
	
	RETURN FALSE;
	
END;
$$
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
	IN c_code fpdb.fp.fply.cty%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	s_year fpdb.fp.cty.s_year%TYPE := NULL;
	e_year fpdb.fp.cty.e_year%TYPE := NULL;

BEGIN

	fpdb.fp.get_country_range(c_code, s_year, e_year);
	
	IF (fpdb.fp.is_element_in_range(extract(year from b_date), s_year, e_year)) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------
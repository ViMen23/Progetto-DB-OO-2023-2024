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
CREATE OR REPLACE FUNCTION no_world()
RETURNS boolean
AS
$$
DECLARE

	n_world integer;

BEGIN

	SELECT count(*)
	INTO n_world
	FROM country
	WHERE (type = 'WORLD') AND (e_year IS NULL);

	IF (0 = n_world)THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: country_ty
------------------------------------------------------------------------------------------
-- input   : country code
-- returns : country type
------------------------------------------------------------------------------------------
-- given a country code as input,
-- it returns its type
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION country_ty
(
	IN c_code country.code%TYPE
)
RETURNS country.type%TYPE
AS
$$
DECLARE

	c_type country.type%TYPE;

BEGIN

	SELECT c.type
	INTO c_type
	FROM country
	WHERE code = c_code;
	
	RETURN c_type;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: country_sy
------------------------------------------------------------------------------------------
-- input   : country code
-- returns : s_year  dm_year
------------------------------------------------------------------------------------------
-- given a country code as input,
-- it returns its foundation year
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION country_sy
(
	IN c_code country.code%TYPE
)
RETURNS country.s_year%TYPE
AS
$$
DECLARE

	s_year country.s_year%TYPE;

BEGIN

	SELECT s_year
	INTO s_year
	FROM country
	WHERE code = c_code;
	
	RETURN s_year;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- FUNCTION: country_ey
------------------------------------------------------------------------------------------
-- input   : country code
-- returns : e_year  dm_year
------------------------------------------------------------------------------------------
-- given a country code as input,
-- it returns its foundation year
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION country_ey
(
	IN c_code country.code%TYPE
)
RETURNS country.e_year%TYPE
AS
$$
DECLARE

	e_year country.s_year%TYPE;

BEGIN

	SELECT e_year
	INTO e_year
	FROM country
	WHERE code = c_code;
	
	RETURN e_year;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------
-- FUNCTION: country_nm
------------------------------------------------------------------------------------------
-- input   : country_code code  
-- returns : country_name dm_enstr
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION country_nm
(
	IN  c_code country.code%TYPE
)
RETURNS country.name%TYPE
AS
$$
DECLARE
	c_name country.name%TYPE;
BEGIN

	SELECT c.name
	INTO c_name
	FROM country AS c
	WHERE c.code = c_code;
	
	RETURN c_name;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: insu_country
------------------------------------------------------------------------------------------
-- input   : content country type, containing country type
-- returns : boolean
------------------------------------------------------------------------------------------
-- takes the types of two countries and evaluates whether the first type
-- can be contained in the second
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insu_country
(
	IN in_country country.type%TYPE,
	IN su_country country.type%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (in_country = 'NATION' AND su_country = 'CONTINENT') THEN
		RETURN TRUE;
	END IF;
	
	IF (in_country = 'CONTINENT' AND su_country = 'WORLD') THEN
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
CREATE OR REPLACE FUNCTION is_nation
(
	IN c_code country.code%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (country_ty(c_code) = 'NATION') THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: e_in_r
------------------------------------------------------------------------------------------
-- input   : element integer, start_range integer, end_range integer  
-- returns : boolean
------------------------------------------------------------------------------------------
-- takes as input an integer and a range of integers
-- and returns true if the integer is contained in the range,
-- false otherwise
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION e_in_r
(
	IN e  integer,
	IN sr integer,
	IN er integer
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	RETURN r1_in_r2(e, e, sr, er);
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: r1_in_r2
------------------------------------------------------------------------------------------
-- input   : start_range1 integer, end_range1 integer, 
-- 			 start_range2 integer, end_range2 integer  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION r1_in_r2
(
	IN sr1 integer,
	IN er1 integer,
	IN sr2 integer,
	IN er2 integer
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF (int4range(sr1, er1) <@ int4range(sr2, er2)) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- FUNCTION: is_in_country
------------------------------------------------------------------------------------------
-- input   : s_year dm_year, e_year dm_year, country_code dm_scode  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION is_in_country
(
	IN s_year dm_year,
	IN e_year dm_year,
	IN c_code	country.code%TYPE;
)
RETURNS boolean
AS
$$
DECLARE

BEGIN
	
	IF (r1_in_r2(s_year, e_year, country_sy(c_code), country_ey(c_code))) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_in_country
------------------------------------------------------------------------------------------
-- input   : year dm_year, country_code dm_scode  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION is_in_country
(
	IN year   dm_year,
	IN c_code	country.code%TYPE;
)
RETURNS boolean
AS
$$
DECLARE

BEGIN
	
	RETURN is_in_country(year, year, c_code);
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: conf_ty
------------------------------------------------------------------------------------------
-- input   : conf_code dm_scode
-- returns : conf_type ty_country
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION conf_ty
(
	IN conf_code conf.code%TYPE
)
RETURNS conf.type%TYPE
AS
$$
DECLARE

	conf_type conf.type%TYPE;

BEGIN

	SELECT type
	INTO conf_type
	FROM conf
	WHERE code = conf_code;
	
	RETURN conf_type;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: conf_sy
------------------------------------------------------------------------------------------
-- input   : conf		 code
-- returns : s_year  dm_year
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION conf_sy
(
	IN conf conf.code%TYPE
)
RETURNS conf.s_year%TYPE
AS
$$
DECLARE

	year conf.s_year%TYPE;

BEGIN

	SELECT s_year
	INTO year
	FROM conf
	WHERE code = conf;
	
	RETURN s_year;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------
-- FUNCTION: conf_ey
------------------------------------------------------------------------------------------
-- input   : conf		 code
-- returns : e_year  dm_year
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION conf_ey
(
	IN conf conf.code%TYPE
)
RETURNS conf.s_year%TYPE
AS
$$
DECLARE

	year conf.e_year%TYPE;

BEGIN

	SELECT e_year
	INTO year
	FROM conf
	WHERE code = conf;
	
	RETURN year;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_in_conf
------------------------------------------------------------------------------------------
-- input   : s_year dm_year, e_year dm_year, conf_code dm_code  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION is_in_conf
(
	IN s_year dm_year,
	IN e_year dm_year,
	IN conf 	conf.code%TYPE;
)
RETURNS boolean
AS
$$
DECLARE

BEGIN
	
	IF (r1_in_r2(s_year, e_year, conf_sy(c_code), conf_ey(c_code))) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: comp_sy
------------------------------------------------------------------------------------------
-- input   : comp		 integer
-- returns : s_year  dm_year
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION comp_sy
(
	IN comp conf.code%TYPE
)
RETURNS comp.s_year%TYPE
AS
$$
DECLARE

	year comp.s_year%TYPE;

BEGIN

	SELECT s_year
	INTO year
	FROM comp
	WHERE id = comp;
	
	RETURN year;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- FUNCTION: comp_sy
------------------------------------------------------------------------------------------
-- input   : comp		 integer
-- returns : s_year  dm_year
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION comp_sy
(
	IN comp conf.code%TYPE
)
RETURNS comp.e_year%TYPE
AS
$$
DECLARE

	year comp.e_year%TYPE;

BEGIN

	SELECT s_year
	INTO year
	FROM comp
	WHERE id = comp;
	
	RETURN year;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- FUNCTION: comp_tty
------------------------------------------------------------------------------------------
-- input   : comp integer
-- returns : team ty_team
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION comp_tty
(
	IN comp conf.code%TYPE
)
RETURNS comp.t_type%TYPE
AS
$$
DECLARE

	team comp.t_type%TYPE;

BEGIN

	SELECT t_type
	INTO team
	FROM comp
	WHERE id = comp;
	
	RETURN team;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: comp_ty
------------------------------------------------------------------------------------------
-- input   : comp integer
-- returns : type ty_comp
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION comp_ty
(
	IN comp conf.code%TYPE
)
RETURNS comp.type%TYPE
AS
$$
DECLARE

	type comp.type%TYPE;

BEGIN

	SELECT type
	INTO type
	FROM comp
	WHERE id = comp;
	
	RETURN type;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: comp_fq
------------------------------------------------------------------------------------------
-- input   : comp integer
-- returns : freq dm_uint
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION comp_fq
(
	IN comp comp.id%TYPE
)
RETURNS comp.freq%TYPE
AS
$$
DECLARE

	freq comp.freq%TYPE;

BEGIN

	SELECT freq
	INTO freq
	FROM comp
	WHERE id = comp;
	
	RETURN freq;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- FUNCTION: is_in_comp
------------------------------------------------------------------------------------------
-- input   : s_year dm_year, e_year dm_year, comp_id integer  
-- returns : boolean
------------------------------------------------------------------------------------------
-- TODO: comment function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION is_in_comp
(
	IN s_year dm_year,
	IN e_year dm_year,
	IN comp 	comp.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN
	
	IF (r1_in_r2(s_year, e_year, comp_sy(comp), comp_ey(comp))) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------
-- FUNCTION: ctrl_formula
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION ctrl_formula
(
	IN comp_ty comp.type%TYPE,
	IN formula comp_ed.formula%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	IF ('INDIVIDUAL' = comp_ty) THEN
		IF (formula IS NULL) THEN
			RETURN TRUE;
		END IF;
	ELSIF ('CHAMPINSHIP' = comp_ty) THEN
		IF (0 = formula_pow(formula)) THEN
			RETURN TRUE;
		END IF;
	ELSE
		IF (formula_k(formula) IS NOT NULL) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	RETURN FALSE
	
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------
-- FUNCTION: formula_k
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION formula_k
(
	IN formula integer%TYPE
)
RETURNS formula.nt_knock%TYPE
AS
$$
DECLARE

	nt_knock formula.nt_knock%TYPE;

BEGIN

	SELECT nt_knock
	INTO nt_knock
	FROM formula
	WHERE id = formula;
	
	RETURN nt_knock;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------


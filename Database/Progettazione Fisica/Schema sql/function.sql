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
	INTO num_world -- ..and put into num_world 
	FROM country
	WHERE (type = 'WORLD') AND (e_year IS NULL);

	-- if there are not active world type country
	IF (0 = n_world)THEN
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
 * NAME : country_type
 * DESC : returns the country type of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.type%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION country_type
(
	IN country_code country.code%TYPE
)
RETURNS country.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	country_type country.type%TYPE;

BEGIN

	-- select the type of the country
	-- associated with the input code country
	SELECT type
	INTO country_type          -- put into country_type variable
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN c_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : country_s_year
 * DESC : returns the country foundation year of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.s_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION country_s_year
(
	IN country_code country.code%TYPE
)
RETURNS country.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	year country.s_year%TYPE;

BEGIN

	-- select the fouondation year of the country
	-- associated with the input code country
	SELECT s_year
	INTO year                  -- put into year variable
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : country_e_year
 * DESC : returns the country suppression year of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.e_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION country_e_year
(
	IN country_code country.code%TYPE
)
RETURNS country.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	year country.s_year%TYPE;

BEGIN

	-- select the suppression year of the country
	-- associated with the input code country
	SELECT e_year
	INTO year                  -- put into year variable
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : country_name
 * DESC : returns the country name of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.name%TYPE 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION country_name
(
	IN  couontry_code country.code%TYPE
)
RETURNS country.name%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE
	name country.name%TYPE;
BEGIN

	-- select the name of the country
	-- associated with the input code country
	SELECT name
	INTO name                   -- put into year variable
	FROM country
	WHERE code = couontry_code;
	
	-- and return it
	RETURN name;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : insu_country
 * DESC :
 *
 *        IN      : country.type%TYPE, country.type%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION insu_country
(
	IN in_country country.type%TYPE, -- inside country
	IN su_country country.type%TYPE  -- super country
)
RETURNS boolean
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

BEGIN

	IF
	(
		-- if a type nation country
		-- is inside a type continent country
		(in_country = 'NATION' AND su_country = 'CONTINENT')
		OR
		-- ..or if a type continent country
		-- is inside a type world country
		(in_country = 'CONTINENT' AND su_country = 'WORLD')
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
 * DESC :
 *
 *        IN      : country.code%TYPE 
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN country_code country.code%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

BEGIN
	
	-- if the country identified by the input country code
	-- is of type nation 
	IF (country_type(country_code) = 'NATION') THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : e_in_r
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
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
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : r1_in_r2
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
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
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_country
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_country
(
	IN s_year dm_year,
	IN e_year dm_year,
	IN c_code	country.code%TYPE
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
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_country
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_country
(
	IN year   dm_year,
	IN c_code	country.code%TYPE
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
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : conf_ty
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_ty
(
	IN conf_code conf.code%TYPE
)
RETURNS conf.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : conf_sy
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_sy
(
	IN conf conf.code%TYPE
)
RETURNS conf.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : conf_ey
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_ey
(
	IN conf conf.code%TYPE
)
RETURNS conf.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_conf
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_conf
(
	IN s_year dm_year,
	IN e_year dm_year,
	IN conf 	conf.code%TYPE
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
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_sy
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_sy
(
	IN comp conf.code%TYPE
)
RETURNS comp.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_ey
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_ey
(
	IN comp conf.code%TYPE
)
RETURNS comp.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	year comp.e_year%TYPE;

BEGIN

	SELECT e_year
	INTO year
	FROM comp
	WHERE id = comp;
	
	RETURN year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_tty
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_tty
(
	IN comp conf.code%TYPE
)
RETURNS comp.t_type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_ty
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_ty
(
	IN comp conf.code%TYPE
)
RETURNS comp.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_fq
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_fq
(
	IN comp comp.id%TYPE
)
RETURNS comp.freq%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
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
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_sex
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_sex
(
	IN comp comp.id%TYPE
)
RETURNS comp.sex%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	sex comp.sex%TYPE;

BEGIN

	SELECT sex
	INTO sex
	FROM comp
	WHERE id = comp;
	
	RETURN sex;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_max_age
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_max_age
(
	IN comp comp.id%TYPE
)
RETURNS comp.max_age%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	max_age comp.max_age%TYPE;

BEGIN

	SELECT max_age
	INTO max_age
	FROM comp
	WHERE id = comp;
	
	RETURN max_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : comp_conf
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION comp_conf
(
	IN comp comp.id%TYPE
)
RETURNS comp.conf%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	conf comp.conf%TYPE;

BEGIN

	SELECT conf
	INTO conf
	FROM comp
	WHERE id = comp;
	
	RETURN conf;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_comp
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
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
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : f_comp_ngroup
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION f_comp_ngroup
(
	IN f_comp f_comp.id%TYPE
)
RETURNS f_comp.n_group%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	n_group f_comp.n_group%TYPE;

BEGIN

	SELECT n_group
	INTO n_group
	FROM f_comp
	WHERE id = f_comp;
	
	RETURN n_group;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : f_comp_pow2k
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION f_comp_pow2k
(
	IN formula f_comp.id%TYPE
)
RETURNS f_comp.pow2_k%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	pow2_k f_comp.pow2_k%TYPE;

BEGIN

	SELECT pow2_k
	INTO pow2_k
	FROM f_comp
	WHERE id = formula;
	
	RETURN pow2_k;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : ctrl_formula
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION ctrl_formula
(
	IN conf_ty conf.type%TYPE,
	IN comp_ty comp.type%TYPE,
	IN formula comp_ed.formula%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN

	-- if competition is individual there isn't a formula
	IF ('INDIVIDUAL' = comp_ty) THEN
		IF (formula IS NULL) THEN
			RETURN TRUE;
		END IF;
	-- if competition is champhionship the formula must have
	ELSIF ('CHAMPIONSHIP' = comp_ty) THEN
		-- at least a group. There isn't a control on
		IF (0 <> f_comp_ngroup(formula)) THEN  
			-- comp_ty because champhionship must have comp_ty='NATION' as the trigger on comp says.
			RETURN TRUE;	 
		END IF;
	-- if competition is tournament the formula is a knockout iff
	ELSIF ('TOURNAMENT' = comp_ty) THEN
		-- conf_ty = 'NATION' as we have seen yesterday on internet,
		IF ('NATION' = conf_ty) THEN
			IF (0 = f_comp_ngroup(formula)) THEN
				RETURN TRUE;
			END IF;
		-- if conf_ty <> 'NATION' the formula must have at
		ELSE
			-- least a knockout match
			IF (0 <> f_comp_pow2k(formula)) THEN
				RETURN TRUE;
			END IF;
	-- if competition is super cup then the formula is knockout
	ELSIF ('SUPER CUP' = comp_ty ) THEN
		IF (0 = f_comp_ngroup(formula)) THEN
				RETURN TRUE;
			END IF;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_sy
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_sy
(
	IN team team.id%TYPE
)
RETURNS team.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	year team.s_year%TYPE;

BEGIN

	SELECT s_year
	INTO year
	FROM team
	WHERE id = team;
	
	RETURN year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_ey
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_ey
(
	IN team team.id%TYPE
)
RETURNS team.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	year team.e_year%TYPE;

BEGIN

	SELECT e_year
	INTO year
	FROM team
	WHERE id = team;
	
	RETURN year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_ty
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_ty
(
	IN team team.id%TYPE
)
RETURNS team.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	type team.type%TYPE;

BEGIN

	SELECT type
	INTO type
	FROM team
	WHERE id = team;
	
	RETURN type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_sex
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_sex
(
	IN team team.id%TYPE
)
RETURNS team.sex%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	sex team.sex%TYPE;

BEGIN

	SELECT sex
	INTO sex
	FROM team
	WHERE id = team;
	
	RETURN sex;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_max_age
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_max_age
(
	IN team team.id%TYPE
)
RETURNS team.max_age%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	max_age team.max_age%TYPE;

BEGIN

	SELECT max_age
	INTO max_age
	FROM team
	WHERE id = team;
	
	RETURN max_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_in_team
 * DESC :
 *
 *        IN      : 
 *        INOUT   : 
 *        OUT     : 
 *
 *        RETURNS : 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_in_team
(
	IN s_year dm_year,
	IN e_year dm_year,
	IN team		team.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

BEGIN
	
	IF (r1_in_r2(s_year, e_year, team_sy(team), team_ey(team))) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

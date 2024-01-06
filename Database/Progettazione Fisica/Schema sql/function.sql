/* PROJECT NAME : FOOTBALL PLAYER DATABASE
 *
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY
 * FIELD        : COMPUTER SCIENCE
 * CLASS        : DATA BASES I
 * TEACHER      : SILVIO BARRA
 * YEAR         : 2023-2024
 */


/* FUNCTION */

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

	SELECT type
	INTO c_type
	FROM country
	WHERE code = c_code;
	
	RETURN c_type;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;



/* TYPE :
 * NAME :
 * DESC :
 */
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




/* TYPE :
 * NAME :
 * DESC :
 */
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





/* TYPE :
 * NAME :
 * DESC :
 */
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

	SELECT name
	INTO c_name
	FROM country
	WHERE code = c_code;
	
	RETURN c_name;
	
END;
$$
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;



/* TYPE :
 * NAME :
 * DESC :
 */
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



/* TYPE :
 * NAME :
 * DESC :
 */
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



/* TYPE :
 * NAME :
 * DESC :
 */
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



/* TYPE :
 * NAME :
 * DESC :
 */
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




/* TYPE :
 * NAME :
 * DESC :
 */
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



/* TYPE :
 * NAME :
 * DESC :
 */
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



/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION comp_ey
(
	IN comp conf.code%TYPE
)
RETURNS comp.e_year%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION comp_sex
(
	IN comp comp.id%TYPE
)
RETURNS comp.sex%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION comp_max_age
(
	IN comp comp.id%TYPE
)
RETURNS comp.max_age%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION comp_conf
(
	IN comp comp.id%TYPE
)
RETURNS comp.conf%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
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

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION f_comp_ngroup
(
	IN f_comp f_comp.id%TYPE
)
RETURNS f_comp.n_group%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION f_comp_pow2k
(
	IN formula f_comp.id%TYPE
)
RETURNS f_comp.pow2_k%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
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

	IF ('INDIVIDUAL' = comp_ty) THEN -- if competition is individual there isn't a formula
		IF (formula IS NULL) THEN
			RETURN TRUE;
		END IF;
	ELSIF ('CHAMPIONSHIP' = comp_ty) THEN 	-- if competition is champhionship the formula must have
		IF (0 <> f_comp_ngroup(formula) ) THEN -- at least a group. There isn't a control on 
			RETURN TRUE; 						-- comp_ty because champhionship must have comp_ty= 
		END IF;									-- 'NATION' as the trigger on comp says.
	ELSIF ('TOURNAMENT' = comp_ty) THEN -- if competition is tournament the formula is a knockout iff
		IF ('NATION' = conf_ty ) THEN   -- conf_ty = 'NATION' as we have seen yesterday on internet,
			IF (0 = f_comp_ngroup(formula)) THEN
				RETURN TRUE;
			END IF;
		ELSE 										-- if conf_ty <> 'NATION' the formula must have at
			IF ( 0 <> f_comp_pow2k(formula) ) THEN	-- least a knockout match
				RETURN TRUE;
			END IF;
	ELSIF ('SUPER CUP' = comp_ty ) THEN -- if competition is super cup then the formula is knockout
		IF (0 = f_comp_ngroup(formula)) THEN
				RETURN TRUE;
			END IF;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION team_sy
(
	IN team team.id%TYPE
)
RETURNS team.s_year%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION team_ey
(
	IN team team.id%TYPE
)
RETURNS team.e_year%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION team_ty
(
	IN team team.id%TYPE
)
RETURNS team.type%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION team_sex
(
	IN team team.id%TYPE
)
RETURNS team.sex%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
CREATE OR REPLACE FUNCTION team_max_age
(
	IN team team.id%TYPE
)
RETURNS team.max_age%TYPE
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
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql;

/* TYPE :
 * NAME :
 * DESC :
 */
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

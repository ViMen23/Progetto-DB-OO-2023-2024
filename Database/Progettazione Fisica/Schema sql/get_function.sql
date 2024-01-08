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
 * GET FUNCTION
 *
 * NAME : get_tableName_attribute 
 ******************************************************************************/



/*******************************************************************************
 * FUNCTION - GET FROM country TABLE
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_country_type
 * DESC : returns the country type of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.type%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_country_type
(
	IN country_code country.code%TYPE -- country code
)
RETURNS country.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	country_type country.type%TYPE; -- country type

BEGIN

	-- select the type of the country
	-- associated with the input code country
	SELECT type
	INTO country_type
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN country_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_country_name
 * DESC : returns the country name of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.name%TYPE 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_country_name
(
	IN  country_code country.code%TYPE -- country code
)
RETURNS country.name%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	country_name country.name%TYPE; -- country name

BEGIN

	-- select the name of the country
	-- associated with the input code country
	SELECT name
	INTO country_name
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN country_name;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_country_s_year
 * DESC : returns the country foundation year of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.s_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_country_s_year
(
	IN country_code country.code%TYPE -- country code
)
RETURNS country.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	country_s_year country.s_year%TYPE; -- country foundation year

BEGIN

	-- select the fouondation year of the country
	-- associated with the input code country
	SELECT s_year
	INTO country_s_year
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN country_s_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_country_e_year
 * DESC : returns the country suppression year of the country
 *        identified by the input code country
 *
 *        IN      : country.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : country.e_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_country_e_year
(
	IN country_code country.code%TYPE -- country code
)
RETURNS country.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	country_e_year country.s_year%TYPE; -- country suppression year

BEGIN

	-- select the suppression year of the country
	-- associated with the input code country
	SELECT e_year
	INTO country_e_year
	FROM country
	WHERE code = country_code;
	
	-- and return it
	RETURN country_e_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * FUNCTION - GET FROM conf TABLE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_conf_type
 * DESC : returns the confederation type of the confederation
 *        identified by the input code confederation
 *
 *        IN      : conf.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : conf.code%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_conf_type
(
	IN conf_code conf.code%TYPE -- confederation code
)
RETURNS conf.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	conf_type conf.type%TYPE; -- confederation type

BEGIN

	-- select the type of the confederation
	-- associated with the input code confederation
	SELECT type
	INTO conf_type
	FROM conf
	WHERE code = conf_code;
	
	-- and return it
	RETURN conf_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_conf_s_year
 * DESC : returns the confederation foundation year of the confederation
 *        identified by the input code confederation
 *
 *        IN      : conf.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : conf.s_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_conf_s_year
(
	IN conf_code conf.code%TYPE -- confederation code
)
RETURNS conf.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	conf_s_year conf.s_year%TYPE; -- confederation foundation year

BEGIN

	-- select the foundation year of the confederation
	-- associated with the input code confederation
	SELECT s_year
	INTO conf_s_year
	FROM conf
	WHERE code = conf_code;
	
	-- and return it
	RETURN conf_s_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_conf_e_year
 * DESC : returns the confederation suppression year of the confederation
 *        identified by the input code confederation
 *
 *        IN      : conf.code%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : conf.e_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_conf_e_year
(
	IN conf_code conf.code%TYPE -- confederation code
)
RETURNS conf.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	conf_e_year conf.e_year%TYPE; -- confederation suppression year

BEGIN

	-- select the suppression year of the confederation
	-- associated with the input code confederation
	SELECT e_year
	INTO conf_e_year
	FROM conf
	WHERE code = conf_code;
	
	-- and return it
	RETURN conf_e_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * FUNCTION - GET FROM comp TABLE
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_s_year
 * DESC : returns the competition foundation year of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.s_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_s_year
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_s_year comp.s_year%TYPE; -- competition foundation year

BEGIN

	-- select the foundation year of the competition
	-- associated with the input id competition
	SELECT s_year
	INTO comp_s_year
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_s_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_e_year
 * DESC : returns the competition suppression year of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.e_year%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_e_year
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_e_year comp.e_year%TYPE; -- competition suppression year

BEGIN

	-- select the suppression year of the competition
	-- associated with the input id competition
	SELECT e_year
	INTO comp_e_year
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_e_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_t_type
 * DESC : returns the competition team type of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.t_type%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_t_type
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.t_type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_t_type comp.t_type%TYPE; -- competition team type

BEGIN

	-- select the team type of the competition
	-- associated with the input id competition
	SELECT t_type
	INTO comp_t_type
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_t_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_type
 * DESC : returns the competition type of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.type%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_type
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_type comp.type%TYPE; -- competition type

BEGIN

	-- select the type of the competition
	-- associated with the input id competition
	SELECT type
	INTO comp_type
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_freq
 * DESC : returns the competition frequency of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.freq%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_freq
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.freq%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_freq comp.freq%TYPE; -- competition frequency

BEGIN

	-- select the frequency of the competition
	-- associated with the input id competition
	SELECT freq
	INTO comp_freq
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_freq;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_sex
 * DESC : returns the competition sex of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.sex%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_sex
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.sex%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_sex comp.sex%TYPE; -- competition sex

BEGIN

	-- select the sex of the competition
	-- associated with the input id competition
	SELECT sex
	INTO comp_sex
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_sex;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_max_age
 * DESC : returns the competition max_age of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.max_age%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_max_age
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.max_age%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_max_age comp.max_age%TYPE; -- competition max age

BEGIN

	-- select the max_age of the competition
	-- associated with the input id competition
	SELECT max_age
	INTO comp_max_age
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_max_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_comp_conf
 * DESC : returns the referred confederation code of the competition
 *        identified by the input id competition
 *
 *        IN      : comp.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : comp.conf%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_comp_conf
(
	IN comp_id comp.id%TYPE -- competition id
)
RETURNS comp.conf%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	comp_conf comp.conf%TYPE; -- referring competition confederation code

BEGIN

	-- select the referred confederation code of the competition
	-- associated with the input id competition
	SELECT conf
	INTO comp_conf
	FROM comp
	WHERE id = comp_id;
	
	-- and return it
	RETURN comp_conf;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * FUNCTION - GET FROM team TABLE
 ******************************************************************************/
 
 
/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_team_s_year
 * DESC : returns the team foundation year of the team
 *        identified by the input id team
 *
 *        IN      : team.id%TYPE 
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : team.s_year%TYPE 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_team_s_year
(
	IN team_id team.id%TYPE -- team id
)
RETURNS team.s_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	team_s_year team.s_year%TYPE; -- team foundation year

BEGIN

	-- select the foundation year of the team
	-- associated with the input id team
	SELECT s_year
	INTO team_s_year
	FROM team
	WHERE id = team_id;
	
	-- and return it
	RETURN team_s_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_team_e_year
 * DESC : returns the team suppression year of the team
 *        identified by the input id team
 *
 *        IN      : team.id%TYPE 
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : team.e_year%TYPE 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_team_e_year
(
	IN team_id team.id%TYPE -- team id
)
RETURNS team.e_year%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	team_e_year team.s_year%TYPE; -- team suppression year

BEGIN

	-- select the suppression year of the team
	-- associated with the input id team
	SELECT e_year
	INTO team_e_year
	FROM team
	WHERE id = team_id;
	
	-- and return it
	RETURN team_e_year;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_team_type
 * DESC : returns the team type of the team
 *        identified by the input id team
 *
 *        IN      : team.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : team.type%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_team_type
(
	IN team_id team.id%TYPE -- team id
)
RETURNS team.type%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	team_type team.type%TYPE; -- team type

BEGIN

	-- select the type of the team
	-- associated with the input id team
	SELECT type
	INTO team_type
	FROM team
	WHERE id = team_id;
	
	-- and return it
	RETURN team_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_team_sex
 * DESC : returns the sex of the team
 *        identified by the input id team
 *
 *        IN      : team.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : team.sex%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_team_sex
(
	IN team_id team.id%TYPE -- team id
)
RETURNS team.sex%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	team_sex team.sex%TYPE; -- team sex

BEGIN

	-- select the sex of the team
	-- associated with the input id team
	SELECT sex
	INTO team_sex
	FROM team
	WHERE id = team_id;
	
	-- and return it
	RETURN team_sex;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_team_max_age
 * DESC : returns the max age type of the team
 *        identified by the input id team
 *
 *        IN      : team.id%TYPE
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : team.max_age%TYPE
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_team_max_age
(
	IN team_id team.id%TYPE -- team id
)
RETURNS team.max_age%TYPE
RETURNS NULL ON NULL INPUT -- if any null input directly returns null
AS
$$
DECLARE

	team_max_age team.max_age%TYPE; -- team max age

BEGIN

	-- select the max age of the team
	-- associated with the input id team
	SELECT max_age
	INTO team_max_age
	FROM team
	WHERE id = team_id;
	
	-- and return it
	RETURN team_max_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

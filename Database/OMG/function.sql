/******************************************************************************* 
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : competitionUTER SCIENCE                                            
 * CLASS        : DATA BASES I                                                
 * TEACHER      : SILVIO BARRA                                                
 * YEAR         : 2023-2024                                                   
 ******************************************************************************/



/*******************************************************************************
 * FUNCTION PRE SCHEMA                                              
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : table_exists
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION table_exists
(
	IN	name_table	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			information_schema.tables 
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : attr_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION attr_exists
(
	IN	name_table	text,
	IN	name_attr	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			information_schema.columns 
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
			AND
			column_name = name_attr
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_type_attr
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_type_attr
(
	IN	name_table	text,
	IN	name_attr	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_attr text;

BEGIN
	
	SELECT
		data_type
	INTO
		type_attr
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_attr;
		
	RETURN type_attr;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_id
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_id
(
	IN	separator	text,
	IN	in_string	text
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	count		integer;
	
	name_table	text;

	name_attr	text;
	value_attr	text;
	type_attr	text;

	row_table	record;

	to_execute	text;

	id_to_find	integer;
	
BEGIN
	
	to_execute = '';

	id_to_find = NULL;
	count = 0;

	FOR row_table IN SELECT string_to_table(in_string, separator)
	LOOP
		
		IF (0 = count) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			to_execute = to_execute || 'SELECT id ';
			to_execute = to_execute || 'FROM ' || name_table || ' WHERE ';
			
		ELSIF (1 = (count % 2)) THEN
		
			name_attr = row_table.string_to_table;
			
			IF (NOT attr_exists(name_table, name_attr)) THEN
				RETURN NULL;
			END IF;
			
			type_attr = get_type_attr(name_table, name_attr);
			
			to_execute = to_execute || name_attr || ' = ';
			
		ELSIF (0 = (count % 2)) THEN
		
			value_attr = row_table.string_to_table;
			
			IF (NOT type_attr LIKE '%int%') THEN
				 
				value_attr = quote_literal(value_attr);
				
			END IF;
				
			to_execute = to_execute || value_attr || ' AND ';
			
		END IF;
		
		count = count + 1;
		
	END LOOP;
	
	to_execute = trim(to_execute, ' AND ');
	
	to_execute = to_execute || ';';
	
	EXECUTE to_execute INTO id_to_find;
	
	RETURN id_to_find;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attr
 *
 * IN      : text, text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attr
(
	IN	name_table	text,
	IN	name_attr	text,
	IN	value_id	integer
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				integer;
	
	type_attr		text;
	value_attr		text;

	to_execute		text;
	cur_to_execute	refcursor;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	IF (NOT attr_exists(name_table, name_attr)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = '';
	to_execute = to_execute || 'SELECT ' || name_attr;
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	OPEN cur_to_execute FOR EXECUTE to_execute;
	
	type_attr = get_type_attr(name_table, name_attr);
	
	IF (type_attr LIKE '%int%') THEN
		
		FETCH cur_to_execute INTO tmp;
		 
		value_attr = CAST(tmp AS text); 
		
	ELSE
	
		FETCH cur_to_execute INTO value_attr;
	
	END IF;
	
	CLOSE cur_to_execute;

	RETURN value_attr;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_rec
 *
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_rec
(
	IN	name_table	text,
	IN	value_id	integer
)
RETURNS record
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	to_execute	text;
	rec_table	record;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = '';
	to_execute = to_execute || 'SELECT *';
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	EXECUTE to_execute INTO rec_table;

	RETURN rec_table;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * FUNCTION POST SCHEMA                                              
 ******************************************************************************/



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_containment
 *
 * IN      : country.id%TYPE, country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_containment
(
	IN	id_in_country	country.id%TYPE,
	IN	id_su_country	country.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	type_in_country	text;					
	type_su_country	text;
	
BEGIN
	
	type_in_country	= get_attr('country', 'type', id_in_country);						
	type_su_country = get_attr('country', 'type', id_su_country);

	IF
	(
		(type_in_country = 'NATION' AND type_su_country = 'CONTINENT')
		OR
		(type_in_country = 'CONTINENT' AND type_su_country = 'WORLD')
		OR
		(type_in_country = 'WORLD' AND type_su_country IS NULL)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 *
 * IN      : country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN	id_country	country.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	type_country	text;

BEGIN
	
	type_country = get_attr('country', 'type', id_country);

	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : same_country_conf
 *
 * IN      : country.id%TYPE, confederation.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION same_country_conf
(
	IN	id_country	country.id%TYPE
	IN	id_conf		confederation.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	tmp				text;
	id_country_conf	integer;

BEGIN
	
	tmp = get_attr('confederation', 'country_id', id_conf);
	id_country_conf = CAST(tmp AS integer);

	IF (id_country = id_country_conf) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : type_country_from_conf
 *
 * IN      : confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION type_country_from_conf
(
	IN	id_conf	confederation.id%TYPE
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE 

	tmp				text;
	id_country		integer;
	type_country	text;

BEGIN
	
	tmp = get_attr('confederation', 'country_id', id_conf);
	id_country = CAST(tmp AS integer);

	type_country = get_attr('country', 'type', id_country);

	RETURN type_country;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : conf_from_comp_ed
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : confederation.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_from_comp_ed
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS confederation.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	id_comp	integer;
	id_conf	integer;

BEGIN
	
	tmp = get_attr('competition_edition', 'competition_id', id_comp_ed);
	id_comp = CAST(tmp AS integer);

	tmp = get_attr('competition', 'confederation_id', id_comp);
	id_conf = CAST(tmp AS integer);

	RETURN id_conf;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_team_name
 *
 * IN      : country.id%TYPE, ty_age_cap, ty_sex
 * INOUT   : void
 * OUT     : void
 * RETURNS : dm_alnum
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_team_name
(
	IN	id_country	country.id%TYPE,
	IN	age_cap		ty_age_cap,
	IN	sex			ty_sex
)
RETURNS dm_alnum
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	name_team text;

BEGIN
	
	name_team = get_attr('country', 'name', id_country);

	IF (age_cap <> 'MAJOR') THEN
		name_team = name_team || ' ' || age_cap;
	END IF;
	
	IF (sex = 'FEMALE') THEN
		name_team = name_team || ' Women';
	END IF;
	
	RETURN name_team;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_edition
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_edition
(
	IN	id_comp	competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) > 0
		FROM
			competition_edition
		WHERE
			competition_id = id_comp
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------






/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : a_start_year
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : dm_year
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION a_start_year
(
	IN	id_comp	competition.id%TYPE
)
RETURNS dm_year
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			start_year
		FROM
			competition_ed
		WHERE
			competition_id = id_comp
		LIMIT
			1
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_freq
 *
 * IN      : competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_freq
(
	IN	id_comp	competition.id%TYPE,
	IN	s_year	dm_year
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	freq	integer;
	
BEGIN
	
	tmp = get_attr('competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	IF (freq <= 1) THEN
		RETURN TRUE;
	ELSE
		IF (0 = (s_year - a_start_year(id_comp)) % freq) THEN
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
 * NAME : similar_competitions
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF competition.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_competitions
(
	IN	id_comp	competition.id%TYPE
)
RETURNS SETOF competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp	record;

BEGIN
	
	rec_comp = get_rec('competition', id_comp);

	RETURN
	(
		SELECT
			id
		FROM
			competition
		WHERE
			type = rec_comp.type
			AND
			team_type = rec_comp.team_type
			AND
			tier = rec_comp.tier
			AND
			age_cap = rec_comp.age_cap
			AND
			sex = rec_comp.sex
			AND
			confederation_id = rec_comp.confederation_id
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : one_tier_edition
 *
 * IN      : competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION one_tier_edition
(
	IN	id_comp	competition.id%TYPE,
	IN	s_year	dm_year
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			competition_edition
		WHERE
			start_year = s_year
			AND
			competition_id IN SELECT similar_competitions(id_comp) 
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : belong_to
 *
 * IN      : team.id%TYPE, confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to
(
	IN	id_team	team.id%TYPE,
	IN	id_conf	confederation.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	tmp				text;
	type_conf		text;
	id_conf_team	integer;

BEGIN
	
	type_conf = type_country_from_conf(id_conf);

	tmp = get_attr('team', 'confederation_id', id_team);
	id_conf_team = CAST(tmp AS integer);

	IF ('NATION' = type_conf AND id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_conf_team);
	id_conf_team = CAST(tmp AS integer);
	
	IF ('CONTINENT' = type_conf AND id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_conf_team);
	id_conf_team = CAST(tmp AS integer);
	
	IF ('WORLD' = type_conf AND id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_comp
 *
 * IN      : team.id%TYPE, competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_comp
(
	IN	id_team	team.id%TYPE,
	IN	id_comp	competition.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	rec_team	record;
	rec_comp	record;

BEGIN
	
	rec_team = get_rec('team', id_team);
	rec_comp = get_rec('competition', id_comp);

	IF
	(
		rec_team.type = rec_comp.team_type
		AND
		rec_team.age_cap = rec_comp.age_cap
		AND
		rec_team.sex = rec_comp.sex
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : available
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION available
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	tmp	text;
	max	integer;

BEGIN
	
	tmp = get_attr('competition_edition', 'total_team', id_comp_ed);
	max = CAST(tmp AS integer);

	RETURN
	(
		SELECT
			count(*) < max
		FROM
			partecipation
		WHERE
			competition_edition_id = id_comp_ed
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_teams
 *
 * IN      : ty_age_cap, ty_sex
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF team.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_teams
(
	IN	age_team	ty_age_cap,
	IN	sex_team	ty_sex
)
RETURNS SETOF team.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			id
		FROM
			team
		WHERE
			type = 'NATIONAL'
			AND
			age_cap = age_team
			AND
			sex = sex_team
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_role
 *
 * IN      : player.id%TYPE, ty_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_role
(
	IN	id_player		player.id%TYPE,
	IN	role_to_check	ty_role
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	pos_player	integer;
	role_pos	text;

BEGIN
	
	FOR pos_player
	IN
		SELECT
			position_id
		FROM
			player_position
		WHERE
			player_id = id_player
	LOOP

		role_pos = get_attr('position', 'role', pos_player);

		IF (role_pos = role_to_check) THEN
			RETURN TRUE;
		END IF;

	END LOOP;

	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_time_range
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_time_range
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	time_range	daterange;

	s_year		integer;
	e_year		integer;

	s_date		date;
	e_date		date;

BEGIN
	
	s_year = get_attr('competition_edition', 'start_year', id_comp_ed);
	e_year = get_attr('competition_edition', 'end_year', id_comp_ed);

	IF (s_year = e_year) THEN
		s_date = make_date(s_year, 01, 01);
		e_date = make_date(s_year, 12, 31);
	ELSE
		s_date = make_date(s_year, 08, 01);
		e_date = make_date(e_year, 07, 31);
	END IF;

	time_range = daterange(s_date, e_date, '[]');

	RETURN time_range;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : play_in_during
 *
 * IN      : player.id%TYPE, team.id%TYPE, daterange 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION play_in_during
(
	IN	id_player	player.id%TYPE,
	IN	id_team		team.id%TYPE,
	IN	time_range	daterange
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) > 0
		FROM
			militancy
		WHERE
			team_id = id_team
			AND
			player_id = id_player
			AND
			date_range && time_range
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_prize
 *
 * IN      : team.id%TYPE, prize.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_prize
(
	IN	id_team		team.id%TYPE,
	IN	id_prize	prize.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	rec_team	record;
	rec_prize	record;

BEGIN
	
	rec_team = get_rec('team', id_team);
	rec_prize = get_rec('prize', id_prize);

	IF
	(
		rec_team.age_cap = rec_prize.age_cap
		AND
		rec_team.sex = rec_prize.sex
	)
	THEN
		RETURN TRUE;
	END IF;

	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : pos_fit_stat
 *
 * IN      : position.id%TYPE, statistic.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION pos_fit_stat
(
	IN	id_pos		position.id%TYPE,
	IN	id_stat		statistic.id%TYPE
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	role_pos	text;
	type_stat	text;

BEGIN
	
	role_pos = get_attr('position', 'role', id_pos);
	type_stat = get_attr('statistic', 'type', id_stat);

	IF (position(role_pos in type_stat) > 0) THEN
		RETURN TRUE;
	END IF;

	RETURN FALSE

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : valid_daterange
 *
 * IN      : date, ty_age_cap
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_daterange
(
	IN	s_date	date,
	IN	age_cap	ty_age_cap
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	min_age		integer;
	max_age		integer;

	s_year		integer;
	s_month		integer;
	s_day		integer;

	valid_range	daterange;
	s_valid		date;
	e_valid		date;

BEGIN
	
	min_age = 14;

	CASE age_cap

		WHEN 'MAJOR' THEN
			max_age = 50;
	
		WHEN 'U-23' THEN
			max_age = 23;
	
		WHEN 'U-22' THEN
			max_age = 22;
	
		WHEN 'U-21' THEN
			max_age = 21;
	
		WHEN 'U-20' THEN
			max_age = 20;
	
		WHEN 'U-19' THEN
			max_age = 19;
	
		WHEN 'U-18' THEN
			max_age = 18;
	
		WHEN 'U-17' THEN
			max_age = 17;
	
		WHEN 'U-16' THEN
			max_age = 16;
	
		WHEN 'U-15' THEN
			max_age = 15;
		
	END CASE;
	
	s_year = extract(year from s_date);
	s_month = extract(month from s_date);
	s_day = extract(day from s_date);

	IF (2 = s_month AND 29 = s_day) THEN
		s_month = 3;
		s_day = 1;
	END IF;

	s_valid = make_date(s_year + min_age, s_month, s_day);
	e_valid = make_date(s_year + max_age, s_month, s_day);

	valid_range = daterange(s_valid, e_valid, '[]');

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_club_militancy
 *
 * IN      : player.id%TYPE, daterange
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_club_militancy
(
	IN	id_player	player.id%TYPE,
	IN	range_date	daterange
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			militancy
		WHERE
			player_id = id_player
			AND
			upper(date_range) IS NOT NULL
			AND
			date_range && range_date
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_national_militancy
 *
 * IN      : player.id%TYPE, country.id%TYPE, ty_age_cap, daterange
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_national_militancy
(
	IN	id_player	player.id%TYPE,
	IN	id_country	country.id%TYPE,
	IN	age_cap		ty_age_cap,
	IN	range_date	daterange
)
RETURNS boolean
RETURNS FALSE ON NULL INPUT
AS
$$
DECLARE

	

BEGIN
	
	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
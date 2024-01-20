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
		('NATION' = type_in_country AND 'CONTINENT' = type_su_country)
		OR
		('CONTINENT' = type_in_country AND 'WORLD' = type_su_country)
		OR
		('WORLD' = type_in_country AND type_su_country IS NULL)
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
RETURNS NULL ON NULL INPUT
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
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	freq	integer;
	a_year	integer;
	
BEGIN
	
	tmp = get_attr('competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	IF (freq <= 1) THEN
		RETURN TRUE;
	ELSE

		SELECT
			start_year
		INTO
			a_year
		FROM
			competition_edition
		WHERE
			competition_id = id_comp
		LIMIT
			1;

		IF (0 = ((s_year - a_year) % freq)) THEN
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
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp							text;
	id_conf_team				integer;
	id_super_conf_team			integer;
	id_super_super_conf_team	integer;

BEGIN

	tmp = get_attr('team', 'confederation_id', id_team);
	id_conf_team = CAST(tmp AS integer);

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_conf_team);
	id_super_conf_team = CAST(tmp AS integer);
	
	IF (id_super_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	tmp = get_attr('confederation', 'super_id', id_super_conf_team);
	id_super_super_conf_team = CAST(tmp AS integer);
	
	IF (id_super_super_conf_team = id_conf) THEN
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
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;
	tot_team	integer;

BEGIN
	
	tmp = get_attr('competition_edition', 'total_team', id_comp_ed);
	tot_team = CAST(tmp AS integer);

	RETURN
	(
		SELECT
			count(*) < tot_team
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
RETURNS NULL ON NULL INPUT
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
	IN	id_pos		"position".id%TYPE,
	IN	id_stat		statistic.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
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
	IN	id_team		team.id%TYPE,
	IN	id_comp		competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_team		text;
	type_team_comp	text;

BEGIN
	
	type_team = get_attr('team', 'type', id_team);
	type_team_comp = get_attr('competition', 'team_type', id_comp);

	RETURN type_team = type_team_comp;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : valid_daterange
 *
 * IN      : date
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_daterange
(
	IN	dob		date
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	min_age		integer;
	max_age		integer;
	dob_year	integer;
	dob_month	integer;
	dob_day		integer;
	valid_range	daterange;
	s_valid		date;
	e_valid		date;

BEGIN
	
	min_age = 14;
	max_age = 50;
	
	dob_year = extract(year from dob);
	dob_month = extract(month from dob);
	dob_day = extract(day from dob);

	IF (2 = dob_month AND 29 = dob_day) THEN
		dob_month = 3;
		dob_day = 1;
	END IF;

	s_valid = make_date(dob_year + min_age, dob_month, dob_day);
	e_valid = make_date(dob_year + max_age, dob_month, dob_day);

	valid_range = daterange(s_valid, e_valid, '[]');

	RETURN valid_range;

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
RETURNS NULL ON NULL INPUT
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
 * IN      : player.id%TYPE, country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_national_militancy
(
	IN	id_player	player.id%TYPE,
	IN	id_country	country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
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
			upper(date_range) IS NULL
	);	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_tot_team
 *
 * IN      : competition.id%TYPE, dm_usint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_tot_team
(
	IN	id_comp		competition.id%TYPE,
	IN	tot_team	dm_usint
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;
	id_conf			integer;
	id_country		integer;

	type_country	text;
	type_comp		text;
	
BEGIN
	
	type_comp = get_attr('competition', 'type', id_comp);

	IF ('SUPER CUP' = type_comp) THEN
		IF (tot_team <= 6) THEN
			RETURN TRUE;
		END IF;
	ELSIF ('LEAGUE' = type_comp) THEN
		IF (tot_team <= 50) THEN
			RETURN TRUE;
		END IF;
	ELSIF ('CUP' = type_comp) THEN

		tmp = get_attr('competition', 'confederation_id', id_comp);
		id_conf = CAST(tmp_text AS integer);

		tmp = get_attr('confederation', 'country_id', id_conf);
		id_country = CAST(tmp_text AS integer);

		type_country = get_attr('country', 'type', id_country);

		IF ('NATION' = type_country) THEN
			IF (floor(log(2, tot_team)) = ceil(log(2, tot_team))) THEN
				RETURN TRUE;
			END IF;
		ELSE
			IF (tot_team <= 50) THEN
				RETURN TRUE;
			END IF;
		END IF;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp
 *
 * IN      : competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF competition.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp
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

	RETURN QUERY
		SELECT
			id
		FROM
			competition
		WHERE
			type = rec_comp.type
			AND
			team_type = rec_comp.team_type
			AND
			confederation_id = rec_comp.confederation_id;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp_ed
 *
 * IN      : competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF competition_edition.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp_ed
(
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS SETOF competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp_ed	record;

BEGIN
	
	rec_comp_ed = get_rec('competition_edition', id_comp_ed);

	RETURN QUERY
		SELECT
			id
		FROM
			competition_edition
		WHERE
			start_year = rec_comp_ed.start_year
			AND
			end_year = rec_comp_ed.end_year
			AND
			competition_id IN (SELECT similar_comp(rec_comp_ed.competition_id));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_take_part
 *
 * IN      : team.id%TYPE, competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_take_part
(
	IN	id_team		team.id%TYPE,
	IN	id_comp_ed	competition_edition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) < 1
		FROM
			partecipation
		WHERE
			team_id = id_team
			AND
			competition_edition_id IN (SELECT similar_comp_ed(id_comp_ed))
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_nationality
 *
 * IN      : player.id%TYPE, team.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_nationality
(
	IN	id_player	player.id%TYPE,
	IN	id_team		team.id%TYPE
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
			nationality
		WHERE
			player_id = id_player
			AND
			team_id = id_team
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


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
 * NAME : gk_attr
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF attribute.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_attr
(
)
RETURNS SETOF attribute.id%TYPE
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_attribute
		WHERE
			type = 'GOALKEEPER';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_tag
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF tag.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_tag
(
)
RETURNS SETOF tag.id%TYPE
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_tag
		WHERE
			type = 'GOALKEEPER';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_stat
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF stat.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_stat
(
)
RETURNS SETOF tag.id%TYPE
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_statistic
		WHERE
			goalkeeper = TRUE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_play
 *
 * IN      : player.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF play.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_play
(
	id_player	player.id%TYPE
)
RETURNS SETOF tag.id%TYPE
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_play
		WHERE
			id_player = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : trophy_not_role
 *
 * IN      : en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF trophy.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION trophy_not_role
(
	role_player	en_role_mix
)
RETURNS SETOF trophy.id%TYPE
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_trophy
		WHERE
			type = 'PLAYER'
			AND
			role IS NOT NULL
			AND
			0 = position(role in role_player);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : prize_not_role
 *
 * IN      : en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF prize.id%TYPE
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION prize_not_role
(
	role_player	en_role_mix
)
RETURNS SETOF prize.id%TYPE
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_prize
		WHERE
			type = 'PLAYER'
			AND
			role IS NOT NULL
			AND
			0 = position(role in role_player);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_be_inside
 *
 * IN      : fp_country.id%TYPE, fp_country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_be_inside
(
	IN	id_in_country		fp_country.id%TYPE,
	IN	id_super_country	fp_country.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	type_in_country		text;
	type_super_country	text;
	
BEGIN
				
	type_in_country = get_column('fp_country', 'type', id_in_country);
	type_super_country = get_column('fp_country', 'type', id_super_country);

	IF
	(
		('NATION' = type_in_country AND 'CONTINENT' = type_super_country)
		OR
		('CONTINENT' = type_in_country AND 'WORLD' = type_super_country)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RAISE NOTICE 'Country (id = %) cannot be inside of country (id = %)', id_in_country, id_super_country;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 *
 * IN      : fp_country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se l'id di un paese in input è di una nazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN	id_country	fp_country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_country	text;

BEGIN
	
	type_country = get_column('fp_country', 'type', id_country);

	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	END IF;
	
	RAISE NOTICE 'Country (id =  %) is not a nation', id_country;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_years_comp_ed
 *
 * IN      : fp_competition.id%TYPE, dm_year, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_years_comp_ed
(
	IN	id_comp	fp_competition.id%TYPE,
	IN	s_year	dm_year,
	IN	e_year	dm_year
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_comp		text;
	team_type_comp	text;

BEGIN
	
	type_comp = get_column('fp_competition', 'type', id_comp);

	IF ('LEAGUE' = type_comp) THEN
	
		IF (1 = e_year - s_year) THEN
			RETURN TRUE;
		END IF;
	
	ELSIF ('SUPER CUP' = type_comp) THEN
	
		IF (0 = e_year - s_year) THEN
			RETURN TRUE;
		END IF;
	
	ELSIF ('CUP' = type_comp) THEN
		
		team_type_comp = get_column('fp_competition', 'team_type', id_comp);

		IF ('NATIONAL' = team_type_comp) THEN

			IF (0 = e_year - s_year) THEN
				RETURN TRUE;
			END IF;
		
		ELSIF ('CLUB' = team_type_comp) THEN

			IF (1 = e_year - s_year) THEN
				RETURN TRUE;
			END IF;
		
		END IF;
	END IF;


	RAISE NOTICE 'Competition (id =  %) cannot have edition start in % and end in %', id_comp, s_year, e_year;

	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_edition
 *
 * IN      : fp_competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che dato in input l'id di una competizione calcistica valuta
 *        se essa ha edizioni nel database
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_edition
(
	IN	id_comp	fp_competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	have	boolean;

BEGIN
	
	have = FALSE;

	SELECT
		count(*) >= 1
	INTO
		have
	FROM
		fp_competition_edition
	WHERE
		competition_id = id_comp;

	IF (NOT have) THEN
		RAISE NOTICE 'Competition (id =  %) does not have editions', id_comp;
	END IF;

	RETURN have;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------





/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_freq
 *
 * IN      : fp_competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una competizione calcistica può avere
 *        un'edizione che inizia in un determinato anno, rispetto alla
 *        sua frequenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_freq
(
	IN	id_comp	fp_competition.id%TYPE,
	IN	s_year	dm_year                 -- anno di inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	freq	integer;
	a_year	integer; -- un anno di inizio di un'edizione
	
BEGIN
	
	tmp = get_column('fp_competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	-- se la frequenza della competizione calcistica è annnuale o irregolare
	IF (freq <= 1) THEN
		RETURN TRUE;
	-- altrimenti
	ELSE

		-- seleziono un anno di inizio di una qualsiasi edizione
		-- della competizione calcistica
		SELECT
			start_year
		INTO
			a_year
		FROM
			fp_competition_edition
		WHERE
			competition_id = id_comp
		LIMIT
			1;

		-- ...e valuto se l'anno di inizio in input è accettabile
		-- rispetto alla frequenza della competizione calcistica
		IF (0 = ((s_year - a_year) % freq)) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	RAISE NOTICE 'Competition (id =  %) cannot start in year %, bad frequency', id_comp, s_year;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : belong_to
 *
 * IN      : fp_team.id%TYPE, fp_confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio appartiene ad una
 *        confederazione calcistica membro di un'altra confederazione.
 *        
 *        NOTA: Per non appesantire eccessivamente la notazione in questa
 *              funzione useremo impropriamente il nome di variabile "type_conf"
 *              per denotare il tipo del paese associato alla confederazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to
(
	IN	id_team	fp_team.id%TYPE,
	IN	id_conf	fp_confederation.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp					text;

	type_conf			text;

	id_country			integer;

	id_conf_to_check	integer;
	
BEGIN

	-- prendo il tipo del paese associato alla confederazione memebro
	tmp = get_column('fp_confederation', 'id_country', id_conf);
	id_country = CAST(tmp AS integer);					
	type_conf = get_column('fp_country', 'type', id_country);

	-- prendo la confederazione calcistica associata alla squadra di calcio
	tmp = get_column('fp_team', 'confederation_id', id_team);
	id_conf_to_check = CAST(tmp AS integer);

	-- se la confederazione in input è nazionale
	IF ('NATION' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;

	-- prendo la confederazione calcistica contenente quella
	-- associata alla squadra di calcio
	tmp = get_column('fp_confederation', 'super_id', id_conf_to_check);
	id_conf_to_check = CAST(tmp AS integer);
	
	-- se la confederazione in input è continentale
	IF ('CONTINENT' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	-- prendo la confederazione calcistica che contiene quella contenente quella
	-- associata alla squadra di calcio
	tmp = get_column('fp_confederation', 'super_id', id_conf_to_check);
	id_conf_to_check = CAST(tmp AS integer);
	
	-- se la confederazione in input è mondiale
	IF ('WORLD' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	RAISE NOTICE 'Team (id =  %) does not belong to confederation (id = %)', id_team, id_conf;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------





/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_place
 *
 * IN      : fp_competition.id%TYPE, dm_year, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un'edizione di una competizione calcistica
 *        ha ancora posti a disposizione per squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_place
(
	IN	id_comp	fp_competition.id%TYPE,
	IN	s_year	dm_year,
	IN	e_year	dm_year
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	tot_team	integer;

	have		boolean;

BEGIN
	
	tmp = get_column('fp_competition_edition', 'total_team', id_comp_ed);
	tot_team = CAST(tmp AS integer);

	have = FALSE;

	SELECT
		count(*) < tot_team
	INTO
		have
	FROM
		fp_partecipation
	WHERE
		competition_id = id_comp
		AND
		start_year = s_year
		AND
		end_year = e_year;

	IF (NOT have) THEN
		RAISE NOTICE 'Competition (id = %) [%-%] does not have place', id_comp, s_year, e_year;
	END IF;

	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : role_all_positions
 *
 * IN      : fp_player.id%TYPE, en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION role_all_positions
(
	IN	id_player	fp_player.id%TYPE,
	IN	role_player	en_role_mix
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	pos_player	integer;
	role_pos	text;

BEGIN
	
	-- per ogni posizione associata al giocatore
	FOR pos_player
	IN
		SELECT
			position_id
		FROM
			fp_player_position
		WHERE
			player_id = id_player
	LOOP

		role_pos = get_column('fp_position', 'role', pos_player);

		IF (0 = position(role_pos, role_player)) THEN
			RAISE NOTICE 'Player (id =  %) does not have role %', id_player, role_pos;
			RETURN TRUE;
		END IF;

	END LOOP;

	
	RETURN TRUE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------






/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : play_in_during
 *
 * IN      : fp_player.id%TYPE, fp_team.id%TYPE, daterange 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore gioca in una squadra di calcio
 *        durante un intervallo di tempo, espresso come range di date
 ******************************************************************************/
CREATE OR REPLACE FUNCTION play_in_during
(
	IN	id_player	fp_player.id%TYPE,
	IN	id_team		fp_team.id%TYPE,
	IN	time_range	daterange
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	play	boolean;

BEGIN
	
	play = FALSE;

	SELECT
		count(*) >= 1
	INTO
		play
	FROM
		fp_militancy
	WHERE
		team_id = id_team
		AND
		player_id = id_player
		AND
		date_range && time_range;

	IF (NOT play) THEN
		RAISE NOTICE 'Player (id = %) does not play in team (id = %) during date range %', id_player, id_team, time_range;
	END IF;

	RETURN play;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : pos_fit_stat
 *
 * IN      : fp_position.id%TYPE, fp_statistic.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una posizione del campo di gioco è
 *        associabile ad una statistica.
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione e' associabile ad una statistica
 *              se e soltanto se il ruolo della posizione e' una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION pos_fit_stat
(
	IN	id_pos		fp_position.id%TYPE,
	IN	id_stat		fp_statistic.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	role_pos	text;
	type_stat	text;

BEGIN
	
	role_pos = get_column('fp_position', 'role', id_pos);
	type_stat = get_column('fp_statistic', 'type', id_stat);

	IF (position(role_pos in type_stat) > 0) THEN
		RETURN TRUE;
	END IF;

	RAISE NOTICE 'Position (id = %) cannot be associated with statistic (id = %)', id_pos, id_stat;
	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_comp
 *
 * IN      : fp_team.id%TYPE, fp_competition.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio è compatibile con
 *        una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_comp
(
	IN	id_team		fp_team.id%TYPE,
	IN	id_comp		fp_competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_team		text;
	type_team_comp	text;

	compatibile		boolean;

BEGIN
	
	compatibile = FALSE;

	type_team = get_column('fp_team', 'type', id_team);
	type_team_comp = get_column('fp_competition', 'team_type', id_comp);
	
	IF (type_team = type_team_comp) THEN
		compatibile = TRUE;
	ELSE
		RAISE NOTICE 'Team (id = %) is not compatible to competition (id = %)', id_team, id_comp;
	END IF;

	RETURN compatibile;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_tot_team
 *
 * IN      : fp_competition.id%TYPE, dm_usint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se il numero massimo di squadre di calcio che
 *        possono partecipare ad una competizione calcistica sia coerente
 *        con il tipo di competizione.
 *
 *        NOTE: I valori limite sono arbitrari ma ottenuti grazie a numerose
 *              ricerche (su Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_tot_team
(
	IN	id_comp		fp_competition.id%TYPE,
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
	
	type_comp = get_column('fp_competition', 'type', id_comp);

	-- se la competizione calcistica è una supercoppa
	IF ('SUPER CUP' = type_comp) THEN
		-- al massimo sono possibili 6 squadre partecipanti
		IF (tot_team <= 6) THEN
			RETURN TRUE;
		END IF;
	-- se la competizione calcistica è un campionato
	ELSIF ('LEAGUE' = type_comp) THEN
		-- al massimo sono possibili 50 squadre partecipanti
		IF (tot_team <= 50) THEN
			RETURN TRUE;
		END IF;
	-- se la competizione calcistica è un torneo
	ELSIF ('CUP' = type_comp) THEN

		tmp = get_column('fp_competition', 'confederation_id', id_comp);
		id_conf = CAST(tmp_text AS integer);

		tmp = get_column('fp_confederation', 'country_id', id_conf);
		id_country = CAST(tmp_text AS integer);

		type_country = get_column('fp_country', 'type', id_country);

		-- se si tratta di una coppa nazionale
		IF ('NATION' = type_country) THEN
			-- è una competizione ad eliminazione diretta
			-- e il numero di partecipanti deve essere una potenza di 2
			IF (floor(log(2, tot_team)) = ceil(log(2, tot_team))) THEN
				RETURN TRUE;
			END IF;
		-- se si tratta di una coppa internazionale
		ELSE
			-- al massimo sono possibili 50 squadre partecipanti
			IF (tot_team <= 50) THEN
				RETURN TRUE;
			END IF;
		END IF;

	END IF;

	RAISE NOTICE 'Competition (id = %) has no correct total team number (%)', id_comp, tot_team;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp
 *
 * IN      : fp_competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF fp_competition.id%TYPE
 *
 * DESC : Funzione che restituisce l'id di tutte le competizioni calcistiche
 *        simili a quella in input.
 *
 *        NOTA: Per simile si intende una competizione calcistica
 *              dello stesso tipo e alla quale possono partecipare
 *              lo stesso tipo di squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp
(
	IN	id_comp	fp_competition.id%TYPE
)
RETURNS SETOF fp_competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp	record;

BEGIN
	
	rec_comp = get_record('fp_competition', id_comp);

	RETURN QUERY
		SELECT
			id
		FROM
			fp_competition
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
 * IN      : fp_competition.id%TYPE, dm_year, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (integer, integer, integer)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp_ed
(
	IN	id_comp	fp_competition.id%TYPE,
	IN	s_year	dm_year,
	IN	e_year	dm_year
)
RETURNS TABLE
(
	competition_id	integer,
	start_year		integer,
	end_year		integer
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			competition_id,
			start_year,
			end_year
		FROM
			fp_competition_edition
		WHERE
			start_year = s_year
			AND
			end_year = e_year
			AND
			competition_id IN
							(
								SELECT
									*
								FROM
									similar_comp(id_comp)
							);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_take_part
 *
 * IN      : fp_team.id%TYPE, fp_competition.id%TYPE, dm_year, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_take_part
(
	IN	id_team	fp_team.id%TYPE,
	IN	id_comp	fp_competition.id%TYPE,
	IN	s_year	dm_year,
	IN	e_year	dm_year
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	can			boolean;

	rec_comp_ed	record;

BEGIN
	
	can = FALSE;

	FOR rec_comp_ed
	IN
		SELECT
			*
		FROM
			similar_comp_ed(id_comp, s_year, e_year)
	LOOP

		SELECT
			count(*) < 1
		INTO
			can
		FROM
			fp_partecipation
		WHERE
			team_id = id_team
			AND
			competition_id = rec_comp_ed.competition_id
			AND
			start_year = rec_comp_ed.start_year
			AND
			end_year = rec_comp_ed.end_year;
									

		IF (NOT can) THEN
			RAISE NOTICE 'Team (id = %) cannot partecipate to competition (id = %) [%-%]', id_team, id_comp, s_year, e_year;
			RETURN can;
		END IF;
	
	END LOOP;
		
	RETURN can;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_nationality
 *
 * IN      : fp_player.id%TYPE, fp_country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha una certa nazionalità
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_nationality
(
	IN	id_player	fp_player.id%TYPE,
	IN	id_country	fp_country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	have	boolean;

BEGIN
	
	have = FALSE;

	SELECT
		count(*) >= 1
	INTO
		have
	FROM
		fp_nationality
	WHERE
		player_id = id_player
		AND
		country_id = id_country;
	
	IF (NOT have) THEN
		RAISE NOTICE 'Player (id = %) has not nationatity country (id = %)', id_player, id_country;
	END IF;

	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_age_limit
 *
 * IN      : date, date
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_age_limit
(
	IN	birth_date		date,
	IN	retired_date	date
)
RETURNS boolean
AS
$$
DECLARE

	year_birth_date		integer;
	year_retired_date	integer;

	min_age				integer;
	max_age				integer;

BEGIN

	min_age = 15;
	max_age = 50;
	
	year_birth_date = extract year from birth_date;
	year_retired_date = extract year from retired_date;

	IF ((year_retired_date - year_birth_date) NOT BETWEEN min_age AND max_age) THEN
		RETURN FALSE;
	END;

	RETURN TRUE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_age_militancy
 *
 * IN      : date, date, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_age_militancy
(
	IN	birth_date		date,
	IN	retired_date	date,
	IN	start_season	integer,
	IN	end_season		integer
)
RETURNS boolean
AS
$$
DECLARE

	year_birth_date		integer;
	year_retired_date	integer;

	min_age				integer;
	max_age				integer;

BEGIN

	min_age = 15;
	max_age = 50;
	
	year_birth_date = extract year from birth_date;
	year_retired_date = extract year from retired_date;

	IF (year_retired_date IS NULL) THEN
		year_retired_date = max_age;
	END IF;
	
	IF (((start_season - year_birth_date) < min_age) OR ((year_retired_date - end_season) < 0)) THEN
		RETURN FALSE;
	END IF;
	
	RETURN TRUE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_militancy
 *
 * IN      : player.id%TYPE, team.id%TYPE, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_militancy
(
	IN	id_player		player.id%TYPE,
	IN	id_team			team.id%TYPE,
	IN	start_season	integer,
	IN	end_season		integer
)
RETURNS boolean
AS
$$
DECLARE

	tmp				text;

	id_country_team	integer;

	type_team		text;

BEGIN

	type_team = get_column('fp_team', 'type', id_team);

	IF ('CLUB' = type_team) THEN
	
		RETURN free_club_militancy(player_id, start_season, end_season);
	
	ELSIF ('NATIONAL' = type_team) THEN
		
		tmp = get_column('fp_team', 'country_id', id_team);
		id_country_team = CAST(tmp AS integer);

		IF (NOT has_nationality(id_player, id_country_team)) THEN
			RETURN FALSE;
		END IF;

		IF (other_national_militancy(id_player, id_team)) THEN
			RETURN FALSE;
		END IF;

		RETURN free_national_militancy(player_id, team_id, start_season, end_season);
		
	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_national_militancy
 *
 * IN      : player.id%TYPE, team.id%TYPE, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_national_militancy
(
	IN	id_player	player.id%TYPE,
	IN	id_team		team.id%TYPE,
	IN	s_season	integer,
	IN	e_season	integer
)
RETURNS boolean
AS
$$
DECLARE

	tmp				text;

	free			boolean;

BEGIN

	free = FALSE;

	SELECT
		count(*) < 1
	INTO
		free
	FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_id = id_team
		AND
		(
			start_season BETWEEN s_season AND e_season
			OR
			end_season BETWEEN s_season AND e_season
		);

	RETURN free;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : other_national_militancy
 *
 * IN      : player.id%TYPE, team.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION other_national_militancy
(
	IN	id_player		player.id%TYPE,
	IN	id_team			team.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	type_team	text;

	id_team_mil	integer;

BEGIN

	FOR id_team_mil
	IN
		SELECT DISTINCT
			team_id
		FROM
			fp_militancy
		WHERE
			player_id = id_player

	LOOP

		type_team = get_column('fp_team', 'type', id_team_mil);

		IF ('NATIONAL' = type_team AND id_team_mil <> id_team) THEN
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
 * NAME : free_club_militancy
 *
 * IN      : player.id%TYPE, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_club_militancy
(
	IN	id_player	player.id%TYPE,
	IN	s_season	integer,
	IN	e_season	integer
)
RETURNS boolean
AS
$$
DECLARE

	type_team	text;

	id_team_mil	integer;

BEGIN

	FOR id_team_mil
	IN
		SELECT DISTINCT
			team_id
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			(
				start_season BETWEEN s_season AND e_season
				OR
				end_season BETWEEN s_season AND e_season
			)

	LOOP

		type_team = get_column('fp_team', 'type', id_team_mil);

		IF (type_team <> 'NATIONAL') THEN
			RETURN FALSE;
		END IF;		

	END LOOP;

	RETURN TRUE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
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
 * NAME : world_exists
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION world_exists
(
)
RETURNS boolean
AS
$$
DECLARE

	exist	boolean;

BEGIN

	exist = FALSE;
				
	SELECT
		count(*) >= 1
	INTO
		exist
	FROM
		fp_country
	WHERE
		type = 'WORLD';


	IF (exist) THEN
		RAISE NOTICE E'Reached maximum number of Worlds'
			'Function: world_exists()';
	END IF;

	RETURN exist;
	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : all_continent_exists
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_continent_exists
(
)
RETURNS boolean
AS
$$
DECLARE

	exist	boolean;

BEGIN

	exist = FALSE;

	SELECT
		count(*) >= 6
	INTO
		exist
	FROM
		fp_country
	WHERE
		type = 'CONTINENT';


	IF (exist) THEN
		RAISE NOTICE E'Reached maximum number of Continents'
			'Function: all_continent_exists()';
	END IF;

	RETURN exist;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : place_for_country
 *
 * IN      : en_country
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION place_for_country
(
	IN	type_country	en_country
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
				
	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	ELSIF ('CONTINENT' = type_country) THEN
		RETURN (NOT all_continent_exists());
	ELSIF ('WORLD' = type_country) THEN
		RETURN (NOT world_exists());
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : conf_from_country
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_from_country
(
	IN	id_country	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	id_conf		integer;

BEGIN

	id_conf = NULL;

	SELECT
		id
	INTO
		id_conf
	FROM
		fp_confederation
	WHERE
		country_id = id_country;


	RETURN id_conf;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_national_team
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_national_team
(
	IN	id_country	integer
)
RETURNS void
AS
$$
DECLARE

	rec_country	record;

	id_conf		integer;

BEGIN

	rec_country = get_record('fp_country', id_country);

	IF (rec_country.type <> 'NATION') THEN

		RAISE NOTICE E'Error. Cannot create national team. Country (id = %) is not a nation\n'
			'Function: create_national_team(integer)', id_country;

		RETURN;

	END IF;


	INSERT INTO
		fp_team
		(
			type,
			country_id,
			long_name,
			short_name
		)
	VALUES
	(
		'NATIONAL',
		id_country,
		rec_country.name,
		rec_country.code
	)
	ON CONFLICT DO NOTHING;

	RAISE NOTICE E'Created national team for country (id = %)\n'
		'Function: create_national_team(integer)', id_country;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_all_gk
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_all_gk
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
BEGIN

	PERFORM delete_gk_tag(id_player);


	DELETE FROM
		fp_attribute_goalkeeping
	WHERE
		player_id = id_player;


	DELETE FROM
		fp_statistic_goalkeeper
	WHERE
		play_id IN
					(
						SELECT
							*
						FROM
							player_play(id_player)
					);

	RAISE NOTICE E'Deleted attribute and statistic goalkeeper'
		'of player (id = %)\nFunction: delete_all_gk(integer)', id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_all_gk
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_all_gk
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	id_play	integer;

BEGIN

	INSERT INTO
		fp_attribute_goalkeeping
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;

	
	FOR id_play
	IN
		SELECT
			*
		FROM
			player_play(id_player)
	
	LOOP

		INSERT INTO
			fp_statistic_goalkeeper
			(
				play_id
			)
		VALUES
		(
			id_play
		)
		ON CONFLICT DO NOTHING;

	END LOOP;


	RAISE NOTICE E'Created attribute and statistic goalkeeper'
		'of player (id = %)\nFunction: create_all_gk(integer)', id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : min_age
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'età minima per un calciatore.
 *
 *        NOTA: valore arbitrario ma ottenuto grazie a numerose ricerche
 *              (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION min_age
(
)
RETURNS integer
AS
$$
DECLARE

	min_age	integer;

BEGIN

	min_age = 15;
				
	RETURN min_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_age
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'età massima per un calciatore.
 *
 *        NOTA: valore arbitrario ma ottenuto grazie a numerose ricerche
 *              (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_age
(
)
RETURNS integer
AS
$$
DECLARE

	max_age	integer;

BEGIN

	max_age = 50;
				
	RETURN max_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : min_militancy_year
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'anno di inizio della prima militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION min_militancy_year
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
DECLARE

	min_year	integer;

BEGIN

	min_year = NULL;

	SELECT
		min(start_year)
	INTO
		min_year
	FROM
		fp_militancy
	WHERE
		player_id = id_player;

	
	RETURN min_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_militancy_year
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'anno di inizio dell'ultima militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_militancy_year
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
DECLARE

	max_year	integer;

BEGIN

	max_year = NULL;

	SELECT
		max(start_year)
	INTO
		max_year
	FROM
		fp_militancy
	WHERE
		player_id = id_player;

	
	RETURN max_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : valid_year_range
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : integer, integer
 * RETURNS : record
 *
 * DESC : Funzione che calcola e restituisce il range di anni validi per un
 *        calciatore.
 *
 *        NOTA: Per anno valido si intende un anno nel quale un calciatore
 *              può militare in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_year_range
(
	IN	id_player	integer,
	OUT	s_valid		integer,	-- inizio range anni validi
	OUT	e_valid		integer		-- fine range anni validi
)
RETURNS record
AS
$$
DECLARE

	tmp				text;

	year_dob		integer;
	year_retired	integer;

BEGIN

	tmp = get_column('fp_player', 'dob', id_player);
	year_dob = extract(year from CAST(tmp AS date));

	s_valid = year_dob + min_age();

	
	IF (is_retired(id_player)) THEN

		tmp = get_column('fp_player_retired', 'retired_date', id_player);
		year_retired = extract(year from CAST(tmp AS date));

		e_valid = year_dob + year_retired - 1;

	ELSE

		e_valid = year_dob + max_age();
	
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_retired
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore si sia ritirato o meno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_retired
(
	IN	id_player	integer
)
RETURNS boolean
AS
$$
DECLARE

	retired	boolean;	

BEGIN

	retired = FALSE;

	SELECT
		count(*) >= 1
	INTO
		retired
	FROM
		fp_player_retired
	WHERE
		player_id = id_player;


	IF (NOT retired) THEN
		RAISE NOTICE E'Player (id = %) has not retired yet\n'
			'Function: is_retired(integer)', id_player;
	END IF;

	RETURN retired;
	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_national
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha mai giocato in nazionale
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_national
(
	IN	id_player	integer
)
RETURNS boolean
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
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'NATIONAL'
	LIMIT 1;


	IF (NOT have) THEN
		RAISE NOTICE E'Player (id = %) does not have any national militancy\n'
			'Function: is_national(integer)', id_player;
	END IF;

	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_team
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce la squadra nazionale per la quale un
 *        calciatore ha giocato
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_team
(
	IN	id_player	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	id_team	integer;

BEGIN

	id_team = NULL;
				
	
	SELECT
		team_id
	INTO
		id_team
	FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'NATIONAL'
	LIMIT
		1;

	IF (id_team IS NULL) THEN

		RAISE NOTICE E'Player (id = %) does not have any national militancy\n'
			'Function: national_team(integer)', id_player;

	END IF;

	RETURN id_team;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha militanze in squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_militancy
(
	IN	id_player	integer
)
RETURNS boolean
AS
$$
DECLARE

	has	boolean;

BEGIN
			
	SELECT
		count(*) >= 1
	INTO
		has
	FROM
		fp_militancy
	WHERE
		player_id = id_player;
	

	IF (NOT has) THEN
		RAISE NOTICE E'Player (id = %) does not have any militancy\n'
			'Function: has_militancy(integer)', id_player;
	END IF;

	RETURN has;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_tags
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i tag di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_tags
(
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_tag
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
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i giochi di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_play
(
	id_player	integer
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_play
		WHERE
			player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : not_role_trophy
 *
 * IN      : en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i trofei individuali che non hanno un
 *        ruolo compatibile con la combinazione di ruoli in input
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION not_role_trophy
(
	role_player	en_role_mix
)
RETURNS SETOF integer
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
			0 = position(CAST(role AS text) in CAST(role_player AS text));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : not_role_prize
 *
 * IN      : en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i premi individuali che non hanno un
 *        ruolo compatibile con la combinazione di ruoli in input
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION not_role_prize
(
	role_player	en_role_mix
)
RETURNS SETOF integer
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
			0 = position(CAST(role AS TEXT) in CAST(role_player AS text));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_gk_tag
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le associazioni a tag di tipo
 *        portiere di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_gk_tag
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_player_tag
	WHERE
		player_id = id_player
		AND
		tag_id IN
					(
						SELECT
							*
						FROM
							gk_tags()
					);

	RAISE NOTICE E'Deleted goalkeeper tags of player (id = %)\n'
		'Function: delete_gk_tag(integer)', id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_not_role_prize
 *
 * IN      : integer, en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutti i premi individuali non compatibili
 *        con i ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_not_role_prize
(
	id_player	integer,
	role_player	en_role_mix
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_player_prize_case
	WHERE
		player_id = id_player
		AND
		prize_id IN
					(
						SELECT
							*
						FROM
							not_role_prize(role_player)
					);

	RAISE NOTICE E'Deleted prize which role is not one of player (id = %)'
		'\nFunction: delete_not_role_prize(integer, en_role_mix)', id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_not_role_trophy
 *
 * IN      : integer, en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutti i trofei individuali non compatibili
 *        con i ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_not_role_trophy
(
	id_player	integer,
	role_player	en_role_mix
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_player_trophy_case
	WHERE
		player_id = id_player
		AND
		trophy_id IN
					(
						SELECT
							*
						FROM
							not_role_trophy(role_player)
					);
	
	RAISE NOTICE E'Deleted trophy which role is not one of player (id = %)'
		'\nFunction: delete_not_role_trophy(integer, en_role_mix)', id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_club_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le militanze in una squadra
 *        di tipo club di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_club_militancy
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'CLUB';

	RAISE NOTICE E'Delete all club militacy of player (id = %)\n'
		'Function: delete_club_militancy(integer)', id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_national_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le militanze in una squadra
 *        di tipo nazionale di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_national_militancy
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'NATIONAL';

	RAISE NOTICE E'Delete all national militacy of player (id = %)\n'
		'Function: delete_national_militancy(integer)', id_player;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_be_inside
 *
 * IN      : en_country, en_country
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una tipologia di paese può essere contenuta
 *        in un'altra tipologia
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_be_inside
(
	IN	type_in_country		en_country,	-- tipo paese contenuto
	IN	type_super_country	en_country	-- tipo paese contenente
)
RETURNS boolean
AS
$$
BEGIN

	IF
	(
		('NATION' = type_in_country AND 'CONTINENT' = type_super_country)
		OR
		('CONTINENT' = type_in_country AND 'WORLD' = type_super_country)
		OR
		('WORLD' = type_in_country AND type_super_country IS NULL)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RAISE NOTICE E'% cannot be inside %\nFunction:'
		'can_be_inside(en_country, en_country)', type_in_country,
		type_super_country;

	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un paese è di una nazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN	id_country	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	type_country	en_country;

BEGIN
	
	tmp = get_column('fp_country', 'type', id_country);
	type_country = CAST(tmp AS en_country);

	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	END IF;
	
	RAISE NOTICE E'Country (id =  %) is not a nation\n'
		'Function: is_nation(integer)', id_country;

	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_edition
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che dato in input l'id di una competizione calcistica valuta
 *        se essa ha edizioni nel database
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_edition
(
	IN	id_comp	integer
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

		RAISE NOTICE E'Competition (id =  %) does not have editions\n'
			'Function: has_edition(integer)', id_comp;

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
 * IN      : integer, smallint
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
	IN	id_comp	integer,
	IN	s_year	smallint	-- anno di inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;

	freq	integer;
	a_year	integer;	-- un anno di inizio di un'edizione
	
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
	
	RAISE NOTICE E'Competition (id =  %) cannot start in year %, bad frequency\n'
		'Function: corr_freq(integer, smallint)', id_comp, s_year;

	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : belong_to
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio appartiene ad una
 *        confederazione calcistica membro di un'altra confederazione.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to
(
	IN	id_team	integer,
	IN	id_conf	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	type_conf		en_country;

	id_country		integer;

	id_conf_team	integer;
	
BEGIN

	-- prendo la confederazione di cui la squadra e' membro
	tmp = get_column('fp_team', 'country_id', id_team);
	id_country = CAST(tmp AS integer);					
	
	id_conf_team = conf_from_country(id_country);


	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;

	tmp = get_column('fp_confederation', 'super_id', id_conf_team);
	id_conf_team = CAST(tmp AS integer);

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;

	tmp = get_column('fp_confederation', 'super_id', id_conf_team);
	id_conf_team = CAST(tmp AS integer);

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	
	
	RAISE NOTICE E'Team (id =  %) does not belong to confederation (id = %)\n'
		'Function: belong_to(integer, integer)', id_team, id_conf;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_team_comp
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_team_comp
(
	IN	id_comp	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp	record;

BEGIN

	rec_comp = get_record('fp_competition', id_comp);

	IF ('LEAGUE' = rec_comp.type) THEN
		RETURN 40;
	
	ELSIF ('SUPER CUP' = rec_comp.type) THEN
		RETURN 6;
	
	ELSIF ('CUP' = rec_comp.type) THEN

		IF ('CLUB' = rec_comp.team_type) THEN
			RETURN 128;
	
		ELSIF ('NATIONAL' = rec_comp.team_type) THEN
			RETURN 48;
	
		END IF;

	END IF;


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_match_comp
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_match_comp
(
	IN	id_comp	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	type_comp	en_competition;

BEGIN

	tmp = get_column('fp_competition', 'type',id_comp);
	type_comp = CAST(tmp AS en_competition);

	IF ('LEAGUE' = type_comp) THEN
		RETURN 40;
	
	ELSIF ('SUPER CUP' = type_comp) THEN
		RETURN 3;
	
	ELSIF ('CUP' = type_comp) THEN
		RETURN 10;

	END IF;


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_place
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un'edizione di una competizione calcistica
 *        ha ancora posti a disposizione per squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_place
(
	IN	id_comp	integer,
	IN	s_year	smallint
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
		(count(*) < max_team_comp(id_comp))
	INTO
		have
	FROM
		fp_partecipation
	WHERE
		competition_id = id_comp
		AND
		start_year = s_year;


	IF (NOT have) THEN

		RAISE NOTICE E'Competition (id = %) start year (%)'
			'does not have place\nFunction: has_place(integer, smallint)',
			id_comp, s_year;

	END IF;


	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : role_fit_positions
 *
 * IN      : integer, en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha posizioni compatibili con
 *        una combinazione di ruoli
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION role_fit_positions
(
	IN	id_player	integer,
	IN	role_player	en_role_mix
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	pos_player	integer;
	role_pos	en_role;

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

		tmp = get_column('fp_position', 'role', pos_player);
		role_pos = CAST(tmp AS en_role);	-- conversione superflua ma effettuata per coerenza

		IF (0 = position(CAST(role_pos AS text) IN CAST(role_player AS text))) THEN

			RAISE NOTICE E'Player (id =  %) does not have role %\n'
				'Function: role_fit_positions(integer, en_role_mix)',
				id_player, role_pos;

			RETURN FALSE;
		END IF;

	END LOOP;

	
	RETURN TRUE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_comp
 *
 * IN      : integer, integer 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio è compatibile con
 *        una competizione calcistica
 *
 *        NOTA: una squadra di calcio è compatibile con una competizione
 *              calcistica se è dello stesso tipo del tipo di squadre che
 *              possono partecipare alla suddetta competizione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_comp
(
	IN	id_team	integer,
	IN	id_comp	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	type_team		en_team;
	type_team_comp	en_team;

BEGIN

	tmp = get_column('fp_team', 'type', id_team);
	type_team = CAST(tmp AS en_team);

	tmp = get_column('fp_competition', 'team_type', id_comp);
	type_team_comp = CAST(tmp AS en_team);


	IF (type_team = type_team_comp) THEN
		RETURN TRUE;
	ELSE

		RAISE NOTICE E'Team (id = %) is not compatible to competition (id = %)\n'
			'Function: team_fit_comp(integer, integer)', id_team, id_comp;
		RETURN FALSE;

	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce l'id di tutte le competizioni calcistiche
 *        simili a quella in input.
 *
 *        NOTA: Per simile si intende una competizione calcistica
 *              appartenente alla stessa confederazione calcistica,
 *              dello stesso tipo e alla quale possono partecipare
 *              lo stesso tipo di squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp
(
	IN	id_comp	integer
)
RETURNS SETOF integer
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
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (integer, integer)
 *
 * DESC : Funzione che restituisce l'id di tutte le edizione di competizioni
 *        calcistiche simili a quella in input.
 *
 *        NOTA: Per simile si intende una competizione calcistica simile
 *              che ha inizio nello stesso anno 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint
)
RETURNS TABLE
(
	id_similar_comp	integer,
	same_s_year		smallint
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			competition_id,
			CAST(start_year AS smallint) 
		FROM
			fp_competition_edition
		WHERE
			start_year = s_year
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
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio può partecipare ad
 *        un'edizione di una competizione calcistica.
 *
 *        NOTA: Una squadra di calcio per ogni confederazione calcistica
 *              cui appartiene può partecipare solo ad un tipo di competizione
 *              per ogni stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_take_part
(
	IN	id_team	integer,
	IN	id_comp	integer,
	IN	s_year	smallint	-- anno inizio
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

	-- per ogni edizione simile di competizioni calcistiche
	FOR rec_comp_ed
	IN
		SELECT
			*
		FROM
			similar_comp_ed(id_comp, s_year)
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
			competition_id = rec_comp_ed.id_similar_comp
			AND
			start_year = rec_comp_ed.same_s_year;
									
		-- se la squadra di calcio partecipa ad un'edizione simile
		IF (NOT can) THEN

			RAISE NOTICE E'Team (id = %) cannot partecipate'
				'to competition (id = %) start year (%)\n'
				'Function: can_take_part(integer, integer, smallint)',
				id_team, id_comp, s_year;

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
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha una certa nazionalità
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_nationality
(
	IN	id_player	integer,
	IN	id_country	integer
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
		RAISE NOTICE E'Player (id = %) has not nationatity country (id = %)\n'
			'Function: has_nationality(integer, integer)', id_player, id_country;
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
 * DESC : Funzione che valuta se la data di nascita e di ritiro di un
 *        calciatore rispettino i limiti di età da noi definiti.
 *
 *        NOTA: fare riferimento alle funzioni min_age e max_age
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_age_limit
(
	IN	birth_date		date,
	IN	retired_date	date
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	year_birth_date		integer;
	year_retired_date	integer;

BEGIN

	year_birth_date = extract(year from birth_date);
	year_retired_date = extract(year from retired_date);


	IF ((year_retired_date - year_birth_date) BETWEEN min_age() AND max_age()) THEN
		RETURN TRUE;
	END IF;

	RAISE NOTICE E' % is not between % and %\nFunction:'
		'corr_age_limit(date, date)', year_retired_date - year_birth_date,
		min_age(), max_age();

	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_militancy
 *
 * IN      : integer, en_team, smallint, en_season
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se in un certo anno un calciatore è disponibile
 *        per una nuova militanza di un certo tipo di squadra e di un certo tipo
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_militancy
(
	IN	id_player	integer,
	IN	type_team	en_team,
	IN	s_year		smallint,
	IN	type_year	en_season
)
RETURNS boolean
AS
$$
DECLARE

	free	boolean;

BEGIN

	free = FALSE;

	IF ('I PART' = type_year) THEN
	
		SELECT
			count(*) = 0
		INTO
			free
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = type_team
			AND
			start_year = s_year
			AND
			type IN ('I PART', 'FULL');
	
	ELSIF ('II PART' = type_year) THEN
	
		SELECT
			count(*) = 0
		INTO
			free
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = type_team
			AND
			start_year = s_year
			AND
			type IN ('II PART', 'FULL');

	ELSIF ('FULL' = type_year) THEN

		SELECT
			count(*) = 0
		INTO
			free
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = type_team
			AND
			start_year = s_year;
		
	END IF;


	IF (NOT free) THEN

		RAISE NOTICE E'Player (id = %) cannot have a militancy (type = %)'
		'starting in year % of type %\nFunction: '
		'free_militancy(integer, en_team, smallint, en_season)',
		id_player, type_team, s_year, type_year;

	END IF;

	RETURN free;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : remove_all_trophy_season
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che rimuove tutti i trofei assegnati ad un calciatore
 *        nella sua militanza in una squadra in un certo anno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION remove_all_trophy_season
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS void
AS
$$
BEGIN

	DELETE FROM
		fp_player_trophy_case
	WHERE
		player_id = id_player
		AND
		team_id = id_team
		AND
		start_year = s_year;

	RAISE NOTICE E'Deleted all trophy won by team (id = %), in year % that'
		'were assigned to player (id = %)\nFunction: '
		'remove_all_trophy_season(integer, integer, smallint)', id_team,
		s_year, id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : assign_all_trophy_season
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che assegna ad un calciatore tutti i trofei vinti da una
 *        squadra in un certo anno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION assign_all_trophy_season
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS void
AS
$$
DECLARE

	rec_team_trophy	record;

BEGIN

	FOR rec_team_trophy
	IN
		SELECT
			*
		FROM
			fp_team_trophy_case
		WHERE
			team_id = id_team
			AND
			start_year = s_year

	LOOP

		INSERT INTO
			fp_player_trophy_case
			(
				player_id,
				team_id,
				trophy_id,
				start_year,
				competition_id
			)
		VALUES
		(
			id_player,
			id_team,
			rec_team_trophy.trophy_id,
			s_year,
			rec_team_trophy.competition_id
		)
		ON CONFLICT DO NOTHING;

	END LOOP;

	RAISE NOTICE E'Assigned all trophy won by team (id = %), in year % '
		'to player (id = %)\nFunction: '
		'assign_all_trophy_season(integer, integer, smallint)', id_team,
		s_year, id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : list_player_position
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce tutte le posizioni di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION list_player_position
(
	IN	id_player	integer
)
RETURNS SETOF integer
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			position_id
		FROM
			fp_player_position
		WHERE
			player_id = id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_role
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : en_role_mix
 *
 * DESC : Funzione che restituisce la combinazione di ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_role
(
	IN	id_player	integer
)
RETURNS en_role_mix
AS
$$
DECLARE

	tmp			text;	-- stringa temporanea per costruire il nuovo ruolo

	role_pos	en_role;
	role_player	en_role_mix;

BEGIN

	tmp = '';

	-- per ogni ruolo associato alle posizioni del calciatore
	-- in ordine di enum
	FOR role_pos
	IN
		SELECT DISTINCT
			role
		FROM
			fp_position
		WHERE
			id IN
				(
					SELECT
						*
					FROM
						list_player_position(id_player)
				)
		ORDER BY
			role

	LOOP

		-- aggiungi alla combinazione di ruoli del giocatore
		tmp = tmp || CAST(role_pos AS text);
		tmp = tmp || '-';

	END LOOP;

	tmp = trim(tmp, '-');

	role_player = CAST(tmp AS en_role_mix);

	RAISE NOTICE E'Created new role of a player (id = %)\nFunction: '
		'new_role(integer)', id_player;

	RETURN role_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_has_trophy
 *
 * IN      : integer, integer, smallint, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio ha vinto un trofeo
 *        associato ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_has_trophy
(
	IN	id_team		integer,
	IN	id_trophy	integer,
	IN	s_year		smallint,
	IN	id_comp		integer
)
RETURNS boolean
AS
$$
DECLARE

	has	boolean;

BEGIN

	has = FALSE;

	
	SELECT
		count(*) >= 1
	INTO
		has
	FROM
		fp_team_trophy_case
	WHERE
		team_id = id_team
		AND
		trophy_id = id_trophy
		AND
		start_year = s_year
		AND
		competition_id = id_comp;


	IF (NOT has) THEN

		RAISE NOTICE E'Team (id = %) did not win the trophy (id = %)'
			' of the competition edition (competition_id = % , start_year = %)\n'
			'Function: team_has_trophy(integer, integer, smallint, integer)',
			id_team, id_trophy, id_comp, s_year;

	END IF;

	RETURN has;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_type_militancy
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : en_season
 *
 * DESC : Funzione che restituisce il tipo di milianza dato in input
 *        un calciatore, una squadra di calcio e un anno di inzio militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_type_militancy
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS en_season
AS
$$
BEGIN

	RETURN
	(
		SELECT
			type
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_id = id_team
			AND
			start_year = s_year
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_attributes
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_attributes
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	tmp			text;

	role_player	en_role_mix;

BEGIN

	INSERT INTO
		fp_attribute_mental
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;


	INSERT INTO
		fp_attribute_physical
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;


	INSERT INTO
		fp_attribute_technical
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;

	RAISE NOTICE E'Created attribute for player (id = %)\nFunction: '
		'create_attributes(integer)', id_player;

	tmp = get_column('fp_player', 'role', id_player);
	role_player = CAST(tmp AS en_role_mix);

	IF ('GK' = role_player) THEN

		INSERT INTO
			fp_attribute_goalkeeping
			(
				player_id
			)
		VALUES
		(
			id_player
		)
		ON CONFLICT DO NOTHING;

		RAISE NOTICE E'Created goalkeeper attribute for player (id = %)\n'
			'Function: create_attributes(integer)', id_player;

	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_play_from_militancy
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_play_from_militancy
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS void
AS
$$
DECLARE

	id_comp	integer;

BEGIN

	FOR id_comp
	IN
		SELECT
			competition_id
		FROM
			fp_partecipation
		WHERE
			start_year = s_year
			AND
			team_id = id_team
	
	LOOP

		INSERT INTO
			fp_play
			(
				start_year,
				competition_id,
				team_id,
				player_id
			)
		VALUES
		(
			s_year,
			id_comp,
			id_team,
			id_player
		)
		ON CONFLICT DO NOTHING;

	END LOOP;

	RAISE NOTICE E'Created play from militancy (team_id = % , player_id = % , '
		'start_year = %)\nFunction:'
		'create_play_from_militancy(integer, integer, smallint)', id_team,
		id_player, s_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_play_from_partecipation
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_play_from_partecipation
(
	IN	id_team	integer,
	IN	id_comp	integer,
	IN	s_year	smallint
)
RETURNS void
AS
$$
DECLARE

	id_player	integer;

BEGIN

	FOR id_player
	IN
		SELECT
			player_id
		FROM
			fp_militancy
		WHERE
			start_year = s_year
			AND
			team_id = id_team
	
	LOOP

		INSERT INTO
			fp_play
			(
				start_year,
				competition_id,
				team_id,
				player_id
			)
		VALUES
		(
			s_year,
			id_comp,
			id_team,
			id_player
		)
		ON CONFLICT DO NOTHING;

	END LOOP;


	RAISE NOTICE E'Created play from partecipation (team_id = % , '
		'competition_id = % , start_year = % \nFunction:'
		'create_play_from_partecipation(integer, integer, smallint)', id_team,
		id_comp, s_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_statistics
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_statistics
(
	IN	id_play	integer
)
RETURNS void
AS
$$
DECLARE

	tmp			text;

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	INSERT INTO
		fp_statistic_general
		(
			play_id
		)
	VALUES
	(
		id_play
	)
	ON CONFLICT DO NOTHING;


	tmp = get_column('fp_play', 'player_id', id_play);
	id_player = CAST(tmp AS integer);

	tmp = get_column('fp_player', 'role', id_player);
	role_player = CAST(tmp AS en_role_mix);


	RAISE NOTICE E'Created General Statistics of player (id = %) for play (id = %)'
		'\nFunction: create_statistics(integer)', id_player, id_play;

	IF (CAST(role_player AS text) LIKE '%GK%') THEN

		INSERT INTO
			fp_statistic_goalkeeper
			(
				play_id
			)
		VALUES
		(
			id_play
		)
		ON CONFLICT DO NOTHING;

		RAISE NOTICE E'Created Goalkeeper Statistics of player (id = %)'
			'for play (id = %)\nFunction: create_statistics(integer)',
			id_player, id_play;
		
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_zero_statistics
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_zero_statistics
(
	IN	id_play	integer
)
RETURNS void
AS
$$
DECLARE

	tmp			text;

	id_player	integer;
	role_player	integer;

BEGIN

	UPDATE
		fp_statistic_general
	SET
		goal_scored = 0,
		assist = 0,
		yellow_card	= 0,
		red_card = 0,
		penalty_scored = 0
	WHERE
		play_id = id_play;


	tmp = get_column('fp_play', 'player_id', id_play);
	id_player = CAST(tmp AS integer);

	tmp = get_column('fp_player', 'role', id_play);
	role_player = CAST(tmp AS en_role_mix);

	RAISE NOTICE E'Set to zero General Statistics of player (id = %)'
		'for play (id = %)\nFunction: create_statistics(integer)',
		id_player, id_play;

	IF (CAST(role_player AS text) LIKE '%GK%') THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = 0,
			penalty_saved = 0
		WHERE
			play_id = id_play;
		
		RAISE NOTICE E'Set to zero Goalkeeper Statistics of player (id = %)'
			'for play (id = %)\nFunction: set_zero_statistics(integer)',
			id_player, id_play;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : insert_militancy_from_to
 *
 * IN      : en_team, integer, integer, smallint, en_season, smallint, en_season
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION insert_militancy_from_to
(
	IN	type_team	en_team,
	IN	id_team		integer,
	IN	id_player	integer,
	IN	s_year		smallint,
	IN	type_s_year	en_season,
	IN	e_year		smallint,
	IN	type_e_year	en_season
)
RETURNS void
AS
$$
DECLARE

	error		boolean;

	chek_year	smallint;

	year		smallint;

BEGIN

	error = FALSE;

	IF (e_year <= s_year) THEN
		error = TRUE;
	END IF;


	IF (error) THEN
		RETURN;
	END IF;
	

	chek_year = NULL;

	INSERT INTO
		fp_militancy
		(
			team_type,
			team_id,
			player_id,
			start_year,
			type
		)
	VALUES
	(
		type_team,
		id_team	,
		id_player,
		s_year,
		type_s_year
	)
	RETURNING
		start_year
	INTO
		chek_year;


	IF (chek_year IS NULL) THEN
		error = TRUE;
	END IF;


	IF (error) THEN

		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
			AND
			type = type_s_year;

		RETURN;

	END IF;



	FOR year IN (s_year + 1)..(e_year - 1)
	LOOP

		chek_year = NULL;

		INSERT INTO
			fp_militancy
			(
				team_type,
				team_id,
				player_id,
				start_year,
				type
			)
		VALUES
		(
			type_team,
			id_team	,
			id_player,
			year,
			'FULL'
		)
		RETURNING
			start_year
		INTO
			chek_year;

		
		IF (chek_year IS NULL) THEN
			error = TRUE;
		END IF;

		EXIT WHEN error;

	END LOOP;


	IF (error) THEN

		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
			AND
			type = type_s_year;


		FOR year IN (s_year + 1)..(e_year - 1)
		LOOP

			DELETE FROM
				fp_militancy
			WHERE
				team_type = type_team
				AND
				team_id = id_team
				AND
				player_id = id_player
				AND
				start_year = year
				AND
				type = 'FULL';

		END LOOP;


		RETURN;

	END IF;


	chek_year = NULL;

	INSERT INTO
		fp_militancy
		(
			team_type,
			team_id,
			player_id,
			start_year,
			type
		)
	VALUES
	(
		type_team,
		id_team	,
		id_player,
		e_year,
		type_e_year
	)
	RETURNING
		start_year
	INTO
		chek_year;

	
	IF (chek_year IS NULL) THEN
		error = TRUE;
	END IF;


	IF (error) THEN

		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
			AND
			type = type_s_year;


		FOR year IN (s_year + 1)..(e_year - 1)
		LOOP

			DELETE FROM
				fp_militancy
			WHERE
				team_type = type_team
				AND
				team_id = id_team
				AND
				player_id = id_player
				AND
				start_year = year
				AND
				type = 'FULL';

		END LOOP;


		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = e_year
			AND
			type = type_e_year;

	END IF;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : random_between
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : smallint
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION random_between
(
	IN	s_range	integer,
	IN	e_range	integer
)
RETURNS smallint
AS
$$
BEGIN

	RETURN CAST(floor(random() * (e_range - s_range + 1) + s_range) AS smallint);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_mental
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_mental
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	UPDATE
		fp_attribute_mental
	SET
		aggression = random_between(0, 10),
		anticipation = random_between(0, 10),
		bravery = random_between(0, 10),
		composure = random_between(0, 10),
		concentration = random_between(0, 10),
		decision = random_between(0, 10),
		determination = random_between(0, 10),
		flair = random_between(0, 10),
		leadership = random_between(0, 10),
		off_the_ball = random_between(0, 10),
		positioning = random_between(0, 10),
		teamwork = random_between(0, 10),
		vision = random_between(0, 10),
		work_rate = random_between(0, 10)
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_physical
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_physical
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	UPDATE
		fp_attribute_physical
	SET
		acceleration = random_between(0, 10),
		agility = random_between(0, 10),
		balance = random_between(0, 10),
		jumping_reach = random_between(0, 10),
		natural_fitness = random_between(0, 10),
		pace = random_between(0, 10),
		stamina = random_between(0, 10),
		strenght = random_between(0, 10)
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_technical
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_technical
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	UPDATE
		fp_attribute_technical
	SET
		corners = random_between(0, 10),
		crossing = random_between(0, 10),
		dribbling = random_between(0, 10),
		finishing = random_between(0, 10),
		first_touch = random_between(0, 10),
		free_kick_taking = random_between(0, 10),
		heading = random_between(0, 10),
		long_shots = random_between(0, 10),
		long_throws = random_between(0, 10),
		marking = random_between(0, 10),
		passing = random_between(0, 10),
		penality_taking = random_between(0, 10),
		tackling = random_between(0, 10),
		technique = random_between(0, 10)	
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_goalkeeping
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_goalkeeping
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	tmp			text;

	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_player', 'role', id_player);
	role_player = CAST(tmp AS en_role_mix);

	IF (0 = position('GK' in CAST(role_player AS text))) THEN
		RETURN;
	END IF;


	UPDATE
		fp_attribute_goalkeeping
	SET
		aerial_reach = random_between(0, 10),
		command_of_area = random_between(0, 10),
		communication = random_between(0, 10),
		eccentricity = random_between(0, 10),
		first_touch_gk = random_between(0, 10),
		handling = random_between(0, 10),
		kicking = random_between(0, 10),
		one_on_ones = random_between(0, 10),
		passing_gk = random_between(0, 10),
		punching_tencency = random_between(0, 10),
		reflexes = random_between(0, 10),
		rushing_out_tendency = random_between(0, 10),
		throwing = random_between(0, 10)
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	PERFORM set_random_attribute_mental(id_player);

	PERFORM set_random_attribute_physical(id_player);

	PERFORM set_random_attribute_technical(id_player);

	PERFORM set_random_attribute_goalkeeping(id_player);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_statistic_general
 *
 * IN      : integer, integer, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_statistic_general
(
	IN	id_play		integer,
	IN	match_play	integer,
	IN	main_role	en_role
)
RETURNS void
AS
$$
BEGIN

	IF ('GK' = main_role) THEN

		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.05) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.2) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.1) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.05) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('DF' = main_role) THEN

		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.2) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.3) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.4) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.3) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.2) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('MF' = main_role) THEN
		
		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.4) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.6) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.3) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.25) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.35) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('FW' = main_role) THEN

		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.9) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.5) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.2) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.1) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.5) AS integer))
		WHERE
			play_id = id_play;

	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_statistic_goalkeeper
 *
 * IN      : integer, integer, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_statistic_goalkeeper
(
	IN	id_play		integer,
	IN	match_play	integer,
	IN	main_role	en_role
)
RETURNS void
AS
$$
DECLARE

	tmp			text;

	id_player	integer;

	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_play', 'player_id', id_play);
	id_player = CAST(tmp AS integer);

	tmp = get_column('fp_player', 'role', id_player);
	role_player = CAST(tmp AS en_role_mix);

	IF (0 = position('GK' in CAST(role_player AS text))) THEN
		RETURN;
	END IF;

	 
	IF ('GK' = main_role) THEN
		
		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 1.25) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.35) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('DF' = main_role) THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.01) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('MF' = main_role) THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.01) AS integer))
		WHERE
			play_id = id_play;
	
	ELSIF ('FW' = main_role) THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.01) AS integer))
		WHERE
			play_id = id_play;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_statistic
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_statistic
(
	IN	id_play	integer
)
RETURNS void
AS
$$
DECLARE
	
	tmp				text;

	id_comp			integer;

	s_year			smallint;

	tot_team		integer;

	match_play		integer;

	id_player		integer;
	id_pos_player	integer;
	role_pos_player	en_role;

BEGIN

	tmp = get_column('fp_play', 'competition_id', id_play);
	id_comp = CAST(tmp AS integer);

	tmp = get_column('fp_play', 'start_year', id_play);
	s_year = CAST(tmp AS integer);




	UPDATE
		fp_play
	SET
		match = random_between(1, max_match_comp(id_comp))
	WHERE
		id = id_play;


	tmp = get_column('fp_play', 'match', id_play);
	match_play = CAST(tmp AS integer);

	
	tmp = get_column('fp_play', 'player_id', id_play);
	id_player = CAST(tmp AS integer);

	tmp = get_column('fp_player', 'position_id', id_player);
	id_pos_player = CAST(tmp AS integer);

	tmp = get_column('fp_position', 'role', id_pos_player);
	role_pos_player = CAST(tmp AS en_role);


	PERFORM set_random_statistic_general(id_play, match_play, role_pos_player);

	PERFORM set_random_statistic_goalkeeper(id_play, match_play, role_pos_player);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_all_statistic
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_all_statistic
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	id_play	integer;

BEGIN

	FOR id_play
	IN
		SELECT
			id
		FROM
			fp_play
		WHERE
			player_id = id_player
		
	LOOP

		PERFORM set_random_statistic(id_play);

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	PERFORM set_random_attribute(id_player);

	PERFORM set_random_all_statistic(id_player);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_all
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_all
(
)
RETURNS void
AS
$$
DECLARE

	id_player	integer;

BEGIN

	FOR id_player
	IN
		SELECT
			id
		FROM
			fp_player

	LOOP

		PERFORM set_random(id_player);

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_team_from_country
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_team_from_country
(
	IN id_country	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	id_team	integer;

BEGIN

	id_team = NULL;

	SELECT
		id
	INTO
		id_team
	FROM
		fp_team
	WHERE
		country_id = id_country
		AND
		type = 'NATIONAL';

	IF (id_team IS NULL) THEN

		RAISE NOTICE E'Country (id = %) hasn''t a national team\n'
			'Function: national_team_from_country(integer)', id_country;
	END IF;

	RETURN id_team;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_national_militancy
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha militanze
 *        per una certa squadra di calcio nazionale
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_national_militancy
(
	IN	id_player	integer,
	IN	id_team		integer
)
RETURNS boolean
AS
$$
DECLARE

	has	boolean;

BEGIN
			
	SELECT
		count(*) >= 1
	INTO
		has
	FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_id = id_team
		AND
		team_type = 'NATIONAL'
	LIMIT 1;
	

	IF (NOT has) THEN

		RAISE NOTICE E'Player (id = %) does not have any militancy'
			'with team (id = %)\nFunction: '
			'has_national_militancy(integer, integer)', id_player, id_team;

	END IF;

	RETURN has;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

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
 * RETURNS : boolean
 *
 * DESC : Funzione che calcola e restituisce il range di anni validi per un
 *        calciatore.
 *
 *        NOTA: per anno valido si intende un anno nel quale un calciatore
 *              può militare in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_year_range
(
	IN	id_player	integer,
	OUT	s_valid		integer,	-- inizio range anni validi
	OUT	e_valid		integer		-- fine range anni validi
)
RETURNS boolean
AS
$$
DECLARE

	tmp				text;

	year_dob		integer;
	year_retired	integer;

BEGIN

	tmp = get_column('fp_player', 'dob', id_player);
	year_dob = extract year from CAST(tmp AS date);

	s_valid = year_dob + min_age();

	
	IF (is_retired(id_player)) THEN

		tmp = get_column('fp_player_retired', 'retired_date', id_player);
		year_retired = extract year from CAST(tmp AS date);

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
BEGIN
				
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_player_retired
		WHERE
			player_id = id_player
	);
	
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
BEGIN
				
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = 'NATIONAL';
	);
	
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
 * DESC : Funzione che valuta se un calciatore ha militanze in squadre du calcio
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
		RAISE NOTICE 'Player (id = %) does not have any militancy', id_player;
	END IF;

	RETURN has;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_attributes
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce gli attributi di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_attributes
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
			fp_attribute
		WHERE
			type = 'GOALKEEPER';
	
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
			type = 'GOALKEEPER';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_statistics
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce le statistiche di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_statistics
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
			0 = position(role in role_player);
	
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
			0 = position(role in role_player);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_gk_attribute
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le associazioni ad attributi di tipo
 *        portiere di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_gk_attribute
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
			fp_player_attribute
		WHERE
			player_id = id_player
			AND
			attribute_id IN
							(
								SELECT
									*
								FROM
									gk_attributes()
							);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_gk_statistic
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le associazioni a statistiche di tipo
 *        portiere di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_gk_statistic
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
			fp_player_statistic
		WHERE
			player_id = id_player
			AND
			statistic_id IN 
							(
								SELECT
									*
								FROM
									gk_statistics()
							);
	
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
		player_id = NEW.id
		AND
		prize_id IN
					(
						SELECT
							*
						FROM
							not_role_prize(role_player)
					);
	
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
		player_id = NEW.id
		AND
		trophy_id IN
					(
						SELECT
							*
						FROM
							not_role_trophy(role_player)
					);
	
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
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_be_inside
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un paese può essere contenuto in un altro
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_be_inside
(
	IN	id_in_country		integer,	-- paese contenuto
	IN	id_super_country	integer		-- paese contenente
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
 * IN      : integer, smallint, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se l'anno di inizio e fine di un'edizione di
 *        una competizione calcistica sono corretti.
 *
 *        NOTA: abbiamo effettuato una semplificazione che è basata
 *              sull'analisi di numerose competizioni (Wikipidia, Transermarkt).
 *              Un campionato è sempre a cavallo di due anni.
 *              Una supercoppa sempre svolta in un solo anno.
 *              Un torneo per club a cavallo di due anni, un torneo per
 *              nazionali sempre svolto in un solo anno.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_years_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint,	-- anno inizio
	IN	e_year	smallint	-- anno fine
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
 * IN      : integer, integer
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
	IN	id_team	integer,
	IN	id_conf	integer
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

	-- prendo il tipo del paese associato alla confederazione membro
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
 * NAME : tot_team_comp_ed
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce il numero di team che possono partecipare
 *        ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tot_team_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint	-- anno inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tot_team	integer;

BEGIN

	tot_team = NULL;

	SELECT
		total_team
	INTO
		tot_team
	FROM
		fp_competition_edition
	WHERE
		competition_id = id_comp
		AND
		start_year = s_year;


	RETURN tot_team;

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

	tot_team	integer;

	have		boolean;

BEGIN
	
	tot_team = tot_team_comp_ed(id_comp, s_year);

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
		start_year = s_year;


	IF (NOT have) THEN
		RAISE NOTICE 'Competition (id = %) [%-%] does not have place', id_comp, s_year;
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
 * NAME : militancy_in
 *
 * IN      : integer, integer 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha una militanza in una squadra
 ******************************************************************************/
CREATE OR REPLACE FUNCTION militancy_in
(
	IN	id_player	integer,
	IN	id_team		integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	SELECT
		count(*) >= 1
	FROM
		fp_militancy
	WHERE
		team_id = id_team
		AND
		player_id = id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : pos_fit_stat
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una posizione del campo di gioco è
 *        associabile ad una statistica.
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION pos_fit_stat
(
	IN	id_pos	integer,
	IN	id_stat	integer
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

	type_team		text;
	type_team_comp	text;

BEGIN

	type_team = get_column('fp_team', 'type', id_team);
	type_team_comp = get_column('fp_competition', 'team_type', id_comp);
	
	IF (type_team = type_team_comp) THEN
		RETURN TRUE;
	ELSE
		RAISE NOTICE 'Team (id = %) is not compatible to competition (id = %)', id_team, id_comp;
		RETURN FALSE;
	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_tot_team
 *
 * IN      : integer, smallint
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
	IN	id_comp		integer,
	IN	tot_team	smallint
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
	competition_id	integer,
	start_year		integer
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			competition_id,
			start_year
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
			competition_id = rec_comp_ed.competition_id
			AND
			start_year = rec_comp_ed.start_year;
									
		-- se la squadra di calcio partecipa ad un'edizione simile
		IF (NOT can) THEN
			RAISE NOTICE 'Team (id = %) cannot partecipate to competition (id = %) [%-%]', id_team, id_comp, s_year;
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

	year_birth_date = extract year from birth_date;
	year_retired_date = extract year from retired_date;


	IF ((year_retired_date - year_birth_date) BETWEEN min_age() AND max_age()) THEN
		RETURN TRUE;
	END;


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
		RAISE NOTICE 'Player (id = %) cannot have a militancy (type = %) starting in year % of type %', id_player, type_team, s_year, type;
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
		);

	END LOOP;

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
 * RETURNS : text
 *
 * DESC : Funzione che restituisce la combinazione di ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_role
(
	IN	id_player	integer
)
RETURNS text
AS
$$
DECLARE

	role_player		text;
	new_role_player	text;

BEGIN

	new_role_player = '';

	-- per ogni ruolo associato alle posizioni del calciatore
	-- in ordine di enum
	FOR role_player
	IN
		SELECT DISTINCT
			role
		FROM
			fp_player_position
		WHERE
			player_id = id_player
		ORDER BY
			role;

	LOOP

		-- aggiungi alla combinazione di ruoli del giocatore
		new_role_player = new_role_player || role_player;
		new_role_player = new_role_player || '-';

	END LOOP;

	new_role_player = trim(new_role_player, '-');

	RETURN new_role_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : position_number
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce il numero di posizioni associate ad un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION position_number
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*)
		FROM
			fp_player_position
		WHERE
			player_id = id_player
	);

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
 * RETURNS : integer
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
BEGIN

	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_team_trophy_case
		WHERE
			team_id = id_team
			AND
			trophy_id = id_trophy
			AND
			start_year = s_year
			AND
			competition_id = id_comp
	);

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
 * RETURNS : text
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
RETURNS text
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

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
 * TRIGGER FUNCTION
 ******************************************************************************/


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_if_referenced_refuse
 *
 * DESC : Funzione che controlla che accetta un aggiornamento solo se la
 *        riga della tabella che ha scatenato il trigger non è referenziata
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_if_referenced_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', string_for_reference('@', TG_TABLE_NAME, OLD))) THEN
		IF ('UPDATE' = TG_OP) THEN
			RETURN NEW;
		ELSIF ('DELETE' = TG_OP) THEN
			RETURN OLD;
		END IF;
	END IF;
	
	
	IF ('UPDATE' = TG_OP) THEN
		RETURN OLD;
	ELSIF ('DELETE' = TG_OP) THEN
		RETURN NULL;
	END IF;
	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_refuse
 *
 * DESC : Funzione che rifiuta una qualsiasi operazione che attivi il trigger
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	IF ('INSERT' = TG_OP) THEN
		RETURN NULL;
	ELSIF ('UPDATE' = TG_OP) THEN
		RETURN OLD;
	ELSIF ('DELETE' = TG_OP) THEN
		RETURN NULL;
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_country
 *
 * DESC : Funzione che controlla che il nuovo paese che si vuole inserire
 *        sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_country
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp					text;

	type_super_country	en_country;

BEGIN

	IF (place_for_country(NEW.type)) THEN

		tmp = get_column('fp_country', 'type', NEW.super_id);
		type_super_country = CAST(tmp AS en_country);

		IF (can_be_inside(NEW.type, type_super_country)) THEN
			RETURN NEW;
		END IF;

	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_country\n'
		'Refuse insert for country: (name = %)', NEW.name;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_country_nation
 *
 * DESC : Funzione che dopo l'inserimento di un paese ne crea
 *        la squadra nazionale corrispondente
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_country_nation
(
)
RETURNS trigger
AS
$$
BEGIN

	PERFORM create_national_team(NEW.id);


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_confederation
 *
 * DESC : Funzione che controlla se la nuova confederazione calcistica che
 *        si desidera inserire rispetti il vincolo di contentimento in
 *        un'altra confederazione di tipo appropriato
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_confederation
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp					text;

	id_country_super	integer;

	type_country		en_country;
	type_country_super	en_country;


BEGIN

	tmp = get_column('fp_country', 'type', NEW.country_id);
	type_country = CAST(tmp AS en_country);

	tmp = get_column('fp_confederation', 'country_id', NEW.super_id);
	id_country_super = CAST(tmp AS integer);
	tmp = get_column('fp_country', 'type', id_country_super);
	type_country_super = CAST(tmp AS en_country);


	IF (can_be_inside(type_country, type_country_super)) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_confederation\n'
		'Refuse insert for confederation: (long name = %)', NEW.long_name;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_competition
 *
 * DESC : Funzione che controlla che la nuova competizione calcistica che
 *        si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_competition
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp					text;

	id_country_conf		integer;
	type_country_conf	en_country;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	tmp = get_column('fp_country', 'type', id_country_conf);
	type_country_conf = CAST(tmp AS en_country);

	-- non possono esistere competizioni per squadre nazionali
	-- organizzate da una confederazione nazionale
	IF (type_country_conf <> 'NATION' OR NEW.team_type <> 'NATIONAL') THEN
		RETURN NEW;
	END IF;


	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_competition\n'
		'Refuse insert for competition: (name = %)', NEW.name;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_competition_edition
 *
 * DESC : Funzione che controlla che la nuova edizione di una competizione
 *        calcistica che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_competition_edition
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT has_edition(NEW.competition_id)) THEN
		RETURN NEW;

	ELSE
		-- se esiste già un'edizione della competizione
		-- quella che si vuole inserire deve rispettare la frequenza della competizione
		IF (corr_freq(NEW.competition_id, NEW.start_year)) THEN
			RETURN NEW;
		END IF;

	END IF;	


	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_competition_edition\n'
		'Refuse insert for competition edition: (comp_id = %, s_year = %)',
		NEW.competition_id, NEW.start_year;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_team
 *
 * DESC : Funzione che controlla che la nuova squadra di calcio che si vuole
 *        inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team
(
)
RETURNS trigger
AS
$$
DECLARE

	code_country	text;
	name_country 	text;

BEGIN

	-- se la squadra è associata ad una nazione
	IF (is_nation(NEW.country_id)) THEN

		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;

		-- se la squadra è di tipo nazionale deve avere lo stesso nome
		-- della nazione cui è associata		
		ELSIF ('NATIONAL' = NEW.type) THEN

			code_country = get_column('fp_country', 'code', NEW.country_id);
			name_country = get_column('fp_country', 'name', NEW.country_id);

			IF (NEW.short_name = code_country AND NEW.long_name = name_country) THEN
				RETURN NEW;
			END IF;
				
		END IF;

	END IF;
	

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_team\n'
		'Refuse insert for team: (long name = %)', NEW.long_name;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_player
 *
 * DESC : Funzione che controlla che il nuovo calciatore che si vuole inserire
 *        sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	role_pos	en_role_mix;

BEGIN

	IF (is_nation(NEW.country_id)) THEN

		tmp = get_column('fp_position', 'role', NEW.position_id);
		role_pos = CAST(tmp AS en_role_mix);

		IF (NEW.role = role_pos) THEN
			RETURN NEW;
		END IF;

	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_player\n'
		'Refuse insert for player: (name = %, surname = %)',
		NEW.name, NEW.surname;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_player
 *
 * DESC : Funzione che dopo l'inserimento di un calciatore ne aggiorna la
 *        nazionalità, l'associazione tra calciatore e posizione e
 *        crea gli attributi riferiti al calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_player
(
)
RETURNS trigger
AS
$$
BEGIN

	INSERT INTO
		fp_nationality
		(
			country_id,
			player_id
		)
	VALUES
	(
		NEW.country_id,
		NEW.id
	)
	ON CONFLICT DO NOTHING;


	INSERT INTO
		fp_player_position
		(
			player_id,
			position_id
		)
	VALUES
	(
		NEW.id,
		NEW.position_id
	)
	ON CONFLICT DO NOTHING;


	PERFORM create_attributes(NEW.id);


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_player_country
 *
 * DESC : Funzione che controlla che l'aggiornamento del paese di nascita di
 *        un calciatore sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_country
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_nation(NEW.country_id)) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bu_player_country\n'
		'Refuse update born country for player: (name = %, surname = %)',
		NEW.name, NEW.surname;

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_player_dob
 *
 * DESC : Funzione che controlla che l'aggiornamento della data di nascita di
 *        un calciatore sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_dob
(
)
RETURNS trigger
AS
$$
DECLARE

	retired_date	date;

	born_year		integer;

	temp			boolean;

BEGIN

	temp = TRUE;

	IF (is_retired(NEW.id)) THEN

		retired_date = get_retired_date(NEW.id);

		IF (NOT corr_age_limit(NEW.dob, retired_date)) THEN
			temp = FALSE;
		END IF;
	
	END IF;


	IF (has_militancy(NEW.id)) THEN

		born_year = extract(year from NEW.dob);

		IF (min_militancy_year(NEW.id) - born_year < min_age()) THEN
			temp = FALSE;
		END IF;


		IF (NOT is_retired(NEW.id)) THEN

			IF (max_militancy_year(NEW.id) - born_year > max_age()) THEN
				temp = FALSE;
			END IF;

		END IF;
		
	END IF;

	IF (NOT temp) THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bu_player_dob\n'
			'Refuse update dob for player: (name = %, surname = %)',
			NEW.name, NEW.surname;

		RETURN OLD;

	END IF;

	RETURN NEW;
		
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_player_role
 *
 * DESC : Funzione che controlla che l'aggiornamento del ruolo di un calciatore
 *        sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_role
(
)
RETURNS trigger
AS
$$
BEGIN

	-- se il nuovo ruolo è compatibile con tutte le posizioni del calciatore
	IF (role_fit_positions(NEW.id, NEW.role)) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bu_player_dob\n'
		'Refuse update role for player: (name = %, surname = %)',
		NEW.name, NEW.surname;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_player_country
 *
 * DESC : Funzione che dopo l'aggiornamento del paese di nascita di un
 *        calciatore, aggiorna la nazionalità del calciatore ed elimina
 *        la vecchia nazionalità se non sono presenti militanze nazionali
 *        associate al vecchio paese di nascita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_country
(
)
RETURNS trigger
AS
$$
BEGIN


	INSERT INTO
		fp_nationality
		(
			country_id,
			player_id
		)
	VALUES
	(
		NEW.country_id,
		NEW.id
	)
	ON CONFLICT DO NOTHING;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_player_pos
 *
 * DESC : Funzione che dopo l'aggiornamento della posizione principale di un
 *        calciatore, aggiorna l'associazione tra calciatore e posizione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_pos
(
)
RETURNS trigger
AS
$$
BEGIN
	
	INSERT INTO
		fp_player_position
		(
			player_id,
			position_id
		)
	VALUES
	(
		NEW.id,
		NEW.position_id
	)
	ON CONFLICT DO NOTHING;
	

	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_player_role
 *
 * DESC : Funzione che dopo l'aggiornamento del ruolo di un calciatore
 *        aggiorna gli attributi, le statistiche, i tag, i premi e i trofei
 *        associati al ruolo del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_role
(
)
RETURNS trigger
AS
$$
BEGIN
	
	-- se il calciatore ha perso il ruolo di portiere
	IF ((CAST(OLD.role AS text) LIKE '%GK%') AND (CAST(NEW.role AS text) NOT LIKE '%GK%')) THEN
		PERFORM delete_all_gk(NEW.id);
	ELSIF ((CAST(OLD.role AS text) NOT LIKE '%GK%') AND (CAST(NEW.role AS text) LIKE '%GK%')) THEN
		PERFORM create_all_gk(NEW.id);
	END IF;
	

	PERFORM delete_not_role_trophy(NEW.id, NEW.role);
	PERFORM delete_not_role_prize(NEW.id, NEW.role);
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tg_bi_player_retired
 *
 * DESC : Funzione che controlla che il giocatore ritirato che si vuole
 *        inserire sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_retired
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	born_date		date;
	retired_year	integer;

	temp			boolean;

BEGIN

	temp = TRUE;

	tmp = get_column('fp_player', 'dob', NEW.player_id);
	born_date = CAST(tmp AS date);

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		temp = FALSE;
	END IF;
	

	IF (has_militancy(NEW.player_id)) THEN

		retired_year = extract(year from NEW.retired_date);
	
		IF (max_militancy_year(NEW.player_id) >= retired_year) THEN
			temp = FALSE;
		END IF;
	
	END IF;

	IF (NOT temp) THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bi_player_retired\n'
			'Refuse insert player retired: (player id = %)', NEW.player_id;


		RETURN NULL;

	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tg_bu_player_retired_date
 *
 * DESC : Funzione che controlla che l'aggiornamento della data di ritiro per
 *        il giocatore ritirato sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_player_retired_date
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	born_date		date;
	retired_year	integer;

	temp			boolean;

BEGIN

	temp = TRUE;

	tmp = get_column('fp_player', 'dob', NEW.player_id);
	born_date = CAST(tmp AS date);

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		temp = FALSE;	
	END IF;
	

	IF (has_militancy(NEW.player_id)) THEN

		retired_year = extract(year from NEW.retired_date);
	
		IF (max_militancy_year(NEW.player_id) >= retired_year) THEN
			temp = FALSE;
		END IF;
	
	END IF;

	IF (NOT temp) THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bu_player_retired_date\n'
			'Refuse update player retired date: (player id = %)', NEW.player_id;

		RETURN OLD;

	END IF;

	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_nationality
 *
 * DESC : Funzione che controlla che la nuova nazionalità
 *        che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_nationality
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_nation(NEW.country_id)) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_nationality\n'
		'Refuse insert nationality: (country id = %, player id = %)',
		NEW.country_id, NEW.player_id;

	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_nationality
 *
 * DESC : Funzione che controlla che la nazionalità che si vuole eliminare
 *        non sia quella riferita alla nazione di nascita di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_nationality
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp					text;

	id_country_player	integer;

	id_team				integer;

BEGIN

	tmp = get_column('fp_player', 'country_id', OLD.player_id);
	id_country_player = CAST(tmp AS integer);


	IF (OLD.country_id = id_country_player) THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bd_nationality\n'
			'Refuse delete nationality: (country id = %, player id = %)',
			OLD.country_id, OLD.player_id;

		RETURN NULL;

	END IF;


	IF (is_national(OLD.player_id)) THEN

		id_team = national_team(OLD.player_id);

		tmp = get_column('fp_team', 'country_id', id_team);
		id_country = CAST(tmp AS integer);

		
		IF (OLD.country_id = id_country) THEN

			-- DEBUG
			RAISE NOTICE
				E'Trigger Function: tf_bd_nationality\n'
				'Refuse delete nationality: (country id = %, player id = %)',
				OLD.country_id, OLD.player_id;

			RETURN NULL;

		END IF;

	END IF;


	RETURN OLD;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_partecipation
 *
 * DESC : Funzione che controlla che la nuova partecipazione di una squadra
 *        di calcio ad un'edizione di una competizione calcistica che
 *        si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_partecipation
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	id_conf_comp	integer;

BEGIN

	tmp = get_column('fp_competition', 'confederation_id', NEW.competition_id);
	id_conf_comp = CAST(tmp AS integer);


	IF
	(
		-- se l'edizione ha ancora posti disponibili
		has_place(NEW.competition_id, NEW.start_year)
		AND
		-- ..e la squadra appartiene alla confederazione che organizza la competizione
		belong_to(NEW.team_id, id_conf_comp)
		AND
		-- ..e la squadra è compatibile con la competizione
		team_fit_comp(NEW.team_id, NEW.competition_id)
		AND
		-- ..e la squadra non partecipa ad altre edizioni simili nella stessa confederazione
		can_take_part(NEW.team_id, NEW.competition_id, NEW.start_year)
	)
	THEN
		RETURN NEW;
	END IF;
	
	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_partecipation\n'
		'Refuse insert partecipation: (comp id = %, s_year = %, team id = %)',
		NEW.competition_id, NEW.start_year, NEW.team_id;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_partecipation
 *
 * DESC : Funzione che dopo l'inserimento di una partecipazione
 *        ne crea i giochi corrispondenti
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_partecipation
(
)
RETURNS trigger
AS
$$
BEGIN

	PERFORM create_play_from_partecipation(NEW.team_id, NEW.competition_id, NEW.start_year);


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_militancy
 *
 * DESC : Funzione che valuta se la nuova militanza di un calciatore in una
 *        squadra di calcio che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_militancy
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	start_valid	integer;
	end_valid	integer;

	id_country	integer;

	temp		boolean;

BEGIN

	temp = TRUE;

	SELECT
		*
	INTO
		start_valid,
		end_valid
	FROM
		valid_year_range(NEW.player_id);

	-- la militanza deve essere in un anno valido
	IF (NEW.start_year BETWEEN start_valid AND end_valid) THEN

		IF ('NATIONAL' = NEW.team_type) THEN

			tmp = get_column('fp_team', 'country_id', NEW.team_id);
			id_country = CAST(tmp AS integer);

			IF (NOT has_nationality(NEW.player_id, id_country)) THEN
				temp = FALSE;
			END IF;

			IF (is_national(NEW.player_id)) THEN

				-- se è una militanza nazionale e il calciatore ha gia
				-- militato in nazionale la squadra deve essere la stessa
				IF (national_team(NEW.player_id) <> NEW.team_id) THEN
					temp = FALSE;
				END IF;

			END IF;

		END IF;

		IF (NOT free_militancy(NEW.player_id, NEW.team_type, NEW.start_year, NEW.type)) THEN
			temp = FALSE;
		END IF;
	
	ELSE
		temp = FALSE;

	END IF;


	IF (NOT temp) THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bi_militancy\n'
			'Refuse insert militancy: (player id = %, s_year = %, team id = %)',
			NEW.player_id, NEW.start_year, NEW.team_id;
			
		RETURN NULL;

	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_militancy
 *
 * DESC : Funzione che dopo l'inserimento di una militanza che è riferita
 *        alla seconda parte di stagione assegna i trofei vinti dalla squadra
 *        in quella stagione al calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_militancy
(
)
RETURNS trigger
AS
$$
BEGIN

	IF ('II PART' = NEW.type OR 'FULL' = NEW.type) THEN
		PERFORM assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);

	END IF;


	PERFORM create_play_from_militancy(NEW.player_id, NEW.team_id, NEW.start_year);

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_militancy
 *
 * DESC : Funzione che valuta se sia possibile aggiornare una militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_militancy
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_free_militancy(NEW.team_type, NEW.team_id, NEW.player_id, NEW.start_year)) THEN
		RETURN NEW;
	END IF;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_militancy
 *
 * DESC : Funzione che dopo l'aggiornamento della militanza assegna o rimuove
 *        i trofei
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_militancy
(
)
RETURNS trigger
AS
$$
BEGIN

	-- se la militanza aggiornata si riferisce alla seconda parte di stagione
	IF ('I PART' = OLD.type AND NEW.type <> 'I PART') THEN
		PERFORM assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);

	-- se la militanza aggiornata non si riferisce alla seconda parte di stagione
	ELSIF (OLD.type <> 'I PART' AND 'I PART' = NEW.type) THEN
		PERFORM remove_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
		
	END IF;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_play
 *
 * DESC : Funzione che controlla che il nuovo gioco che si vuole inserire
 *        sia valido
 *
 *        NOTA: per il numero massimo di partite per team abbiamo effettuato
 *              un'approssimazione per eccesso basata su numerose osservazioni
 *              (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NEW.match <= max_match_comp(NEW.competition_id)) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_play\n'
		'Refuse insert play: (play id = %)', NEW.play_id;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_play
 *
 * DESC : Funzione che dopo l'inserimento di un gioco ne crea
 *        le statistiche corrispondenti
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_play
(
)
RETURNS trigger
AS
$$
BEGIN

	PERFORM create_statistics(NEW.id);


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_play_match
 *
 * DESC : Funzione che controlla che l'aggiornamento delle partite disputate
 *        riferite ad un gioco sia valido
 *
 *        NOTA: per il numero massimo di partite per team abbiamo effettuato
 *              un'approssimazione per eccesso basata su numerose osservazioni
 *              (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_play_match
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NEW.match <= max_match_comp(NEW.competition_id)) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bu_play_match\n'
		'Refuse update play match: (play id = %)', NEW.play_id;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_play_match
 *
 * DESC : Funzione che dopo l'aggiornamento del numero di partite
 *        di un gioco setta le statistiche corrispondenti a zero se
 *        il numero di partite è uguale a zero
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_play_match
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (0 = NEW.match) THEN
		PERFORM set_zero_statistics(NEW.id);
	END IF;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_player_tag
 *
 * DESC : Funzione che controlla che l'associazione tra calciatore e tag
 *        che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_tag
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	goalkeeper	boolean;

	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_tag', 'goalkeeper', NEW.tag_id);
	goalkeeper = CAST(tmp AS boolean);
	
	IF (goalkeeper) THEN
	
		tmp = get_column('fp_player', 'role', NEW.player_id);
		role_player = CAST(tmp AS en_role_mix);

		IF (CAST(role_player AS text) NOT LIKE '%GK%') THEN

			-- DEBUG
			RAISE NOTICE
				E'Trigger Function: tf_bi_player_tag\n'
				'Refuse insert player_tag: (player id = %, tag id = %)',
				NEW.player_id, NEW.tag_id;

			RETURN NULL;

		END IF;
		
	END IF;
	
	
	RETURN NEW;
	
END;

$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_player_position
 *
 * DESC : Funzione che dopo l'inserimento di una nuova associazione tra un
 *        calciatore ed una posizione aggiorna il ruolo del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_player_position
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	role_player		en_role_mix;
	new_role_player	en_role_mix;

BEGIN

	new_role_player = new_role(NEW.player_id);


	tmp = get_column('fp_player', 'role', NEW.player_id);
	role_player = CAST(tmp AS en_role_mix);

	IF (role_player <> new_role_player) THEN
		
		UPDATE
			fp_player
		SET
			role = new_role_player
		WHERE
			id = NEW.player_id;

	END IF;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_player_position
 *
 * DESC : Funzione che controlla che l'associazione tra un
 *        calciatore ed una posizione che si vuole eliminare
 *        non sia la posizione principale del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_player_position
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	id_pos_player	integer;

BEGIN

	id_pos_player = NULL;

	tmp = get_column('fp_player', 'position_id', OLD.player_id);
	id_pos_player = CAST(tmp AS integer);


	IF ((id_pos_player IS NULL) OR (id_pos_player <> OLD.position_id)) THEN
		RETURN OLD;
	END IF;
	

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bd_player_position\n'
		'Refuse delete player_position: (player id = %, position id = %)',
		OLD.player_id, OLD.player_id;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ad_player_position
 *
 * DESC : Funzione che dopo l'eliminazione di una nuova associazione tra un
 *        calciatore ed una posizione aggiorna il ruolo del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ad_player_position
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	role_player		en_role_mix;
	new_role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_player', 'role', OLD.player_id);
	role_player = CAST(tmp AS en_role_mix);


	IF (role_player IS NULL) THEN
		RETURN NULL;
	END IF;


	new_role_player = new_role(OLD.player_id);


	IF (role_player <> new_role_player) THEN
		
		UPDATE
			fp_player
		SET
			role = new_role_player
		WHERE
			id = OLD.player_id;

	END IF;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_attribute_goalkeeping
 *
 * DESC : Funzione che controlla che l'attributo per portieri di un calciatore
 *        che si vuole inserire sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_attribute_goalkeeping
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_player', 'role', NEW.player_id);
	role_player = CAST(tmp AS en_role_mix);

	IF (CAST(role_player AS text) NOT LIKE '%GK%') THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bi_attribute_goalkeeping\n'
			'Refuse insert attribute_goalkeeping: (player id = %)', NEW.player_id;

		RETURN NULL;

	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_attribute_goalkeeping
 *
 * DESC : Funzione che controlla che l'attributo per portieri di un calciatore
 *        che si vuole eliminare non si riferisca ad un calciatore
 *        che ha tra i suoi ruoli di gioco il portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_attribute_goalkeeping
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	role_player	en_role_mix;

BEGIN

	role_player = NULL;

	tmp = get_column('fp_player', 'role', OLD.player_id);
	role_player = CAST(tmp AS en_role_mix);

	IF ((role_player IS NOT NULL) AND (CAST(role_player AS text) LIKE '%GK%')) THEN

		-- DEBUG
		RAISE NOTICE
			E'Trigger Function: tf_bd_attribute_goalkeeping\n'
			'Refuse delete attribute_goalkeeping: (player id = %)', OLD.player_id;

		RETURN NULL;	

	END IF;

	
	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_attribute_references
 *
 * DESC : Funzione che controlla che l'attributo di un calciatore
 *        che si vuole eliminare non si riferisca più ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_attribute_references
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	id_player	integer;

BEGIN

	id_player = NULL;

	tmp = get_column('fp_player', 'id', OLD.player_id);
	id_player = CAST(tmp AS integer);

	IF (id_player IS NULL) THEN
		RETURN OLD;	
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bd_attribute_references\n'
		'Refuse delete attribute: (player id = %)', OLD.player_id;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_statistic
 *
 * DESC : Funzione che controlla che l'aggiornamento delle statistiche
 *        di un gioco sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_statistic
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	match_play	integer;

BEGIN

	tmp = get_column('fp_play', 'match', NEW.play_id);
	match_play = CAST(tmp AS integer);

	IF (match_play > 0) THEN
		RETURN NEW;
	ELSIF (0 = match_play) THEN

		IF ('fp_statistic_general' = TG_TABLE_NAME) THEN

			IF
			(
				0 = NEW.goal_scored
				AND
				0 = NEW.assist
				AND
				0 = NEW.yellow_card
				AND
				0 = NEW.red_card
				AND
				0 = NEW.penalty_scored
			)
			THEN
				RETURN NEW;
			END IF;

		ELSIF ('fp_statistic_goalkeeper' = TG_TABLE_NAME) THEN

			IF
			(
				0 = NEW.goal_conceded
				AND
				0 = NEW.penalty_saved
			)
			THEN
				RETURN NEW;
			END IF;

		END IF;

	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bu_statistic\n'
		'Refuse update statistic: (play id = %)', NEW.play_id;
	

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_statistic_general
 *
 * DESC : Funzione che controlla che la statistica generale di un gioco
 *        che si vuole eliminare non si riferisca più ad un gioco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_statistic_general
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp		text;

	id_play	integer;

BEGIN

	id_play = NULL;

	tmp = get_column('fp_play', 'id', OLD.play_id);
	id_play = CAST(tmp AS integer);

	IF (id_play IS NULL) THEN
		RETURN OLD;	
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bd_statistic_general\n'
		'Refuse delete statistic_general: (play id = %)', OLD.play_id;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_statistic_goalkeeper
 *
 * DESC : Funzione che controlla che la statistica per portieri di un gioco
 *        che si vuole inserire sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_statistic_goalkeeper
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_play', 'player_id', NEW.play_id);
	id_player = CAST(tmp AS integer);

	tmp = get_column('fp_player', 'role', id_player);
	role_player = CAST(tmp AS en_role_mix);

	IF (CAST(role_player AS text) LIKE '%GK%') THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_statistic_goalkeeper\n'
		'Refuse insert statistic_goalkeeper: (play id = %)', NEW.play_id;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_statistic_goalkeeper
 *
 * DESC : Funzione che controlla che la statistica per portieri di un gioco
 *        che si vuole eliminare non si riferisca ad un gioco associato
 *        ad un calciatore che ha tra i suoi ruoli di gioco il portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_statistic_goalkeeper
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_play', 'player_id', OLD.play_id);
	id_player = CAST(tmp AS integer);

	IF (id_player IS NOT NULL) THEN

		tmp = get_column('fp_player', 'role', id_player);
		role_player = CAST(tmp AS en_role_mix);

		IF (CAST(role_player AS text) LIKE '%GK%') THEN

			-- DEBUG
			RAISE NOTICE
				E'Trigger Function: tf_bd_statistic_goalkeeper\n'
				'Refuse delete statistic_goalkeeper: (play id = %)', OLD.play_id;
	
			RETURN NULL;
		END IF;
			
	END IF;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_team_trophy_case
 *
 * DESC : Funzione che controlla che il nuovo trofeo che si vuole assegnare
 *        ad una squadra di calcio sia compatibile
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	type_trophy	en_award;

BEGIN

	tmp = get_column('fp_trophy', 'type', NEW.trophy_id);
	type_trophy = CAST(tmp AS en_award);

	IF ('TEAM' = type_trophy) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_team_trophy_case\n'
		'Refuse insert team_trophy_case:'
		' (team id = %, trophy id = %, s_year = %, comp id = %)',
		NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_team_trophy_case
 *
 * DESC : Funzione che dopo l'assegnazione di un trofeo ad una squadra di
 *        calcio assegna il trofeo a tutti i giocatori che militano in quella
 *        squadra a fine stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_team_trophy_case
(
)
RETURNS trigger
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
			team_id = NEW.team_id
			AND
			start_year = NEW.start_year
			AND
			type <> 'I PART'
	
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
			NEW.team_id,
			NEW.trophy_id,
			NEW.start_year,
			NEW.competition_id
		)
		ON CONFLICT DO NOTHING;

	END LOOP;

	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ad_team_trophy_case
 *
 * DESC : Funzione che dopo l'eliminazione di un trofeo ad una squadra di
 *        calcio rimuove il trofeo a tutti i giocatori che militano in quella
 *        squadra a fine stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ad_team_trophy_case
(
)
RETURNS trigger
AS
$$
BEGIN

	DELETE FROM
		fp_player_trophy_case
	WHERE
		team_id = OLD.team_id
		AND
		trophy_id = OLD.trophy_id
		AND
		start_year = OLD.start_year
		AND
		competition_id = OLD.competition_id;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_player_trophy_case
 *
 * DESC : Funzione che controlla che il nuovo trofeo che si vuole assegnare
 *        ad un calciatore sia compatibile
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	type_militancy	en_season;

	type_trophy		en_award;

	role_trophy		en_role;

	role_player		en_role_mix;

BEGIN

	type_militancy = get_type_militancy(NEW.player_id, NEW.team_id, NEW.start_year);


	IF (type_militancy <> 'I PART') THEN

		tmp = get_column('fp_trophy', 'type', NEW.trophy_id);
		type_trophy = CAST(tmp AS en_award);

		IF ('TEAM' = type_trophy) THEN

			-- se si tratta di un trofeo di squadra la squadra in questione deve avere il trofeo
			IF (team_has_trophy(NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id)) THEN
				RETURN NEW;
			END IF;
		
		ELSIF ('PLAYER' = type_trophy) THEN

			tmp = get_column('fp_trophy', 'role', NEW.trophy_id);
			role_trophy = CAST(tmp AS en_role);

			IF (role_trophy IS NULL) THEN
				RETURN NEW;
			
			ELSE

				tmp = get_column('fp_player', 'role', NEW.player_id);
				role_player = CAST(tmp AS en_role_mix);

				IF (position(CAST(role_trophy AS text) in CAST(role_player AS text)) > 0) THEN
					RETURN NEW;
				END IF;

			END IF;
		
		END IF;

	END IF;
	
	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_player_trophy_case\n'
		'Refuse insert player_trophy_case:'
		' (player id = %, team id = %, trophy id = %, s_year = %, comp id = %)',
		NEW.player_id, NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id;
 

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_player_trophy_case
 *
 * DESC : Funzione che controlla che sia possibile eliminare un trofeo
 *        assegnato ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_player_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	type_militancy	en_season;

	type_trophy		en_award;

BEGIN

	tmp = get_column('fp_trophy', 'type', OLD.trophy_id);
	
	type_trophy = CAST(tmp AS en_award);

	IF ('TEAM' = type_trophy) THEN

		type_militancy = get_type_militancy(OLD.player_id, OLD.team_id, OLD.start_year);
	
		-- se il trofeo è di squadra
		-- tale trofeo sarà eliminabile solo se la squadra non ha il trofeo
		-- o se il calciatore non milita nella parte finale di stagione
		IF
		(
			team_has_trophy(OLD.team_id, OLD.trophy_id, OLD.start_year, OLD.competition_id)
			AND
			type_militancy <> 'I PART' 
		)
		THEN

			-- DEBUG
			RAISE NOTICE
				E'Trigger Function: tf_bd_player_trophy_case\n'
				'Refuse delete player_trophy_case:'
				' (player id = %, team id = %, trophy id = %, s_year = %, comp id = %)',
				NEW.player_id, NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id;
 
			RETURN NULL;
		END IF;
	
	END IF;
	

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_team_prize_case
 *
 * DESC : Funzione che controlla che il nuovo premio che si vuole assegnare
 *        ad una squadra di calcio sia compatibile
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team_prize_case
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	type_prize	en_award;

BEGIN

	tmp = get_column('fp_prize', 'type', NEW.prize_id);
	type_prize = CAST(tmp AS en_award);

	IF ('TEAM' = type_prize) THEN
		RETURN NEW;
	END IF;

	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_team_prize_case\n'
		'Refuse insert team_prize_case:'
		' (team id = %, prize id = %, a_year = %)',
		NEW.team_id, NEW.prize_id, NEW.assign_year;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_player_prize_case
 *
 * DESC : Funzione che controlla che il nuovo premio che si vuole assegnare
 *        ad un calciatore sia compatibile
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_prize_case
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	type_prize	en_award;
	role_prize	en_role;

	start_valid	integer;
	end_valid	integer;

	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_prize', 'type', NEW.prize_id);
	type_prize = CAST(tmp AS en_award);
	
	IF ('PLAYER' = type_prize) THEN

		SELECT
			*
		INTO
			start_valid,
			end_valid
		FROM
			valid_year_range(NEW.player_id);
		
	
		-- il premio deve essere assegnato in un anno valido
		IF (NEW.assign_year BETWEEN start_valid AND end_valid) THEN

			tmp = get_column('fp_prize', 'role', NEW.prize_id);
			role_prize = CAST(tmp AS en_role);

			IF (role_prize IS NULL) THEN		
				RETURN NEW;
			
			ELSE

				tmp = get_column('fp_player', 'role', NEW.player_id);
				role_player = CAST(tmp AS en_role_mix);

				IF (position(CAST(role_prize AS text) in CAST(role_player AS text)) > 0) THEN
					RETURN NEW;
				END IF;

			END IF;

		END IF;
	
	END IF;
	
	-- DEBUG
	RAISE NOTICE
		E'Trigger Function: tf_bi_player_prize_case\n'
		'Refuse insert player_prize_case:'
		' (player id = %, prize id = %, a_year = %)',
		NEW.player_id, NEW.prize_id, NEW.assign_year;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

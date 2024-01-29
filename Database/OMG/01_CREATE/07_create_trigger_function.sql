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
 * NAME : tf_bu_if_referenced_refuse
 *
 * DESC : Funzione che controlla che accetta un aggiornamento solo se la
 *        riga della tabella che ha scatenato il trigger non e' referenziata
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_if_referenced_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', string_for_reference('@', TG_TABLE_NAME, OLD))) THEN
		RETURN NEW;
	END IF;
	
	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_refuse
 *
 * DESC : Funzione che rifiuta qualsiasi aggiornamento
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_au_country_name
 *
 * DESC : Funzione che a seguito dell'aggiornamento del nome di un paese
 *        aggiorna il nome della squadra nazionale ad esso associata
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_country_name
(
)
RETURNS trigger
AS
$$
BEGIN

	UPDATE
		fp_team
	SET
		name = NEW.name
	WHERE
		type = 'NATIONAL'
		AND
		country_id = NEW.id;
	
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

	tmp						text;

	id_country_super_conf	integer;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.super_id);
	id_country_super_conf = CAST(tmp AS integer);


	IF (can_be_inside(NEW.country_id, id_country_super_conf)) THEN
		RETURN NEW;
	END IF;


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

	tmp				text;
	id_country_conf	integer;
	name_country 	text;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);


	-- se la squadra e' associata ad una nazione
	-- e la confederazione associata alla squadra e' associata alla stessa
	-- nazione della squadra
	IF (is_nation(NEW.country_id) AND NEW.country_id = id_country_conf) THEN

		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;

		-- se la squadra e' di tipo nazionale deve avere lo stesso nome
		-- della nazione cui e' associata		
		ELSIF ('NATIONAL' = NEW.type) THEN

			name_country = get_column('fp_country', 'name', NEW.country_id);

			IF (NEW.name = name_country) THEN
				RETURN NEW;
			END IF;

		END IF;

	END IF;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bu_team_name
 *
 * DESC : Funzione che controlla che il nuovo nome di una squadra di calcio
 *        di tipo nazionale sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_team_name
(
)
RETURNS trigger
AS
$$
DECLARE

	name_country	text;

BEGIN

	name_country = get_column('fp_country', 'name', OLD.country_id);


	IF (NEW.name = name_country) THEN
		RETURN NEW;
	END IF;


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
	type_country_conf	text;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	type_country_conf = get_column('fp_country', 'type', id_country_conf);

	-- non possono esistere competizioni per squadre nazionali
	-- organizzate da una confederazione nazionale
	IF (type_country_conf <> 'NATION' OR NEW.team_type <> 'NATIONAL') THEN
		RETURN NEW;
	END IF;


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

	IF
	(
		-- se l'edizione iniza e termina negli anni corretti
		corr_years_comp_ed(NEW.competition_id, NEW.start_year, NEW.end_year)
		AND
		-- ..ed ha il corretto numero di squadre partecipanti in base al tipo 
		corr_tot_team(NEW.competition_id, NEW.total_team)
	)
	THEN

		IF (NOT has_edition(NEW.competition_id)) THEN
			RETURN NEW;

		ELSE
			-- se esiste gia' un'edizione della competizione
			-- quella che si vuole inserire deve rispettare la frequenza della competizione
			IF (corr_freq(NEW.competition_id, NEW.start_year)) THEN
				RETURN NEW;
			END IF;

		END IF;

	END IF;


	RETURN NULL;
	
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
		-- ..e la squadra e' compatibile con la competizione
		team_fit_comp(NEW.team_id, id_comp)
		AND
		-- ..e la squadra non partecipa ad altre edizioni simili nella stessa confederazione
		can_take_part(NEW.team_id, NEW.competition_id, NEW.start_year)
	)
	THEN
		RETURN NEW;
	END IF;
	

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
BEGIN

	-- deve essere nato in una nazione
	-- ed inizialmente non avere ruoli
	IF (is_nation(NEW.country_id) AND NEW.role IS NULL) THEN
		RETURN NEW;
	END IF;


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
 *        nazionalita'
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
	);
	
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


	RETURN OLD;
	
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

	-- se il nuovo ruolo e' compatibile con tutte le posizioni del calciatore
	IF (role_fit_positions(NEW.id, NEW.role)) THEN
		RETURN NEW;
	END IF;


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

	tmp				text;

	retired_date	date;

	born_year		integer;

BEGIN

	IF (is_retired(NEW.id)) THEN

		tmp = get_column('fp_player_retired', 'retired_date', NEW.id);
		retired_date = CAST(tmp AS date);

		IF (NOT corr_age_limit(NEW.dob, retired_date)) THEN
			RETURN OLD;
		END IF;
	
	END IF;


	IF (has_militancy(NEW.id)) THEN

		born_year = extract year from NEW.dob;

		IF (min_militancy_year(NEW.id) - born_year < min_age()) THEN
			RETURN OLD;
		END IF;


		IF (NOT is_retired(NEW.id)) THEN

			IF (max_militancy_year(NEW.id) - born_year > max_age()) THEN
				RETURN OLD;
			END IF;

		END IF;
		
	END IF;


	RETURN NEW;
		
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_au_player_country
 *
 * DESC : Funzione che dopo l'aggiornamento del paese di nascita di un
 *        calciatore, aggiorna la nazionalita' del calciatore ed elimina
 *        la vecchia nazionalita' se non sono presenti militanze nazionali
 *        associate al vecchio paese di nascita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_country
(
)
RETURNS trigger
AS
$$
DECLARE

	id_team	integer;

BEGIN

	id_team = national_team_from_country(OLD.country_id);


	IF (NOT has_militancy(NEW.id, id_team)) THEN

		DELETE FROM
			fp_nationality
		WHERE
			country_id = OLD.country_id
			AND
			player_id = NEW.id;

	END IF;


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
	);
	
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
	IF ((OLD.role LIKE '%GK%') AND (NEW.role NOT LIKE '%GK%')) THEN

		delete_gk_attribute(NEW.id);
		delete_gk_statistic(NEW.id);
		delete_gk_tag(NEW.id);

	END IF;
	

	delete_not_role_trophy(NEW.id, NEW.role);
	delete_not_role_prize(NEW.id, NEW.role);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_nationality
 *
 * DESC : Funzione che controlla che la nuova nazionalita' da inserire sia
 *        riferita ad una nazione
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


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bd_nationality
 *
 * DESC : Funzione che controlla che la nazionalita' che si vuole eliminare
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

BEGIN

	tmp = get_column('fp_player', 'country_id', OLD.player_id);
	id_country_player = CAST(tmp AS integer);


	IF (OLD.country_id <> id_country_player) THEN
		RETURN OLD;
	END IF;


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_ad_nationality
 *
 * DESC : Funzione che dopo l'eliminazione di una nazionalita' elimina
 *        la militanza nazionale associata alla nazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ad_nationality
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	id_country	integer;

	id_team		integer;

BEGIN

	IF (is_national(OLD.player_id)) THEN

		id_team = national_team();

		tmp = get_column('fp_team', 'country_id', id_team);
		id_country = CAST(tmp AS integer);

		
		IF (OLD.country_id = id_country) THEN
			delete_national_militancy(OLD.player_id);
		END IF;

	END IF; 
	
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

	role_player	text;

	id_country	integer;

BEGIN

	role_player = get_column('fp_player', 'role', NEW.player_id);

	-- il calciatore deve avere un ruolo
	IF (role_player IS NOT NULL) THEN

		valid_year_range(NEW.player_id, start_valid, end_valid);

		-- la militanza deve essere in un anno valido
		IF (NEW.start_year BETWEEN start_valid AND end_valid) THEN

			IF ('NATIONAL' = NEW.team_type) THEN

				tmp = get_column('fp_team', 'country_id', NEW.team_id);
				id_country = CAST(tmp AS integer);

				IF (NOT has_nationality(NEW.player_id, id_country)) THEN
					RETURN NULL;
				END IF;

				IF (is_national(NEW.player_id)) THEN

					-- se e' una militanza nazionale e il calciatore ha gia
					-- militato in nazionale la squadra deve essere la stessa
					IF (national_team(NEW.player_id) <> NEW.team_id) THEN
						RETURN NULL;
					END IF;

				END IF;

			END IF;

			IF (free_militancy(NEW.player_id, NEW.team_type, NEW.start_year, NEW.type)) THEN
				RETURN NEW;
			END IF;
			
		END IF;

	END IF;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_militancy
 *
 * DESC : Funzione che dopo l'inserimento di una militanza che e' riferita
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

	assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	
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
		assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	-- se la militanza aggiornata non si riferisce alla seconda parte di stagione
	ELSIF (OLD.type <> 'I PART' AND 'I PART' = NEW.type) THEN
		remove_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_player_tag
 *
 * DESC : Funzione che controlla che l'associazione tra calciatore e tag di
 *        tipo portiere che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_tag
(
)
RETURNS trigger
AS
$$
DECLARE

	role_player	text;

BEGIN

	role_player = get_column('fp_player', 'role', NEW.player_id);


	IF (role_player LIKE '%GK%') THEN
		RETURN NEW;
	END IF;
	
	
	RETURN NULL;
	
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

	role_player		text;
	new_role_player	text;

BEGIN

	new_role_player = new_role(NEW.player_id);

	role_player = get_column('fp_player', 'role', NEW.player_id);


	IF (role_player IS NULL OR role_player <> new_role_player) THEN
		
		UPDATE
			fp_player
		SET
			role = new_role_player
		WHERE
			id = NEW.player_id;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_player_position
 *
 * DESC : Funzione che prima dell'eliminazione di un'associazione tra un
 *        calciatore ed una posizione si assicura che non sia l'unica posizione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_player_position
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (position_number(OLD.player_id) > 1 OR OLD.player_id IS NULL) THEN
		RETURN OLD;
	END IF;


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

	role_player		text;
	new_role_player	text;

BEGIN

	new_role_player = new_role(OLD.player_id);

	role_player = get_column('fp_player', 'role', OLD.player_id);


	IF (role_player IS NULL OR role_player <> new_role_player) THEN
		
		UPDATE
			fp_player
		SET
			role = new_role_player
		WHERE
			id = OLD.player_id;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_player_attribute
 *
 * DESC : Funzione che controlla che l'associazione tra calciatore e attributo
 *        di tipo portiere che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_attribute
(
)
RETURNS trigger
AS
$$
DECLARE

	role_player	text;

BEGIN

	role_player = get_column('fp_player', 'role', NEW.player_id);

	IF (role_player LIKE '%GK%') THEN
		RETURN NEW;
	END IF;
	
	
	RETURN NULL;
	
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

	type_trophy	text;

BEGIN

	type_trophy = get_column('fp_trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trophy) THEN
		RETURN NEW;
	END IF;
	
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
			NEW.id,
			NEW.start_year,
			NEW.competition_id
		);

	END LOOP;
	
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
		trophy_id = OLD.id
		AND
		start_year = OLD.start_year
		AND
		competition_id = OLD.competition_id;
	
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

	type_militancy	text;

	type_trophy		text;
	role_trophy		text;

	role_player		text;

BEGIN

	type_militancy = get_type_militancy(NEW.player_id, NEW.team_id, NEW.start_year);


	IF (type_militancy <> 'I PART') THEN

		type_trophy = get_column('fp_trophy', 'type', NEW.trophy_id);

		IF ('TEAM' = type_trophy) THEN

			-- se si tratta di un trofeo di squadra la squadra in questione deve avere il trofeo
			IF (team_has_trophy(NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id)) THEN
				RETURN NEW;
			END IF;
		
		ELSIF ('PLAYER' = type_trophy) THEN

			role_trophy = get_column('fp_trophy', 'role', NEW.trophy_id);

			IF (role_trophy IS NULL) THEN
				RETURN NEW;
			
			ELSE

				role_player = get_column('fp_player', 'role', NEW.player_id);

				IF (position(role_trophy in role_player) > 0) THEN
					RETURN NEW;
				END IF;

			END IF;
		
		END IF;

	END IF;
	

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

	type_militancy	text;

	type_trophy		text;
	role_trophy		text;

	role_player		text;

BEGIN

	type_trophy = get_column('fp_trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trophy) THEN

		type_militancy = get_type_militancy(NEW.player_id, NEW.team_id, NEW.start_year);
	
		-- se il trofeo e' di squadra
		-- tale trofeo sara' eliminabile solo se la squadra non ha il trofeo
		-- o se il calciatore non milita nella parte finale di stagione
		IF
		(
			team_has_trophy(NEW.team_id, NEW.trophy_id, NEW.start_year, NEW.competition_id)
			AND
			type_militancy <> 'I PART' 
		)
		THEN
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

	type_prize		text;
	role_prize		text;

	start_valid	integer;
	end_valid	integer;

BEGIN

	type_prize = get_column('fp_prize', 'type', NEW.prize_id);
	
	IF ('PLAYER' = type_prize) THEN

		valid_year_range(NEW.player_id, start_valid, end_valid);
	
		-- il premio deve essere assegnato in un anno valido
		IF (NEW.assign_year BETWEEN start_valid AND end_valid) THEN

			role_prize = get_column('fp_prize', 'role', NEW.prize_id);

			IF (role_prize IS NULL) THEN		
				RETURN NEW;
			
			ELSE

				role_player = get_column('fp_player', 'role', NEW.player_id);
			
				IF (position(role_prize in role_player) > 0) THEN
					RETURN NEW;
				END IF;

			END IF;
		
		END IF;
	
	END IF;
	

	RETURN NULL;
	
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

	type_prize	text;

BEGIN

	type_prize = get_column('fp_prize', 'type', NEW.prize_id);


	IF ('TEAM' = type_prize) THEN
		RETURN NEW;
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
 *              (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play
(
)
RETURNS trigger
AS
$$
DECLARE

	tot_team	integer;

BEGIN

	tot_team = tot_team_comp_ed(NEW.competition_id, NEW.start_year);


	IF (NEW.match <= tot_team * 4) THEN
		RETURN NEW;
	END IF;


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
 *              (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_play_match
(
)
RETURNS trigger
AS
$$
DECLARE

	tot_team	integer;

BEGIN

	tot_team = tot_team_comp_ed(NEW.competition_id, NEW.start_year);


	IF (NEW.match <= tot_team * 4) THEN
		RETURN NEW;
	END IF;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION 
 * NAME : tf_bi_play_statistic
 *
 * DESC : Funzione che controlla che l'associazione tra gioco e statistica
 *        che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play_statistic
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;

	gk_stat		boolean;
	
	id_player	integer;
	role_player	integer;

BEGIN

	tmp = get_column('fp_statistic', 'goalkeeper', NEW.statistic_id);
	gk_stat = CAST(tmp AS boolean);

	
	IF (NOT gk_stat) THEN	
		RETURN NEW;
	
	ELSE

		tmp = get_column('fp_play', 'player_id', NEW.play_id);
		id_player = CAST(tmp AS integer);

		role_player = get_column('fp_player', 'role', id_player);


		IF (role_player LIKE '%GK%') THEN	
			RETURN NEW;
		END IF;

	END IF;
	

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
CREATE OR REPLACE FUNCTION tg_bi_player_retired
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	born_date		date;
	retired_year	integer;

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.id);
	born_date = CAST(tmp AS date);

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		RETURN NULL;	
	END IF;
	

	IF (has_militancy(NEW.id)) THEN

		retired_year = extract year from NEW.retired_date;
	
		IF (max_militancy_year(NEW.id) >= retired_year) THEN
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
 * NAME : tg_bu_player_retired_date
 *
 * DESC : Funzione che controlla che l'aggiornamento della data di ritiro per
 *        il giocatore ritirato sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tg_bu_player_retired_date
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;

	born_date		date;
	retired_year	integer;

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.id);
	born_date = CAST(tmp AS date);

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		RETURN OLD;	
	END IF;
	

	IF (has_militancy(NEW.id)) THEN

		retired_year = extract year from NEW.retired_date;
	
		IF (max_militancy_year(NEW.id) >= retired_year) THEN
			RETURN OLD;
		END IF;
	
	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
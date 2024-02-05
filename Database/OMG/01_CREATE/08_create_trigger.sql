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
 * TRIGGER
 ******************************************************************************/



/*******************************************************************************
 * COUNTRY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_country
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un paese
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_country
BEFORE INSERT ON fp_country
FOR EACH ROW
EXECUTE FUNCTION tf_bi_country();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_country_nation
 *
 * DESC : Trigger che si attiverà dopo l'inserimento di un paese di tipo nazione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_country_nation
AFTER INSERT ON fp_country
FOR EACH ROW
WHEN
(
	'NATION' = NEW.type
)
EXECUTE FUNCTION tf_ai_country_nation();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_country_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un paese
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_country_refuse
BEFORE UPDATE ON fp_country
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_country_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione di un paese
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_country_refuse
BEFORE DELETE ON fp_country
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * CONFEDERATION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        di una confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation
BEFORE INSERT ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_confederation();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_confederation_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        di una confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_confederation_refuse
BEFORE UPDATE ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_confederation_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        di una confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_confederation_refuse
BEFORE DELETE ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * COMPETITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition
BEFORE INSERT ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_refuse
BEFORE UPDATE ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_competition_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_competition_refuse
BEFORE DELETE ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------


/*******************************************************************************
 * COMPETITION EDITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition_edition
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un'edizione
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition_edition
BEFORE INSERT ON fp_competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition_edition();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition_edition_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un'edizione
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_edition_refuse
BEFORE UPDATE ON fp_competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_competition_edition_referred
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione di un'edizione
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_competition_edition_referred
BEFORE DELETE ON fp_competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_if_referenced_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TEAM
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        di una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team
BEFORE INSERT ON fp_team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'id o del
 *        paese associato o del tipo o se il tipo è nazionale
 *        di una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_refuse
BEFORE UPDATE ON fp_team
FOR EACH ROW
WHEN
(
	OLD.id IS DISTINCT FROM NEW.id
	OR
	OLD.country_id IS DISTINCT FROM NEW.country_id
	OR
	OLD.type IS DISTINCT FROM NEW.type
	OR
	'NATIONAL' = OLD.type
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT ON fp_player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_player
 *
 * DESC : Trigger che si attiverà dopo l'inserimento di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_player
AFTER INSERT ON fp_player
FOR EACH ROW
EXECUTE FUNCTION tf_ai_player();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_id_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'id
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_id_refuse
BEFORE UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.id IS DISTINCT FROM NEW.id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_country
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del paese di nascita
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_country
BEFORE UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.country_id IS DISTINCT FROM NEW.country_id
)
EXECUTE FUNCTION tf_bu_player_country();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_dob
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della data di nascita
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_dob
BEFORE UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.dob IS DISTINCT FROM NEW.dob
)
EXECUTE FUNCTION tf_bu_player_dob();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_role
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dei ruoli
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_role
BEFORE UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.role IS DISTINCT FROM NEW.role
)
EXECUTE FUNCTION tf_bu_player_role();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_player_country
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento del paese di nascita
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_player_country
AFTER UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.country_id IS DISTINCT FROM NEW.country_id
)
EXECUTE FUNCTION tf_au_player_country();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_player_pos
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento della posizione
 *        principale di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_player_pos
AFTER UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.position_id IS DISTINCT FROM NEW.position_id
)
EXECUTE FUNCTION tf_au_player_pos();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_player_role
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento dei ruoli di un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_player_role
AFTER UPDATE ON fp_player
FOR EACH ROW
WHEN
(
	OLD.role IS DISTINCT FROM NEW.role
)
EXECUTE FUNCTION tf_au_player_role();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER RETIRED
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_retired
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        di un calciatore ritirato
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_retired
BEFORE INSERT ON fp_player_retired
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_retired();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_retired_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del calciatore di
 *        riferimento di un calciatore ritirato
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_retired_refuse
BEFORE UPDATE ON fp_player_retired
FOR EACH ROW
WHEN
(
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_retired_date
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della data di
 *        ritiro di un calciatore ritirato
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_retired_date
BEFORE UPDATE ON fp_player_retired
FOR EACH ROW
WHEN
(
	OLD.retired_date IS DISTINCT FROM NEW.retired_date
)
EXECUTE FUNCTION tf_bu_player_retired_date();
--------------------------------------------------------------------------------



/*******************************************************************************
 * NATIONALITY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_nationality
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di una nazionalità
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_nationality
BEFORE INSERT ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bi_nationality();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_nationality_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della nazionalità
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_nationality_refuse
BEFORE UPDATE ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_nationality
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione della nazionalità
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bf_nationality
BEFORE DELETE ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bd_nationality();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ad_nationality
 *
 * DESC : Trigger che si attiverà dopo l'eliminazione della nazionalità
 *        di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ad_nationality
AFTER DELETE ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_ad_nationality();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PARTECIPATION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_partecipation
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di una partecipazione
 *        di una squadra di calcio ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_partecipation
BEFORE INSERT ON fp_partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_partecipation();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_partecipation
 *
 * DESC : Trigger che si attiverà dopo l'inserimento di una partecipazione di
 *        una squadra di calcio ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_partecipation
AFTER INSERT ON fp_partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_ai_partecipation();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_partecipation_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della partecipazione
 *        di una squadra di calcio ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_partecipation_refuse
BEFORE UPDATE ON fp_partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * MILITANCY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_militancy
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di una militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_militancy
BEFORE INSERT ON fp_militancy
FOR EACH ROW
EXECUTE FUNCTION tf_bi_militancy();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_militancy
 *
 * DESC : Trigger che si attiverà dopo l'inserimento di una militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_militancy
AFTER INSERT ON fp_militancy
FOR EACH ROW
EXECUTE FUNCTION tf_ai_militancy();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_militancy_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della squadra di
 *        calcio o del tipo di squadra di calcio o del calciatore o
 *        dell'anno di inizio di una militanza
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_militancy_refuse
BEFORE UPDATE ON fp_militancy
FOR EACH ROW
WHEN
(
	OLD.team_id IS DISTINCT FROM NEW.team_id
	OR
	OLD.team_type IS DISTINCT FROM NEW.team_type
	OR
	OLD.player_id IS DISTINCT FROM NEW.player_id
	OR
	OLD.start_year IS DISTINCT FROM NEW.start_year
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_militancy
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento di una militanza
 *        riferita alla prima parte di stagione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_militancy
AFTER UPDATE ON fp_militancy
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
	AND
	(
		'I PART' = OLD.type
		OR
		'I PART' = NEW.type
	)
)
EXECUTE FUNCTION tf_au_militancy();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play
BEFORE INSERT ON fp_play
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_play
 *
 * DESC : Trigger che si attiverà dopo l'inserimento di un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_play
AFTER INSERT ON fp_play
FOR EACH ROW
EXECUTE FUNCTION tf_ai_play();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_play_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'id o
 *        dell'anno di inizio di un'edizione di una competizione o
 *        della competizione a cui l'edizione si riferisce o della squadra di
 *        calcio o del calciatore di un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_play_refuse
BEFORE UPDATE ON fp_play
FOR EACH ROW
WHEN
(
	OLD.id IS DISTINCT FROM NEW.id
	OR
	OLD.start_year IS DISTINCT FROM NEW.start_year
	OR
	OLD.competition_id IS DISTINCT FROM NEW.competition_id
	OR
	OLD.team_id IS DISTINCT FROM NEW.team_id
	OR
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_play_match
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del numero di
 *        partite associate ad un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_play_match
BEFORE UPDATE ON fp_play
FOR EACH ROW
WHEN
(
	OLD.match IS DISTINCT FROM NEW.match
)
EXECUTE FUNCTION tf_bu_play_match();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_play_match
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento del numero di
 *        partite associate ad un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_play_match
AFTER UPDATE ON fp_play
FOR EACH ROW
WHEN
(
	OLD.match IS DISTINCT FROM NEW.match
)
EXECUTE FUNCTION tf_au_play_match();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TAG
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_tag_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_tag_refuse
BEFORE UPDATE ON fp_tag
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_tag_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione di un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_tag_refuse
BEFORE DELETE ON fp_tag
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER TAG
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_tag
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        di un'associazione tra un calciatore ed un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_tag
BEFORE INSERT ON fp_player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_tag();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_tag_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        dell'associazione tra un calciatore ed un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_tag_refuse
BEFORE UPDATE ON fp_player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * POSITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_position_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        di una posizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_position_refuse
BEFORE UPDATE ON fp_position
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_position_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        di una posizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_position_refuse
BEFORE DELETE ON fp_position
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER POSITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_player_position
 *
 * DESC : Trigger che si attiverà dopo l'inserimento
 *        di un'associazione tra un calciatore ed una posizione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_player_position
AFTER INSERT ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_ai_player_position();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_position_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        dell'associazione tra un calciatore ed una posizione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_position_refuse
BEFORE UPDATE ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_player_position
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        dell'associazione tra un calciatore ed una posizione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_player_position
BEFORE DELETE ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_bd_player_position();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ad_player_position
 *
 * DESC : Trigger che si attiverà dopo l'eliminazione
 *        dell'associazione tra un calciatore ed una posizione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ad_player_position
AFTER DELETE ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_ad_player_position();
--------------------------------------------------------------------------------



/*******************************************************************************
 * ATTRIBUTE GOALKEEPING
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_attribute_goalkeeping
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        dell'attributo per portieri di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_attribute_goalkeeping
BEFORE INSERT ON fp_attribute_goalkeeping
FOR EACH ROW
EXECUTE FUNCTION tf_bi_attribute_goalkeeping();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_attribute_goalkeeping
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del calciatore
 *        di riferimento di un attributo per portieri
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_attribute_goalkeeping
BEFORE UPDATE ON fp_attribute_goalkeeping
FOR EACH ROW
WHEN
(
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_attribute_goalkeeping
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        dell'attributo per portieri di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_attribute_goalkeeping
BEFORE DELETE ON fp_attribute_goalkeeping
FOR EACH ROW
EXECUTE FUNCTION tf_bd_attribute_goalkeeping();
--------------------------------------------------------------------------------


/*******************************************************************************
 * ATTRIBUTE MENTAL
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_attribute_mental_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del calciatore
 *        di riferimento di un attributo mentale
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_attribute_mental_refuse
BEFORE UPDATE ON fp_attribute_mental
FOR EACH ROW
WHEN
(
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_attribute_mental
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        dell'attributo mentale di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_attribute_mental
BEFORE DELETE ON fp_attribute_mental
FOR EACH ROW
EXECUTE FUNCTION tf_bd_attribute_references();
--------------------------------------------------------------------------------



/*******************************************************************************
 * ATTRIBUTE PHISYCAL
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_attribute_physical_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del calciatore
 *        di riferimento di un attributo fisico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_attribute_physical_refuse
BEFORE UPDATE ON fp_attribute_physical
FOR EACH ROW
WHEN
(
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_attribute_phisycal
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        dell'attributo fisico di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_attribute_phisycal
BEFORE DELETE ON fp_attribute_physical
FOR EACH ROW
EXECUTE FUNCTION tf_bd_attribute_references();
--------------------------------------------------------------------------------



/*******************************************************************************
 * ATTRIBUTE TECHNICAL
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_attribute_technical_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del calciatore
 *        di riferimento di un attributo tecnico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_attribute_technical_refuse
BEFORE UPDATE ON fp_attribute_technical
FOR EACH ROW
WHEN
(
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_attribute_technical
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        dell'attributo tecnico di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_attribute_technical
BEFORE DELETE ON fp_attribute_technical
FOR EACH ROW
EXECUTE FUNCTION tf_bd_attribute_references();
--------------------------------------------------------------------------------



/*******************************************************************************
 * STATISTIC GENERAL
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_statistic_general_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del gioco
 *        di riferimento di una statistica generale ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_statistic_general_refuse
BEFORE UPDATE ON fp_statistic_general
FOR EACH ROW
WHEN
(
	OLD.play_id IS DISTINCT FROM NEW.play_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_statistic_general
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di una
 *        statistica generale quando il gioco a cui si riferisce resta invariato
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_statistic_general
BEFORE UPDATE ON fp_statistic_general
FOR EACH ROW
WHEN
(
	OLD.play_id IS NOT DISTINCT FROM NEW.play_id
)
EXECUTE FUNCTION tf_bu_statistic();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_statistic_general
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        della statistica generale di un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_statistic_general
BEFORE DELETE ON fp_statistic_general
FOR EACH ROW
EXECUTE FUNCTION tf_bd_statistic_general();
--------------------------------------------------------------------------------



/*******************************************************************************
 * STATISTIC GOALKEEPER
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_statistic_goalkeeper
 *
 * DESC : Trigger che si attiverà prima dell'inserimento
 *        di una statistica per portieri di un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_statistic_goalkeeper
BEFORE INSERT ON fp_statistic_goalkeeper
FOR EACH ROW
EXECUTE FUNCTION tf_bi_statistic_goalkeeper();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_statistic_goalkeeper_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del gioco
 *        di riferimento di una statistica per portieri
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_statistic_goalkeeper_refuse
BEFORE UPDATE ON fp_statistic_goalkeeper
FOR EACH ROW
WHEN
(
	OLD.play_id IS DISTINCT FROM NEW.play_id
)
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_statistic_goalkeeper
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di una
 *        statistica per portieri quando il gioco a cui si riferisce
 *        resta invariato
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_statistic_goalkeeper
BEFORE UPDATE ON fp_statistic_goalkeeper
FOR EACH ROW
WHEN
(
	OLD.play_id IS NOT DISTINCT FROM NEW.play_id
)
EXECUTE FUNCTION tf_bu_statistic();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_statistic_goalkeeper
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        della statistica per portieri di un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_statistic_goalkeeper
BEFORE DELETE ON fp_statistic_goalkeeper
FOR EACH ROW
EXECUTE FUNCTION tf_bd_statistic_goalkeeper();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TROPHY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_trophy_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        di un trofeo calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_trophy_refuse
BEFORE UPDATE ON fp_trophy
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_trophy_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        di un trofeo calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_trophy_refuse
BEFORE DELETE ON fp_trophy
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TEAM TROPHY CASE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team_trophy_case
 *
 * DESC : Trigger che si attiverà prima dell'assegnazione di un trofeo
 *        calcistico ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team_trophy_case
BEFORE INSERT ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team_trophy_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_team_trophy_case
 *
 * DESC : Trigger che si attiverà dopo l'assegnazione di un trofeo calcistico
 *        ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_team_trophy_case
AFTER INSERT ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_ai_team_trophy_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_trophy_case_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un trofeo
 *        calcistico assegnato ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_trophy_case_refuse
BEFORE UPDATE ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ad_team_trophy_case
 *
 * DESC : Trigger che si attiverà dopo l'eliminazione di un trofeo
 *        calcistico assegnato ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ad_team_trophy_case
AFTER DELETE ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_ad_team_trophy_case();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER TROPHY CASE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_trophy_case
 *
 * DESC : Trigger che si attiverà prima dell'assegnazione di un trofeo
 *        calcistico ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_trophy_case
BEFORE INSERT ON fp_player_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_trophy_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_trophy_case_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un trofeo
 *        calcistico assegnato ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_trophy_case_refuse
BEFORE UPDATE ON fp_player_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_player_trophy_case
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione di un trofeo
 *        calcistico assegnato ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_player_trophy_case
BEFORE DELETE ON fp_player_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bd_player_trophy_case();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PRIZE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_prize_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        di un premio calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_prize_refuse
BEFORE UPDATE ON fp_prize
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_prize_refuse
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione
 *        di un premio calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_prize_refuse
BEFORE DELETE ON fp_prize
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TEAM PRIZE CASE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team_prize_case
 *
 * DESC : Trigger che si attiverà prima dell'assegnazione di premio calcistico
 *        ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team_prize_case
BEFORE INSERT ON fp_team_prize_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team_prize_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_prize_case_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del premio
 *        calcistico assegnato ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_prize_case_refuse
BEFORE UPDATE ON fp_team_prize_case
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER PRIZE CASE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_prize_case
 *
 * DESC : Trigger che si attiverà prima dell'assegnazione di premio calcistico
 *        ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_prize_case
BEFORE INSERT ON fp_player_prize_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_prize_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_prize_case_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del premio
 *        calcistico assegnato ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_prize_case_refuse
BEFORE UPDATE ON fp_player_prize_case
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------




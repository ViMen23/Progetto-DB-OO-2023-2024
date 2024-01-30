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
 * NAME : tg_bu_country
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del tipo di paese
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_country_referenced
BEFORE UPDATE ON fp_country
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_country_name
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento del nome di paese
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_country_name
AFTER UPDATE ON fp_country
FOR EACH ROW
WHEN
(
	OLD.name IS DISTINCT FROM NEW.name
)
EXECUTE FUNCTION tf_au_country_name();
--------------------------------------------------------------------------------



/*******************************************************************************
 * CONFEDERATION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di una confederazione
 *        calcistica contenuta in un'altra confederazione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation
BEFORE INSERT ON fp_confederation
FOR EACH ROW
WHEN
(
	NEW.super_id IS NOT NULL
)
EXECUTE FUNCTION tf_bi_confederation();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_confederation_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del paese o
 *        della confederazione contenente di una confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_confederation_referenced
BEFORE UPDATE ON fp_confederation
FOR EACH ROW
WHEN
(
	OLD.country_id IS DISTINCT FROM NEW.country_id
	OR
	OLD.super_id IS DISTINCT FROM NEW.super_id
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TEAM
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di una squadra di
 *        calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team
BEFORE INSERT ON fp_team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del paese o
 *        del tipo della confederazione di una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_referenced
BEFORE UPDATE ON fp_team
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
	OR
	OLD.country_id IS DISTINCT FROM NEW.country_id
	OR
	OLD.confederation_id IS DISTINCT FROM NEW.confederation_id
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_name
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del nome
 *        di una squadra di calcio di tipo nazionale
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_name
BEFORE UPDATE ON fp_team
FOR EACH ROW
WHEN
(
	OLD.name IS DISTINCT FROM NEW.name
	AND
	OLD.type IS NOT DISTINCT FROM NEW.type
	AND
	'NATIONAL' = OLD.type
)
EXECUTE FUNCTION tf_bu_team_name();
--------------------------------------------------------------------------------



/*******************************************************************************
 * COMPETITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di una competizione
 *        calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition
BEFORE INSERT ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del tipo o del
 *        tipo di squadra o della condeferazione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_referenced
BEFORE UPDATE ON fp_competition
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
	OR
	OLD.team_type IS DISTINCT FROM NEW.team_type
	OR
	OLD.confederation_id IS DISTINCT FROM NEW.confederation_id
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition_freq_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della frequenza
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_freq_refuse
BEFORE UPDATE ON fp_competition
FOR EACH ROW
WHEN
(
	OLD.frequency IS DISTINCT FROM NEW.frequency
	AND
	NEW.frequency <> 0
)
EXECUTE FUNCTION tf_bu_refuse();
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
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'edizione
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_edition_refuse
BEFORE UPDATE ON fp_competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
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
 * NAME : tg_bu_partecipation_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento della partecipazione
 *        di una squadra di calcio ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_partecipation_refuse
BEFORE UPDATE ON fp_partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
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
 * DESC : Trigger che si attiverà dopo dell'inserimento di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_player
AFTER INSERT ON fp_player
FOR EACH ROW
EXECUTE FUNCTION tf_ai_player();
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
 * NAME : tg_bu_player_role
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dei ruoli di un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_player_role
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
EXECUTE FUNCTION tf_bu_refuse();
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
 * DESC : Trigger che si attiverà dopo l'inserimento di una militanza riferita
 *        alla parte finale della stagione o all'intera stagione
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_militancy
AFTER INSERT ON fp_militancy
FOR EACH ROW
WHEN
(
	'II PART' = NEW.type
	OR
	'FULL' = NEW.type
)
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
EXECUTE FUNCTION tf_bu_refuse();
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
 * TAG
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_tag_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un tag
 *        di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_tag_referenced
BEFORE UPDATE ON fp_tag
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
	AND
	('GOALKEEPER' = OLD.type OR 'GOALKEEPER' = NEW.type)
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER TAG
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_tag
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un'associazione
 *        tra un calciatore ed un tag di tipo portiere
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
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'associazione
 *        tra un calciatore ed un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_tag_refuse
BEFORE UPDATE ON fp_player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * POSITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_position_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del ruolo
 *        associato ad una posizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_position_referenced
BEFORE UPDATE ON fp_position
FOR EACH ROW
WHEN
(
	OLD.role IS DISTINCT FROM NEW.role
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER POSITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_player_position
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un'associazione
 *        tra un calciatore ed una posizione
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
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'associazione
 *        tra un calciatore ed una posizione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_position_refuse
BEFORE UPDATE ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ad_player_position
 *
 * DESC : Trigger che si attiverà dopo l'eliminazione dell'associazione
 *        tra un calciatore ed una posizione
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ad_player_position
AFTER DELETE ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_ad_player_position();
--------------------------------------------------------------------------------



/*******************************************************************************
 * ATTRIBUTE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_attribute_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di un attributo
 *        di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_attribute_referenced
BEFORE UPDATE ON fp_attribute
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
	AND
	('GOALKEEPER' = OLD.type OR 'GOALKEEPER' = NEW.type)
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER ATTRIBUTE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_attribute
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un'associazione
 *        tra un calciatore ed un attributo
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_attribute
BEFORE INSERT ON fp_player_attribute
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_attribute();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_attribute_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'associazione
 *        tra un calciatore ed un attributo
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_attribute_refuse
BEFORE UPDATE ON fp_player_attribute
FOR EACH ROW
WHEN
(
	OLD.player_id IS DISTINCT FROM NEW.player_id
	OR
	OLD.attribute_id IS DISTINCT FROM NEW.attribute_id
)
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * STATISTIC
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_statistic_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del ruolo
 *        associato ad una statistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_statistic_referenced
BEFORE UPDATE ON fp_statistic
FOR EACH ROW
WHEN
(
	OLD.goalkeeper IS DISTINCT FROM NEW.goalkeeper
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TROPHY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_trophy_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del ruolo o del
 *        tipo di un trofeo calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_trophy_referenced
BEFORE UPDATE ON fp_trophy
FOR EACH ROW
WHEN
(
	OLD.role IS DISTINCT FROM NEW.role
	OR
	OLD.type IS DISTINCT FROM NEW.type
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
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
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ad_team_trophy_case
 *
 * DESC : Trigger che si attiverà dopo l'aggiornamento di un trofeo
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
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_player_trophy_case
 *
 * DESC : Trigger che si attiverà dopo l'eliminazione di un trofeo
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
 * NAME : tg_bu_prize_referenced
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del ruolo o del
 *        tipo di un premio calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_prize_referenced
BEFORE UPDATE ON fp_prize
FOR EACH ROW
WHEN
(
	OLD.role IS DISTINCT FROM NEW.role
	OR
	OLD.type IS DISTINCT FROM NEW.type
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
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
EXECUTE FUNCTION tf_bu_refuse();
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
EXECUTE FUNCTION tf_bu_refuse();
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
 * NAME : tg_bu_play_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento dell'edizione della
 *        competizione calcistica o della squadra di calcio o del calciatore
 *        associato ad un gioco
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_play_refuse
BEFORE UPDATE ON fp_play
FOR EACH ROW
WHEN
(
	OLD.start_year IS DISTINCT FROM NEW.start_year
	OR
	OLD.competition_id IS DISTINCT FROM NEW.competition_id
	OR
	OLD.team_id IS DISTINCT FROM NEW.team_id
	OR
	OLD.player_id IS DISTINCT FROM NEW.player_id
)
EXECUTE FUNCTION tf_bu_refuse();
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
 * PLAY STATISTIC
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play_statistic
 *
 * DESC : Trigger che si attiverà prima dell'insermento di un'associazione
 *        tra un gioco ed una statistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play_statistic
BEFORE INSERT ON fp_play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_play_statistic_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento del gioco
 *        o della statistica dell'associazione tra un gioco ed una statistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_play_statistic_refuse
BEFORE UPDATE ON fp_play_statistic
FOR EACH ROW
WHEN
(
	OLD.play_id IS DISTINCT FROM NEW.play_id
	OR
	OLD.statistic_id IS DISTINCT FROM NEW.statistic_id
)
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------



/*******************************************************************************
 * PLAYER RETIRED
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_retired
 *
 * DESC : Trigger che si attiverà prima dell'inserimento di un calciatore
 *        ritirato
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
EXECUTE FUNCTION tf_bu_refuse();
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

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
 * TYPE : TRIGGER
 * NAME : tg_bu_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_country
BEFORE UPDATE OF type ON fp_country
FOR EACH ROW
EXECUTE FUNCTION tf_bu_country();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_country
AFTER UPDATE OF name ON fp_country
FOR EACH ROW
EXECUTE FUNCTION tf_au_country();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : Trigger per l'inserimento di una nuova confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation
BEFORE INSERT
ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_confederation();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_confederation
BEFORE UPDATE OF country_id, super_id ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_bu_confederation();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team
 *
 * DESC : Trigger per l'inserimento di una nuova squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team
BEFORE INSERT ON fp_team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team
BEFORE UPDATE OF type, country_id, confederation_id ON fp_team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_name
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_name
BEFORE UPDATE OF name ON fp_team
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team_name();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition
 *
 * DESC : Trigger per l'inserimento di una nuova competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition
BEFORE INSERT ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition
BEFORE UPDATE OF type, type_team, confederation_id ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_bu_competition();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition_freq
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_freq
BEFORE UPDATE OF frequency ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_bu_competition_freq();
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_competition_edition
 *
 * DESC : Trigger per l'inserimento di una nuova edizione di una competizione
 *        calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition_edition
BEFORE INSERT ON fp_competition_edition
FOR EACH ROW
EXECUTE FUNCTION tf_bi_competition_edition();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_partecipation
 *
 * DESC : Trigger per l'inserimento di una nuova partecipazione di una
 *        squadra di calcio ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_partecipation
BEFORE INSERT ON fp_partecipation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_partecipation();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player
 *
 * DESC : Trigger per l'inserimento di una nuovo calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT ON fp_player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_nationality
 *
 * DESC : Trigger per l'inserimento di una nuova nazionalita' di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_nationality
BEFORE INSERT ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bi_nationality();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_militancy
 *
 * DESC : Trigger per l'inserimento di una nuova militanza di un calciatore
 *        in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_militancy
BEFORE INSERT ON fp_militancy
FOR EACH ROW
EXECUTE FUNCTION tf_bi_militancy();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_tag
 *
 * DESC : Trigger per l'inserimento di una nuova associazione tra un
 *        calciatore ed un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_tag
BEFORE INSERT ON fp_player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_tag();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_attribute
 *
 * DESC : Trigger per l'inserimento di una nuova associazione tra un
 *        calciatore ed un attributo
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_attribute
BEFORE INSERT ON fp_player_attribute
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_attribute();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team_trophy_case
 *
 * DESC : Trigger per l'inserimento di un nuovo trofeo calcistico assegnato
 *        ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team_trophy_case
BEFORE INSERT ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team_trophy_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player_trophy_case
 *
 * DESC : Trigger per l'inserimento di un nuovo trofeo calcistico assegnato
 *        ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_trophy_case
BEFORE INSERT ON fp_player_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_trophy_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_team_prize_case
 *
 * DESC : Trigger per l'inserimento di un nuovo premio calcistico assegnato
 *        ad una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_team_prize_case
BEFORE INSERT ON fp_team_prize_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_team_prize_case();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play
BEFORE INSERT ON fp_play
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play();
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play_statistic
BEFORE INSERT ON fp_play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------

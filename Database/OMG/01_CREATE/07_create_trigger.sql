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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_country
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
 * NAME : tg_au_country
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_country
AFTER UPDATE ON fp_country
FOR EACH ROW
WHEN
(
	OLD.name IS DISTINCT FROM NEW.name
)
EXECUTE FUNCTION tf_au_country();
--------------------------------------------------------------------------------



/*******************************************************************************
 * CONFEDERATION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : Trigger per l'inserimento di una nuova confederazione calcistica
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
 * NAME : tg_bu_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_confederation
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
 * DESC : TODO
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
BEFORE UPDATE ON fp_competition
FOR EACH ROW
WHEN
(
	OLD.type IS DISTINCT FROM NEW.type
	OR
	OLD.type_team IS DISTINCT FROM NEW.type_team
	OR
	OLD.confederation_id IS DISTINCT FROM NEW.confederation_id
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_competition_freq
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_freq
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
 * NAME : tg_bu_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_competition_edition
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
 * NAME : tg_bu_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_partecipation
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
 * DESC : Trigger per l'inserimento di una nuovo calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player
BEFORE INSERT ON fp_player
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_player
 *
 * DESC : TODO
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
 * DESC : TODO
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
 * DESC : TODO
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
 * DESC : TODO
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
 * DESC : TODO
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
 * DESC : Trigger per l'inserimento di una nuova nazionalita' di un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_nationality
BEFORE INSERT ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bi_nationality();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_nationality
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_nationality
BEFORE UPDATE ON fp_nationality
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_nationality
 *
 * DESC : TODO
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
 * DESC : TODO
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
 * NAME : tg_ai_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_militancy
AFTER INSERT ON fp_militancy
FOR EACH ROW
EXECUTE FUNCTION tf_ai_militancy();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_militancy
BEFORE UPDATE ON fp_militancy
FOR EACH ROW
WHEN
(
	(OLD.team_id IS DISTINCT FROM NEW.team_id)
	OR
	(OLD.player_id IS DISTINCT FROM NEW.player_id)
)
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_militancy_season
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_militancy_season
BEFORE UPDATE ON fp_militancy
FOR EACH ROW
WHEN
(
	(OLD.start_season IS DISTINCT FROM NEW.start_season)
	OR
	(OLD.type_start_season IS DISTINCT FROM NEW.type_start_season)
	OR
	(OLD.end_season IS DISTINCT FROM NEW.end_season)
	OR
	(OLD.type_end_season IS DISTINCT FROM type_end_season.dob)
)
EXECUTE FUNCTION tf_ai_militancy_season();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_militancy
AFTER UPDATE ON fp_militancy
FOR EACH ROW
EXECUTE FUNCTION tf_au_militancy();
--------------------------------------------------------------------------------




/*******************************************************************************
 * SQUAD
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ai_squad
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_squad
AFTER INSERT ON fp_squad
FOR EACH ROW
EXECUTE FUNCTION tg_ai_squad();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_au_squad
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_au_squad
AFTER UPDATE ON fp_squad
FOR EACH ROW
EXECUTE FUNCTION tg_au_squad();
--------------------------------------------------------------------------------




/*******************************************************************************
 * TAG
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_tag
BEFORE UPDATE ON fp_tag
FOR EACH ROW
WHEN
(
	(OLD.type IS DISTINCT FROM NEW.type)
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
 * NAME : tg_bu_player_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_tag
BEFORE UPDATE ON fp_player_tag
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------




/*******************************************************************************
 * POSITION
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_position
BEFORE INSERT ON fp_position
FOR EACH ROW
WHEN
(
	(OLD.role IS DISTINCT FROM NEW.role)
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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_player_position
AFTER INSERT ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_ai_player_position();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_position
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_position
BEFORE INSERT ON fp_player_position
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_player_position
 *
 * DESC : TODO
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
 * DESC : TODO
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
 * NAME : tg_bu_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_attribute
BEFORE INSERT ON fp_attribute
FOR EACH ROW
WHEN
(
	(OLD.type IS DISTINCT FROM NEW.type)
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
 * NAME : tg_bu_player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_attribute
BEFORE INSERT ON fp_player_attribute
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
 * TYPE : TRIGGER
 * NAME : tg_bu_player_attribute_score
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_attribute_score
BEFORE INSERT ON fp_player_attribute
FOR EACH ROW
WHEN
(
	OLD.score IS DISTINCT FROM NEW.score
)
EXECUTE FUNCTION tf_bu_player_attribute_score();
--------------------------------------------------------------------------------




/*******************************************************************************
 * STATISTIC
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_statistic
BEFORE INSERT ON fp_statistic
FOR EACH ROW
WHEN
(
	OLD.role IS DISTINCT FROM NEW.role
)
EXECUTE FUNCTION tf_bu_if_referenced_refuse();
--------------------------------------------------------------------------------




/*******************************************************************************
 * TROPHY
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_trophy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_trophy
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
 * NAME : tg_ai_team_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_ai_team_trophy_case
AFTER INSERT ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_ai_team_trophy_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_team_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_trophy_case
BEFORE UPDATE ON fp_team_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_ad_team_trophy_case
 *
 * DESC : TODO
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
 * DESC : Trigger per l'inserimento di un nuovo trofeo calcistico assegnato
 *        ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_trophy_case
BEFORE INSERT ON fp_player_trophy_case
FOR EACH ROW
WHEN
(
	'TEAM' = NEW.type
)
EXECUTE FUNCTION tf_bi_player_trophy_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_trophy_case
BEFORE UPDATE ON fp_player_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bu_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_player_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_player_trophy_case
BEFORE DELETE ON fp_player_trophy_case
FOR EACH ROW
WHEN
(
	'TEAM' = OLD.type
)
EXECUTE FUNCTION tf_bd_player_trophy_case();
--------------------------------------------------------------------------------




/*******************************************************************************
 * PRIZE
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_prize
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_prize
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
 * NAME : tg_bu_team_prize_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_team_prize_case
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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_prize_case
BEFORE INSERT ON fp_player_prize_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_prize_case();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_player_prize_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_player_prize_case
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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play
BEFORE INSERT ON fp_play
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_play
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
 * DESC : TODO
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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play_statistic
BEFORE INSERT ON fp_play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_play_statistic
BEFORE UPDATE ON fp_play_statistic
FOR EACH ROW
WHEN
(
	OLD.score IS DISTINCT FROM NEW.score
)
EXECUTE FUNCTION tf_bu_play_statistic();
--------------------------------------------------------------------------------




/*******************************************************************************
 * USER ACCOUNT
 ******************************************************************************/

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bd_user_account
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bd_user_account
BEFORE DELETE ON fp_user_account
FOR EACH ROW
EXECUTE FUNCTION tf_bd_user_account();
--------------------------------------------------------------------------------
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
 * TRIGGER BEFORE OUR INSERT
 ******************************************************************************/


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_country_refuse
 *
 * DESC : Consenti l'inserimento di paesi
 ******************************************************************************/
ALTER TABLE
    fp_country
DISABLE TRIGGER
    tg_bi_country_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_confederation_refuse
 *
 * DESC : Consenti l'inserimento di confederazioni calcistiche
 ******************************************************************************/
ALTER TABLE
    fp_confederation
DISABLE TRIGGER
    tg_bi_confederation_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_competition_refuse
 *
 * DESC : Consenti l'inserimento di competizioni calcistiche
 ******************************************************************************/
ALTER TABLE
    fp_competition
DISABLE TRIGGER
    tg_bi_competition_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_tag_refuse
 *
 * DESC : Consenti l'inserimento di tag
 ******************************************************************************/
ALTER TABLE
    fp_tag
DISABLE TRIGGER
    tg_bi_tag_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_position_refuse
 *
 * DESC : Consenti l'inserimento di posizioni
 ******************************************************************************/
ALTER TABLE
    fp_position
DISABLE TRIGGER
    tg_bi_position_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_trophy_refuse
 *
 * DESC : Consenti l'inserimento di trofei calcistici
 ******************************************************************************/
ALTER TABLE
    fp_trophy
DISABLE TRIGGER
    tg_bi_trophy_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_prize_refuse
 *
 * DESC : Consenti l'inserimento di premi calcistici
 ******************************************************************************/
ALTER TABLE
    fp_prize
DISABLE TRIGGER
    tg_bi_prize_refuse;
--------------------------------------------------------------------------------
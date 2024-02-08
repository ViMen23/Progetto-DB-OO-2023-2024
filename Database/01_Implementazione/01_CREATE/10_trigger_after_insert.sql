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
 * TRIGGER AFTER OUR INSERT
 ******************************************************************************/


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_country
 *
 * DESC : Disabilita il controllo sull'inserimento di paesi
 ******************************************************************************/
ALTER TABLE
    fp_country
DISABLE TRIGGER
    tg_bi_country;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_country_refuse
 *
 * DESC : Impedisci l'inserimento di paesi
 ******************************************************************************/
ALTER TABLE
    fp_country
ENABLE TRIGGER
    tg_bi_country_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_confederation
 *
 * DESC : Disabilita il controllo sull'inserimento di confederazioni
 ******************************************************************************/
ALTER TABLE
    fp_confederation
DISABLE TRIGGER
    tg_bi_confederation;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_confederation_refuse
 *
 * DESC : Impedisci l'inserimento di confederazioni calcistiche
 ******************************************************************************/
ALTER TABLE
    fp_confederation
ENABLE TRIGGER
    tg_bi_confederation_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DISABLE TRIGGER
 * NAME : tg_bi_competition
 *
 * DESC : Disabilita il controllo sull'inserimento di competizioni
 ******************************************************************************/
ALTER TABLE
    fp_competition
DISABLE TRIGGER
    tg_bi_competition;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_competition_refuse
 *
 * DESC : Impedisci l'inserimento di competizioni calcistiche
 ******************************************************************************/
ALTER TABLE
    fp_competition
ENABLE TRIGGER
    tg_bi_competition_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_tag_refuse
 *
 * DESC : Impedisci l'inserimento di tag
 ******************************************************************************/
ALTER TABLE
    fp_tag
ENABLE TRIGGER
    tg_bi_tag_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_position_refuse
 *
 * DESC : Impedisci l'inserimento di posizioni
 ******************************************************************************/
ALTER TABLE
    fp_position
ENABLE TRIGGER
    tg_bi_position_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_trophy_refuse
 *
 * DESC : Impedisci l'inserimento di trofei calcistici
 ******************************************************************************/
ALTER TABLE
    fp_trophy
ENABLE TRIGGER
    tg_bi_trophy_refuse;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENABLE TRIGGER
 * NAME : tg_bi_prize_refuse
 *
 * DESC : Impedisci l'inserimento di premi calcistici
 ******************************************************************************/
ALTER TABLE
    fp_prize
ENABLE TRIGGER
    tg_bi_prize_refuse;
--------------------------------------------------------------------------------
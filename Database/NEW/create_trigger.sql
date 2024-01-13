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
 * TYPE : TRIGGER FUNCTION - tg_bi_conf_country TRIGGER 
 * NAME : tf_bi_connection_table
 * DESC :
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_connection_table
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (ctrl_connection_table_year(TG_TABLE_NAME, NEW)) THEN
		RETURN NEW
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TRIGGER
 ******************************************************************************/


/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bi_conf_country
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_conf_country
BEFORE INSERT IN conf_country
FOR EACH ROW
EXECUTE FUNCTION tf_bi_connection_table();
--------------------------------------------------------------------------------

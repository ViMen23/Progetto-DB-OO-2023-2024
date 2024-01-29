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
 * DOMAIN 
 ******************************************************************************/


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_alnum
 *
 * DESC : Dominio per una stringa di caratteri alfanumerici
 *        (inclusi i caratteri accentati) di lunghezza compresa tra i 2 e
 *        i 100 caratteri.
 *        Blocca l'inserimento di stringhe con ripetizioni di segni di
 *        punteggiatura e spazi che non siano validi
 ******************************************************************************/
CREATE DOMAIN dm_alnum AS varchar(100)
CHECK
(
	value ~ '(?=^'
				'['
					
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
				'['
					'\u0020'
					'\u0027'
					'\u002D'
					'\u002E'
					'\u002F'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0060'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']{0,98}'
				'['
					'\u002E'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
			'$)'
			'(?!.*('
				'[\u0020\u0027\u002D\u002F\u0060]{2}'
				'|'
				'[\u0027\u002D\u002E\u002F\u0060]{2}'
				'|'
				'\u0020\u002E'
			'))'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_code
 *
 * DESC : Dominio per un codice di due o tre lettere maiuscole
 ******************************************************************************/
CREATE DOMAIN dm_code AS varchar(3)
CHECK
(
	value ~ '(?=^[\u0041-\u005A]{2,3}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_date
 *
 * DESC : Dominio contenente le date precedenti o uguali a quella corrente
 *        e maggiori o uguali ad una data arbitraria che permette l'inserimento
 *        di calciatori che idealmente giochino la prima stagione possibile
 ******************************************************************************/
CREATE DOMAIN dm_date AS date
CHECK
(
	value BETWEEN '1810-01-01' AND current_date
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_description
 *
 * DESC : Dominio per una stringa di caratteri alfanumerici
 *        (inclusi i caratteri accentati) di lunghezza compresa tra i 2 e
 *        i 500 caratteri.
 *        Blocca l'inserimento di stringhe con ripetizioni di segni di
 *        punteggiatura e spazi che non siano validi
 ******************************************************************************/
CREATE DOMAIN dm_description AS varchar(500)
CHECK
(
	value ~ '(?=^'
				'['
					
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
				'['
					'\u0020'
					'\u0027'
					'\u002C'
					'\u002D'
					'\u002E'
					'\u002F'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0060'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']{0,498}'
				'['
					'\u002E'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
			'$)'
			'(?!.*('
				'[\u0020\u0027\u002D\u002F\u0060]{2}'
				'|'
				'[\u0027\u002C\u002D\u002E\u002F\u0060]{2}'
				'|'
				'\u0020\u002C'
				'|'
				'\u0020\u002E'
			'))'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_password
 *
 * DESC : Dominio per la password.
 *        Accetta una stringa alfanumerica di lunghezza compresa tra
 *        gli 8 e i 255 caratteri.
 *        È necessaria la presenza di almeno una cifra, una lettera maiuscola,
 *        una lettera minuscola ed un carattere speciale
 ******************************************************************************/
CREATE DOMAIN dm_password AS varchar(255)
CHECK
(
	value ~ '(?=^[\u0020-\u007E]{8,255}$)'
			'(?=.*[\u0030-\u0039]{1})'
			'(?=.*[\u0041-\u005A]{1})'
			'(?=.*[\u0061-\u007A]{1})'
			'(?=.*[\u0020-\u002F\u003A-\u0040\u005B-\u0060\u007B-\u007E]{1})'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_string
 *
 * DESC : Dominio per una stringa di caratteri (inclusi i caratteri accentati)
 *        di lunghezza compresa tra i 2 e i 100 caratteri.
 *        Blocca l'inserimento di stringhe con ripetizioni di segni di
 *        punteggiatura e spazi che non siano validi
 ******************************************************************************/
CREATE DOMAIN dm_string AS varchar(100)
CHECK
(
	value ~ '(?=^'
				'['
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
				'['
					'\u0020'
					'\u0027'
					'\u002D'
					'\u002E'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']{0,98}'
				'['
					'\u002E'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
			'$)'
			'(?!.*('
				'[\u0020\u0027\u002D]{2}'
				'|'
				'[\u0027\u002D\u002E]{2}'
				'|'
				'\u0020\u002E'
			'))'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_username
 *
 * DESC : Dominio per una stringa di caratteri alfanumerici, punti, trattini e
 *        underscore di lunghezza compresa tra i 4 e i 20 caratteri.
 ******************************************************************************/
CREATE DOMAIN dm_username AS varchar(20)
CHECK
(
	value ~ '(?=^'
				'['
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
				']'
				'['
					'\u002D'
					'\u002E'
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u005F'
					'\u0061-\u007A'
				']{2,18}'
				'['
					'\u0030-\u0039'
					'\u0041-\u005A'
					'\u0061-\u007A'
				']'
			'$)'
			'(?!.*[\u002D\u002E\u005F]{2})'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_usint
 *
 * DESC : Dominio contenente smallint non negativi
 ******************************************************************************/
CREATE DOMAIN dm_usint AS smallint
CHECK
(
	value >= 0
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_year
 *
 * DESC : Dominio contenente gli anni precedenti o uguali a quello corrente
 *        e superiore o uguale all'anno in cui è ufficialmente nato il calcio  
 ******************************************************************************/
CREATE DOMAIN dm_year AS smallint
CHECK
(
	value BETWEEN 1860 AND (extract(year from current_date))
);
--------------------------------------------------------------------------------

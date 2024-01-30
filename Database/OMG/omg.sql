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
 * SCHEMA                                                                     
 ******************************************************************************/


/******************************************************************************* 
 * TYPE : SCHEMA
 * NAME : public
 *
 * DESC : Lo schema per il database.
 *        È stato scelto di utilizzare lo schema public in quanto è
 *        il percorso di ricerca predefinito per ogni database in Postgresql,
 *        in modo da rendere il codice più leggibile                            
 ******************************************************************************/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
--------------------------------------------------------------------------------

/******************************************************************************* 
 * TYPE : EXTENSION
 * NAME : hstore
 *
 * DESC : Estensione necessaria per rendere più comoda l'implementazione
 *        di alcune funzioni e trigger.
 *
 *        NOTA: per maggiori informazioni consultare la documentazione ufficiale
 *              di Postgresql                      
 ******************************************************************************/
CREATE EXTENSION hstore;
--------------------------------------------------------------------------------

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
 * ENUM TYPE
 ******************************************************************************/


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_award
 *
 * DESC : Enum delle possibili tipologie di trofeo e premio calcistico
 ******************************************************************************/
CREATE TYPE en_award AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_competition
 *
 * DESC : Enum delle possibili tipologie di competizione calcistica
 ******************************************************************************/
CREATE TYPE en_competition AS ENUM
(
	'CUP',
	'LEAGUE',
	'SUPER CUP'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_country
 *
 * DESC : Enum delle possibili tipologie di paese
 ******************************************************************************/
CREATE TYPE en_country AS ENUM
(
	'NATION',
	'CONTINENT',
	'WORLD'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_feature
 *
 * DESC : Enum delle possibili tipologie di attributo per un calciatore
 ******************************************************************************/
CREATE TYPE en_feature AS ENUM
(
	'GOALKEEPER',
	'KEY ATTRIBUTE',
	'MEDICAL',
	'MENTAL',
	'PHYSICAL',
	'SET PIECE',
	'TACTICAL - ATTACKING',
	'TACTICAL - DEFENDING',
	'TEAM WORK',
	'TECHNICAL - ATTACKING',
	'TECHNICAL - DEFENDING',
	'TECHNICAL - IN POSSESSION',
	'TECHNICAL - OUT POSSESSION'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_foot
 *
 * DESC : Enum delle possibili tipologie di piede preferito di un calciatore
 ******************************************************************************/
CREATE TYPE en_foot AS ENUM
(
	'EITHER',
	'LEFT',
	'RIGHT'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_role
 *
 * DESC : Enum delle possibili tipologie di ruolo di un calciatore
 ******************************************************************************/
CREATE TYPE en_role AS ENUM
(
	'GK', -- portiere
	'DF', -- difensore
	'MF', -- centrocampista
	'FW'  -- attaccante
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_role_mix
 *
 * DESC : Enum formato da tutte le possibili combinazioni di ruoli
 *        di un calciatore
 ******************************************************************************/
CREATE TYPE en_role_mix AS ENUM
(
	'GK',
	'DF',
	'MF',
	'FW',
	'GK-DF',
	'GK-MF',
	'GK-FW',
	'DF-MF',
	'DF-FW',
	'MF-FW',
	'GK-DF-MF',
	'GK-DF-FW',
	'GK-MF-FW',
	'DF-MF-FW',
	'GK-DF-MF-FW'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_season
 *
 * DESC : Enum delle possibili tipologie di militanza riferite ad una stagione
 ******************************************************************************/
CREATE TYPE en_season AS ENUM
(
	'I PART',	-- solo prima parte di stagione
	'II PART',	-- solo seconda parte di stagione
	'FULL'		-- tutta la stagione
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_team
 *
 * DESC : Enum delle possibili tipologie di squadra di calcio
 ******************************************************************************/
CREATE TYPE en_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
--------------------------------------------------------------------------------

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
 * FUNCTION PRE SCHEMA                                              
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : table_exists
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se esiste una tabella con un nome uguale alla
 *        stringa in input.
 *        Fa uso del catalogo di sistema di Postgresql.
 *
 *        NOTA: La funzione considera come database predefinito "fpdb" e
 *              come schema predefinito "public".
 ******************************************************************************/
CREATE OR REPLACE FUNCTION table_exists
(
	IN	name_table	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	existence	boolean;

BEGIN

	existence = FALSE;

	SELECT
		count(*) >= 1
	INTO
		existence
	FROM
		information_schema.tables 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table;
	

	IF (NOT existence) THEN
		RAISE NOTICE 'Table % not exists', name_table;
	END IF;


	RETURN existence;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : column_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se esiste una colonna all'interno di una tabella,
 *        prendendo in input il nome di una tabella e di una colonna.
 *        Fa uso del catalogo di sistema di Postgresql.
 *
 *        NOTA: La funzione considera come database predefinito "fpdb" e
 *              come schema predefinito "public".
 ******************************************************************************/
CREATE OR REPLACE FUNCTION column_exists
(
	IN	name_table	text,
	IN	name_column	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	existence	boolean;

BEGIN

	existence = FALSE;

	SELECT
		count(*) >= 1
	INTO
		existence
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_column;


	IF (NOT existence) THEN
		RAISE NOTICE 'Column % not exists in table %', name_column, name_table;
	END IF;


	RETURN existence;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_type_column
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Funzione che, preso in input il nome di una tabella e di una colonna,
 *        restituisce il tipo della colonna sotto forma di testo.
 *        Fa uso del catalogo di sistema di Postgresql.
 *
 *		  NOTA: La funzione considera come database predefinito "fpdb" e
 *              come schema predefinito "public"
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_type_column
(
	IN	name_table	text,
	IN	name_column	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_column	text;

BEGIN

	type_column = NULL;
	
	SELECT
		data_type
	INTO
		type_column
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_column;


	RETURN type_column;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_id
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'id di una riga di una tabella, se presente.
 *        Prende in input un separatore ed una stringa formattata in modo
 *        appropiato.
 *
 *        ES. separatore = '@'
 *            stringa = 'nome_tabella@nome_colonna1@valore_colonna1@nome_colonna2@valore_colonna2@...@nome_colonnaN@valore_colonnaN'
 *
 *        L'idea di fondo è quella di sfruttare la formattazione della
 *        stringa in input per estrarre tutte le informazioni necessarie
 *        utilizzando un contatore.
 *        Si immagini di costruire un array di stringhe contenente in ciascuna
 *        posizione la parte di stringa corrispondente.
 *        Continuando a seguire l'esempio proposto:
 *
 *        POSITION | VALUE
 *           0     | nome_tabella
 *           1     | nome_colonna1
 *           2     | valore_colonna1
 *           3     | nome_colonna2
 *           4     | valore_colonna2
 *          ...    | ...
 *         2N - 1  | nome_colonnaN
 *           2N    | valore_colonnaN
 *
 *        Eccezion fatta per la posizione 0 che si riferisce al nome della
 *        tabella, tutte le altre posizioni dispari faranno riferimento a
 *        nomi di colonne, mentre le posizioni pari immediatamente successive
 *        ai rispettivi valori.
 *        Sfruttando tali osservazioni mediante SQL dinamico sarà possibile
 *        costruire la query desiderata.
 *        
 *        NOTA: Importante osservare che tale funzione sfrutta la buona prassi,
 *              che abbiamo osservato quando possibile e necessario,
 *              di assegnare una chiave surrogata di tipo integer alle tabelle
 *              e di denominarla id
 *
 *        NOTA: Assicurarsi che i valori in input permettano di definire
 *              in modo univoco una riga di una tabella.
 *              Non sono stati effettuati eccessivi, e dovuti, controlli
 *              sull'input in quanto si tratta di una funzione nata con lo
 *              scopo di semplificare l'inserimento dei dati nel database
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_id
(
	IN	separator		text,
	IN	input_string	text
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	counter			integer;

	name_table		text;
	row_table		record;
	
	name_column		text;
	value_column	text;
	type_column		text;
	
	to_execute		text;

	id_to_find		integer;
	
BEGIN
	
	to_execute = '';

	id_to_find = NULL;
	
	counter = 0;

	FOR row_table
	IN
		-- suddivido la stringa in input in base alla posizione del separatore
		-- per sfruttarne la formattazione
		SELECT
			*
		FROM
			string_to_table(input_string, separator)

	LOOP

		-- se si tratta del nome della tabella
		IF (0 = counter) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;

			-- mi assicuro che la tabella in questione abbia una colonna id
			IF (NOT column_exists(name_table, 'id')) THEN
				RETURN NULL;
			END IF;
			
			-- ...e comincio col preparare la query da eseguire
			to_execute = to_execute || 'SELECT id ';
			to_execute = to_execute || 'FROM ' || name_table || ' WHERE ';
		
		-- se si tratta del nome di una colonna
		ELSIF (1 = (counter % 2)) THEN
		
			name_column = row_table.string_to_table;
			
			IF (NOT column_exists(name_table, name_column)) THEN
				RETURN NULL;
			END IF;
			
			type_column = get_type_column(name_table, name_column);
			
			-- continuo a costruire la query da eseguire
			to_execute = to_execute || name_column || ' = ';
		
		-- se si tratta del valore di una colonna
		ELSIF (0 = (counter % 2)) THEN
		
			value_column = row_table.string_to_table;
			
			-- OSSERVAZIONE
			-- in questo punto abbiamo sfruttato un'ulteriore peculiarità
			-- del nostro database
			-- essenzialmente i tipi di dati che gestiamo si possono
			-- dividere in due grandi categorie
			-- categoria "testo", che contiene chiaramente i varchar,
			-- text, ma anche date e altro
			-- e categoria integer, di cui fanno parte i valori numerici.
			-- Abbiamo pertanto sfruttato il fatto che, indipendentemente
			-- dai tipi e domini creati, Postgresql salvi nel catalogo
			-- anche l'informazione sui tipi primitivi
			-- pertanto se nel tipo della colonna non è presente la
			-- sottostringa 'int' si tratterà di un valore testuale
			-- che necessita di essere posto tra singoli apici
			-- per formare correttamente
			-- la query da eseguire con SQL dinamico
			IF (NOT type_column LIKE '%int%') THEN 
				value_column = quote_literal(value_column);
			END IF;
			
			-- aggiungo per permettere la creazione di una query
			-- che filtra su più colonne
			to_execute = to_execute || value_column || ' AND ';
			
		END IF;
		
		counter = counter + 1;
		
	END LOOP;
	
	to_execute = trim(to_execute, ' AND ');
	
	to_execute = to_execute || ';';

	-- a questo punto, continuando l'esempio proposto nella descrizione
	-- avremo ottenuto la query:
	-- 
	-- SELECT
	-- 		id
	-- FROM
	-- 		nome_tabella
	-- WHERE
	--      nome_colonna1 = valore_colonna1
	--      AND
	--      nome_colonna2 = valore_colonna2
	--      AND
    --      ...
	--      AND
	--      nome_colonnaN = valore_colonnaN;
	--
	-- Per semplificare la visualizzazione è stato scelto di formattare
	-- la query in modo appropriato, sebbene quella ottenuta con la funzione
	-- sia su una sola riga di testo
	
	EXECUTE to_execute INTO id_to_find;
	

	RETURN id_to_find;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_column
 *
 * IN      : text, text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Funzione che restituisce il valore della colonna di una riga
 *        di una tabella sotto forma di testo, prendendo in input il nome
 *        della tabella, il nome della colonna in questione e l'id che
 *        identifica la riga.
 *        Utilizza SQL dinamico per costruire la query da eseguire.
 *
 *        NOTA: È possibile utilizzare tale funzione solo su tabelle che
 *              hanno una colonna chiamata id
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_column
(
	IN	name_table	text,
	IN	name_column	text,
	IN	value_id	integer
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				integer;

	type_column		text;
	value_column	text;

	to_execute		text;

	cur_to_execute	refcursor;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	IF (NOT column_exists(name_table, 'id')) THEN
		RETURN NULL;
	END IF;

	IF (NOT column_exists(name_table, name_column)) THEN
		RETURN NULL;
	END IF;
	
	-- se i controlli hanno dato esito positivo
	-- costruisco la query da eseguire
	to_execute = '';
	to_execute = to_execute || 'SELECT ' || name_column;
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';

	-- a questo punto avremo ottenuto la query:
	-- 
	-- SELECT
	-- 		name_column
	-- FROM
	-- 		name_table
	-- WHERE
	--      id = value_id;
	--
	-- Per semplificare la visualizzazione è stato scelto di formattare
	-- la query in modo appropriato, sebbene quella ottenuta con la funzione
	-- sia su una sola riga di testo
	
	OPEN cur_to_execute FOR EXECUTE to_execute;
	
	type_column = get_type_column(name_table, name_column);
	
	-- se la colonna è di tipo numerico
	IF (type_column LIKE '%int%') THEN
		FETCH cur_to_execute INTO tmp;
		-- è necessario castarla come text 
		value_column = CAST(tmp AS text); 
	ELSE
		FETCH cur_to_execute INTO value_column;
	END IF;
	
	CLOSE cur_to_execute;


	RETURN value_column;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_record
 *
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : Funzione che restituisce l'intera riga di una tabella, prendendo in
 *        input il nome della tabella, e l'id che identifica la riga.
 *        Utilizza SQL dinamico per costruire la query da eseguire.
 *
 *        NOTA: È possibile utilizzare tale funzione solo su tabelle che
 *              hanno una colonna chiamata id
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_record
(
	IN	name_table	text,
	IN	value_id	integer
)
RETURNS record
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	to_execute	text;
	rec_table	record;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;

	IF (NOT column_exists(name_table, 'id')) THEN
		RETURN NULL;
	END IF;
	
	-- se i controlli hanno dato esito positivo
	-- costruisco la query da eseguire
	to_execute = '';
	to_execute = to_execute || 'SELECT *';
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	-- a questo punto avremo ottenuto la query:
	-- 
	-- SELECT
	-- 		*
	-- FROM
	-- 		name_table
	-- WHERE
	--      id = value_id;
	--
	-- Per semplificare la visualizzazione è stato scelto di formattare
	-- la query in modo appropriato, sebbene quella ottenuta con la funzione
	-- sia su una sola riga di testo

	EXECUTE to_execute INTO rec_table;


	RETURN rec_table;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : all_references
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, integer)
 *
 * DESC : Funzione che dato il nome di una tabella restituisce tutte le colonne
 *        delle altre tabelle che fanno riferimento alla tabella in input,
 *        ordinate per nome del constraint e per odine nel costraint decrescente
 *        in modo tale che ogni volta che si raggiunge il valore di 1 si passi
 *        ad un constraint differente, sotto forma di nuova tabella.
 *        Fa uso del catalogo di sistema di Postgresql.
 *
 *        NOTA: La funzione considera come database predefinito "fpdb" e
 *              come schema predefinito "public"
 *
 *        NOTA: È posssibile implementare tale funzione in modo più complesso
 *              in termini generali ma si è scelto di sfruttare la "disciplina"
 *              che abbiamo utilizzato nello scrivere i nomi dei vari constraint
 *              (e non solo).
 *              Nello specifico ogni constraint di tipo foreign key è stato
 *              formalizzato nel seguente modo:
 *
 *              nomeTabellaCheRiferisce_fk_nomeTabellaDaRiferire
 *
 *              È pertanto stato possibile implementare tale funzione in modo
 *              rapido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_references
(
	IN	name_table	text
)
RETURNS TABLE
(
	constr			text,	-- nome del constraint
	table_to_ref	text,	-- tabella referenziata
	col_to_ref		text,	-- colonna della tabella referenziata
	table_ref		text,	-- tabella che referenzia
	col_ref			text,	-- colonna della tabella che referenzia
	col_ord			integer	-- ordine della colonna della tabella che referenzia
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			CAST(ccu.constraint_name AS text) AS constr,
			CAST(ccu.table_name AS text) AS table_to_ref,
			CAST(ccu.column_name AS text) AS col_to_ref,
			CAST(kcu.table_name AS text) AS table_ref,
			CAST(kcu.column_name AS text) AS col_ref,
			CAST(kcu.ordinal_position AS integer) AS col_ord
		FROM
			information_schema.constraint_column_usage AS ccu
			JOIN
			information_schema.key_column_usage AS kcu
			ON
				ccu.constraint_name = kcu.constraint_name
		WHERE
			ccu.constraint_name LIKE '%_fk_%'
			AND
			ccu.table_catalog = 'fpdb'
			AND
			ccu.table_schema = 'public'
			AND
			ccu.table_name = name_table
			AND
			(
				ccu.column_name = 'id'
				OR
				ccu.column_name = kcu.column_name
			)
		ORDER BY
			ccu.constraint_name,
			kcu.ordinal_position DESC;
			
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_referenced
 *
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una riga di una tabella è referenziata.
 *        Prende in input un separatore ed una stringa formattata in modo
 *        appropiato.
 *
 *        ES. separatore = '@'
 *            stringa = 'nome_tabella@nome_colonna1@valore_colonna1@nome_colonna2@valore_colonna2@...@nome_colonnaN@valore_colonnaN'
 *
 *        L'idea di fondo è quella di sfruttare la formattazione della
 *        stringa in input per estrarre tutte le informazioni necessarie
 *        alla costruzione della query desiderata mediante SQL dinamico
 *        in modo essenzialmente analogo a quello che viene fatto nella
 *        funzione "get_id".
 *
 *        NOTA: Assicurarsi che i valori in input permettano di definire
 *              in modo univoco una riga di una tabella.
 *              Non sono stati effettuati eccessivi, e dovuti, controlli
 *              sull'input in quanto si tratta di una funzione nata con lo
 *              scopo di semplificare diversi trigger e pertanto l'input
 *              sarà generato automaticamente e sarà corretto.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_referenced
(
	IN	separator	text,
	IN	in_string	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	name_table		text;
	row_table		record;

	name_column		text;
	value_column	text;
	type_column		text;
	
	name_constr		text;
	
	to_execute		text;
	where_cond		text;
	
	counter			integer;
	
BEGIN

	-- come prima cosa è necessario costruire la condizione del where
	-- che andrà a completare la query

	where_cond = '';
	name_constr = '';
	
	counter = 0;
	
	FOR row_table
	IN
		-- suddivido la stringa in input in base alla posizione del separatore
		-- per sfruttarne la formattazione
		SELECT
			*
		FROM
			string_to_table(in_string, separator)

	LOOP
		
		-- se si tratta del nome della tabella
		IF (0 = counter) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			-- comincio a costruire la condizione del where 
			where_cond = where_cond || 'WHERE ';
			
		-- se si tratta del nome di una colonna
		ELSIF (1 = (counter % 2)) THEN
		
			name_column = row_table.string_to_table;
			
			IF (NOT column_exists(name_table, name_column)) THEN
				RETURN NULL;
			END IF;
			
			type_column = get_type_column(name_table, name_column);
			
			-- aggiungo alla condizione del where il nome della colonna
			where_cond = where_cond || name_table || '.' || name_column || ' = ';

		-- se si tratta del valore di una colonna	
		ELSIF (0 = (counter % 2)) THEN
		
			value_column = row_table.string_to_table;
			
			IF (NOT type_column LIKE '%int%') THEN
				value_column = quote_literal(value_column);	
			END IF;
			
			-- aggiungo alla condizione del where il valore della colonna
			where_cond = where_cond || value_column || ' AND ';
			
		END IF;
		
		counter = counter + 1;
		
	END LOOP;

	where_cond = trim(where_cond, ' AND ');
	
	where_cond = where_cond || ';';

	-- a questo punto avremo ottenuto la condizione del where
	-- (seguendo l'esempio proposto):
	-- 
	-- WHERE
	--      nome_tabella.nome_colonna1 = valore_colonna1
	--      AND
	--      nome_tabella.nome_colonna2 = valore_colonna2
	--		AND
	--		...
	--		AND
	--		nome_tabella.nome_colonnaN = valore_colonnaN;
	--
	-- Per semplificare la visualizzazione è stato scelto di formattare
	-- la condizione del where in modo appropriato, sebbene quella ottenuta con la funzione
	-- sia su una sola riga di testo


	-- a questo punto bisogna costruire la prima parte della query che andremo ad eseguire

	counter = 0;

	-- per ogni referenza alla riga della tabella in questione
	FOR row_table
	IN
		SELECT
			*
		FROM
			all_references(name_table)

	LOOP
		
		-- se si tratta di un nuovo contraint
		IF (row_table.constr <> name_constr) THEN
		
			-- setto il constraint corrente
			name_constr = row_table.constr;

			-- costruisco la query da eseguire da zero
			to_execute = '';
			to_execute = to_execute || 'SELECT count(*)';
			to_execute = to_execute || ' FROM ' || name_table;
			to_execute = to_execute || ' JOIN ' || row_table.table_ref;
			to_execute = to_execute || ' ON ' || name_table || '.' || row_table.col_to_ref;
			to_execute = to_execute || ' = ' || row_table.table_ref || '.' || row_table.col_ref;
		
		ELSE
			
			-- se è un constraint che è stato gia incontrato
			-- la query da eseguire va estesa con le nuove colonne
			to_execute = to_execute || ' JOIN ' || row_table.table_ref;
			to_execute = to_execute || ' ON ' || name_table || '.' || row_table.col_to_ref;
			to_execute = to_execute || ' = ' || row_table.table_ref || '.' || row_table.col_ref;
			
		END IF;
		
		
		-- se si tratta dell'ultimo valore di una colonna della tabella che referenzia
		-- è il momento di collegare la query con la condizione del where 
		IF (1 = row_table.col_ord) THEN

			-- prima di collegare la condizione del where la query sarà:
			--
			-- SELECT
			-- 		count(*)
			-- FROM
			-- 		nome_tabella
			--		JOIN
			--		nome_tabella_che_referenzia1
			--		ON
			--			nome_tabella.colonna_referenziata = nome_tabella_che_referenzia1.colonna_che_referenzia
			-- ...
			-- e così via..
			--
			-- Per semplificare la visualizzazione è stato scelto di formattare
			-- la condizione del where in modo appropriato, sebbene quella ottenuta con la funzione
			-- sia su una sola riga di testo

			to_execute = to_execute || ' ' || where_cond;

			EXECUTE to_execute INTO counter;

			-- se il contatore è maggiore di 0 allora la riga in questione è referenziata			
			IF (counter > 0) THEN
				RETURN TRUE;		
			END IF;
				
		END IF;
		
	END LOOP;

	-- se si arriva a questo punto significa che la riga in questione non è referenziata
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : list_pk_columns
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Funzione che preso in input il nome di una tabella restituisce
 *        la lista delle colonne che formano la primary key della tabella
 *        in questione, sotto forma di nuova tabella.
 *        Fa uso del catalogo di sistema di Postgresql.
 *
 *        NOTA: La funzione considera come database predefinito "fpdb" e
 *              come schema predefinito "public"
 *
 *        NOTA: È possibile implementare tale funzione in modo più complesso
 *              in termini generali ma si è scelto di sfruttare la "disciplina"
 *              che abbiamo utilizzato nello scrivere i nomi dei vari constraint
 *              (e non solo).
 *              Nello specifico ogni constraint di tipo primary key è stato
 *              formalizzato nel seguente modo:
 *
 *              pk_nomeTabella
 *
 *              È pertanto stato possibile implementare tale funzione in modo
 *              rapido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION list_pk_columns
(
	IN	name_table	text
)
RETURNS TABLE
(
	name_column		text
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			CAST(column_name AS text) AS name_column  
		FROM
			information_schema.constraint_column_usage
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
			AND
			constraint_name LIKE 'pk_%';
			
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : string_for_reference
 *
 * IN      : text, text, record
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Funzione che preso in input un separatore, il nome di una tabella e
 *        un record di una riga della tabella in input costruisce mediante
 *        SQL dinamico la stringa che poi potrà essere data in input alla
 *        funzione "is_referenced".
 *
 *        NOTA: Fa uso dell'estensione hstore
 *
 *        NOTA: Non vengono effettuati eccessivi, e doverosi, controlli
 *              sull'input in quanto è una funzione nata con lo scopo
 *              di semplificare la scrittura di diversi trigger e pertanto
 *              l'input sarà automatico e sempre corretto
 ******************************************************************************/
CREATE OR REPLACE FUNCTION string_for_reference
(
	IN	separator	text,
	IN	name_table	text,
	IN	rec_table	record
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	output_string	text;

	name_column		text;

	h_rec_table		hstore;	-- record di tipo hstore

BEGIN

	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;

	-- converte il record della tabella
	-- per poter essere utilizzato dall'estensione hstore
	h_rec_table = hstore(rec_table);

	-- inizia a costruire la stringa in output col nome della tabella
	output_string = '';
	output_string = output_string || name_table;

	-- per ogni nome di colonna della tabella che forma una primary key
	FOR name_column
	IN
		SELECT
			*
		FROM
			list_pk_columns(name_table)

	LOOP

		-- costruisci la stringa con nome colonna separatore
		-- e valore colonna (ottenuto facilmente grazie all'estensione) 
		output_string = output_string || separator || name_column;
		output_string = output_string || separator || (h_rec_table->name_column);
		
	END LOOP;


	RETURN output_string;
			
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

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
 * TABLES AND CONSTRAINTS
 ******************************************************************************/



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_country
 *
 * DESC : Tabella contentente informazioni sui paesi
 ******************************************************************************/
CREATE TABLE fp_country
(
	id		serial		NOT NULL,
	type	en_country	NOT NULL,
	code	dm_code		NOT NULL,
	name	dm_string	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_country TABLE
 * NAME : pk_country
 *
 * DESC : Non possono esistere paesi diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_country
ADD CONSTRAINT pk_country
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_country TABLE
 * NAME : uq_country_code
 *
 * DESC : Non possono esistere paesi diversi con lo stesso codice
 ******************************************************************************/
ALTER TABLE	fp_country
ADD CONSTRAINT uq_country_code
UNIQUE
(
	code
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_country TABLE
 * NAME : uq_country_name
 *
 * DESC : Non possono esistere paesi diversi con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_country
ADD CONSTRAINT uq_country_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_confederation
 *
 * DESC : Tabella contentente informazioni sulle confederazioni calcistiche
 ******************************************************************************/
CREATE TABLE fp_confederation
(
	id			serial		NOT NULL,
	country_id	integer		NOT NULL,
	short_name	dm_alnum 	NOT NULL,
	long_name	dm_alnum	NOT NULL,
	super_id	integer				  -- confederazione di grado immediatamente
	                                  -- superiore della quale è membro
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_confederation TABLE
 * NAME : pk_confederation
 *
 * DESC : Non possono esistere confederazioni calcistiche diverse
 *        con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_confederation
ADD CONSTRAINT pk_confederation
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_confederation TABLE
 * NAME : uq_confederation_long_name
 *
 * DESC : Non possono esistere confederazioni calcistiche diverse
 *        con lo stesso nome esteso
 ******************************************************************************/
ALTER TABLE	fp_confederation
ADD CONSTRAINT uq_confederation_long_name
UNIQUE
(
	long_name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_confederation TABLE
 * NAME : uq_confederation_country_id
 *
 * DESC : Un paese deve appartenere al più ad una confederazione calcistica
 ******************************************************************************/
ALTER TABLE	fp_confederation
ADD CONSTRAINT uq_confederation_country_id
UNIQUE
(
	country_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_confederation TABLE
 * NAME : confederation_fk_confederation
 *
 * DESC : Una confederazione calcistica fa riferimento alla confederazione
 *        calcistica di grado immediatamente superiore della quale è membro
 ******************************************************************************/
ALTER TABLE fp_confederation
ADD CONSTRAINT confederation_fk_confederation
FOREIGN KEY
(
	super_id
)
REFERENCES fp_confederation
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_confederation TABLE
 * NAME : confederation_fk_country
 *
 * DESC : Una confederazione calcistica fa riferimento al paese di appartenenza
 ******************************************************************************/
ALTER TABLE	fp_confederation
ADD CONSTRAINT confederation_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES fp_country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_team
 *
 * DESC : Tabella contentente informazioni sulle squadre di calcio
 ******************************************************************************/
CREATE TABLE fp_team
(
	id					serial		NOT NULL,
	type				en_team 	NOT NULL,
	country_id			integer		NOT NULL,
	name				dm_alnum	NOT NULL,
	confederation_id	integer		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_team TABLE
 * NAME : pk_team
 *
 * DESC : Non possono esistere squadre di calcio diverse con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_team
ADD CONSTRAINT pk_team
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_team TABLE
 * NAME : uq_team
 *
 * DESC : Non possono esistere squadre di calcio diverse con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_team
ADD CONSTRAINT uq_team
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_team TABLE
 * NAME : uq_team_type
 *
 * DESC : Vincolo creato per permettere la referenza da parte di militanza
 ******************************************************************************/
ALTER TABLE	fp_team
ADD CONSTRAINT uq_team_type
UNIQUE
(
	type,
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team TABLE
 * NAME : team_fk_country
 *
 * DESC : Una squadra di calcio fa riferimento al paese di appartenenza
 ******************************************************************************/
ALTER TABLE	fp_team
ADD CONSTRAINT team_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES fp_country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team TABLE
 * NAME : team_fk_confederation
 *
 * DESC : Una squadra di calcio fa riferimento alla confederazione calcistica
 *        di appartenenza
 ******************************************************************************/
ALTER TABLE	fp_team
ADD CONSTRAINT team_fk_confederation
FOREIGN KEY
(
	confederation_id
)
REFERENCES fp_confederation
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_competition
 *
 * DESC : Tabella contentente informazioni sulle competizioni calcistiche
 ******************************************************************************/
CREATE TABLE fp_competition
(
	id					serial			NOT NULL,
	type				en_competition	NOT NULL,
	team_type			en_team			NOT NULL,
	name				dm_alnum		NOT NULL,
	frequency			dm_usint		NOT NULL,
	confederation_id	integer			NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_competition TABLE
 * NAME : pk_competition
 *
 * DESC : Non possono esistere competizioni calcistiche diverse con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_competition 
ADD CONSTRAINT pk_competition
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_competition TABLE
 * NAME : uq_competition_name
 *
 * DESC : Non possono esistere competizioni calcistiche diverse
 *        con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_competition 
ADD CONSTRAINT uq_competition_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_competition TABLE
 * NAME : competition_fk_confederation
 *
 * DESC : Una competizione calcistica fa riferimento alla confederazione
 *        calcistica di appartenenza
 ******************************************************************************/
ALTER TABLE	fp_competition
ADD CONSTRAINT competition_fk_confederation
FOREIGN KEY
(
	confederation_id
)
REFERENCES fp_confederation
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_competition_edition
 *
 * DESC : Tabella contentente informazioni sulle edizioni
 *        delle competizioni calcistiche
 ******************************************************************************/
CREATE TABLE fp_competition_edition
(
	start_year		dm_year		NOT NULL,
	end_year		smallint	NOT NULL,
	competition_id	integer		NOT NULL,
	total_team		dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_competition_edition TABLE
 * NAME : pk_competition_edition
 *
 * DESC : Ogni edizione di una competizione calcistica deve iniziare
 *        in un anno diverso
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT pk_competition_edition
PRIMARY KEY
(
	start_year,
	competition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_competition_edition TABLE
 * NAME : uq_competition_edition_end_year
 *
 * DESC : Ogni edizione di una competizione calcistica deve finire
 *        in un anno diverso
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT uq_competition_edition_end_year
UNIQUE
(
	end_year,
	competition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - fp_competition_edition TABLE
 * NAME : ck_competition_edition_range
 *
 * DESC : Ogni edizione di una competizione calcistica deve iniziare e finire
 *        nello stesso anno o al massimo terminare l'anno successivo a quello
 *        di inizio
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT ck_competition_edition_range
CHECK
(
	(end_year - start_year) BETWEEN 0 AND 1
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - fp_competition_edition TABLE
 * NAME : ck_competition_edition_total_team
 *
 * DESC : Il numero di squadre di calcio che possono partecipare ad una
 *        edizione di una competizione calcistica deve essere compreso tra
 *        un minimo di 2 ed un massimo di 128.
 *
 *        NOTA: Il valore massimo, sebbene arbitrario, è stato ottenuto
 *              mediante una ricerca dettagliata effettuata analizzando
 *              gli storici delle varie edizioni di competizioni calcistiche
 *              su Wikipidia, Transfermarkt e altri siti.
 *              Abbiamo considerato sempre la fase finale di una competizione
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT ck_competition_edition_total_team
CHECK
(
	total_team BETWEEN 2 AND 128
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_competition_edition TABLE
 * NAME : competition_edition_fk_competition
 *
 * DESC : Un'edizione di una competizione calcistica fa riferimento alla 
 *        competizione calcistica a cui appartiene
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT competition_edition_fk_competition
FOREIGN KEY
(
	competition_id
)
REFERENCES fp_competition
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_partecipation
 *
 * DESC : Tabella contentente informazioni sulla partecipazione
 *        di una squadra di calcio ad un'edizione di una competizioni calcistica
 ******************************************************************************/
CREATE TABLE fp_partecipation
(
	start_year		dm_year	NOT NULL,
	competition_id	integer	NOT NULL,
	team_id			integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_partecipation TABLE
 * NAME : pk_partecipation
 *
 * DESC : Ogni squadra di calcio può partecipare al più una volta ad
 *        un'edizione di una competizione calcistica
 ******************************************************************************/
ALTER TABLE	fp_partecipation
ADD CONSTRAINT pk_partecipation
PRIMARY KEY
(
	start_year,
	competition_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_partecipation TABLE
 * NAME : partecipation_fk_competition_edition
 *
 * DESC : La partecipazione di una squadra di calcio ad un'edizione di una
 *        competizione calcistica fa riferimento all'edizione della competizione
 *        calcistica in questione
 ******************************************************************************/
ALTER TABLE	fp_partecipation
ADD CONSTRAINT partecipation_fk_competition_edition
FOREIGN KEY
(
	start_year,
	competition_id
)
REFERENCES fp_competition_edition
(
	start_year,
	competition_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_partecipation TABLE
 * NAME : partecipation_fk_team
 *
 * DESC : La partecipazione di una squadra di calcio ad un'edizione di una
 *        competizione calcistica fa riferimento alla squadra di calcio
 *        in questione
 ******************************************************************************/
ALTER TABLE	fp_partecipation
ADD CONSTRAINT partecipation_fk_team
FOREIGN KEY
(
	team_id
)
REFERENCES fp_team
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player
 *
 * DESC : Tabella contentente informazioni sui calciatori
 ******************************************************************************/
CREATE TABLE fp_player
(
	id			serial		NOT NULL,
	name		dm_string	NOT NULL,
	surname		dm_string	NOT NULL,
	dob			dm_date		NOT NULL, -- data di nascita
	country_id	integer		NOT NULL, -- id del paese di nascita
	foot		en_foot		NOT NULL, -- piede preferito
	role		en_role_mix			
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player TABLE
 * NAME : pk_player
 *
 * DESC : Non possono esistere calciatori diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_player
ADD CONSTRAINT pk_player
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_player TABLE
 * NAME : uq_player
 *
 * DESC : Non possono esistere calciatori diversi con la stessa combinazione
 *        di nome, cognome, data di nascita e paese di nascita
 ******************************************************************************/
ALTER TABLE	fp_player
ADD CONSTRAINT uq_player
UNIQUE
(
	name,
	surname,
	dob,
	country_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player TABLE
 * NAME : player_fk_country
 *
 * DESC : Un calciatore fa riferimento al paese di nascita
 ******************************************************************************/
ALTER TABLE	fp_player
ADD CONSTRAINT player_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES fp_country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player_retired
 *
 * DESC : Tabella contentente informazioni sui calciatori ritirati
 ******************************************************************************/
CREATE TABLE fp_player_retired
(
	player_id		integer	NOT NULL,
	retired_date	dm_date	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_retired TABLE
 * NAME : pk_player_retired
 *
 * DESC : Un calciatore può ritirarsi al più una volta
 ******************************************************************************/
ALTER TABLE fp_player_retired
ADD CONSTRAINT pk_player_retired
PRIMARY KEY
(
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_retired TABLE
 * NAME : player_retired_fk_player
 *
 * DESC : Un calciatore ritirato fa riferimento ad un calciatore
 ******************************************************************************/
ALTER TABLE	fp_player_retired
ADD CONSTRAINT player_retired_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_nationality
 *
 * DESC : Tabella contentente informazioni sulle nazionalità
 *        di un calciatore
 ******************************************************************************/
CREATE TABLE fp_nationality
(
	country_id	integer	NOT NULL,
	player_id	integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_nationality TABLE
 * NAME : pk_nationality
 *
 * DESC : Un calciatore non può essere associato più di una volta allo
 *        stesso paese
 ******************************************************************************/
ALTER TABLE fp_nationality
ADD CONSTRAINT pk_nationality
PRIMARY KEY
(
	country_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_nationality TABLE
 * NAME : nationality_fk_country
 *
 * DESC : La nazionalità di un calciatore fa riferimento al paese in questione
 ******************************************************************************/
ALTER TABLE	fp_nationality
ADD CONSTRAINT nationality_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES fp_country
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_nationality TABLE
 * NAME : nationality_fk_player
 *
 * DESC : La nazionalità di un calciatore fa riferimento al calciatore
 *        in questione
 ******************************************************************************/
ALTER TABLE	fp_nationality
ADD CONSTRAINT nationality_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_militancy
 *
 * DESC : Tabella contentente informazioni sulle militanze dei calciatori
 *        in una squadra di calcio per stagione calcistica
 *
 *        NOTA: una stagione riferita ad una militanza in una squadra di calcio
 *              di tipo club sarà sempre a cavallo di due anni consecutivi
 *              (es. 2000-2001), una stagione riferita ad una militanza in una
 *              squadra di calcio di tipo nazionale sarà riferita ad un anno
 *              (es. 2000)
 ******************************************************************************/
CREATE TABLE fp_militancy
(
	team_type		en_team		NOT NULL,
	team_id			integer		NOT NULL,
	player_id		integer		NOT NULL,
	start_year		dm_year		NOT NULL,
	type			en_season	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_militancy TABLE
 * NAME : pk_militancy
 *
 * DESC : Un calciatore non può militare nella stessa squadra di calcio
 *        più volte in uno stesso anno
 ******************************************************************************/
ALTER TABLE	fp_militancy
ADD CONSTRAINT pk_militancy
PRIMARY KEY
(
	team_id,
	player_id,
	start_year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_militancy TABLE
 * NAME : uq_militancy
 *
 * DESC : Un calciatore non può militare nella stessa tipologia di squadra
 *        di calcio nella stessa parte di una stagione calcistica
 ******************************************************************************/
ALTER TABLE	fp_militancy
ADD CONSTRAINT uq_militancy
UNIQUE
(
	team_type,
	player_id,
	start_year,
	type
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - ck_militancy TABLE
 * NAME : ck_militancy
 *
 * DESC : Una militanza di un calciatore in una squadra nazionale è annuale,
 *        mentre in una squadra di calcio di tipo club può anche essere di
 *        mezza stagione
 ******************************************************************************/
ALTER TABLE	fp_militancy
ADD CONSTRAINT ck_militancy
CHECK
(
	('NATIONAL' = team_type AND 'FULL' = type)
	OR
	team_type <> 'NATIONAL'
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_militancy TABLE
 * NAME : militancy_fk_team
 *
 * DESC : La squadra e il tipo di squadra di una militanza calcistica fanno
 *        riferimento alla squadra di calcio in questione
 ******************************************************************************/
ALTER TABLE	fp_militancy
ADD CONSTRAINT militancy_fk_team
FOREIGN KEY
(
	team_id,
	team_type
)
REFERENCES fp_team
(
	id,
	type
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_militancy TABLE
 * NAME : militancy_fk_player
 *
 * DESC : Il calciatore di una militanza calcistica fa riferimento
 *        al calciatore in questione
 ******************************************************************************/
ALTER TABLE	fp_militancy
ADD CONSTRAINT militancy_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_tag
 *
 * DESC : Tabella contentente informazioni sui tag che possono essere
 *        associati ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_tag
(
	id			serial			NOT NULL,
	type		en_feature		NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_description
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_tag TABLE 
 * NAME : pk_tag
 *
 * DESC : Non possono esistere tag diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_tag
ADD CONSTRAINT pk_tag
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_tag TABLE
 * NAME : uq_tag_name
 *
 * DESC : Non possono esistere tag diversi con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_tag
ADD CONSTRAINT uq_tag_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_tag TABLE
 * NAME : uq_tag_description
 *
 * DESC : Non possono esistere tag diversi con la stessa descrizione
 ******************************************************************************/
ALTER TABLE	fp_tag
ADD CONSTRAINT uq_tag_description
UNIQUE
(
	description
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player_tag
 *
 * DESC : Tabella contentente informazioni sui tag associati
 *        ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_tag
(
	player_id	integer	NOT NULL,
	tag_id		integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_tag TABLE 
 * NAME : pk_player_tag
 *
 * DESC : Un calciatore può essere associato ad un tag al più una volta
 ******************************************************************************/
ALTER TABLE	fp_player_tag
ADD CONSTRAINT pk_player_tag
PRIMARY KEY
(
	player_id,
	tag_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_tag TABLE
 * NAME : player_tag_fk_player
 *
 * DESC : L'associazione di un calciatore ad un tag fa riferimento
 *        al calciatore in questione
 ******************************************************************************/
ALTER TABLE	fp_player_tag
ADD CONSTRAINT player_tag_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_tag TABLE
 * NAME : player_tag_fk_tag
 *
 * DESC : L'associazione di un calciatore ad un tag fa riferimento
 *        al tag in questione
 ******************************************************************************/
ALTER TABLE	fp_player_tag
ADD CONSTRAINT player_tag_fk_tag
FOREIGN KEY
(
	tag_id
)
REFERENCES fp_tag
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_position
 *
 * DESC : Tabella contentente informazioni sulle posizioni di gioco
 *        che un calciatore può assumere nel campo di gioco
 ******************************************************************************/
CREATE TABLE fp_position
(
	id		serial		NOT NULL,
	role	en_role		NOT NULL,
	code	dm_code		NOT NULL,
	name	dm_string	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_position TABLE
 * NAME : pk_position
 *
 * DESC : Non possono esistere posizioni di gioco diverse con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_position
ADD CONSTRAINT pk_position
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_position TABLE
 * NAME : uq_position_code
 *
 * DESC : Non possono esistere posizioni di gioco diverse con lo stesso codice
 ******************************************************************************/
ALTER TABLE	fp_position
ADD CONSTRAINT uq_position_code
UNIQUE
(
	code
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_position TABLE
 * NAME : uq_position_name
 *
 * DESC : Non possono esistere posizioni di gioco diverse con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_position
ADD CONSTRAINT uq_position_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player_position
 *
 * DESC : Tabella contentente informazioni sulle posizioni di gioco
 *        associate ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_position
(
	player_id	integer		NOT NULL,
	position_id	integer		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_position TABLE  
 * NAME : pk_player_position
 *
 * DESC : Un calciatore può essere associato ad una posizione di gioco
 *        al più una volta
 ******************************************************************************/
ALTER TABLE fp_player_position
ADD CONSTRAINT pk_player_position
PRIMARY KEY
(
	player_id,
	position_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_position TABLE 
 * NAME : player_position_fk_player
 *
 * DESC : L'associazione di un calciatore ad una posizione di gioco
 *        fa riferimento al calciatore in questione
 ******************************************************************************/
ALTER TABLE fp_player_position
ADD CONSTRAINT player_position_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_position TABLE
 * NAME : player_position_fk_position
 *
 * DESC : L'associazione di un calciatore ad una posizione di gioco
 *        fa riferimento al calciatore in questione
 ******************************************************************************/
ALTER TABLE fp_player_position
ADD CONSTRAINT player_position_fk_position
FOREIGN KEY
(
	position_id
)
REFERENCES fp_position
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_attribute
 *
 * DESC : Tabella contentente informazioni sugli attributi che
 *        possono essere associati ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_attribute
(
	id			serial			NOT NULL,
	type		en_feature		NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_description
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_attribute TABLE   
 * NAME : pk_attribute
 *
 * DESC : Non possono esistere attributi diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_attribute
ADD CONSTRAINT pk_attribute
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_attribute TABLE
 * NAME : uq_attribute_name
 *
 * DESC : Non possono esistere attributi diversi con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_attribute
ADD CONSTRAINT uq_attribute_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_attribute TABLE
 * NAME : uq_attribute_description
 *
 * DESC : Non possono esistere attributi diversi con la stessa descrizione
 ******************************************************************************/
ALTER TABLE	fp_attribute
ADD CONSTRAINT uq_attribute_description
UNIQUE
(
	description
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player_attribute
 *
 * DESC : Tabella contentente informazioni sugli attributi
 *        associati ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_attribute
(
	player_id		integer		NOT NULL,
	attribute_id	integer		NOT NULL,
	score			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_attribute TABLE  
 * NAME : pk_player_attribute
 *
 * DESC : Un calciatore può essere associato ad un attributo al più una volta
 ******************************************************************************/
ALTER TABLE fp_player_attribute
ADD CONSTRAINT pk_player_attribute
PRIMARY KEY
(
	player_id,
	attribute_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - fp_player_attribute TABLE  
 * NAME : ck_player_attribute
 *
 * DESC : Controllo che il punteggio sia minore o uguale di 100
 ******************************************************************************/
ALTER TABLE fp_player_attribute
ADD CONSTRAINT ck_player_attribute
CHECK
(
	score <= 100
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_attribute TABLE
 * NAME : player_attribute_fk_player
 *
 * DESC : L'associazione di un calciatore ad un attributo
 *        fa riferimento al calciatore in questione
 ******************************************************************************/
ALTER TABLE fp_player_attribute
ADD CONSTRAINT player_attribute_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_attribute TABLE
 * NAME : player_attribute_fk_attribute
 *
 * DESC : L'associazione di un calciatore ad un attributo
 *        fa riferimento all'attributo in questione
 ******************************************************************************/
ALTER TABLE fp_player_attribute
ADD CONSTRAINT player_attribute_fk_attribute
FOREIGN KEY
(
	attribute_id
)
REFERENCES fp_attribute
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_statistic
 *
 * DESC : Tabella contentente informazioni sulle statistiche che
 *        possono essere associate ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_statistic
(
	id			serial			NOT NULL,
	goalkeeper	boolean 		NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_description
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_statistic TABLE  
 * NAME : pk_statistic
 *
 * DESC : Non possono esistere statistiche diverse con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_statistic
ADD CONSTRAINT pk_statistic
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_statistic TABLE
 * NAME : uq_statistic_name
 *
 * DESC : Non possono esistere statistiche diverse con lo stesso nome
 ******************************************************************************/
ALTER TABLE	fp_statistic
ADD CONSTRAINT uq_statistic_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_statistic TABLE
 * NAME : uq_statistic_description
 *
 * DESC : Non possono esistere statistiche diverse con la stessa descrizone
 ******************************************************************************/
ALTER TABLE	fp_statistic
ADD CONSTRAINT uq_statistic_description
UNIQUE
(
	description
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_trophy
 *
 * DESC : Tabella contentente informazioni sui trofei calcistici
 ******************************************************************************/
CREATE TABLE fp_trophy
(
	id			serial		NOT NULL,
	type		en_award	NOT NULL,
	role		en_role				,
	name		dm_string	NOT NULL,
	description	dm_string
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_trophy TABLE  
 * NAME : pk_trophy
 *
 * DESC : Non possono esistere trofei calcistici diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_trophy
ADD CONSTRAINT pk_trophy
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_trophy TABLE
 * NAME : uq_trophy_name
 *
 * DESC : Non possono esistere trofei calcistici diversi con lo stesso nome
 ******************************************************************************/
ALTER TABLE fp_trophy
ADD CONSTRAINT uq_trophy_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_trophy TABLE
 * NAME : ck_trophy
 *
 * DESC : I trofei di squadra non devono essere associati ad alcun ruolo
 ******************************************************************************/
ALTER TABLE fp_trophy
ADD CONSTRAINT ck_trophy
CHECK
(
	type <> 'TEAM'
	OR
	('TEAM' = type AND role IS NULL)
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_trophy TABLE
 * NAME : uq_trophy_description
 *
 * DESC : Non possono esistere trofei calcistici diversi
 *        con la stessa descrizione
 ******************************************************************************/
ALTER TABLE fp_trophy
ADD CONSTRAINT uq_trophy_description
UNIQUE
(
	description
);
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_team_trophy_case
 *
 * DESC : Tabella contentente informazioni sui trofei calcistici
 *        vinti da una squadra di calcio
 ******************************************************************************/
CREATE TABLE fp_team_trophy_case
(
	team_id			integer		NOT NULL,
	trophy_id		integer		NOT NULL,
	start_year		dm_year		NOT NULL,
	competition_id	integer		NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_team_trophy_case TABLE
 * NAME : pk_team_trophy_case
 *
 * DESC : Una squadra di calcio può vincere il trofeo associato
 *        ad un'edizione di una competizione calcistica al più una volta
 ******************************************************************************/
ALTER TABLE	fp_team_trophy_case
ADD CONSTRAINT pk_team_trophy_case
PRIMARY KEY
(
	team_id,
	trophy_id,
	start_year,
	competition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team_trophy_case TABLE
 * NAME : team_trophy_case_fk_partecipation
 *
 * DESC : Un trofeo calcistico vinto da una squadra di calcio fa
 *        riferimento alla partecipazione della suddetta squadra
 *        all'edizione della competizione calcistica cui è associato
 *        il trofeo vinto
 ******************************************************************************/
ALTER TABLE	fp_team_trophy_case
ADD CONSTRAINT team_trophy_case_fk_partecipation
FOREIGN KEY
(
	start_year,
	competition_id,
	team_id
)
REFERENCES fp_partecipation
(
	start_year,
	competition_id,
	team_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team_trophy_case TABLE
 * NAME : team_trophy_case_fk_trophy
 *
 * DESC : Un trofeo calcistico vinto da una squadra di calcio fa
 *        riferimento al trofeo in questione
 ******************************************************************************/
ALTER TABLE	fp_team_trophy_case
ADD CONSTRAINT team_trophy_case_fk_trophy
FOREIGN KEY
(
	trophy_id
)
REFERENCES fp_trophy
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player_trophy_case
 *
 * DESC : Tabella contentente informazioni sui trofei calcistici
 *        vinti da un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_trophy_case
(
	player_id		integer NOT NULL,
	team_id			integer	NOT NULL,
	trophy_id		integer	NOT NULL,
	start_year		dm_year	NOT NULL,
	competition_id	integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : pk_player_trophy_case
 *
 * DESC : Un calciatore che milita in una squadra di calcio può vincere
 *        il trofeo associato ad un'edizione di una competizione calcistica
 *        al più una volta
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT pk_player_trophy_case
PRIMARY KEY
(
	player_id,
	team_id,
	trophy_id,
	start_year,
	competition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : player_trophy_case_fk_militancy
 *
 * DESC : Un trofeo calcistico vinto da un calciatore fa riferimento
 *        alla militanza del calciatore nella squadra di calcio
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT player_trophy_case_fk_militancy
FOREIGN KEY
(
	player_id,
	team_id,
	start_year
)
REFERENCES fp_militancy
(
	player_id,
	team_id,
	start_year
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : player_trophy_case_fk_partecipation
 *
 * DESC : Un trofeo calcistico vinto da un calciatore fa riferimento
 *        alla partecipazione della squadra di calcio all'edizione
 *        della competizione calcistica cui è associato il trofeo vinto
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT player_trophy_case_fk_partecipation
FOREIGN KEY
(
	start_year,
	competition_id,
	team_id
)
REFERENCES fp_partecipation
(
	start_year,
	competition_id,
	team_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : player_trophy_case_fk_trophy
 *
 * DESC : Un trofeo calcistico vinto da un calciatore che fa riferimento
 *        al trofeo calcistico in questione
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT player_trophy_case_fk_trophy
FOREIGN KEY
(
	trophy_id
)
REFERENCES fp_trophy
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_prize
 *
 * DESC : Tabella contentente informazioni sui premi calcistici
 ******************************************************************************/
CREATE TABLE fp_prize
(
	id			serial			NOT NULL,
	type		en_award		NOT NULL,
	role		en_role					,
	name		dm_string		NOT NULL,
	description	dm_description			,
	given		dm_string		NOT NULL  -- ente che assegna il premio calcistico
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_prize TABLE
 * NAME : pk_prize
 *
 * DESC : Non possono esistere premi calcistici diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_prize
ADD CONSTRAINT pk_prize
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_prize TABLE
 * NAME : uq_prize_name
 *
 * DESC : Non possono esistere premi calcistici diversi con lo stesso nome
 ******************************************************************************/
ALTER TABLE fp_prize
ADD CONSTRAINT uq_prize_name
UNIQUE
(
	name
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_prize TABLE
 * NAME : uq_prize_description
 *
 * DESC : Non possono esistere premi calcistici diversi
 *        con la stessa descrizione
 ******************************************************************************/
ALTER TABLE fp_prize
ADD CONSTRAINT uq_prize_description
UNIQUE
(
	description
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_prize TABLE
 * NAME : ck_prize
 *
 * DESC : I premi di squadra non devono essere associati ad alcun ruolo
 ******************************************************************************/
ALTER TABLE fp_prize
ADD CONSTRAINT ck_prize
CHECK
(
	type <> 'TEAM'
	OR
	('TEAM' = type AND role IS NULL)
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_team_prize_case
 *
 * DESC : Tabella contentente informazioni sui premi calcistici
 *        vinti da una squadra di calcio
 ******************************************************************************/
CREATE TABLE fp_team_prize_case
(
	team_id		integer	NOT NULL,
	prize_id	integer	NOT NULL,
	assign_year	dm_year	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_team_prize_case TABLE
 * NAME : pk_team_prize_case
 *
 * DESC : Una squadra di calcio può vincere un premio calcistico in un anno
 *        al più una volta
 ******************************************************************************/
ALTER TABLE fp_team_prize_case
ADD CONSTRAINT pk_team_prize_case
PRIMARY KEY
(
	team_id,
	prize_id,
	assign_year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team_prize_case TABLE
 * NAME : team_prize_case_fk_prize
 *
 * DESC : Un premio calcistico vinto da una squadra di calcio fa riferimento
 *        al premio in questione
 ******************************************************************************/
ALTER TABLE fp_team_prize_case
ADD CONSTRAINT team_prize_case_fk_prize
FOREIGN KEY
(
	prize_id
)
REFERENCES fp_prize
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team_prize_case TABLE
 * NAME : team_prize_case_fk_team
 *
 * DESC : Un premio calcistico vinto da una squadra di calcio fa riferimento
 *        alla squadra in questione
 ******************************************************************************/
ALTER TABLE fp_team_prize_case
ADD CONSTRAINT team_prize_case_fk_team
FOREIGN KEY
(
	team_id
)
REFERENCES fp_team
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_player_prize_case
 *
 * DESC : Tabella contentente informazioni sui premi calcistici
 *        vinti da un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_prize_case
(
	player_id	integer	NOT NULL,
	prize_id	integer	NOT NULL,
	assign_year	dm_year	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_prize_case TABLE
 * NAME : pk_player_prize_case
 *
 * DESC : Una calciatore può vincere un premio calcistico in un anno
 *        al più una volta
 ******************************************************************************/
ALTER TABLE fp_player_prize_case
ADD CONSTRAINT pk_player_prize_case
PRIMARY KEY
(
	player_id,
	prize_id,
	assign_year
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_prize_case TABLE
 * NAME : player_prize_case_fk_player
 *
 * DESC : Un premio calcistico vinto da un calciatore fa riferimento
 *        al calciatore in questione
 ******************************************************************************/
ALTER TABLE fp_player_prize_case
ADD CONSTRAINT player_prize_case_fk_player
FOREIGN KEY
(
	player_id
)
REFERENCES fp_player
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_prize_case TABLE
 * NAME : player_prize_case_fk_prize
 *
 * DESC : Un premio calcistico vinto da un calciatore fa riferimento
 *        al premio in questione
 ******************************************************************************/
ALTER TABLE fp_player_prize_case
ADD CONSTRAINT player_prize_case_fk_prize
FOREIGN KEY
(
	prize_id
)
REFERENCES fp_prize
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_play
 *
 * DESC : Tabella contentente informazioni sul gioco di un calciatore in
 *        un'edizione di una competizione calcistica e in una squadra di calcio
 *
 *        NOTA: per non appesantire la notazione ci riferiremo a tale
 *               concetto come "gioco" 
 ******************************************************************************/
CREATE TABLE fp_play
(
	id				serial		NOT NULL,
	start_year		dm_year		NOT NULL,
	competition_id	integer		NOT NULL,
	team_id			integer		NOT NULL,
	player_id		integer		NOT NULL,
	match			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_play TABLE  
 * NAME : pk_play
 *
 * DESC : Non possono esistere giochi diversi con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT pk_play
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_play TABLE  
 * NAME : uq_play
 *
 * DESC : Un calciatore può giocare al più una volta per ogni edizione di
 *        una competizione calcistica in una squadra di calcio
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT uq_play
UNIQUE
(
	start_year,
	competition_id,
	team_id,
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - ck_play TABLE  
 * NAME : ck_play
 *
 * DESC : Il numero di presenze di un calciatore in un gioco
 *        deve essere maggiore di zero
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT ck_play
CHECK
(
	match > 0
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_play TABLE  
 * NAME : play_fk_partecipation
 *
 * DESC : Un gioco fa riferimento alla partecipazione della squadra di calcio
 *        in questione nell'edizione della competizione calcistica in questione
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT play_fk_partecipation
FOREIGN KEY
(
	start_year,
	competition_id,
	team_id
)
REFERENCES fp_partecipation
(
	start_year,
	competition_id,
	team_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_play TABLE  
 * NAME : play_fk_militancy
 *
 * DESC : Un gioco fa riferimento alla militanza del calciatore in questione
 *        nella squadra di calcio in questione
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT play_fk_militancy
FOREIGN KEY
(
	start_year,
	team_id,
	player_id
)
REFERENCES fp_militancy
(
	start_year,
	team_id,
	player_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_play_statistic
 *
 * DESC : Tabella contentente informazioni sulle statistiche associate
 *        ad un gioco
 ******************************************************************************/
CREATE TABLE fp_play_statistic
(
	play_id			integer		NOT NULL,
	statistic_id	integer		NOT NULL,
	score			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_play_statistic TABLE  
 * NAME : pk_play_statistic
 *
 * DESC : Un gioco può essere associato al più una volta ad una statistica
 ******************************************************************************/
ALTER TABLE fp_play_statistic
ADD CONSTRAINT pk_play_statistic
PRIMARY KEY
(
	play_id,
	statistic_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_play_statistic TABLE
 * NAME : play_statistic_fk_play
 *
 * DESC : L'associazione di un gioco ad una statistica
 *        fa riferimento al gioco in questione
 ******************************************************************************/
ALTER TABLE fp_play_statistic
ADD CONSTRAINT play_statistic_fk_play
FOREIGN KEY
(
	play_id
)
REFERENCES fp_play
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_play_statistic TABLE
 * NAME : play_statistic_fk_statistic
 *
 * DESC : L'associazione di un gioco ad una statistica
 *        fa riferimento alla statistica in questione
 ******************************************************************************/
ALTER TABLE fp_play_statistic
ADD CONSTRAINT play_statistic_fk_statistic
FOREIGN KEY
(
	statistic_id
)
REFERENCES fp_statistic
(
	id
)
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_user_account
 *
 * DESC : Tabella contentente informazioni sugli account utente
 *        che possono utilizzare l'applicativo connesso al database
 ******************************************************************************/
CREATE TABLE fp_user_account
(
	username	dm_username	NOT NULL,
	password	dm_password	NOT NULL,
	priviledge	dm_usint	NOT NULL  -- livello di privilegio dell'utente				
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_user_account TABLE
 * NAME : pk_user_account
 *
 * DESC : Non possono esistere account utente diversi con lo stesso username
 ******************************************************************************/
ALTER TABLE	fp_user_account
ADD CONSTRAINT pk_user_account
PRIMARY KEY
(
	username
);
--------------------------------------------------------------------------------

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
 * FUNCTION POST SCHEMA                                              
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : min_age
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'età minima per un calciatore.
 *
 *        NOTA: valore arbitrario ma ottenuto grazie a numerose ricerche
 *              (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION min_age
(
)
RETURNS integer
AS
$$
DECLARE

	min_age	integer;

BEGIN

	min_age = 15;
				
	RETURN min_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_age
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'età massima per un calciatore.
 *
 *        NOTA: valore arbitrario ma ottenuto grazie a numerose ricerche
 *              (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_age
(
)
RETURNS integer
AS
$$
DECLARE

	max_age	integer;

BEGIN

	max_age = 50;
				
	RETURN max_age;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : min_militancy_year
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'anno di inizio della prima militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION min_militancy_year
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
DECLARE

	min_year	integer;

BEGIN

	min_year = NULL;

	SELECT
		min(start_year)
	INTO
		min_year
	FROM
		fp_militancy
	WHERE
		player_id = id_player;

	
	RETURN min_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_militancy_year
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce l'anno di inizio dell'ultima militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_militancy_year
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
DECLARE

	max_year	integer;

BEGIN

	max_year = NULL;

	SELECT
		max(start_year)
	INTO
		max_year
	FROM
		fp_militancy
	WHERE
		player_id = id_player;

	
	RETURN max_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : valid_year_range
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : integer, integer
 * RETURNS : record
 *
 * DESC : Funzione che calcola e restituisce il range di anni validi per un
 *        calciatore.
 *
 *        NOTA: Per anno valido si intende un anno nel quale un calciatore
 *              può militare in una squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_year_range
(
	IN	id_player	integer,
	OUT	s_valid		integer,	-- inizio range anni validi
	OUT	e_valid		integer		-- fine range anni validi
)
RETURNS record
AS
$$
DECLARE

	tmp				text;

	year_dob		integer;
	year_retired	integer;

BEGIN

	tmp = get_column('fp_player', 'dob', id_player);
	year_dob = extract(year from CAST(tmp AS date));

	s_valid = year_dob + min_age();

	
	IF (is_retired(id_player)) THEN

		tmp = get_column('fp_player_retired', 'retired_date', id_player);
		year_retired = extract(year from CAST(tmp AS date));

		e_valid = year_dob + year_retired - 1;

	ELSE

		e_valid = year_dob + max_age();
	
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_retired
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore si sia ritirato o meno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_retired
(
	IN	id_player	integer
)
RETURNS boolean
AS
$$
BEGIN
				
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_player_retired
		WHERE
			player_id = id_player
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_national
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha mai giocato in nazionale
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_national
(
	IN	id_player	integer
)
RETURNS boolean
AS
$$
BEGIN
				
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = 'NATIONAL'
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_team
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce la squadra nazionale per la quale un
 *        calciatore ha giocato
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_team
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
DECLARE

	id_team	integer;

BEGIN

	id_team = NULL;
				
	
	SELECT
		team_id
	INTO
		id_team
	FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'NATIONAL'
	LIMIT
		1;


	RETURN id_team;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha militanze in squadre du calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_militancy
(
	IN	id_player	integer
)
RETURNS boolean
AS
$$
DECLARE

	has	boolean;

BEGIN
			
	SELECT
		count(*) >= 1
	INTO
		has
	FROM
		fp_militancy
	WHERE
		player_id = id_player;
	

	IF (NOT has) THEN
		RAISE NOTICE 'Player (id = %) does not have any militancy', id_player;
	END IF;

	RETURN has;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_attributes
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce gli attributi di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_attributes
(
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_attribute
		WHERE
			type = 'GOALKEEPER';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_tags
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i tag di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_tags
(
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_tag
		WHERE
			type = 'GOALKEEPER';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : gk_statistics
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce le statistiche di tipo portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION gk_statistics
(
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_statistic
		WHERE
			goalkeeper = TRUE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_play
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i giochi di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_play
(
	id_player	integer
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_play
		WHERE
			player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : not_role_trophy
 *
 * IN      : en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i trofei individuali che non hanno un
 *        ruolo compatibile con la combinazione di ruoli in input
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION not_role_trophy
(
	role_player	en_role_mix
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_trophy
		WHERE
			type = 'PLAYER'
			AND
			role IS NOT NULL
			AND
			0 = position(CAST(role AS text) in CAST(role_player AS text));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : not_role_prize
 *
 * IN      : en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce i premi individuali che non hanno un
 *        ruolo compatibile con la combinazione di ruoli in input
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION not_role_prize
(
	role_player	en_role_mix
)
RETURNS SETOF integer
AS
$$
BEGIN
				
	RETURN QUERY
		SELECT
			id
		FROM
			fp_prize
		WHERE
			type = 'PLAYER'
			AND
			role IS NOT NULL
			AND
			0 = position(CAST(role AS TEXT) in CAST(role_player AS text));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_gk_attribute
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le associazioni ad attributi di tipo
 *        portiere di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_gk_attribute
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
			fp_player_attribute
		WHERE
			player_id = id_player
			AND
			attribute_id IN
							(
								SELECT
									*
								FROM
									gk_attributes()
							);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_gk_statistic
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le associazioni a statistiche di tipo
 *        portiere di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_gk_statistic
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
			fp_play_statistic
		WHERE
			play_id IN
						(
							SELECT
								*
							FROM
								player_play(id_player)
						
						)
			AND
			statistic_id IN 
							(
								SELECT
									*
								FROM
									gk_statistics()
							);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_gk_tag
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le associazioni a tag di tipo
 *        portiere di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_gk_tag
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_player_tag
	WHERE
		player_id = id_player
		AND
		tag_id IN
					(
						SELECT
							*
						FROM
							gk_tags()
					);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_not_role_prize
 *
 * IN      : integer, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutti i premi individuali non compatibili
 *        con i ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_not_role_prize
(
	id_player	integer,
	role_player	en_role
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_player_prize_case
	WHERE
		player_id = id_player
		AND
		prize_id IN
					(
						SELECT
							*
						FROM
							not_role_prize(role_player)
					);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_not_role_trophy
 *
 * IN      : integer, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutti i trofei individuali non compatibili
 *        con i ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_not_role_trophy
(
	id_player	integer,
	role_player	en_role
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_player_trophy_case
	WHERE
		player_id = id_player
		AND
		trophy_id IN
					(
						SELECT
							*
						FROM
							not_role_trophy(role_player)
					);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_club_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le militanze in una squadra
 *        di tipo club di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_club_militancy
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'CLUB';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_national_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le militanze in una squadra
 *        di tipo nazionale di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_national_militancy
(
	id_player	integer
)
RETURNS void
AS
$$
BEGIN
				
	DELETE FROM
		fp_militancy
	WHERE
		player_id = id_player
		AND
		team_type = 'NATIONAL';
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_be_inside
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un paese può essere contenuto in un altro
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_be_inside
(
	IN	id_in_country		integer,	-- paese contenuto
	IN	id_super_country	integer		-- paese contenente
)
RETURNS boolean
AS
$$
DECLARE

	tmp					text;

	type_in_country		en_country;
	type_super_country	en_country;
	
BEGIN
				
	tmp = get_column('fp_country', 'type', id_in_country);
	type_in_country = CAST(tmp AS en_country);

	tmp = get_column('fp_country', 'type', id_super_country);
	type_super_country = CAST(tmp AS en_country);

	IF
	(
		('NATION' = type_in_country AND 'CONTINENT' = type_super_country)
		OR
		('CONTINENT' = type_in_country AND 'WORLD' = type_super_country)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RAISE NOTICE 'Country (id = %) cannot be inside of country (id = %)', id_in_country, id_super_country;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un paese è di una nazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN	id_country	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	type_country	en_country;

BEGIN
	
	tmp = get_column('fp_country', 'type', id_country);
	type_country = CAST(tmp AS en_country);

	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	END IF;
	

	RAISE NOTICE 'Country (id =  %) is not a nation', id_country;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_years_comp_ed
 *
 * IN      : integer, smallint, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se l'anno di inizio e fine di un'edizione di
 *        una competizione calcistica sono corretti.
 *
 *        NOTA: abbiamo effettuato una semplificazione che è basata
 *              sull'analisi di numerose competizioni (Wikipidia, Transermarkt).
 *              Un campionato è sempre a cavallo di due anni.
 *              Una supercoppa sempre svolta in un solo anno.
 *              Un torneo per club a cavallo di due anni, un torneo per
 *              nazionali sempre svolto in un solo anno.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_years_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint,	-- anno inizio
	IN	e_year	smallint	-- anno fine
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	type_comp		en_competition;
	team_type_comp	en_team;

BEGIN
	
	tmp = get_column('fp_competition', 'type', id_comp);
	type_comp = CAST(tmp AS en_competition);

	IF ('LEAGUE' = type_comp) THEN
	
		IF (1 = e_year - s_year) THEN
			RETURN TRUE;
		END IF;
	
	ELSIF ('SUPER CUP' = type_comp) THEN
	
		IF (0 = e_year - s_year) THEN
			RETURN TRUE;
		END IF;
	
	ELSIF ('CUP' = type_comp) THEN
		
		tmp = get_column('fp_competition', 'team_type', id_comp);
		team_type_comp = CAST(tmp AS en_team);

		IF ('NATIONAL' = team_type_comp) THEN

			IF (0 = e_year - s_year) THEN
				RETURN TRUE;
			END IF;
		
		ELSIF ('CLUB' = team_type_comp) THEN

			IF (1 = e_year - s_year) THEN
				RETURN TRUE;
			END IF;
		
		END IF;
	END IF;


	RAISE NOTICE 'Competition (id =  %) cannot have edition start in % and end in %', id_comp, s_year, e_year;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_edition
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che dato in input l'id di una competizione calcistica valuta
 *        se essa ha edizioni nel database
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_edition
(
	IN	id_comp	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	have	boolean;

BEGIN
	
	have = FALSE;

	SELECT
		count(*) >= 1
	INTO
		have
	FROM
		fp_competition_edition
	WHERE
		competition_id = id_comp;


	IF (NOT have) THEN
		RAISE NOTICE 'Competition (id =  %) does not have editions', id_comp;
	END IF;

	RETURN have;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_freq
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una competizione calcistica può avere
 *        un'edizione che inizia in un determinato anno, rispetto alla
 *        sua frequenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_freq
(
	IN	id_comp	integer,
	IN	s_year	smallint	-- anno di inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;

	freq	integer;
	a_year	integer;	-- un anno di inizio di un'edizione
	
BEGIN
	
	tmp = get_column('fp_competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	-- se la frequenza della competizione calcistica è annnuale o irregolare
	IF (freq <= 1) THEN
		RETURN TRUE;
	-- altrimenti
	ELSE

		-- seleziono un anno di inizio di una qualsiasi edizione
		-- della competizione calcistica
		SELECT
			start_year
		INTO
			a_year
		FROM
			fp_competition_edition
		WHERE
			competition_id = id_comp
		LIMIT
			1;

		-- ...e valuto se l'anno di inizio in input è accettabile
		-- rispetto alla frequenza della competizione calcistica
		IF (0 = ((s_year - a_year) % freq)) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	RAISE NOTICE 'Competition (id =  %) cannot start in year %, bad frequency', id_comp, s_year;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : belong_to
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio appartiene ad una
 *        confederazione calcistica membro di un'altra confederazione.
 *        
 *        NOTA: Per non appesantire eccessivamente la notazione in questa
 *              funzione useremo impropriamente il nome di variabile "type_conf"
 *              per denotare il tipo del paese associato alla confederazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to
(
	IN	id_team	integer,
	IN	id_conf	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp					text;

	type_conf			en_country;

	id_country			integer;

	id_conf_to_check	integer;
	
BEGIN

	-- prendo il tipo del paese associato alla confederazione membro
	tmp = get_column('fp_confederation', 'id_country', id_conf);
	id_country = CAST(tmp AS integer);					
	tmp = get_column('fp_country', 'type', id_country);
	type_conf = CAST(tmp AS en_country);

	-- prendo la confederazione calcistica associata alla squadra di calcio
	tmp = get_column('fp_team', 'confederation_id', id_team);
	id_conf_to_check = CAST(tmp AS integer);

	-- se la confederazione in input è nazionale
	IF ('NATION' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;

	-- prendo la confederazione calcistica contenente quella
	-- associata alla squadra di calcio
	tmp = get_column('fp_confederation', 'super_id', id_conf_to_check);
	id_conf_to_check = CAST(tmp AS integer);
	
	-- se la confederazione in input è continentale
	IF ('CONTINENT' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	-- prendo la confederazione calcistica che contiene quella contenente quella
	-- associata alla squadra di calcio
	tmp = get_column('fp_confederation', 'super_id', id_conf_to_check);
	id_conf_to_check = CAST(tmp AS integer);
	
	-- se la confederazione in input è mondiale
	IF ('WORLD' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;
	

	RAISE NOTICE 'Team (id =  %) does not belong to confederation (id = %)', id_team, id_conf;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : tot_team_comp_ed
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce il numero di team che possono partecipare
 *        ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tot_team_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint	-- anno inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tot_team	integer;

BEGIN

	tot_team = NULL;

	SELECT
		total_team
	INTO
		tot_team
	FROM
		fp_competition_edition
	WHERE
		competition_id = id_comp
		AND
		start_year = s_year;


	RETURN tot_team;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_place
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un'edizione di una competizione calcistica
 *        ha ancora posti a disposizione per squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_place
(
	IN	id_comp	integer,
	IN	s_year	smallint
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tot_team	integer;

	have		boolean;

BEGIN
	
	tot_team = tot_team_comp_ed(id_comp, s_year);

	have = FALSE;

	SELECT
		count(*) < tot_team
	INTO
		have
	FROM
		fp_partecipation
	WHERE
		competition_id = id_comp
		AND
		start_year = s_year;


	IF (NOT have) THEN
		RAISE NOTICE 'Competition (id = %) start year (%)'
			'does not have place', id_comp, s_year;
	END IF;

	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : role_fit_positions
 *
 * IN      : integer, en_role_mix
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha posizioni compatibili con
 *        una combinazione di ruoli
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION role_fit_positions
(
	IN	id_player	integer,
	IN	role_player	en_role_mix
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	pos_player	integer;
	role_pos	en_role;

BEGIN
	
	-- per ogni posizione associata al giocatore
	FOR pos_player
	IN
		SELECT
			position_id
		FROM
			fp_player_position
		WHERE
			player_id = id_player

	LOOP

		tmp = get_column('fp_position', 'role', pos_player);
		role_pos = CAST(tmp AS en_role);	-- conversione superflua ma effettuata per coerenza

		IF (0 = position(CAST(role_pos AS text) IN CAST(role_player AS text))) THEN
			RAISE NOTICE 'Player (id =  %) does not have role %', id_player, role_pos;
			RETURN TRUE;
		END IF;

	END LOOP;

	
	RETURN TRUE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : militancy_in
 *
 * IN      : integer, integer 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha una militanza in una squadra
 ******************************************************************************/
CREATE OR REPLACE FUNCTION militancy_in
(
	IN	id_player	integer,
	IN	id_team		integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	SELECT
		count(*) >= 1
	FROM
		fp_militancy
	WHERE
		team_id = id_team
		AND
		player_id = id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : pos_fit_stat
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una posizione del campo di gioco è
 *        associabile ad una statistica.
 *
 *        NOTA: Considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione è associabile ad una statistica
 *              se e soltanto se il ruolo della posizione è una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION pos_fit_stat
(
	IN	id_pos	integer,
	IN	id_stat	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	role_pos	en_role;
	type_stat	en_feature;

BEGIN
	
	tmp = get_column('fp_position', 'role', id_pos);
	role_pos = CAST(tmp AS en_role);

	tmp = get_column('fp_statistic', 'type', id_stat);
	type_stat = CAST(tmp AS en_feature);

	IF (position(CAST(role_pos AS text) in CAST(type_stat AS text)) > 0) THEN
		RETURN TRUE;
	END IF;

	RAISE NOTICE 'Position (id = %) cannot be associated with statistic (id = %)', id_pos, id_stat;
	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_comp
 *
 * IN      : integer, integer 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio è compatibile con
 *        una competizione calcistica
 *
 *        NOTA: una squadra di calcio è compatibile con una competizione
 *              calcistica se è dello stesso tipo del tipo di squadre che
 *              possono partecipare alla suddetta competizione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_comp
(
	IN	id_team	integer,
	IN	id_comp	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	type_team		en_team;
	type_team_comp	en_team;

BEGIN

	tmp = get_column('fp_team', 'type', id_team);
	type_team = CAST(tmp AS en_team);

	tmp = get_column('fp_competition', 'team_type', id_comp);
	type_team_comp = CAST(tmp AS en_team);


	IF (type_team = type_team_comp) THEN
		RETURN TRUE;
	ELSE
		RAISE NOTICE 'Team (id = %) is not compatible to competition (id = %)', id_team, id_comp;
		RETURN FALSE;
	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_tot_team
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se il numero massimo di squadre di calcio che
 *        possono partecipare ad una competizione calcistica sia coerente
 *        con il tipo di competizione.
 *
 *        NOTE: I valori limite sono arbitrari ma ottenuti grazie a numerose
 *              ricerche (su Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_tot_team
(
	IN	id_comp		integer,
	IN	tot_team	smallint
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	id_conf			integer;

	id_country		integer;

	type_country	en_country;
	type_comp		en_competition;
	
BEGIN
	
	tmp = get_column('fp_competition', 'type', id_comp);
	type_comp = CAST(tmp AS en_competition);

	-- se la competizione calcistica è una supercoppa
	IF ('SUPER CUP' = type_comp) THEN
		-- al massimo sono possibili 6 squadre partecipanti
		IF (tot_team <= 6) THEN
			RETURN TRUE;
		END IF;
	-- se la competizione calcistica è un campionato
	ELSIF ('LEAGUE' = type_comp) THEN
		-- al massimo sono possibili 50 squadre partecipanti
		IF (tot_team <= 50) THEN
			RETURN TRUE;
		END IF;
	-- se la competizione calcistica è un torneo
	ELSIF ('CUP' = type_comp) THEN

		tmp = get_column('fp_competition', 'confederation_id', id_comp);
		id_conf = CAST(tmp_text AS integer);

		tmp = get_column('fp_confederation', 'country_id', id_conf);
		id_country = CAST(tmp_text AS integer);

		tmp = get_column('fp_country', 'type', id_country);
		type_country = CAST(tmp AS en_country);

		-- se si tratta di una coppa nazionale
		IF ('NATION' = type_country) THEN
			-- è una competizione ad eliminazione diretta
			-- e il numero di partecipanti deve essere una potenza di 2
			IF (floor(log(2, tot_team)) = ceil(log(2, tot_team))) THEN
				RETURN TRUE;
			END IF;
		-- se si tratta di una coppa internazionale
		ELSE
			-- al massimo sono possibili 50 squadre partecipanti
			IF (tot_team <= 50) THEN
				RETURN TRUE;
			END IF;
		END IF;

	END IF;

	RAISE NOTICE 'Competition (id = %) has no correct total team number (%)', id_comp, tot_team;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce l'id di tutte le competizioni calcistiche
 *        simili a quella in input.
 *
 *        NOTA: Per simile si intende una competizione calcistica
 *              appartenente alla stessa confederazione calcistica,
 *              dello stesso tipo e alla quale possono partecipare
 *              lo stesso tipo di squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp
(
	IN	id_comp	integer
)
RETURNS SETOF integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp	record;

BEGIN
	
	rec_comp = get_record('fp_competition', id_comp);

	RETURN QUERY
		SELECT
			id
		FROM
			fp_competition
		WHERE
			type = rec_comp.type
			AND
			team_type = rec_comp.team_type
			AND
			confederation_id = rec_comp.confederation_id;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : similar_comp_ed
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (integer, integer)
 *
 * DESC : Funzione che restituisce l'id di tutte le edizione di competizioni
 *        calcistiche simili a quella in input.
 *
 *        NOTA: Per simile si intende una competizione calcistica simile
 *              che ha inizio nello stesso anno 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint
)
RETURNS TABLE
(
	competition_id	integer,
	start_year		integer
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			competition_id,
			start_year
		FROM
			fp_competition_edition
		WHERE
			start_year = s_year
			AND
			competition_id IN
							(
								SELECT
									*
								FROM
									similar_comp(id_comp)
							);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_take_part
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio può partecipare ad
 *        un'edizione di una competizione calcistica.
 *
 *        NOTA: Una squadra di calcio per ogni confederazione calcistica
 *              cui appartiene può partecipare solo ad un tipo di competizione
 *              per ogni stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_take_part
(
	IN	id_team	integer,
	IN	id_comp	integer,
	IN	s_year	smallint	-- anno inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	can			boolean;

	rec_comp_ed	record;

BEGIN
	
	can = FALSE;

	-- per ogni edizione simile di competizioni calcistiche
	FOR rec_comp_ed
	IN
		SELECT
			*
		FROM
			similar_comp_ed(id_comp, s_year)
	LOOP

		SELECT
			count(*) < 1
		INTO
			can
		FROM
			fp_partecipation
		WHERE
			team_id = id_team
			AND
			competition_id = rec_comp_ed.competition_id
			AND
			start_year = rec_comp_ed.start_year;
									
		-- se la squadra di calcio partecipa ad un'edizione simile
		IF (NOT can) THEN
			RAISE NOTICE 'Team (id = %) cannot partecipate'
				'to competition (id = %) start year (%)',
				id_team, id_comp, s_year;
			RETURN can;
		END IF;
	
	END LOOP;
		
	RETURN can;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_nationality
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha una certa nazionalità
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_nationality
(
	IN	id_player	integer,
	IN	id_country	integer
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	have	boolean;

BEGIN
	
	have = FALSE;

	SELECT
		count(*) >= 1
	INTO
		have
	FROM
		fp_nationality
	WHERE
		player_id = id_player
		AND
		country_id = id_country;
	

	IF (NOT have) THEN
		RAISE NOTICE 'Player (id = %) has not nationatity country (id = %)', id_player, id_country;
	END IF;

	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_age_limit
 *
 * IN      : date, date
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se la data di nascita e di ritiro di un
 *        calciatore rispettino i limiti di età da noi definiti.
 *
 *        NOTA: fare riferimento alle funzioni min_age e max_age
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_age_limit
(
	IN	birth_date		date,
	IN	retired_date	date
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	year_birth_date		integer;
	year_retired_date	integer;

BEGIN

	year_birth_date = extract(year from birth_date);
	year_retired_date = extract(year from retired_date);


	IF ((year_retired_date - year_birth_date) BETWEEN min_age() AND max_age()) THEN
		RETURN TRUE;
	END IF;


	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_militancy
 *
 * IN      : integer, en_team, smallint, en_season
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se in un certo anno un calciatore è disponibile
 *        per una nuova militanza di un certo tipo di squadra e di un certo tipo
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_militancy
(
	IN	id_player	integer,
	IN	type_team	en_team,
	IN	s_year		smallint,
	IN	type_year	en_season
)
RETURNS boolean
AS
$$
DECLARE

	free	boolean;

BEGIN

	free = FALSE;

	IF ('I PART' = type_year) THEN
	
		SELECT
			count(*) = 0
		INTO
			free
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = type_team
			AND
			start_year = s_year
			AND
			type IN ('I PART', 'FULL');
	
	ELSIF ('II PART' = type_year) THEN
	
		SELECT
			count(*) = 0
		INTO
			free
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = type_team
			AND
			start_year = s_year
			AND
			type IN ('II PART', 'FULL');

	ELSIF ('FULL' = type_year) THEN

		SELECT
			count(*) = 0
		INTO
			free
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = type_team
			AND
			start_year = s_year;
		
	END IF;


	IF (NOT free) THEN
		RAISE NOTICE 'Player (id = %) cannot have a militancy (type = %) starting in year % of type %', id_player, type_team, s_year, type;
	END IF;

	RETURN free;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : remove_all_trophy_season
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che rimuove tutti i trofei assegnati ad un calciatore
 *        nella sua militanza in una squadra in un certo anno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION remove_all_trophy_season
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS void
AS
$$
BEGIN

	DELETE FROM
		fp_player_trophy_case
	WHERE
		player_id = id_player
		AND
		team_id = id_team
		AND
		start_year = s_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : assign_all_trophy_season
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che assegna ad un calciatore tutti i trofei vinti da una
 *        squadra in un certo anno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION assign_all_trophy_season
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS void
AS
$$
DECLARE

	rec_team_trophy	record;

BEGIN

	FOR rec_team_trophy
	IN
		SELECT
			*
		FROM
			fp_team_trophy_case
		WHERE
			team_id = id_team
			AND
			start_year = s_year

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
			id_team,
			rec_team_trophy.trophy_id,
			s_year,
			rec_team_trophy.competition_id
		);

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : list_player_position
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF integer
 *
 * DESC : Funzione che restituisce tutte le posizioni di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION list_player_position
(
	IN	id_player	integer
)
RETURNS SETOF integer
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			position_id
		FROM
			fp_player_position
		WHERE
			player_id = id_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_role
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : en_role_mix
 *
 * DESC : Funzione che restituisce la combinazione di ruoli di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_role
(
	IN	id_player	integer
)
RETURNS en_role_mix
AS
$$
DECLARE

	tmp			text;	-- stringa temporanea per costruire il nuovo ruolo

	role_pos	en_role;
	role_player	en_role_mix;

BEGIN

	tmp = '';

	-- per ogni ruolo associato alle posizioni del calciatore
	-- in ordine di enum
	FOR role_pos
	IN
		SELECT DISTINCT
			role
		FROM
			fp_position
		WHERE
			id IN
				(
					SELECT
						*
					FROM
						list_player_position(id_player)
				)
		ORDER BY
			role

	LOOP

		-- aggiungi alla combinazione di ruoli del giocatore
		tmp = tmp || CAST(role_player AS text);
		tmp = tmp || '-';

	END LOOP;

	tmp = trim(tmp, '-');

	role_player = CAST(tmp AS en_role_mix);

	RETURN role_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : position_number
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce il numero di posizioni associate ad un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION position_number
(
	IN	id_player	integer
)
RETURNS integer
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*)
		FROM
			fp_player_position
		WHERE
			player_id = id_player
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_has_trophy
 *
 * IN      : integer, integer, smallint, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio ha vinto un trofeo
 *        associato ad un'edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_has_trophy
(
	IN	id_team		integer,
	IN	id_trophy	integer,
	IN	s_year		smallint,
	IN	id_comp		integer
)
RETURNS boolean
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			fp_team_trophy_case
		WHERE
			team_id = id_team
			AND
			trophy_id = id_trophy
			AND
			start_year = s_year
			AND
			competition_id = id_comp
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_type_militancy
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : en_season
 *
 * DESC : Funzione che restituisce il tipo di milianza dato in input
 *        un calciatore, una squadra di calcio e un anno di inzio militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_type_militancy
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS en_season
AS
$$
BEGIN

	RETURN
	(
		SELECT
			type
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_id = id_team
			AND
			start_year = s_year
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

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
 *        riga della tabella che ha scatenato il trigger non è referenziata
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


	-- se la squadra è associata ad una nazione
	-- e la confederazione associata alla squadra è associata alla stessa
	-- nazione della squadra
	IF (is_nation(NEW.country_id) AND NEW.country_id = id_country_conf) THEN

		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;

		-- se la squadra è di tipo nazionale deve avere lo stesso nome
		-- della nazione cui è associata		
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
			-- se esiste già un'edizione della competizione
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
		-- ..e la squadra è compatibile con la competizione
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
 *        nazionalità
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

	-- se il nuovo ruolo è compatibile con tutte le posizioni del calciatore
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

		born_year = extract(year from NEW.dob);

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

		PERFORM delete_gk_attribute(NEW.id);
		PERFORM delete_gk_statistic(NEW.id);
		PERFORM delete_gk_tag(NEW.id);

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
 * NAME : tf_bi_nationality
 *
 * DESC : Funzione che controlla che la nuova nazionalità da inserire sia
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
 * DESC : Funzione che dopo l'eliminazione di una nazionalità elimina
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
			PERFORM delete_national_militancy(OLD.player_id);
		END IF;

	END IF; 
	
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

	role_player	en_role_mix;

	id_country	integer;

BEGIN

	tmp = get_column('fp_player', 'role', NEW.player_id);
	role_player = CAST(tmp AS en_role_mix);

	-- il calciatore deve avere un ruolo
	IF (role_player IS NOT NULL) THEN

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
					RETURN NULL;
				END IF;

				IF (is_national(NEW.player_id)) THEN

					-- se è una militanza nazionale e il calciatore ha gia
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

	PERFORM assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	
	RETURN NULL;
	
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

	tmp			text;

	role_player	en_role_mix;
	role_tag	en_feature;

BEGIN

	tmp = get_column('fp_tag', 'role', NEW.tag_id);
	role_tag = CAST(tmp AS en_feature);
	
	IF ('GOALKEEPER' = role_tag) THEN
	
		tmp = get_column('fp_player', 'role', NEW.player_id);
		role_player = CAST(tmp AS en_role_mix);

		IF (CAST(role_player AS text) NOT LIKE '%GK%') THEN
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

	IF (role_player IS NULL OR role_player <> new_role_player) THEN
		
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

	tmp				text;

	role_player		en_role_mix;
	new_role_player	en_role_mix;

BEGIN

	new_role_player = new_role(OLD.player_id);


	tmp = get_column('fp_player', 'role', OLD.player_id);
	role_player = CAST(tmp AS en_role_mix);


	IF (role_player IS NULL OR role_player <> new_role_player) THEN
		
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

	tmp			text;

	role_player	en_role_mix;
	role_attr	en_feature;

BEGIN

	tmp = get_column('fp_attribute', 'role', NEW.attribute_id);
	role_attr = CAST(tmp AS en_feature);
	
	IF ('GOALKEEPER' = role_attr) THEN
	
		tmp = get_column('fp_player', 'role', NEW.player_id);
		role_player = CAST(tmp AS en_role_mix);

		IF (CAST(role_player AS text) NOT LIKE '%GK%') THEN
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
		trophy_id = OLD.id
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

	tmp = get_column('fp_trophy', 'type', NEW.trophy_id);
	type_trophy = CAST(tmp AS en_award);

	IF ('TEAM' = type_trophy) THEN

		type_militancy = get_type_militancy(NEW.player_id, NEW.team_id, NEW.start_year);
	
		-- se il trofeo è di squadra
		-- tale trofeo sarà eliminabile solo se la squadra non ha il trofeo
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

	tmp			text;

	type_prize	en_award;

BEGIN

	tmp = get_column('fp_prize', 'type', NEW.prize_id);
	type_prize = CAST(tmp AS en_award);

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
	role_player	en_role_mix;

BEGIN

	tmp = get_column('fp_statistic', 'goalkeeper', NEW.statistic_id);
	gk_stat = CAST(tmp AS boolean);

	
	IF (NOT gk_stat) THEN	
		RETURN NEW;
	
	ELSE

		tmp = get_column('fp_play', 'player_id', NEW.play_id);
		id_player = CAST(tmp AS integer);

		tmp = get_column('fp_player', 'role', id_player);
		role_player = CAST(tmp AS en_role_mix);

		IF (CAST(role_player AS text) LIKE '%GK%') THEN	
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

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.id);
	born_date = CAST(tmp AS date);

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		RETURN NULL;	
	END IF;
	

	IF (has_militancy(NEW.id)) THEN

		retired_year = extract(year from NEW.retired_date);
	
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

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.id);
	born_date = CAST(tmp AS date);

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		RETURN OLD;	
	END IF;
	

	IF (has_militancy(NEW.id)) THEN

		retired_year = extract(year from NEW.retired_date);
	
		IF (max_militancy_year(NEW.id) >= retired_year) THEN
			RETURN OLD;
		END IF;
	
	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

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
 * NAME : tg_bd_player_position
 *
 * DESC : Trigger che si attiverà prima dell'eliminazione dell'associazione
 *        tra un calciatore ed una posizione
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


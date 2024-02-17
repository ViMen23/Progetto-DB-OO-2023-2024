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
 * NAME : dm_attribute
 *
 * DESC : Dominio contenenete tutti i numeri interi da 0 a 10
 ******************************************************************************/
CREATE DOMAIN dm_attribute AS smallint
CHECK
(
	value BETWEEN 0 AND 10
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
	'SUPER_CUP'
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
	'GK_DF',
	'GK_MF',
	'GK_FW',
	'DF_MF',
	'DF_FW',
	'MF_FW',
	'GK_DF_MF',
	'GK_DF_FW',
	'GK_MF_FW',
	'DF_MF_FW',
	'GK_DF_MF_FW'
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
	'I_PART',	-- solo prima parte di stagione
	'II_PART',	-- solo seconda parte di stagione
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
 * NAME : get_from_condition
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Funzione che preso in input un separatore, il nome di una tabella e
 *        un record di una riga della tabella in input costruisce mediante
 *        SQL dinamico la stringa che poi potrà essere data in input alle
 *        funzioni "get_column", "get_record", "row_exists" (vedi dopo).
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
 *        costruire la stringa desiderata.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_from_condition
(
	IN	separator		text,
	IN	input_string	text
)
RETURNS text
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
	
	from_condition	text;
	
BEGIN
	
	from_condition = '';
	
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
			
			-- ...e comincio col preparare la condizione del from
			from_condition = from_condition || 'FROM ' || name_table || ' WHERE ';
		
		-- se si tratta del nome di una colonna
		ELSIF (1 = (counter % 2)) THEN
		
			name_column = row_table.string_to_table;
			
			IF (NOT column_exists(name_table, name_column)) THEN
				RETURN NULL;
			END IF;
			
			type_column = get_type_column(name_table, name_column);
			
			-- continuo a costruire la condizione del from
			from_condition = from_condition || name_column || ' = ';
		
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
			
			-- aggiungo per permettere la creazione di una condizione del from
			-- che filtra su più colonne
			from_condition = from_condition || value_column || ' AND ';
			
		END IF;
		
		counter = counter + 1;
		
	END LOOP;
	
	from_condition = trim(from_condition, ' AND ');
	
	from_condition = from_condition || ';';

	-- a questo punto, continuando l'esempio proposto nella descrizione
	-- avremo ottenuto la query:
	-- 
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
	

	RETURN from_condition;
	
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
			ccu.constraint_name::text AS constr,
			ccu.table_name::text AS table_to_ref,
			ccu.column_name::text AS col_to_ref,
			kcu.table_name::text AS table_ref,
			kcu.column_name::text AS col_ref,
			kcu.ordinal_position::integer AS col_ord
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
			to_execute = to_execute || ' AND ' || name_table || '.' || row_table.col_to_ref;
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
			--			AND
			--			...
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
	name_column	text
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			column_name::text AS name_column  
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
 * TYPE : FUNCTION
 * NAME : get_column
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Funzione che restituisce il valore della colonna di una riga
 *        di una tabella sotto forma di testo, prendendo in input il nome
 *        della tabella, e le colonne ed i valori delle colonne che permettono
 *        di identificare univocamente la riga della tabella in questione.
 *        Utilizza SQL dinamico per costruire la query da eseguire.
 *
 *        NOTA: e' necessario identificare la riga di cui si vuole estrarre
 *              il valore di una colonna in modo univoco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_column
(
	IN	separator		text,
	IN	input_string	text,
	IN	column_to_get	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	counter			integer;

	name_table		text;
	row_table		record;
	
	value_column	text;
	
	to_execute		text;
	from_condition	text;
	
BEGIN
	
	from_condition = '';
	
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

			-- mi assicuro che la tabella in questione abbia la colonna che si cerca 
			IF (NOT column_exists(name_table, column_to_get)) THEN
				RETURN NULL;
			END IF;

		END IF;	
		
		counter = counter + 1;

		EXIT WHEN counter > 0;
		
	END LOOP;
	
	from_condition = get_from_condition(separator, input_string);

	IF (from_condition IS NULL) THEN
		RETURN NULL;
	END IF;

	-- costruisco la query di controllo
	-- che servira' a valutare se la colonna che si vuole
	-- ottenere sia identificata univocamente
	to_execute = '';
	to_execute = 'SELECT count(*) ';
	to_execute = to_execute || from_condition;
	
	-- riutilizzo la variabile counter per controllare
	-- che la riga identificata sia una sola
	counter = 0;
	
	EXECUTE to_execute INTO counter;
	
	-- se non ci sono righe
	IF (0 = counter) THEN
		RAISE NOTICE
			E'FUNCTION get_column\n'
			'Zero rows';

		RETURN NULL;

	-- se c'e' esattamente una riga
	ELSIF (1 = counter) THEN
	
		value_column = NULL;
		
		-- preparo la query da eseguire
		-- per ottenere il valore desiderato
		-- riutilizzo la variabile to_execute
		to_execute = '';
		to_execute = 'SELECT ' || column_to_get || '::text ';
		to_execute = to_execute || from_condition;
		
		EXECUTE to_execute INTO value_column;
		
		RETURN value_column;
	
	-- se ci sono piu' righe
	ELSE
		RAISE NOTICE
			E'FUNCTION get_column\n'
			'More than one row';

		RETURN NULL;
	
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_record
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : Funzione che restituisce l'intera riga di una tabella, prendendo in
 *        input il nome della tabella, e le colonne ed i valori delle colonne
 *        che permettono di identificare univocamente la riga della tabella.
 *        Utilizza SQL dinamico per costruire la query da eseguire.
 *
 *        NOTA: e' necessario identificare la riga di cui si vuole estrarre
 *              il valore di una colonna in modo univoco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_record
(
	IN	separator		text,
	IN	input_string	text
)
RETURNS record
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	counter			integer;

	name_table		text;
	row_table		record;
	
	to_execute		text;
	control_query	text;
	from_condition	text;
	
	control_value	boolean;
	
BEGIN
	
	from_condition = '';
	
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

		END IF;
		
		counter = counter + 1;

		EXIT WHEN counter > 0;
		
	END LOOP;
	
	from_condition = get_from_condition(separator, input_string);

	IF (from_condition IS NULL) THEN
		RETURN NULL;
	END IF;

	-- costruisco la query di controllo
	-- che servira' a valutare se la riga che si vuole
	-- ottenere sia identificata univocamente
	to_execute = '';
	to_execute = 'SELECT count(*) ';
	to_execute = to_execute || from_condition;
	
	-- riutilizzo la variabile counter per controllare
	-- che la riga identificata sia una sola
	counter = 0;
	
	EXECUTE to_execute INTO counter;
	
	-- se non ci sono righe
	IF (0 = counter) THEN
		RAISE NOTICE
			E'FUNCTION get_record\n'
			'Zero rows';

		RETURN NULL;

	-- se c'e' esattamente una riga
	ELSIF (1 = counter) THEN
	
		-- riutilizzo la variabile row_table
		-- per il valore di output
		row_table = NULL;
		
		-- preparo la query da eseguire
		-- per ottenere il valore desiderato
		-- riutilizzo la variabile to_execute
		to_execute = '';
		to_execute = 'SELECT * ';
		to_execute = to_execute || from_condition;
		
		EXECUTE to_execute INTO row_table;
		
		RETURN row_table;
	
	-- se ci sono piu' righe
	ELSE
		RAISE NOTICE
			E'FUNCTION get_record\n'
			'More than one row';

		RETURN NULL;
	
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : row_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : Funzione che valuta se una riga di una tabella esiste, prendendo in
 *        input il nome della tabella, e le colonne ed i valori delle colonne
 *        che permettono di identificare la riga della tabella.
 *        Utilizza SQL dinamico per costruire la query da eseguire.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION row_exists
(
	IN	separator		text,
	IN	input_string	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	counter			integer;

	name_table		text;
	row_table		record;
	
	to_execute		text;
	from_condition	text;
	
	existence		boolean;
	
BEGIN
	
	from_condition = '';
	
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

		END IF;	
		
		counter = counter + 1;

		EXIT WHEN counter > 0;
		
	END LOOP;
	
	from_condition = get_from_condition(separator, input_string);

	IF (from_condition IS NULL) THEN
		RETURN NULL;
	END IF;

	-- costruisco la query di controllo
	-- che servira' a valutare se la riga che si vuole
	-- valutare esista
	to_execute = '';
	to_execute = 'SELECT count(*) >= 1 ';
	to_execute = to_execute || from_condition;
	
	existence = FALSE;
	
	EXECUTE to_execute INTO existence;

	RETURN existence;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * FUNCTION IMMUTABLE
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : end_year_comp_ed
 *
 * IN      : integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che restituisce l'anno di fine di un'edizione di una
 *        competizione calcistica
 *
 *        NOTA: abbiamo applicato una semplificazione giustificata dalle
 *              numerosissime evidenze date dalle tante ricerche su siti
 *              specializzati (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION end_year_comp_ed
(
	IN	id_comp	integer,
	IN	s_year	smallint
)
RETURNS smallint
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
DECLARE

	team_type_comp	en_team;

BEGIN
	
	team_type_comp = get_column
					 (
						'@',
						'fp_competition'
						'@id@' || id_comp::text,
						'team_type'
					 )::en_team;
		
	IF ('CLUB' = team_type_comp) THEN
		RETURN s_year + 1;
	
	ELSIF ('NATIONAL' = team_type_comp) THEN
		RETURN s_year;
	
	END IF;


	RETURN NULL;
	
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
	id			serial		NOT NULL,
	type		en_country	NOT NULL,
	code		dm_code		NOT NULL,
	name		dm_string	NOT NULL,
	super_id	integer		
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
 * TYPE : CHECK CONSTRAINT - fp_country TABLE
 * NAME : ck_country
 *
 * DESC : Controllare che solo il mondo non sia contenuto in altri paesi
 ******************************************************************************/
ALTER TABLE	fp_country
ADD CONSTRAINT ck_country
CHECK
(
	('WORLD' = type AND super_id IS NULL)
	OR
	type <> 'WORLD'
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_country TABLE
 * NAME : country_fk_country
 *
 * DESC : Un paese fa riferimento al paese che lo contiene
 ******************************************************************************/
ALTER TABLE fp_country
ADD CONSTRAINT country_fk_country
FOREIGN KEY
(
	super_id
)
REFERENCES fp_country
(
	id
)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
	end_year		smallint	NOT NULL
		GENERATED ALWAYS AS	
		(
			end_year_comp_ed
			(
				competition_id,
				start_year
			)
		)
		STORED							,
	competition_id	integer		NOT NULL
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
	long_name			dm_alnum	NOT NULL,
	short_name			dm_code		NOT NULL
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
	long_name
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
	position_id	integer		NOT NULL,
	role		en_role_mix	NOT NULL
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player TABLE
 * NAME : player_fk_position
 *
 * DESC : Un calciatore fa riferimento alla sua posizione principale
 ******************************************************************************/
ALTER TABLE	fp_player
ADD CONSTRAINT player_fk_position
FOREIGN KEY
(
	position_id
)
REFERENCES fp_position
(
	id
)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
ON DELETE NO ACTION
ON UPDATE NO ACTION;
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
ON DELETE RESTRICT
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
ON DELETE RESTRICT
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
ON DELETE RESTRICT
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
	id				serial		NOT NULL			 ,
	start_year		dm_year		NOT NULL			 ,
	competition_id	integer		NOT NULL			 ,
	team_id			integer		NOT NULL			 ,
	player_id		integer		NOT NULL			 ,
	match			dm_usint	NOT NULL	DEFAULT 0
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
 * NAME : fp_tag
 *
 * DESC : Tabella contentente informazioni sui tag che possono essere
 *        associati ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_tag
(
	id			serial		NOT NULL,
	goalkeeper	boolean		NOT NULL,
	positive	boolean		NOT NULL,
	name		dm_string	NOT NULL
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
ON DELETE NO ACTION
ON UPDATE CASCADE;
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
ON DELETE NO ACTION
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_attribute_goalkeeping
 *
 * DESC : Tabella contenente informazioni sugli attributi che caratterizzano
 *        un portiere
 ******************************************************************************/
CREATE TABLE fp_attribute_goalkeeping
(
	player_id				integer			NOT NULL			 ,
	aerial_reach			dm_attribute	NOT NULL	DEFAULT 0,
	command_of_area			dm_attribute	NOT NULL	DEFAULT 0,
	communication			dm_attribute	NOT NULL	DEFAULT 0,
	eccentricity			dm_attribute	NOT NULL	DEFAULT 0,
	first_touch_gk			dm_attribute	NOT NULL	DEFAULT 0,
	handling				dm_attribute	NOT NULL	DEFAULT 0,
	kicking					dm_attribute	NOT NULL	DEFAULT 0,
	one_on_ones				dm_attribute	NOT NULL	DEFAULT 0,
	passing_gk				dm_attribute	NOT NULL	DEFAULT 0,
	punching_tencency		dm_attribute	NOT NULL	DEFAULT 0,
	reflexes				dm_attribute	NOT NULL	DEFAULT 0,
	rushing_out_tendency	dm_attribute	NOT NULL	DEFAULT 0,
	throwing				dm_attribute	NOT NULL	DEFAULT 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_attribute_goalkeeping TABLE   
 * NAME : pk_attribute_goalkeeping
 *
 * DESC : Ogni insieme di attributi di un portiere fa riferimento ad
 *        un solo calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_goalkeeping
ADD CONSTRAINT pk_attribute_goalkeeping
PRIMARY KEY
(
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_attribute_goalkeeping TABLE
 * NAME : attribute_goalkeeping_fk_player
 *
 * DESC : Gli attributi di un portiere fanno riferimento ad un calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_goalkeeping
ADD CONSTRAINT attribute_goalkeeping_fk_player
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
 * NAME : fp_attribute_mental
 *
 * DESC : Tabella contenente informazioni sugli attributi mentali che
 *        caratterizzano un calciatore
 ******************************************************************************/
CREATE TABLE fp_attribute_mental
(
	player_id		integer			NOT NULL			 ,
	aggression		dm_attribute	NOT NULL	DEFAULT 0,
	anticipation	dm_attribute	NOT NULL	DEFAULT 0,
	bravery			dm_attribute	NOT NULL	DEFAULT 0,
	composure		dm_attribute	NOT NULL	DEFAULT 0,
	concentration	dm_attribute	NOT NULL	DEFAULT 0,
	decision		dm_attribute	NOT NULL	DEFAULT 0,
	determination	dm_attribute	NOT NULL	DEFAULT 0,
	flair			dm_attribute	NOT NULL	DEFAULT 0,
	leadership		dm_attribute	NOT NULL	DEFAULT 0,
	off_the_ball	dm_attribute	NOT NULL	DEFAULT 0,
	positioning		dm_attribute	NOT NULL	DEFAULT 0,
	teamwork		dm_attribute	NOT NULL	DEFAULT 0,
	vision			dm_attribute	NOT NULL	DEFAULT 0,
	work_rate		dm_attribute	NOT NULL	DEFAULT 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_attribute_mental TABLE   
 * NAME : pk_attribute_mental
 *
 * DESC : Ogni insieme di attributi mentali fa riferimento ad un solo calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_mental
ADD CONSTRAINT pk_attribute_mental
PRIMARY KEY
(
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_attribute TABLE
 * NAME : attribute_mental_fk_player
 *
 * DESC : Gli attributi mentali fanno riferimento ad un calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_mental
ADD CONSTRAINT attribute_mental_fk_player
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
 * NAME : fp_attribute_physical
 *
 * DESC : Tabella contenente informazioni sugli attributi fisici che
 *        caratterizzano un calciatore
 ******************************************************************************/
CREATE TABLE fp_attribute_physical
(
	player_id		integer			NOT NULL			 ,
	acceleration	dm_attribute	NOT NULL	DEFAULT 0,
	agility			dm_attribute	NOT NULL	DEFAULT 0,
	balance			dm_attribute	NOT NULL	DEFAULT 0,
	jumping_reach	dm_attribute	NOT NULL	DEFAULT 0,
	natural_fitness	dm_attribute	NOT NULL	DEFAULT 0,
	pace			dm_attribute	NOT NULL	DEFAULT 0,
	stamina			dm_attribute	NOT NULL	DEFAULT 0,
	strenght		dm_attribute	NOT NULL	DEFAULT 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_attribute_physical TABLE   
 * NAME : pk_attribute_physical
 *
 * DESC : Ogni insieme di attributi fisici fa riferimento ad un solo calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_physical
ADD CONSTRAINT pk_attribute_physical
PRIMARY KEY
(
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_attribute_physical TABLE
 * NAME : attribute_physical_fk_player
 *
 * DESC : Gli attributi fisici fanno riferimento ad un calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_physical
ADD CONSTRAINT attribute_physical_fk_player
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
 * NAME : fp_attribute_technical
 *
 * DESC : Tabella contenente informazioni sugli attributi tecnici che
 *        caratterizzano un calciatore
 ******************************************************************************/
CREATE TABLE fp_attribute_technical
(
	player_id			integer			NOT NULL			 ,
	corners				dm_attribute	NOT NULL	DEFAULT 0,
	crossing			dm_attribute	NOT NULL	DEFAULT 0,
	dribbling			dm_attribute	NOT NULL	DEFAULT 0,
	finishing			dm_attribute	NOT NULL	DEFAULT 0,
	first_touch			dm_attribute	NOT NULL	DEFAULT 0,
	free_kick_taking	dm_attribute	NOT NULL	DEFAULT 0,
	heading				dm_attribute	NOT NULL	DEFAULT 0,
	long_shots			dm_attribute	NOT NULL	DEFAULT 0,
	long_throws			dm_attribute	NOT NULL	DEFAULT 0,
	marking				dm_attribute	NOT NULL	DEFAULT 0,
	passing				dm_attribute	NOT NULL	DEFAULT 0,
	penality_taking		dm_attribute	NOT NULL	DEFAULT 0,
	tackling			dm_attribute	NOT NULL	DEFAULT 0,
	technique			dm_attribute	NOT NULL	DEFAULT 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_attribute_technical TABLE   
 * NAME : pk_attribute_technical
 *
 * DESC : Ogni insieme di attributi tecnici fa riferimento ad un solo calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_technical
ADD CONSTRAINT pk_attribute_technical
PRIMARY KEY
(
	player_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_attribute_technical TABLE
 * NAME : attribute_technical_fk_player
 *
 * DESC : Gli attributi tecnici fanno riferimento ad un calciatore
 ******************************************************************************/
ALTER TABLE fp_attribute_technical
ADD CONSTRAINT attribute_technical_fk_player
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
 * NAME : fp_statistic_general
 *
 * DESC : Tabella contenente informazioni sulle statistiche generali che
 *        caratterizzano un gioco
 ******************************************************************************/
CREATE TABLE fp_statistic_general
(
	play_id			integer		NOT NULL			 ,
	goal_scored		dm_usint 	NOT NULL	DEFAULT 0,
	assist			dm_usint 	NOT NULL	DEFAULT 0,
	yellow_card		dm_usint 	NOT NULL	DEFAULT 0,
	red_card		dm_usint 	NOT NULL	DEFAULT 0,
	penalty_scored	dm_usint 	NOT NULL	DEFAULT 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_statistic_general TABLE  
 * NAME : pk_statistic_general
 *
 * DESC : Ogni insieme di statistiche generali fa riferimento ad un solo gioco
 ******************************************************************************/
ALTER TABLE fp_statistic_general
ADD CONSTRAINT pk_statistic_general
PRIMARY KEY
(
	play_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_statistic_general TABLE
 * NAME : statistic_general_fk_play
 *
 * DESC : Le statistiche generali fanno riferimento ad un gioco
 ******************************************************************************/
ALTER TABLE fp_statistic_general
ADD CONSTRAINT statistic_general_fk_play
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
 * TYPE : TABLE
 * NAME : fp_statistic_goalkeeper
 *
 * DESC : Tabella contenente informazioni sulle statistiche di portiere che
 *        caratterizzano un gioco
 ******************************************************************************/
CREATE TABLE fp_statistic_goalkeeper
(
	play_id			integer		NOT NULL			 ,
	goal_conceded	dm_usint 	NOT NULL	DEFAULT 0,
	penalty_saved	dm_usint 	NOT NULL	DEFAULT 0
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_statistic_goalkeeper TABLE  
 * NAME : pk_statistic_goalkeeper
 *
 * DESC : Ogni insieme di statistiche di portiere fa riferimento ad un solo gioco
 ******************************************************************************/
ALTER TABLE fp_statistic_goalkeeper
ADD CONSTRAINT pk_statistic_goalkeeper
PRIMARY KEY
(
	play_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_statistic_goalkeeper TABLE
 * NAME : statistic_goalkeeper_fk_play
 *
 * DESC : Le statistiche di portiere fanno riferimento ad un gioco
 ******************************************************************************/
ALTER TABLE fp_statistic_goalkeeper
ADD CONSTRAINT statistic_goalkeeper_fk_play
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
	name		dm_string	NOT NULL
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
ON DELETE NO ACTION
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
ON DELETE NO ACTION
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
ON DELETE NO ACTION
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
ON DELETE NO ACTION
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_admin
 *
 * DESC : Tabella contentente informazioni sugli amministratori
 *        che possono utilizzare l'applicativo connesso al database
 ******************************************************************************/
CREATE TABLE fp_admin
(
	username	dm_username		NOT NULL,
	password	dm_password		NOT NULL		
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_admin TABLE
 * NAME : pk_fp_admin
 *
 * DESC : Non possono esistere account utente diversi con lo stesso username
 ******************************************************************************/
ALTER TABLE	fp_admin
ADD CONSTRAINT pk_fp_admin
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
 * NAME : all_continent_exists
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che controlla se esistano gia tutti i continenti
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_continent_exists
(
)
RETURNS boolean
AS
$$
BEGIN

	RETURN
	(
		SELECT
			count(*) >= 6
		FROM
			fp_country
		WHERE
			type = 'CONTINENT'
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : place_for_country
 *
 * IN      : en_country
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che controlla se ci sia posto per il paese che si vuole
		  inserire
 ******************************************************************************/
CREATE OR REPLACE FUNCTION place_for_country
(
	IN	type_country	en_country
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
				
	IF ('NATION' = type_country) THEN
		RETURN TRUE;
	
	ELSIF ('CONTINENT' = type_country) THEN
		RETURN (NOT all_continent_exists());
	
	ELSIF ('WORLD' = type_country) THEN
		RETURN (NOT row_exists('@', 'fp_country@type@WORLD'));
	
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_national_team
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che crea la squadra nazionale di un paese
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_national_team
(
	IN	id_country	integer
)
RETURNS void
AS
$$
DECLARE

	rec_country	record;

BEGIN

	rec_country = get_record
				  (
						'@',
						'fp_country'
						'@id@' || id_country::text
				  );


	IF (rec_country.type <> 'NATION') THEN
		RETURN;
	END IF;


	INSERT INTO
		fp_team
		(
			type,
			country_id,
			long_name,
			short_name
		)
	VALUES
	(
		'NATIONAL',
		id_country,
		rec_country.name,
		rec_country.code
	)
	ON CONFLICT DO NOTHING;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_all_gk
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che elimina tutte le statistiche, i tag e gli attributi
 *        associati al ruolo di portiere per un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_all_gk
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	PERFORM delete_gk_tag(id_player);


	DELETE FROM
		fp_attribute_goalkeeping
	WHERE
		player_id = id_player;


	DELETE FROM
		fp_statistic_goalkeeper
	WHERE
		play_id IN
					(
						SELECT
							*
						FROM
							player_play(id_player)
					);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_all_gk
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che crea tutte le statistiche, i tag e gli attributi
 *        associati al ruolo di portiere per un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_all_gk
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	id_play	integer;

BEGIN

	INSERT INTO
		fp_attribute_goalkeeping
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;

	
	FOR id_play
	IN
		SELECT
			*
		FROM
			player_play(id_player)
	
	LOOP

		INSERT INTO
			fp_statistic_goalkeeper
			(
				play_id
			)
		VALUES
		(
			id_play
		)
		ON CONFLICT DO NOTHING;

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

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
 *              (Wikipedia, Transfermarkt, ...)
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
 *              (Wikipedia, Transfermarkt, ...)
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
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN
	(
		SELECT
			min(start_year)
		FROM
			fp_militancy
		WHERE
			player_id = id_player
	);

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
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN
	(
		SELECT
			max(start_year)
		FROM
			fp_militancy
		WHERE
			player_id = id_player
	);

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
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	year_dob		integer;
	year_retired	integer;

BEGIN

	year_dob = extract
			   (
					year from get_column
							  (
									'@',
									'fp_player'
									'@id@' || id_player::text,
									'dob'
							  )::date
			   );

	s_valid = year_dob + min_age();

	-- se il giocatore e' ritirato
	IF
	(
		row_exists
		(
			'@',
			'fp_player_retired'
			'@player_id@' || id_player::text
		)
	)
	THEN

		year_retired = extract
					   (
							year from get_column
									  (
											'@',
											'fp_player_retired'
											'@player_id@' || id_player::text,
											'retired_date'
									  )::date
					   );

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
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
			
	RETURN
	(
		SELECT
			team_id
		FROM
			fp_militancy
		WHERE
			player_id = id_player
			AND
			team_type = 'NATIONAL'
		LIMIT
			1
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_free_militancy
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore non ha una militanza di un
 *        tipo specifico in un determinato anno
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_free_militancy
(
	IN	type_team	en_team,
	IN	id_team		integer,
	IN	id_player	integer,
	IN	s_year		smallint
)
RETURNS boolean
AS
$$
BEGIN

	RETURN
	(		
		SELECT
			count(*) < 1
		FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id <> id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
	);

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
			0 = position(role::text in role_player::text);
	
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
			0 = position(role::text in role_player::text);
	
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
 * IN      : integer, en_role_mix
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
	role_player	en_role_mix
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
 * IN      : integer, en_role_mix
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
	role_player	en_role_mix
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
 * IN      : en_country, en_country
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una tipologia di paese può essere contenuta
 *        in un'altra tipologia
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_be_inside
(
	IN	type_in_country		en_country,	-- tipo paese contenuto
	IN	type_super_country	en_country	-- tipo paese contenente
)
RETURNS boolean
AS
$$
BEGIN

	IF
	(
		('NATION' = type_in_country AND 'CONTINENT' = type_super_country)
		OR
		('CONTINENT' = type_in_country AND 'WORLD' = type_super_country)
		OR
		('WORLD' = type_in_country AND type_super_country IS NULL)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	
	RETURN FALSE;
	
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

	freq	dm_usint;
	a_year	smallint;	-- un anno di inizio di un'edizione
	
BEGIN
	
	freq = get_column
		   (
				'@',
				'fp_competition'
				'@id@' || id_comp::text,
				'frequency'
		   )::dm_usint;

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

	type_conf		en_country;

	id_country		integer;

	id_conf_team	integer;
	
BEGIN

	-- prendo la confederazione di cui la squadra e' membro
	id_country = get_column
				 (
					'@',
					'fp_team@id@' || id_team::text,
					'country_id'
				 )::integer;

	id_conf_team = get_column
				   (
						'@',
						'fp_confederation'
						'@country_id@' || id_country::text,
						'id'
				   )::integer;

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;


	id_conf_team = get_column
				   (
						'@',
						'fp_confederation'
						'@id@' || id_conf_team::text,
						'super_id'
				   )::integer;

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;


	id_conf_team = get_column
				   (
						'@',
						'fp_confederation'
						'@id@' || id_conf_team::text,
						'super_id'
				   )::integer;

	IF (id_conf_team = id_conf) THEN
		RETURN TRUE;
	END IF;
	

	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_team_comp
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce il massimo numero di possibili di squadre
 *        di calcio partecipanti per una competizione calcistica in base alla
 *        tipologia della stessa
 *
 *        NOTA: i valori sono per eccesso ed arbitrari ma ottenuti mediante
 *              numerose ricerche su siti specializzati
 *              (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_team_comp
(
	IN	id_comp	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp	record;

BEGIN

	rec_comp = get_record
			   (
					'@',
					'fp_competition'
					'@id@' || id_comp::text
			   );


	IF ('LEAGUE' = rec_comp.type) THEN
		RETURN 40;
	
	ELSIF ('SUPER_CUP' = rec_comp.type) THEN
		RETURN 6;
	
	ELSIF ('CUP' = rec_comp.type) THEN

		IF ('CLUB' = rec_comp.team_type) THEN
			RETURN 128;
	
		ELSIF ('NATIONAL' = rec_comp.team_type) THEN
			RETURN 48;
	
		END IF;

	END IF;


	RETURN NULL;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : max_match_comp
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Funzione che restituisce il massimo numero di partite che è possibile
 *        disputare in una competizione in base alla tipologia della stessa
 *
 *        NOTA: i valori sono per eccesso ed arbitrari ma ottenuti mediante
 *              numerose ricerche su siti specializzati
 *              (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION max_match_comp
(
	IN	id_comp	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_comp	en_competition;

BEGIN

	type_comp = get_column
				(
					'@',
					'fp_competition'
					'@id@' || id_comp::text,
					'type'
				)::en_competition;


	IF ('LEAGUE' = type_comp) THEN
		RETURN 40;
	
	ELSIF ('SUPER_CUP' = type_comp) THEN
		RETURN 3;
	
	ELSIF ('CUP' = type_comp) THEN
		RETURN 10;

	END IF;


	RETURN NULL;

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
BEGIN
	
	RETURN
	(
		SELECT
			(count(*) < max_team_comp(id_comp))
		FROM
			fp_partecipation
		WHERE
			competition_id = id_comp
			AND
			start_year = s_year
	);

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

		role_pos = get_column
				   (
						'@',
						'fp_position'
						'@id@' || pos_player::text,
						'role'
				   )::en_role;

		IF (0 = position(role_pos::text IN role_player::text)) THEN
			RETURN FALSE;
		END IF;

	END LOOP;

	
	RETURN TRUE;

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

	type_team		en_team;
	type_team_comp	en_team;

BEGIN

	type_team = get_column
				(
					'@',
					'fp_team'
					'@id@' || id_team::text,
					'type'
				)::en_team;

	type_team_comp = get_column
					 (
						'@',
						'fp_competition'
						'@id@' || id_comp::text,
						'team_type'
					 )::en_team;


	IF (type_team = type_team_comp) THEN
		RETURN TRUE;
	END IF;


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
	
	rec_comp = get_record
			   (
					'@',
					'fp_competition'
					'@id@' || id_comp::text
			   );

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
	id_similar_comp	integer,
	same_s_year		smallint
)
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN

	RETURN QUERY
		SELECT
			competition_id,
			start_year::smallint 
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
	IN	s_year	smallint
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp_ed	record;

BEGIN

	-- per ogni edizione simile di competizioni calcistiche
	FOR rec_comp_ed
	IN
		SELECT
			*
		FROM
			similar_comp_ed(id_comp, s_year)
	LOOP

		-- se la squadra di calcio partecipa ad un'edizione simile
		IF
		(
			row_exists
			(
				'@',
				'fp_partecipation'
				'@team_id@' || id_team::text
				||
				'@competition_id@' || rec_comp_ed.id_similar_comp::text
				||
				'@start_year@' || rec_comp_ed.same_s_year::text
			)
		)
		THEN
			RETURN FALSE;
		END IF;

	END LOOP;


	RETURN TRUE;

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
BEGIN

	IF ('I_PART' = type_year) THEN
	
		RETURN
		(
			SELECT
				count(*) = 0
			FROM
				fp_militancy
			WHERE
				player_id = id_player
				AND
				team_type = type_team
				AND
				start_year = s_year
				AND
				type IN ('I_PART', 'FULL')
		);
	
	ELSIF ('II_PART' = type_year) THEN
	
		RETURN
		(
			SELECT
				count(*) = 0
			FROM
				fp_militancy
			WHERE
				player_id = id_player
				AND
				team_type = type_team
				AND
				start_year = s_year
				AND
				type IN ('II_PART', 'FULL')
		);

	ELSIF ('FULL' = type_year) THEN

		RETURN
		(
			SELECT
				count(*) = 0
			FROM
				fp_militancy
			WHERE
				player_id = id_player
				AND
				team_type = type_team
				AND
				start_year = s_year
		);

	END IF;


	RETURN FALSE;

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
		)
		ON CONFLICT DO NOTHING;

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
		tmp = tmp || role_pos::text;
		tmp = tmp || '_';

	END LOOP;

	tmp = trim(tmp, '_');

	role_player = tmp::en_role_mix;


	RETURN role_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_attributes
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che crea gli attributi per un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_attributes
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	role_player	en_role_mix;

BEGIN

	INSERT INTO
		fp_attribute_mental
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;


	INSERT INTO
		fp_attribute_physical
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;


	INSERT INTO
		fp_attribute_technical
		(
			player_id
		)
	VALUES
	(
		id_player
	)
	ON CONFLICT DO NOTHING;


	role_player = get_column
				  (
						'@',
						'fp_player@id@' || id_player::text,
						'role'
				  )::en_role_mix;


	IF (role_player::text LIKE '%GK%') THEN

		INSERT INTO
			fp_attribute_goalkeeping
			(
				player_id
			)
		VALUES
		(
			id_player
		)
		ON CONFLICT DO NOTHING;

	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_play_from_militancy
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che data una militanza di un calciatore crea i giochi
 *        per tale giocatore per ogni competizione cui partecipa la squadra
 *        nel periodo della militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_play_from_militancy
(
	IN	id_player	integer,
	IN	id_team		integer,
	IN	s_year		smallint
)
RETURNS void
AS
$$
DECLARE

	id_comp	integer;

BEGIN

	FOR id_comp
	IN
		SELECT
			competition_id
		FROM
			fp_partecipation
		WHERE
			start_year = s_year
			AND
			team_id = id_team
	
	LOOP

		INSERT INTO
			fp_play
			(
				start_year,
				competition_id,
				team_id,
				player_id
			)
		VALUES
		(
			s_year,
			id_comp,
			id_team,
			id_player
		)
		ON CONFLICT DO NOTHING;

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_play_from_partecipation
 *
 * IN      : integer, integer, smallint
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che data una partecipazione di una squadra di calcio ad
 *        una competizione crea i giochi riferiti alla suddetta competizione
 *        per tutti i calciatori che militano nella squadra in quel momento
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_play_from_partecipation
(
	IN	id_team	integer,
	IN	id_comp	integer,
	IN	s_year	smallint
)
RETURNS void
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
			start_year = s_year
			AND
			team_id = id_team
	
	LOOP

		INSERT INTO
			fp_play
			(
				start_year,
				competition_id,
				team_id,
				player_id
			)
		VALUES
		(
			s_year,
			id_comp,
			id_team,
			id_player
		)
		ON CONFLICT DO NOTHING;

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : create_statistics
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che crea le statistiche associate al gioco di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION create_statistics
(
	IN	id_play	integer
)
RETURNS void
AS
$$
DECLARE

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	INSERT INTO
		fp_statistic_general
		(
			play_id
		)
	VALUES
	(
		id_play
	)
	ON CONFLICT DO NOTHING;


	id_player = get_column
				(
					'@',
					'fp_play'
					'@id@' || id_play::text,
					'player_id'
				)::integer;

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || id_player::text,
						'role'
				  )::en_role_mix;


	IF (role_player::text LIKE '%GK%') THEN

		INSERT INTO
			fp_statistic_goalkeeper
			(
				play_id
			)
		VALUES
		(
			id_play
		)
		ON CONFLICT DO NOTHING;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_zero_statistics
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta a zero i valori delle statistiche di un gioco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_zero_statistics
(
	IN	id_play	integer
)
RETURNS void
AS
$$
DECLARE

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	UPDATE
		fp_statistic_general
	SET
		goal_scored = 0,
		assist = 0,
		yellow_card	= 0,
		red_card = 0,
		penalty_scored = 0
	WHERE
		play_id = id_play;


	id_player = get_column
				(
					'@',
					'fp_play'
					'@id@' || id_play::text,
					'player_id'
				)::integer;

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || id_player::text,
						'role'
				  )::en_role_mix;


	IF (role_player::text LIKE '%GK%') THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = 0,
			penalty_saved = 0
		WHERE
			play_id = id_play;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : insert_militancy_from_to
 *
 * IN      : en_team, integer, integer, smallint, en_season, smallint, en_season
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che permette l'inserimento di una militanza di un calciatore
 *        in una squadra di calcio per un periodo di tempo superiore ad una
 *        singola stagione
 *
 *        NOTA: la funzione risulta poco elegante visto che Postgresql non
 *              permette l'utilizzo di Transactions all'interno di funzioni.
 *              L'idea di fondo e' costruire una transaction manualmente
 *              inserendo le varie mililtanze e nel caso di errore rimuoverle
 ******************************************************************************/
CREATE OR REPLACE FUNCTION insert_militancy_from_to
(
	IN	type_team	en_team,
	IN	id_team		integer,
	IN	id_player	integer,
	IN	s_year		smallint,
	IN	type_s_year	en_season,
	IN	e_year		smallint,
	IN	type_e_year	en_season
)
RETURNS void
AS
$$
DECLARE

	error		boolean;

	chek_year	smallint;

	year		smallint;

BEGIN

	error = FALSE;

	IF (e_year <= s_year) THEN
		error = TRUE;
	END IF;


	IF (error) THEN
		RETURN;
	END IF;
	

	chek_year = NULL;

	INSERT INTO
		fp_militancy
		(
			team_type,
			team_id,
			player_id,
			start_year,
			type
		)
	VALUES
	(
		type_team,
		id_team	,
		id_player,
		s_year,
		type_s_year
	)
	ON CONFLICT DO NOTHING
	RETURNING
		start_year
	INTO
		chek_year;


	IF (chek_year IS NULL) THEN
		error = TRUE;
	END IF;


	IF (error) THEN

		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
			AND
			type = type_s_year;

		RETURN;

	END IF;



	FOR year IN (s_year + 1)..(e_year - 1)
	LOOP

		chek_year = NULL;

		INSERT INTO
			fp_militancy
			(
				team_type,
				team_id,
				player_id,
				start_year,
				type
			)
		VALUES
		(
			type_team,
			id_team	,
			id_player,
			year,
			'FULL'
		)
		ON CONFLICT DO NOTHING
		RETURNING
			start_year
		INTO
			chek_year;

		
		IF (chek_year IS NULL) THEN
			error = TRUE;
		END IF;

		EXIT WHEN error;

	END LOOP;


	IF (error) THEN

		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
			AND
			type = type_s_year;


		FOR year IN (s_year + 1)..(e_year - 1)
		LOOP

			DELETE FROM
				fp_militancy
			WHERE
				team_type = type_team
				AND
				team_id = id_team
				AND
				player_id = id_player
				AND
				start_year = year
				AND
				type = 'FULL';

		END LOOP;


		RETURN;

	END IF;


	chek_year = NULL;

	INSERT INTO
		fp_militancy
		(
			team_type,
			team_id,
			player_id,
			start_year,
			type
		)
	VALUES
	(
		type_team,
		id_team	,
		id_player,
		e_year,
		type_e_year
	)
	ON CONFLICT DO NOTHING
	RETURNING
		start_year
	INTO
		chek_year;

	
	IF (chek_year IS NULL) THEN
		error = TRUE;
	END IF;


	IF (error) THEN

		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = s_year
			AND
			type = type_s_year;


		FOR year IN (s_year + 1)..(e_year - 1)
		LOOP

			DELETE FROM
				fp_militancy
			WHERE
				team_type = type_team
				AND
				team_id = id_team
				AND
				player_id = id_player
				AND
				start_year = year
				AND
				type = 'FULL';

		END LOOP;


		DELETE FROM
			fp_militancy
		WHERE
			team_type = type_team
			AND
			team_id = id_team
			AND
			player_id = id_player
			AND
			start_year = e_year
			AND
			type = type_e_year;

	END IF;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : random_between
 *
 * IN      : integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : smallint
 *
 * DESC : Funzione che restituisce un numero casuale in un range di interi dato
 ******************************************************************************/
CREATE OR REPLACE FUNCTION random_between
(
	IN	s_range	integer,
	IN	e_range	integer
)
RETURNS smallint
AS
$$
BEGIN

	RETURN floor(random() * (e_range - s_range + 1) + s_range)::smallint;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_mental
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico gli attributi mentali di un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_mental
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	UPDATE
		fp_attribute_mental
	SET
		aggression = random_between(0, 10),
		anticipation = random_between(0, 10),
		bravery = random_between(0, 10),
		composure = random_between(0, 10),
		concentration = random_between(0, 10),
		decision = random_between(0, 10),
		determination = random_between(0, 10),
		flair = random_between(0, 10),
		leadership = random_between(0, 10),
		off_the_ball = random_between(0, 10),
		positioning = random_between(0, 10),
		teamwork = random_between(0, 10),
		vision = random_between(0, 10),
		work_rate = random_between(0, 10)
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_physical
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico gli attributi fisici di un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_physical
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	UPDATE
		fp_attribute_physical
	SET
		acceleration = random_between(0, 10),
		agility = random_between(0, 10),
		balance = random_between(0, 10),
		jumping_reach = random_between(0, 10),
		natural_fitness = random_between(0, 10),
		pace = random_between(0, 10),
		stamina = random_between(0, 10),
		strenght = random_between(0, 10)
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_technical
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico gli attributi tecnici di un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_technical
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	UPDATE
		fp_attribute_technical
	SET
		corners = random_between(0, 10),
		crossing = random_between(0, 10),
		dribbling = random_between(0, 10),
		finishing = random_between(0, 10),
		first_touch = random_between(0, 10),
		free_kick_taking = random_between(0, 10),
		heading = random_between(0, 10),
		long_shots = random_between(0, 10),
		long_throws = random_between(0, 10),
		marking = random_between(0, 10),
		passing = random_between(0, 10),
		penality_taking = random_between(0, 10),
		tackling = random_between(0, 10),
		technique = random_between(0, 10)	
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute_goalkeeping
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico gli attributi di portiere di un
 *        calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute_goalkeeping
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	role_player	en_role_mix;

BEGIN

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || id_player::text,
						'role'
				  )::en_role_mix;

	IF (role_player::text NOT LIKE '%GK%') THEN
		RETURN;
	END IF;


	UPDATE
		fp_attribute_goalkeeping
	SET
		aerial_reach = random_between(0, 10),
		command_of_area = random_between(0, 10),
		communication = random_between(0, 10),
		eccentricity = random_between(0, 10),
		first_touch_gk = random_between(0, 10),
		handling = random_between(0, 10),
		kicking = random_between(0, 10),
		one_on_ones = random_between(0, 10),
		passing_gk = random_between(0, 10),
		punching_tencency = random_between(0, 10),
		reflexes = random_between(0, 10),
		rushing_out_tendency = random_between(0, 10),
		throwing = random_between(0, 10)
	WHERE
		player_id = id_player;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_attribute
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico gli attributi di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_attribute
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	PERFORM set_random_attribute_mental(id_player);

	PERFORM set_random_attribute_physical(id_player);

	PERFORM set_random_attribute_technical(id_player);

	PERFORM set_random_attribute_goalkeeping(id_player);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_statistic_general
 *
 * IN      : integer, integer, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico le statistiche generali di un
 *        calciatore.
 *
 *        NOTA: prende il ruolo principale del calciatore per creare statistiche
 *              piu' realistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_statistic_general
(
	IN	id_play		integer,
	IN	match_play	integer,
	IN	main_role	en_role
)
RETURNS void
AS
$$
BEGIN

	IF ('GK' = main_role) THEN

		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.05) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.2) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.1) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.05) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('DF' = main_role) THEN

		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.2) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.3) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.4) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.3) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.2) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('MF' = main_role) THEN
		
		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.4) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.6) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.3) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.25) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.35) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('FW' = main_role) THEN

		UPDATE
			fp_statistic_general
		SET
			goal_scored = random_between(0, CAST(floor(match_play * 0.9) AS integer)),
			assist = random_between(0, CAST(floor(match_play * 0.5) AS integer)),
			yellow_card = random_between(0, CAST(floor(match_play * 0.2) AS integer)),
			red_card = random_between(0, CAST(floor(match_play * 0.1) AS integer)),
			penalty_scored = random_between(0, CAST(floor(match_play * 0.5) AS integer))
		WHERE
			play_id = id_play;

	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_statistic_goalkeeper
 *
 * IN      : integer, integer, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo randomico le statistiche di portiere di un
 *        calciatore.
 *
 *        NOTA: prende il ruolo principale del calciatore per creare statistiche
 *              piu' realistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_statistic_goalkeeper
(
	IN	id_play		integer,
	IN	match_play	integer,
	IN	main_role	en_role
)
RETURNS void
AS
$$
DECLARE

	id_player	integer;

	role_player	en_role_mix;

BEGIN

	id_player = get_column
				(
					'@',
					'fp_play'
					'@id@' || id_play::text,
					'player_id'
				)::integer;

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || id_player::text,
						'role'
				  )::en_role_mix;


	IF (role_player::text NOT LIKE '%GK%') THEN
		RETURN;
	END IF;

	 
	IF ('GK' = main_role) THEN
		
		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 1.25) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.35) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('DF' = main_role) THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.01) AS integer))
		WHERE
			play_id = id_play;

	ELSIF ('MF' = main_role) THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.01) AS integer))
		WHERE
			play_id = id_play;
	
	ELSIF ('FW' = main_role) THEN

		UPDATE
			fp_statistic_goalkeeper
		SET
			goal_conceded = random_between(0, CAST(floor(match_play * 0.01) AS integer)),
			penalty_saved = random_between(0, CAST(floor(match_play * 0.01) AS integer))
		WHERE
			play_id = id_play;

	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_statistic
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo casuale le statistiche di un gioco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_statistic
(
	IN	id_play	integer
)
RETURNS void
AS
$$
DECLARE
	
	rec_play		record;

	match_play		integer;

	id_pos_player	integer;
	role_pos_player	en_role;

BEGIN

	rec_play = get_record
			   (
					'@',
					'fp_play'
					'@id@' || id_play::text
			   );

	match_play = random_between(1, max_match_comp(rec_play.competition_id));


	UPDATE
		fp_play
	SET
		match = match_play
	WHERE
		id = id_play;

	
	id_pos_player = get_column
					(
						'@',
						'fp_player'
						'@id@' || rec_play.player_id::text,
						'position_id'
					)::integer;

	role_pos_player = get_column
					  (
							'@',
							'fp_position'
							'@id@' || id_pos_player::text,
							'role'
					  )::en_role;


	PERFORM set_random_statistic_general(id_play, match_play, role_pos_player);

	PERFORM set_random_statistic_goalkeeper(id_play, match_play, role_pos_player);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_all_statistic
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo casuale le statistiche di un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_all_statistic
(
	IN	id_player	integer
)
RETURNS void
AS
$$
DECLARE

	id_play	integer;

BEGIN

	FOR id_play
	IN
		SELECT
			id
		FROM
			fp_play
		WHERE
			player_id = id_player
		
	LOOP

		PERFORM set_random_statistic(id_play);

	END LOOP;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random
 *
 * IN      : integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo casuale gli attributi le statistiche
 *        di un calciatore 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random
(
	IN	id_player	integer
)
RETURNS void
AS
$$
BEGIN

	PERFORM set_random_attribute(id_player);

	PERFORM set_random_all_statistic(id_player);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_random_all
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : void
 *
 * DESC : Funzione che setta in modo casuale gli attributi le statistiche
 *        di tutti i calciatori 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_random_all
(
)
RETURNS void
AS
$$
DECLARE

	id_player	integer;

BEGIN

	FOR id_player
	IN
		SELECT
			id
		FROM
			fp_player

	LOOP

		PERFORM set_random(id_player);

	END LOOP;

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
 * NAME : tf_if_referenced_refuse
 *
 * DESC : Funzione che controlla che accetta un aggiornamento solo se la
 *        riga della tabella che ha scatenato il trigger non è referenziata
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_if_referenced_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT is_referenced('@', string_for_reference('@', TG_TABLE_NAME, OLD))) THEN
		
		IF ('UPDATE' = TG_OP) THEN
			RETURN NEW;
	
		ELSIF ('DELETE' = TG_OP) THEN
			RETURN OLD;
	
		END IF;
	
	END IF;
	
	
	IF ('UPDATE' = TG_OP) THEN
		RETURN OLD;
	
	ELSIF ('DELETE' = TG_OP) THEN
		RETURN NULL;
	
	END IF;
	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_refuse
 *
 * DESC : Funzione che rifiuta una qualsiasi operazione che attivi il trigger
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_refuse
(
)
RETURNS trigger
AS
$$
BEGIN

	IF ('INSERT' = TG_OP) THEN
		RETURN NULL;
	
	ELSIF ('UPDATE' = TG_OP) THEN
		RETURN OLD;
	
	ELSIF ('DELETE' = TG_OP) THEN
		RETURN NULL;
	
	END IF;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_country
 *
 * DESC : Funzione che controlla che il nuovo paese che si vuole inserire
 *        sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_country
(
)
RETURNS trigger
AS
$$
DECLARE

	type_super_country	en_country;

BEGIN

	IF (place_for_country(NEW.type)) THEN

		type_super_country = get_column
							 (
								'@',
								'fp_country'
								'@id@' || NEW.super_id::text,
								'type'
							 )::en_country;

		IF (can_be_inside(NEW.type, type_super_country)) THEN
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
 * NAME : tf_ai_country_nation
 *
 * DESC : Funzione che dopo l'inserimento di un paese ne crea
 *        la squadra nazionale corrispondente
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_country_nation
(
)
RETURNS trigger
AS
$$
BEGIN

	PERFORM create_national_team(NEW.id);


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

	type_country		en_country;

	id_country_super	integer;
	type_country_super	en_country;


BEGIN

	type_country = get_column
				   (
						'@',
						'fp_country'
						'@id@' || NEW.country_id::text,
						'type'
				   )::en_country;


	id_country_super = get_column
					   (
							'@',
							'fp_confederation'
							'@id@' || NEW.super_id::text,
							'country_id'
					   )::integer;

	type_country_super = get_column
						 (
							'@',
							'fp_country'
							'@id@' || id_country_super::text,
							'type'
						 )::en_country;


	IF (can_be_inside(type_country, type_country_super)) THEN
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

	id_country_conf		integer;
	type_country_conf	en_country;

BEGIN

	id_country_conf = get_column
					  (
							'@',
							'fp_confederation'
							'@id@' || NEW.confederation_id::text,
							'country_id'
					  )::integer;

	type_country_conf = get_column
						(
							'@',
							'fp_country'
							'@id@' || id_country_conf::text,
							'type'
						)::en_country;

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

	-- se la competizione non ha edizioni
	IF
	(
		NOT row_exists
			(
				'@',
				'fp_competition_edition'
				'@competition_id@' || NEW.competition_id::text
			)
	)
	THEN
		RETURN NEW;

	ELSE
		-- se esiste già un'edizione della competizione
		-- quella che si vuole inserire deve rispettare la frequenza della competizione
		IF (corr_freq(NEW.competition_id, NEW.start_year)) THEN
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

	rec_country	record;

BEGIN

	-- se la squadra è associata ad una nazione
	IF
	(
		row_exists
		(
			'@',
			'fp_country'
			'@type@NATION'
			'@id@' || NEW.country_id::text
		)
	)
	THEN

		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;

		-- se la squadra è di tipo nazionale deve avere lo stesso nome
		-- della nazione cui è associata		
		ELSIF ('NATIONAL' = NEW.type) THEN

			rec_country = get_record
						  (
							'@',
							'fp_country'
							'@id@' || NEW.country_id::text
						  );
			
			IF
			(
				NEW.short_name = rec_country.code
				AND
				NEW.long_name = rec_country.name
			)
			THEN
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
DECLARE

	role_pos	en_role_mix;

BEGIN

	-- se il paese di nascita e' una nazione
	IF
	(
		row_exists
		(
			'@',
			'fp_country'
			'@type@NATION'
			'@id@' || NEW.country_id::text
		)
	)
	THEN

		role_pos = get_column
				   (
						'@',
						'fp_position'
						'@id@' || NEW.position_id::text,
						'role'
				   )::en_role_mix;

		IF (NEW.role = role_pos) THEN
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
 * NAME : tf_ai_player
 *
 * DESC : Funzione che dopo l'inserimento di un calciatore ne aggiorna la
 *        nazionalità, l'associazione tra calciatore e posizione e
 *        crea gli attributi riferiti al calciatore
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
	)
	ON CONFLICT DO NOTHING;


	INSERT INTO
		fp_player_position
		(
			player_id,
			position_id
		)
	VALUES
	(
		NEW.id,
		NEW.position_id
	)
	ON CONFLICT DO NOTHING;


	PERFORM create_attributes(NEW.id);


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

	-- se il paese di nascita e' una nazione
	IF
	(
		row_exists
		(
			'@',
			'fp_country'
			'@type@NATION'
			'@id@' || NEW.country_id::text
		)
	)
	THEN
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

	retired_date	date;

	born_year		integer;

BEGIN

	-- se il giocatore e' ritirato
	IF
	(
		row_exists
		(
			'@',
			'fp_player_retired'
			'@player_id@' || NEW.id::text
		)
	)
	THEN

		retired_date = get_column
					   (
							'@',
							'fp_player_retired'
							'@player_id@' || NEW.id::text,
							'retired_date'
					   )::date;

		IF (NOT corr_age_limit(NEW.dob, retired_date)) THEN
			RETURN OLD;
		END IF;
	
	END IF;

	-- se il calciatore ha una qualunque militanza
	IF
	(
		row_exists
		(
			'@',
			'fp_militancy'
			'@player_id@' || NEW.id::text
		)
	)
	THEN

		born_year = extract(year from NEW.dob);

		IF (min_militancy_year(NEW.id) - born_year < min_age()) THEN
			RETURN OLD;
		END IF;

		-- se il giocatore non e' ritirato
		IF
		(
			NOT row_exists
				(
					'@',
					'fp_player_retired'
					'@player_id@' || NEW.id::text
				)
		)
		THEN

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
	)
	ON CONFLICT DO NOTHING;
	

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_player_pos
 *
 * DESC : Funzione che dopo l'aggiornamento della posizione principale di un
 *        calciatore, aggiorna l'associazione tra calciatore e posizione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_player_pos
(
)
RETURNS trigger
AS
$$
BEGIN
	
	INSERT INTO
		fp_player_position
		(
			player_id,
			position_id
		)
	VALUES
	(
		NEW.id,
		NEW.position_id
	)
	ON CONFLICT DO NOTHING;
	

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
	IF
	(
		OLD.role::text LIKE '%GK%'
		AND
		NEW.role::text NOT LIKE '%GK%'
	)
	THEN
		PERFORM delete_all_gk(NEW.id);
	-- se il calciatore ha acquisito il ruolo di portiere
	ELSIF
	(
		OLD.role::text NOT LIKE '%GK%'
		AND
		NEW.role::text LIKE '%GK%'
	)
	THEN
		PERFORM create_all_gk(NEW.id);
	
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

	born_date		date;
	retired_year	integer;

BEGIN

	born_date = get_column
				(
					'@',
					'fp_player'
					'@id@' || NEW.player_id::text,
					'dob'
				)::date;

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		RETURN NULL;
	END IF;
	
	-- se il calciatore ha una qualsiasi militanza
	IF
	(
		row_exists
		(
			'@',
			'fp_militancy'
			'@player_id@' || NEW.player_id::text
		)
	)
	THEN

		retired_year = extract(year from NEW.retired_date);
	
		IF (max_militancy_year(NEW.player_id) >= retired_year) THEN
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

	born_date		date;
	retired_year	integer;

BEGIN


	born_date = get_column
				(
					'@',
					'fp_player'
					'@id@' || NEW.player_id::text,
					'dob'
				)::date;

	IF (NOT corr_age_limit(born_date, NEW.retired_date)) THEN
		RETURN OLD;	
	END IF;
	

	-- se il calciatore ha una qualsiasi militanza
	IF
	(
		row_exists
		(
			'@',
			'fp_militancy'
			'@player_id@' || NEW.player_id::text
		)
	)
	THEN

		retired_year = extract(year from NEW.retired_date);
	
		IF (max_militancy_year(NEW.player_id) >= retired_year) THEN
			RETURN OLD;
		END IF;
	
	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_nationality
 *
 * DESC : Funzione che controlla che la nuova nazionalità
 *        che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_nationality
(
)
RETURNS trigger
AS
$$
BEGIN

	-- se il paese e' una nazione
	IF
	(
		row_exists
		(
			'@',
			'fp_country'
			'@type@NATION'
			'@id@' || NEW.country_id::text
		)
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

	id_country_player	integer;

	id_team				integer;

	id_country_team		integer;

BEGIN

	id_country_player = get_column
						(
							'@',
							'fp_player'
							'@id@' || OLD.player_id::text,
							'country_id'
						)::integer;


	IF (OLD.country_id = id_country_player) THEN
		RETURN NULL;
	END IF;

	-- se il giocatore ha militato in una nazionale
	IF
	(
		row_exists
		(
			'@',
			'fp_militancy'
			'@team_type@NATIONAL'
			'@player_id@' || OLD.player_id::text
		)
	)
	THEN

		id_team = national_team(OLD.player_id);

		id_country_team = get_column
						  (
								'@',
								'fp_team'
								'@id@' || id_team::text,
								'country_id'
						  )::integer;

		
		IF (OLD.country_id = id_country_team) THEN
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

	id_conf_comp	integer;

BEGIN

	id_conf_comp = get_column
				   (
						'@',
						'fp_competition'
						'@id@' || NEW.competition_id::text,
						'confederation_id'
				   )::integer;


	IF
	(
		-- se l'edizione ha ancora posti disponibili
		has_place(NEW.competition_id, NEW.start_year)
		AND
		-- ..e la squadra appartiene alla confederazione che organizza la competizione
		belong_to(NEW.team_id, id_conf_comp)
		AND
		-- ..e la squadra è compatibile con la competizione
		team_fit_comp(NEW.team_id, NEW.competition_id)
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
 * NAME : tf_ai_partecipation
 *
 * DESC : Funzione che dopo l'inserimento di una partecipazione
 *        ne crea i giochi corrispondenti
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_partecipation
(
)
RETURNS trigger
AS
$$
BEGIN

	PERFORM create_play_from_partecipation(NEW.team_id, NEW.competition_id, NEW.start_year);


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

	start_valid	integer;
	end_valid	integer;

	id_country	integer;

BEGIN

	SELECT
		*
	INTO
		start_valid,
		end_valid
	FROM
		valid_year_range(NEW.player_id);

	-- la militanza deve essere in un anno valido
	IF (NEW.start_year NOT BETWEEN start_valid AND end_valid) THEN
		RETURN NULL;
	END IF;


	IF ('NATIONAL' = NEW.team_type) THEN

		id_country = get_column
					 (
						'@',
						'fp_team'
						'@id@' || NEW.team_id::text,
						'country_id'
					 )::integer;

		-- se il calciatore non ha la nazionalita' del paese della squadra nazionale in questione
		IF
		(
			NOT row_exists
				(
					'@',
					'fp_nationality'
					'@player_id@' || NEW.player_id::text
					||
					'@country_id@' || id_country::text
				)
		)
		THEN
			RETURN NULL;
		END IF;

		-- se il giocatore ha militato in una nazionale
		IF
		(
			row_exists
			(
				'@',
				'fp_militancy'
				'@team_type@NATIONAL'
				'@player_id@' || NEW.player_id::text
			)
		)
		THEN

			-- se è una militanza nazionale e il calciatore ha gia
			-- militato in nazionale la squadra deve essere la stessa
			IF (national_team(NEW.player_id) <> NEW.team_id) THEN
				RETURN NULL;
			END IF;

		END IF;

	END IF;


	IF (NOT free_militancy(NEW.player_id, NEW.team_type, NEW.start_year, NEW.type)) THEN
		RETURN NULL;
	END IF;


	RETURN NEW;
	
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

	IF ('II_PART' = NEW.type OR 'FULL' = NEW.type) THEN
		PERFORM assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
	END IF;


	PERFORM create_play_from_militancy(NEW.player_id, NEW.team_id, NEW.start_year);

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_militancy
 *
 * DESC : Funzione che valuta se sia possibile aggiornare una militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_militancy
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (is_free_militancy(NEW.team_type, NEW.team_id, NEW.player_id, NEW.start_year)) THEN
		RETURN NEW;
	END IF;


	RETURN OLD;
	
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
	IF ('I_PART' = OLD.type AND NEW.type <> 'I_PART') THEN
		PERFORM assign_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);

	-- se la militanza aggiornata non si riferisce alla seconda parte di stagione
	ELSIF (OLD.type <> 'I_PART' AND 'I_PART' = NEW.type) THEN
		PERFORM remove_all_trophy_season(NEW.player_id, NEW.team_id, NEW.start_year);
		
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
 *              (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NEW.match <= max_match_comp(NEW.competition_id)) THEN
		RETURN NEW;
	END IF;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_ai_play
 *
 * DESC : Funzione che dopo l'inserimento di un gioco ne crea
 *        le statistiche corrispondenti
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_ai_play
(
)
RETURNS trigger
AS
$$
BEGIN

	PERFORM create_statistics(NEW.id);


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
 *        NOTA: per il numero massimo dI_PARTite per team abbiamo effettuato
 *              un'approssimazione per eccesso basata su numerose osservazioni
 *              (Wikipedia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_play_match
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NEW.match <= max_match_comp(NEW.competition_id)) THEN
		RETURN NEW;
	END IF;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_au_play_match
 *
 * DESC : Funzione che dopo l'aggiornamento del numero di partite
 *        di un gioco setta le statistiche corrispondenti a zero se
 *        il numero di partite è uguale a zero
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_au_play_match
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (0 = NEW.match) THEN
		PERFORM set_zero_statistics(NEW.id);
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
 * DESC : Funzione che controlla che l'associazione tra calciatore e tag
 *        che si vuole inserire sia valida
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_tag
(
)
RETURNS trigger
AS
$$
DECLARE

	goalkeeper	boolean;

	role_player	en_role_mix;

BEGIN

	goalkeeper = get_column
				 (
					'@',
					'fp_tag'
					'@id@' || NEW.tag_id::text,
					'goalkeeper'
				 )::boolean;
	

	IF (goalkeeper) THEN
	
		role_player = get_column
					  (
						'@',
						'fp_player'
						'@id@' || NEW.player_id::text,
						'role'
					  )::en_role_mix;

		IF (role_player::text NOT LIKE '%GK%') THEN
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

	role_player		en_role_mix;
	new_role_player	en_role_mix;

BEGIN

	new_role_player = new_role(NEW.player_id);

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || NEW.player_id::text,
						'role'
				  )::en_role_mix;


	IF (role_player <> new_role_player) THEN
		
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
 * DESC : Funzione che controlla che l'associazione tra un
 *        calciatore ed una posizione che si vuole eliminare
 *        non sia la posizione principale del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_player_position
(
)
RETURNS trigger
AS
$$
DECLARE

	id_pos_player	integer;

BEGIN

	-- se la posizione fa riferimento ad un calciatore
	IF
	(
		row_exists
		(
			'@',
			'fp_player'
			'@id@' || OLD.player_id::text
		)
	)
	THEN

		id_pos_player = get_column
						(
							'@',
							'fp_player'
							'@id@' || OLD.player_id::text,
							'position_id'
						)::integer;
	
		IF (id_pos_player = OLD.position_id) THEN
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

	role_player		en_role_mix;
	new_role_player	en_role_mix;

BEGIN

	-- se la posizione fa riferimento ad un calciatore
	IF
	(
		row_exists
		(
			'@',
			'fp_player'
			'@id@' || OLD.player_id::text
		)
	)
	THEN

		role_player = get_column
					  (
							'@',
							'fp_player'
							'@id@' || OLD.player_id::text,
							'role'
					  )::en_role_mix;

		new_role_player = new_role(OLD.player_id);


		IF (role_player <> new_role_player) THEN
			
			UPDATE
				fp_player
			SET
				role = new_role_player
			WHERE
				id = OLD.player_id;

		END IF;
		
	END IF;


	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_attribute_goalkeeping
 *
 * DESC : Funzione che controlla che l'attributo per portieri di un calciatore
 *        che si vuole inserire sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_attribute_goalkeeping
(
)
RETURNS trigger
AS
$$
DECLARE

	role_player	en_role_mix;

BEGIN

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || NEW.player_id::text,
						'role'
				  )::en_role_mix;


	IF (role_player::text NOT LIKE '%GK%') THEN
		RETURN NULL;
	END IF;


	RETURN NEW;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_attribute_goalkeeping
 *
 * DESC : Funzione che controlla che l'attributo per portieri di un calciatore
 *        che si vuole eliminare non si riferisca ad un calciatore
 *        che ha tra i suoi ruoli di gioco il portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_attribute_goalkeeping
(
)
RETURNS trigger
AS
$$
DECLARE

	role_player	en_role_mix;

BEGIN

	-- se la lista di attributi fa riferimento ad un calciatore
	IF
	(
		row_exists
		(
			'@',
			'fp_player@id@' || OLD.player_id::text
		)
	)
	THEN

		role_player = get_column
					  (
							'@',
							'fp_player'
							'@id@' || OLD.player_id::text,
							'role'
					  )::en_role_mix;

		IF (role_player::text LIKE '%GK%') THEN
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
 * NAME : tf_bd_attribute_references
 *
 * DESC : Funzione che controlla che l'attributo di un calciatore
 *        che si vuole eliminare non si riferisca più ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_attribute_references
(
)
RETURNS trigger
AS
$$
BEGIN

	-- se la lista di attributi fa riferimento ad un calciatore
	IF
	(
		row_exists
		(
			'@',
			'fp_player'
			'@id@' || OLD.player_id::text
		)
	)
	THEN
		RETURN NULL;
	END IF;

	
	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bu_statistic
 *
 * DESC : Funzione che controlla che l'aggiornamento delle statistiche
 *        di un gioco sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bu_statistic
(
)
RETURNS trigger
AS
$$
DECLARE

	match_play	dm_usint;

BEGIN

	match_play = get_column
				 (
					'@',
					'fp_play'
					'@id@' || NEW.play_id::text,
					'match'
				 )::dm_usint;


	IF (match_play > 0) THEN
		RETURN NEW;
	
	ELSIF (0 = match_play) THEN

		IF ('fp_statistic_general' = TG_TABLE_NAME) THEN

			IF
			(
				0 = NEW.goal_scored
				AND
				0 = NEW.assist
				AND
				0 = NEW.yellow_card
				AND
				0 = NEW.red_card
				AND
				0 = NEW.penalty_scored
			)
			THEN
				RETURN NEW;
			END IF;

		ELSIF ('fp_statistic_goalkeeper' = TG_TABLE_NAME) THEN

			IF
			(
				0 = NEW.goal_conceded
				AND
				0 = NEW.penalty_saved
			)
			THEN
				RETURN NEW;
			END IF;

		END IF;

	END IF;


	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_statistic_general
 *
 * DESC : Funzione che controlla che la statistica generale di un gioco
 *        che si vuole eliminare non si riferisca più ad un gioco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_statistic_general
(
)
RETURNS trigger
AS
$$
BEGIN

	-- se il gioco fa riferimento ad un calciatore
	IF
	(
		row_exists
		(
			'@',
			'fp_play'
			'@id@' || OLD.play_id::text
		)
	)
	THEN
		RETURN NULL;
	END IF;

	
	RETURN OLD;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bi_statistic_goalkeeper
 *
 * DESC : Funzione che controlla che la statistica per portieri di un gioco
 *        che si vuole inserire sia valido
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_statistic_goalkeeper
(
)
RETURNS trigger
AS
$$
DECLARE

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	id_player = get_column
				(
					'@',
					'fp_play'
					'@id@' || NEW.play_id::text,
					'player_id'
				)::integer;

	role_player = get_column
				  (
						'@',
						'fp_player'
						'@id@' || id_player::text,
						'role'
				  )::en_role_mix;

	
	IF (role_player::text LIKE '%GK%') THEN
		RETURN NEW;
	END IF;

	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION
 * NAME : tf_bd_statistic_goalkeeper
 *
 * DESC : Funzione che controlla che la statistica per portieri di un gioco
 *        che si vuole eliminare non si riferisca ad un gioco associato
 *        ad un calciatore che ha tra i suoi ruoli di gioco il portiere
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bd_statistic_goalkeeper
(
)
RETURNS trigger
AS
$$
DECLARE

	id_player	integer;
	role_player	en_role_mix;

BEGIN

	-- se il gioco fa riferimento ad un calciatore
	IF
	(
		row_exists
		(
			'@',
			'fp_play'
			'@id@' || OLD.play_id::text
		)
	)
	THEN
		
		id_player = get_column
					(
						'@',
						'fp_play'
						'@id@' || NEW.play_id::text,
						'player_id'
					)::integer;

		role_player = get_column
					  (
							'@',
							'fp_player'
							'@id@' || id_player::text,
							'role'
					  )::en_role_mix;

		IF (role_player::text LIKE '%GK%') THEN
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

	type_trophy	en_award;

BEGIN

	type_trophy = get_column
				  (
						'@',
						'fp_trophy'
						'@id@' || NEW.trophy_id::text,
						'type'
				  )::en_award;


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
			type <> 'I_PART'
	
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
			NEW.trophy_id,
			NEW.start_year,
			NEW.competition_id
		)
		ON CONFLICT DO NOTHING;

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
		trophy_id = OLD.trophy_id
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

	type_militancy	en_season;

	type_trophy		en_award;
	role_trophy		en_role;

	role_player		en_role_mix;

BEGIN

	type_militancy = get_column
					 (
						'@',
						'fp_militancy'
						'@player_id@' || NEW.player_id::text
						||
						'@team_id@' || NEW.team_id::text
						||
						'@start_year@' || NEW.start_year::text,
						'type'
					 )::en_season;


	IF (type_militancy <> 'I_PART') THEN

		type_trophy = get_column
					  (
							'@',
							'fp_trophy'
							'@id@' || NEW.trophy_id::text,
							'type'
					  )::en_award;

		IF ('TEAM' = type_trophy) THEN

			-- se si tratta di un trofeo di squadra la squadra in questione deve avere il trofeo
			IF 
			(
				row_exists
				(
					'@',
					'fp_team_trophy_case'
					'@team_id@' || NEW.team_id::text
					||
					'@trophy_id@' || NEW.trophy_id::text
					||
					'@start_year@' || NEW.start_year::text
					||
					'@competition_id@' || NEW.competition_id::text
				)
			)
			THEN
				RETURN NEW;
			END IF;
		
		ELSIF ('PLAYER' = type_trophy) THEN

			role_trophy = get_column
						  (
								'@',
								'fp_trophy'
								'@id@' || NEW.trophy_id::text,
								'role'
						  )::en_role;

			IF (role_trophy IS NULL) THEN
				RETURN NEW;
			
			ELSE

				role_player = get_column
							  (
									'@',
									'fp_player@id@' || NEW.player_id::text,
									'role'
							  )::en_role_mix;

				IF (position(role_trophy::text in role_player::text) > 0) THEN
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

	type_militancy	en_season;

	type_trophy		en_award;

BEGIN

	type_trophy = get_column
				  (
						'@',
						'fp_trophy'
						'@id@' || OLD.trophy_id::text,
						'type'
				  )::en_award;

	IF ('TEAM' = type_trophy) THEN

		type_militancy = get_column
						 (
							'@',
							'fp_militancy'
							'@player_id@' || OLD.player_id::text
							||
							'@team_id@' || OLD.team_id::text
							||
							'@start_year@' || OLD.start_year::text,
							'type'
						 )::en_season;
	
		-- se il trofeo è di squadra
		-- tale trofeo sarà eliminabile solo se la squadra non ha il trofeo
		-- o se il calciatore non milita nella parte finale di stagione
		IF
		(
			row_exists
			(
				'@',
				'fp_team_trophy_case'
				'@team_id@' || OLD.team_id::text
				||
				'@trophy_id@' || OLD.trophy_id::text
				||
				'@start_year@' || OLD.start_year::text
				||
				'@competition_id@' || OLD.competition_id::text
			)
			AND
			type_militancy <> 'I_PART' 
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

	type_prize	en_award;

BEGIN

	type_prize = get_column
				 (
					'@',
					'fp_trophy'
					'@id@' || NEW.prize_id::text,
					'type'
				 )::en_award;

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

	type_prize	en_award;
	role_prize	en_role;

	start_valid	integer;
	end_valid	integer;

	role_player	en_role_mix;

BEGIN

	type_prize = get_column
				 (
					'@',
					'fp_trophy'
					'@id@' || NEW.prize_id::text,
					'type'
				 )::en_award;
	
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

			role_prize = get_column
						 (
							'@',
							'fp_trophy'
							'@id@' || NEW.prize_id::text,
							'role'
						 )::en_role;

			IF (role_prize IS NULL) THEN		
				RETURN NEW;
			
			ELSE

				role_player = get_column
							  (
									'@',
									'fp_player'
									'@id@' || NEW.player_id::text,
									'role'
							  )::en_role_mix;

				IF (position(role_prize::text in role_player::text) > 0) THEN
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
 * NAME : tg_bi_country_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento di un paese
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_country_refuse
BEFORE INSERT ON fp_country
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
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
 * NAME : tg_bi_confederation_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento
 *        di una confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation_refuse
BEFORE INSERT ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
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
 * NAME : tg_bi_competition_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_competition_refuse
BEFORE INSERT ON fp_competition
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
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
 * NAME : tg_bu_militancy
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento di una militanza
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_militancy
BEFORE UPDATE ON fp_militancy
FOR EACH ROW
WHEN
(
	OLD.team_id IS NOT DISTINCT FROM NEW.team_id
	AND
	OLD.team_type IS NOT DISTINCT FROM NEW.team_type
	AND
	OLD.player_id IS NOT DISTINCT FROM NEW.player_id
	AND
	OLD.start_year IS NOT DISTINCT FROM NEW.start_year
	AND
	OLD.type <> 'FULL'
)
EXECUTE FUNCTION tf_bu_militancy();
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
		'I_PART' = OLD.type
		OR
		'I_PART' = NEW.type
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
 * NAME : tg_bi_tag_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento di un tag
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_tag_refuse
BEFORE INSERT ON fp_tag
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

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
 * NAME : tg_bi_position_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento
 *        di una posizione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_position_refuse
BEFORE INSERT ON fp_position
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

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
 *        di riferimento di una statistica generale 
 ******************************************************************************/
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
 * NAME : tg_bi_trophy_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento
 *        di un trofeo calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_trophy_refuse
BEFORE INSERT ON fp_trophy
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : TRIGGER
 * NAME : tg_bu_trophy_refuse
 *
 * DESC : Trigger che si attiverà prima dell'aggiornamento
 *        di un trofeo calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bu_trophy_refuse
BEFORE UPDATE ON fp_trophy
FOR EACH ROW
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
FOR EACH ROW
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
 * NAME : tg_bi_prize_refuse
 *
 * DESC : Trigger che rifiuta l'inserimento
 *        di un premio calcistico
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_prize_refuse
BEFORE INSERT ON fp_prize
FOR EACH ROW
EXECUTE FUNCTION tf_refuse();
--------------------------------------------------------------------------------

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

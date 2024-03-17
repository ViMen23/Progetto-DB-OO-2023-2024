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
 * TYPE : CHECK CONSTRAINT - fp_player TABLE
 * NAME : ck_player
 *
 * DESC : Non possono esistere calciatori con un eta' riferita all'anno corrente
 *        minore dell'eta' minima
 ******************************************************************************/
ALTER TABLE	fp_player
ADD CONSTRAINT ck_player
CHECK
(
	(extract(year from current_date) - extract(year from dob)) >= 14
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
	punching_tendency		dm_attribute	NOT NULL	DEFAULT 0,
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
	strength		dm_attribute	NOT NULL	DEFAULT 0
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
	penalty_taking		dm_attribute	NOT NULL	DEFAULT 0,
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
 * TYPE : PRIMARY KEY CONSTRAINT - fp_user_account TABLE
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
		strength = random_between(0, 10)
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
		penalty_taking = random_between(0, 10),
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
		punching_tendency = random_between(0, 10),
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

			IF 
			(
				NOT row_exists
					(
						'@',
						'fp_player_trophy_case'
						'@trophy_id@' || NEW.trophy_id::text
						||
						'@start_year@' || NEW.start_year::text
						||
						'@competition_id@' || NEW.competition_id::text
					)
			)
			THEN

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
					'fp_prize'
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
					'fp_prize'
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
							'fp_prize'
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
 * INSERT COUNTRY
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE COUNTRY
 ******************************************************************************/
INSERT INTO fp_country (type, code, name, super_id)
VALUES
('WORLD', 'WLD', 'World', NULL);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT CONTINENT TYPE COUNTRY
 ******************************************************************************/
INSERT INTO fp_country (type, code, name, super_id)
VALUES
(
	'CONTINENT',
	'AFR',
	'Africa',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'ASI',
	'Asia',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'EUR',
	'Europe',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'NCA',
	'North Center America',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'OCN',
	'Oceania',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'STA',
	'South America',
	get_column('@', 'fp_country@name@World', 'id')::integer
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * INSERT NATION TYPE COUNTRY
 ******************************************************************************/
INSERT INTO fp_country (type, code, name, super_id)
VALUES
(
	'NATION',
	'AFG',
	'Afghanistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'AGO',
	'Angola',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ALB',
	'Albania',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'AND',
	'Andorra',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ARE',
	'United Arab Emirates',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ARG',
	'Argentina',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'ARM',
	'Armenia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ATG',
	'Antigua and Barbuda',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'AUS',
	'Australia',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'AUT',
	'Austria',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'AZE',
	'Azerbaijan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BDI',
	'Burundi',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'BEL',
	'Belgium',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BEN',
	'Benin',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'BFA',
	'Burkina Faso',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'BGD',
	'Bangladesh',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BGR',
	'Bulgaria',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BHR',
	'Bahrain',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BHS',
	'Bahamas',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'BIH',
	'Bosnia and Herzegovina',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BLR',
	'Belarus',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BLZ',
	'Belize',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'BOL',
	'Bolivia',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'BRA',
	'Brazil',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'BRB',
	'Barbados',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'BRN',
	'Brunei',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BTN',
	'Bhutan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BWA',
	'Botswana',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CAF',
	'Central African Republic',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CAN',
	'Canada',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'CHE',
	'Switzerland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'CHL',
	'Chile',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'CHN',
	'China',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'CIV',
	'Côte d''Ivoire',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CMR',
	'Cameroon',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'COD',
	'Democratic Republic of the Congo',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'COG',
	'Congo',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'COL',
	'Colombia',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'COM',
	'Comoros',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CPV',
	'Cabo Verde',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CRI',
	'Costa Rica',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'CUB',
	'Cuba',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'CUW',
	'Curaçao',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'CYP',
	'Cyprus',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'CZE',
	'Czech Republic',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'DEU',
	'Germany',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'DJI',
	'Djibouti',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'DMA',
	'Dominica',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'DNK',
	'Denmark',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'DOM',
	'Dominican Republic',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'DZA',
	'Algeria',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ECU',
	'Ecuador',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'EGY',
	'Egypt',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ENG',
	'England',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ERI',
	'Eritrea',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ESP',
	'Spain',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'EST',
	'Estonia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ETH',
	'Ethiopia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'FIN',
	'Finland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'FJI',
	'Fiji',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'FRA',
	'France',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'FSM',
	'Micronesia',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'GAB',
	'Gabon',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GEO',
	'Georgia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'GHA',
	'Ghana',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GIN',
	'Guinea',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GMB',
	'Gambia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GNB',
	'Guinea-Bissau',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GNQ',
	'Equatorial Guinea',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GRC',
	'Greece',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'GRD',
	'Grenada',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'GTM',
	'Guatemala',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'GUY',
	'Guyana',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'HND',
	'Honduras',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'HRV',
	'Croatia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'HTI',
	'Haiti',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'HUN',
	'Hungary',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'IDN',
	'Indonesia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'IND',
	'India',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'IRL',
	'Ireland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'IRN',
	'Iran',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'IRQ',
	'Iraq',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ISL',
	'Iceland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ISR',
	'Israel',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ITA',
	'Italy',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'JAM',
	'Jamaica',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'JOR',
	'Jordan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'JPN',
	'Japan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KAZ',
	'Kazakhstan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KEN',
	'Kenya',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'KGZ',
	'Kyrgyzstan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KHM',
	'Cambodia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KIR',
	'Kiribati',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'KNA',
	'Saint Kitts and Nevis',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'KOR',
	'South Korea',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KWT',
	'Kuwait',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LAO',
	'Lao People''s Democratic Republic',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LBN',
	'Lebanon',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LBR',
	'Liberia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'LBY',
	'Libya',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'LCA',
	'Saint Lucia',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'LIE',
	'Liechtenstein',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'LKA',
	'Sri Lanka',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LSO',
	'Lesotho',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'LTU',
	'Lithuania',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'LUX',
	'Luxembourg',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'LVA',
	'Latvia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MAR',
	'Morocco',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MCO',
	'Monaco',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MDA',
	'Moldova',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MDG',
	'Madagascar',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MDV',
	'Maldives',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'MEX',
	'Mexico',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'MHL',
	'Marshall Islands',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'MKD',
	'North Macedonia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MLI',
	'Mali',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MLT',
	'Malta',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MMR',
	'Myanmar',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'MNE',
	'Montenegro',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MNG',
	'Mongolia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'MOZ',
	'Mozambique',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MRT',
	'Mauritania',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MUS',
	'Mauritius',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MWI',
	'Malawi',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MYS',
	'Malaysia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'NAM',
	'Namibia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'NER',
	'Niger',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'NGA',
	'Nigeria',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'NIC',
	'Nicaragua',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'NIR',
	'Northern Ireland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'NIU',
	'Niue',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),	
(
	'NATION',
	'NLD',
	'Netherlands',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'NOR',
	'Norway',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'NPL',
	'Nepal',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'NRU',
	'Nauru',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'NZL',
	'New Zealand',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'OMN',
	'Oman',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PAK',
	'Pakistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PAN',
	'Panama',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'PER',
	'Peru',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'PHL',
	'Philippines',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PLW',
	'Palau',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'PNG',
	'Papua New Guinea',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'POL',
	'Poland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'PRI',
	'Puerto Rico',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'PRK',
	'North Korea',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PRT',
	'Portugal',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'PRY',
	'Paraguay',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'PSE',
	'Palestine',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'QAT',
	'Qatar',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ROU',
	'Romania',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'RUS',
	'Russian Federation',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'RWA',
	'Rwanda',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SAU',
	'Saudi Arabia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'SCT',
	'Scotland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SDN',
	'Sudan',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SEN',
	'Senegal',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SGP',
	'Singapore',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'SLB',
	'Solomon Islands',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'SLE',
	'Sierra Leone',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SLV',
	'El Salvador',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'SMR',
	'San Marino',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SOM',
	'Somalia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SRB',
	'Serbia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SSD',
	'South Sudan',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'STP',
	'São Tomé and Príncipe',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SUR',
	'Suriname',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'SVK',
	'Slovakia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SVN',
	'Slovenia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SWE',
	'Sweden',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SWZ',
	'Eswatini',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SYC',
	'Seychelles',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SYR',
	'Syria',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TCD',
	'Chad',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'TGO',
	'Togo',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'THA',
	'Thailand',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TJK',
	'Tajikistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TKM',
	'Turkmenistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TLS',
	'Timor-Leste',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TON',
	'Tonga',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'TTO',
	'Trinidad and Tobago',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'TUN',
	'Tunisia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'TUR',
	'Türkiye',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TWN',
	'Taiwan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TZA',
	'Tanzania',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'UGA',
	'Uganda',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'UKR',
	'Ukraine',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'URY',
	'Uruguay',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'USA',
	'United States',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'UZB',
	'Uzbekistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'VCT',
	'Saint Vincent and the Grenadines',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'VEN',
	'Venezuela',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'VNM',
	'Vietnam',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'VUT',
	'Vanuatu',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'WLS',
	'Wales',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'WSM',
	'Samoa',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'XKX',
	'Kosovo',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'YEM',
	'Yemen',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'YUG',
	'Jugoslavia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ZAF',
	'South Africa',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ZMB',
	'Zambia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ZWE',
	'Zimbabwe',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
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
 * INSERT CONFEDERATION
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'FIFA',
	'Fédération Internationale de Football Association',
	get_column('@', 'fp_country@name@World', 'id')::integer,
	NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT CONTINENT TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'CAF',
	'Confederation of African Football',
	get_column('@', 'fp_country@name@Africa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
	
),
(
	'AFC',
	'Asian Football Confederation',
	get_column('@', 'fp_country@name@Asia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'CONCACAF',
	'Confederation of North and Central America and Caribbean Association Football',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'CONMEBOL',
	'Confederación Sudamericana de Fútbol',
	get_column('@', 'fp_country@name@South America', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'OFC',
	'Oceania Football Confederation',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'UEFA',
	'Union of European Football Associations',
	get_column('@', 'fp_country@name@Europe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT NATION TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'AFF',
	'Afghanistan Football Federation',
	get_column('@', 'fp_country@name@Afghanistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer	
),
(
	'FAF',
	'Angolan Football Federation',
	get_column('@', 'fp_country@name@Angola', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSHF',
	'Federata Shqiptare e Futbollit',
	get_column('@', 'fp_country@name@Albania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FAF',
	'Federació Andorrana de Futbol',
	get_column('@', 'fp_country@name@Andorra', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'UAEFA',
	'UAE Football Association',
	get_column('@', 'fp_country@name@United Arab Emirates', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'AFA',
	'Asociación del Fútbol Argentino',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'FFA',
	'Football Federation of Armenia',
	get_column('@', 'fp_country@name@Armenia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ABFA',
	'Antigua and Barbuda Football Association',
	get_column('@', 'fp_country@name@Antigua and Barbuda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FFA',
	'Football Federation Australia',
	get_column('@', 'fp_country@name@Australia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'ÖFB',
	'Österreichischer Fußball-Bund',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'AFFA',
	'Association of Football Federations of Azerbaijan',
	get_column('@', 'fp_country@name@Azerbaijan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFB',
	'Fédération de Football du Burundi',
	get_column('@', 'fp_country@name@Burundi', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'KBVB',
	'Royal Belgian Football Association',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FBF',
	'Fédération Béninoise de Football',
	get_column('@', 'fp_country@name@Benin', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FBF',
	'Fédération Burkinabé de Football',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'BFF',
	'Bangladesh Football Federation',
	get_column('@', 'fp_country@name@Bangladesh', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFU',
	'Bulgarian Football Union',
	get_column('@', 'fp_country@name@Bulgaria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'BFA',
	'Bahrain Football Association',
	get_column('@', 'fp_country@name@Bahrain', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFA',
	'Bahamas Football Association',
	get_column('@', 'fp_country@name@Bahamas', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'N/FSBiH',
	'Nogometni/Fudbalski Savez Bosne i Hercegovine',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'BFF',
	'Football Federation of Belarus',
	get_column('@', 'fp_country@name@Belarus', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFB',
	'Football Federation of Belize',
	get_column('@', 'fp_country@name@Belize', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FBF',
	'Federación Boliviana de Fútbol',
	get_column('@', 'fp_country@name@Bolivia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'CBF',
	'Confederação Brasileira de Futebol',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'BFA',
	'Barbados Football Association',
	get_column('@', 'fp_country@name@Barbados', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'NFABD',
	'National Football Association of Brunei Darussalam',
	get_column('@', 'fp_country@name@Brunei', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFF',
	'Bhutan Football Federation',
	get_column('@', 'fp_country@name@Bhutan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFA',
	'Botswana Football Association',
	get_column('@', 'fp_country@name@Botswana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),

(
	'FCF',
	'Fédération Centrafricaine de Football',
	get_column('@', 'fp_country@name@Central African Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'CSA',
	'Canada Soccer',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'SFV',
	'Swiss Football Association',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFCh',
	'Federación de Fútbol de Chile',
	get_column('@', 'fp_country@name@Chile', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'CFA',
	'Chinese Football Association',
	get_column('@', 'fp_country@name@China', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FIF',
	'Fédération Ivoirienne de Football',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECAFOOT',
	'Fédération Camerounaise de Football',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECOFA',
	'Fédération Congolaise de Football-Association',
	get_column('@', 'fp_country@name@Democratic Republic of the Congo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECOFOOT',
	'Fédération Congolaise de Football',
	get_column('@', 'fp_country@name@Congo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FCF',
	'Federación Colombiana de Fútbol',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'FFC',
	'Fédération Comorienne de Football',
	get_column('@', 'fp_country@name@Comoros', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FCF',
	'Federação Caboverdiana de Futebol',
	get_column('@', 'fp_country@name@Cabo Verde', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEDEFUTBOL',
	'Federación Costarricense de Fútbol',
	get_column('@', 'fp_country@name@Costa Rica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'AFC',
	'Asociación de Fútbol de Cuba',
	get_column('@', 'fp_country@name@Cuba', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FFK',
	'Federashon Futbòl Kòrsou',
	get_column('@', 'fp_country@name@Curaçao', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'CFA',
	'Cyprus Football Association',
	get_column('@', 'fp_country@name@Cyprus', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FAČR',
	'Fotbalová asociace České republiky',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'DFB',
	'Deutscher Fußball-Bund',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FDF',
	'Fédération Djiboutienne de Football',
	get_column('@', 'fp_country@name@Djibouti', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'DFA',
	'Dominica Football Association',
	get_column('@', 'fp_country@name@Dominica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'DBU',
	'Dansk Boldspil-Union',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FEDOFUTBOL',
	'Federación Dominicana de Fútbol',
	get_column('@', 'fp_country@name@Dominican Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FAF',
	'Fédération Algérienne de Football',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEF',
	'Federación Ecuatoriana de Fútbol',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'EFA',
	'Egyptian Football Association',
	get_column('@', 'fp_country@name@Egypt', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FA',
	'The Football Association',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ENFF',
	'Eritrean National Football Federation',
	get_column('@', 'fp_country@name@Eritrea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'RFEF',
	'Real Federación Española de Fútbol',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EJL',
	'Eesti Jalgpalli Liit',
	get_column('@', 'fp_country@name@Estonia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EFF',
	'Ethiopian Football Federation',
	get_column('@', 'fp_country@name@Ethiopia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SPL',
	'Suomen Palloliitto',
	get_column('@', 'fp_country@name@Finland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFA',
	'Fiji Football Association',
	get_column('@', 'fp_country@name@Fiji', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFF',
	'Fédération Française de Football',
	get_column('@', 'fp_country@name@France', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FSMFA',
	'Federated States of Micronesia Football Association',
	get_column('@', 'fp_country@name@Micronesia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FEGAFOOT',
	'Fédération Gabonaise de Football',
	get_column('@', 'fp_country@name@Gabon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'GFF',
	'Georgian Football Federation',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'GFA',
	'Ghana Football Association',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FGF',
	'Fédération Guinéenne de Football',
	get_column('@', 'fp_country@name@Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'GFF',
	'Gambia Football Federation',
	get_column('@', 'fp_country@name@Gambia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFGB',
	'Federação de Futebol da Guiné-Bissau',
	get_column('@', 'fp_country@name@Guinea-Bissau', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEGUIFUT',
	'Federación Ecuatoguineana de Fútbol',
	get_column('@', 'fp_country@name@Equatorial Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'EPO',
	'Hellenic Football Federation',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'GFA',
	'Grenada Football Association',
	get_column('@', 'fp_country@name@Grenada', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FENAFUTH',
	'Federación Nacional de Fútbol de Guatemala',
	get_column('@', 'fp_country@name@Guatemala', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'GFF',
	'Guyana Football Federation',
	get_column('@', 'fp_country@name@Guyana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FENAFUTH',
	'Federación Nacional Autónoma de Fútbol de Honduras',
	get_column('@', 'fp_country@name@Honduras', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'HNS',
	'Hrvatski nogometni savez',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FHF',
	'Fédération Haïtienne de Football',
	get_column('@', 'fp_country@name@Haiti', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'MLSZ',
	'Magyar Labdarúgó Szövetség',
	get_column('@', 'fp_country@name@Hungary', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'PSSI',
	'Indonesian Football Association',
	get_column('@', 'fp_country@name@Indonesia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'AIFF',
	'All India Football Federation',
	get_column('@', 'fp_country@name@India', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FAI',
	'Football Association of Ireland',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFIRI',
	'Football Federation Islamic Republic of Iran',
	get_column('@', 'fp_country@name@Iran', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'IFA',
	'Iraq Football Association',
	get_column('@', 'fp_country@name@Iraq', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'KSÍ',
	'Knattspyrnusamband Íslands',
	get_column('@', 'fp_country@name@Iceland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'IFA',
	'Israel Football Association',
	get_column('@', 'fp_country@name@Israel', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FIGC',
	'Federazione Italiana Giuoco Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'JFF',
	'Jamaica Football Federation',
	get_column('@', 'fp_country@name@Jamaica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'JFA',
	'Jordan Football Association',
	get_column('@', 'fp_country@name@Jordan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'JFA',
	'Japan Football Association',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFK',
	'Football Federation of Kazakhstan',
	get_column('@', 'fp_country@name@Kazakhstan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FKF',
	'Football Kenya Federation',
	get_column('@', 'fp_country@name@Kenya', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFKR',
	'Football Federation of the Kyrgyz Republic',
	get_column('@', 'fp_country@name@Kyrgyzstan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFC',
	'Football Federation of Cambodia',
	get_column('@', 'fp_country@name@Cambodia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'KIFA',
	'Kiribati Islands Football Association',
	get_column('@', 'fp_country@name@Kiribati', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'SKNFA',
	'Saint Kitts and Nevis Football Association',
	get_column('@', 'fp_country@name@Saint Kitts and Nevis', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'KFA',
	'Korea Football Association',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'KFA',
	'Kuwait Football Association',
	get_column('@', 'fp_country@name@Kuwait', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFF',
	'Lao Football Federation',
	get_column('@', 'fp_country@name@Lao People''s Democratic Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Lebanese Football Association',
	get_column('@', 'fp_country@name@Lebanon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Liberia Football Association',
	get_column('@', 'fp_country@name@Liberia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'LFF',
	'Libyan Football Federation',
	get_column('@', 'fp_country@name@Libya', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SLFA',
	'Saint Lucia Football Association',
	get_column('@', 'fp_country@name@Saint Lucia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'LFV',
	'Liechtensteiner Fussballverband',
	get_column('@', 'fp_country@name@Liechtenstein', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFSL',
	'Football Federation of Sri Lanka',
	get_column('@', 'fp_country@name@Sri Lanka', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Lesotho Football Association',
	get_column('@', 'fp_country@name@Lesotho', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'LFF',
	'Lithuanian Football Federation',
	get_column('@', 'fp_country@name@Lithuania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FLF',
	'Luxembourg Football Federation',
	get_column('@', 'fp_country@name@Luxembourg', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'LFF',
	'Latvijas Futbola federācija',
	get_column('@', 'fp_country@name@Latvia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FRMF',
	'Royal Moroccan Football Federation',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FMF',
	'Fédération Monegasque de Football',
	get_column('@', 'fp_country@name@Monaco', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FMF',
	'Federația Moldovenească de Fotbal',
	get_column('@', 'fp_country@name@Moldova', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FMF',
	'Fédération Malagasy de Football',
	get_column('@', 'fp_country@name@Madagascar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Maldives',
	get_column('@', 'fp_country@name@Maldives', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FMF',
	'Federación Mexicana de Fútbol Asociación',
	get_column('@', 'fp_country@name@Mexico', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'MISA',
	'Marshall Islands Soccer Association',
	get_column('@', 'fp_country@name@Marshall Islands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFM',
	'Football Federation of North Macedonia',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FEMAFOOT',
	'Fédération Malienne de Football',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'MFA',
	'Malta Football Association',
	get_column('@', 'fp_country@name@Malta', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'MFF',
	'Myanmar Football Federation',
	get_column('@', 'fp_country@name@Myanmar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FSCG',
	'Fudbalski Savez Crne Gore',
	get_column('@', 'fp_country@name@Montenegro', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'MFF',
	'Mongolian Football Federation',
	get_column('@', 'fp_country@name@Mongolia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FMF',
	'Federação Moçambicana de Futebol',
	get_column('@', 'fp_country@name@Mozambique', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFRIM',
	'Fédération de Football de la République Islamique de Mauritanie',
	get_column('@', 'fp_country@name@Mauritania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'MFA',
	'Mauritius Football Association',
	get_column('@', 'fp_country@name@Mauritius', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Malawi',
	get_column('@', 'fp_country@name@Malawi', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Malaysia',
	get_column('@', 'fp_country@name@Malaysia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'NFA',
	'Namibia Football Association',
	get_column('@', 'fp_country@name@Namibia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FENIFOOT',
	'Fédération Nigerienne de Football',
	get_column('@', 'fp_country@name@Niger', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'NFF',
	'Nigeria Football Federation',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FENIFUT',
	'Federación Nicaragüense de Fútbol',
	get_column('@', 'fp_country@name@Nicaragua', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'IFA',
	'Irish Football Association',
	get_column('@', 'fp_country@name@Northern Ireland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NISA',
	'Niue Island Soccer Association',
	get_column('@', 'fp_country@name@Niue', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'KNVB',
	'Koninklijke Nederlandse Voetbalbond',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NFF',
	'Norges Fotballforbund',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ANFA',
	'All Nepal Football Association',
	get_column('@', 'fp_country@name@Nepal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer	
),
(
	'NZF',
	'New Zealand Football',
	get_column('@', 'fp_country@name@New Zealand', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'OFA',
	'Oman Football Association',
	get_column('@', 'fp_country@name@Oman', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'PFF',
	'Pakistan Football Federation',
	get_column('@', 'fp_country@name@Pakistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FEPAFUT',
	'Federación Panameña de Fútbol',
	get_column('@', 'fp_country@name@Panama', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FPF',
	'Federación Peruana de Futbol',
	get_column('@', 'fp_country@name@Peru', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'PFF',
	'Philippine Football Federation',
	get_column('@', 'fp_country@name@Philippines', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'PFA',
	'Palau Football Association',
	get_column('@', 'fp_country@name@Palau', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'PNGFA',
	'Papua New Guinea Football Association',
	get_column('@', 'fp_country@name@Papua New Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'PZPN',
	'Polski Związek Piłki Nożnej',
	get_column('@', 'fp_country@name@Poland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FPF',
	'Federación Puertorriqueña de Fútbol',
	get_column('@', 'fp_country@name@Puerto Rico', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'DPRK FA',
	'DPR Korea Football Association',
	get_column('@', 'fp_country@name@North Korea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FPF',
	'Federação Portuguesa de Futebol',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'APF',
	'Asociación Paraguaya de Fútbol',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'PFA',
	'Palestine Football Association',
	get_column('@', 'fp_country@name@Palestine', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'QFA',
	'Qatar Football Association',
	get_column('@', 'fp_country@name@Qatar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FRF',
	'Federația Română de Fotbal',
	get_column('@', 'fp_country@name@Romania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'RFU',
	'Russian Football Union',
	get_column('@', 'fp_country@name@Russian Federation', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FERWAFA',
	'Fédération Rwandaise de Football Association',
	get_column('@', 'fp_country@name@Rwanda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SAFF',
	'Saudi Arabian Football Federation',
	get_column('@', 'fp_country@name@Saudi Arabia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SFA',
	'Scottish Football Association',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SFA',
	'Sudan Football Association',
	get_column('@', 'fp_country@name@Sudan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSF',
	'Fédération Sénégalaise de Football',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAS',
	'Football Association of Singapore',
	get_column('@', 'fp_country@name@Singapore', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SIFF',
	'Solomon Islands Football Federation',
	get_column('@', 'fp_country@name@Solomon Islands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'SLFA',
	'Sierra Leone Football Association',
	get_column('@', 'fp_country@name@Sierra Leone', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FESFUT',
	'Federación Salvadoreña de Fútbol',
	get_column('@', 'fp_country@name@El Salvador', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FSGC',
	'Federazione Sammarinese Giuoco Calcio',
	get_column('@', 'fp_country@name@San Marino', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SFF',
	'Somali Football Federation',
	get_column('@', 'fp_country@name@Somalia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSS',
	'Football Association of Serbia',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SSFA',
	'South Sudan Football Association',
	get_column('@', 'fp_country@name@South Sudan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSF',
	'Federação Santomense de Futebol',
	get_column('@', 'fp_country@name@São Tomé and Príncipe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SVB',
	'Surinaamse Voetbal Bond',
	get_column('@', 'fp_country@name@Suriname', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'SFZ',
	'Slovenský futbalový zväz',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NZS',
	'Nogometna zveza Slovenije',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SvFF',
	'Svenska Fotbollförbundet',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EFA',
	'Eswatini Football Association',
	get_column('@', 'fp_country@name@Eswatini', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SFF',
	'Seychelles Football Federation',
	get_column('@', 'fp_country@name@Seychelles', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SAFA',
	'Syrian Arab Football Association',
	get_column('@', 'fp_country@name@Syria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FTFA',
	'Fédération Tchadienne de Football',
	get_column('@', 'fp_country@name@Chad', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FTF',
	'Fédération Togolaise de Football',
	get_column('@', 'fp_country@name@Togo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAT',
	'Football Association of Thailand',
	get_column('@', 'fp_country@name@Thailand', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFF',
	'Tajikistan Football Federation',
	get_column('@', 'fp_country@name@Tajikistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFT',
	'Football Federation of Turkmenistan',
	get_column('@', 'fp_country@name@Turkmenistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFTL',
	'Federação de Futebol de Timor-Leste',
	get_column('@', 'fp_country@name@Timor-Leste', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFA',
	'Tonga Football Association',
	get_column('@', 'fp_country@name@Tonga', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'TTFA',
	'Trinidad and Tobago Football Association',
	get_column('@', 'fp_country@name@Trinidad and Tobago', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FTF',
	'Fédération Tunisienne de Football',
	get_column('@', 'fp_country@name@Tunisia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'TFF',
	'Türkiye Futbol Federasyonu',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'CTFA',
	'Chinese Taipei Football Association',
	get_column('@', 'fp_country@name@Taiwan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFF',
	'Tanzania Football Federation',
	get_column('@', 'fp_country@name@Tanzania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FUFA',
	'Federation of Uganda Football Associations',
	get_column('@', 'fp_country@name@Uganda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'UAF',
	'Ukrainian Association of Football',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'AUF',
	'Asociación Uruguaya de Fútbol',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'USSF',
	'United States Soccer Federation',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'UFA',
	'Uzbekistan Football Association',
	get_column('@', 'fp_country@name@Uzbekistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SVGFF',
	'Saint Vincent and the Grenadines Football Federation',
	get_column('@', 'fp_country@name@Saint Vincent and the Grenadines', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FVF',
	'Federación Venezolana de Fútbol',
	get_column('@', 'fp_country@name@Venezuela', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'VFF',
	'Vietnam Football Federation',
	get_column('@', 'fp_country@name@Vietnam', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'VFF',
	'Vanuatu Football Federation',
	get_column('@', 'fp_country@name@Vanuatu', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FAW',
	'Football Association of Wales',
	get_column('@', 'fp_country@name@Wales', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFS',
	'Football Federation Samoa',
	get_column('@', 'fp_country@name@Samoa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFK',
	'Football Federation of Kosovo',
	get_column('@', 'fp_country@name@Kosovo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'YFA',
	'Yemen Football Association',
	get_column('@', 'fp_country@name@Yemen', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SAFA',
	'South African Football Association',
	get_column('@', 'fp_country@name@South Africa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAZ',
	'Football Association of Zambia',
	get_column('@', 'fp_country@name@Zambia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'ZIFA',
	'Zimbabwe Football Association',
	get_column('@', 'fp_country@name@Zimbabwe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
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
 * INSERT INTERNATIONAL COMPETITION
 ******************************************************************************/
INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'CUP',
	'NATIONAL',
	'FIFA World Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Internationale de Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'AFC Asian Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AFC Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AFC Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'Africa Cup of Nations',
	2,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'CAF Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'CAF Confederation Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'CAF Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'CONCACAF Gold Cup',
	2,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football',
		'id'
	)::integer	
),
(
	'CUP',
	'CLUB',
	'CONCACAF Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'CONMEBOL Copa América',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Libertadores de América',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Sudamericana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'CONMEBOL Recopa Sudamericana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'OFC Nations Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'OFC Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'UEFA European Championship',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Europa League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Conference League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT NATIONAL COMPETITION
 ******************************************************************************/
INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'LEAGUE',
	'CLUB',
	'Afghan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Afghanistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria Superiore',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Parë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Dytë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Superkupa e Shqipërisë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kupa e Shqipërisë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Girabola',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segundona',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Angolan SuperCup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Angolan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Divisió',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segona Divisió',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Andorran Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Constitució',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE First Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE Second Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UAE President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'UAE Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Profesional de Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Nacional',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Argentina',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa Argentina',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Centenario de la AFA',
	100,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Armenian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Armenian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Armenian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Armenian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Antigua and Barbuda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Antigua and Barbuda FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'A-League Men',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Australia Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Österreichische Fußball-Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Admiral 2. Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Austrian Regionalliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'ÖFB-Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'ÖFB-Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Premyer Liqası',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Birinci Divizionu',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Azərbaycan Kuboku',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Azərbaycan Superkuboku',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Burundi Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Burundi',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jupiler Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Challenger Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belgian National Division 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Beker van België',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Belgische Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Bénin',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Bénin',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Faso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Burkina Faso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bangladesh Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bangladesh Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Third Amateur Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Bulgarian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Bulgarian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bahraini Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Bahraini King''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Bahraini Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'BFA Senior League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahamas Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premijer Liga Bosne i Hercegovine',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga FBiH',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Republike Srpske',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup Bosne i Hercegovine',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Belarusian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Belarusian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Belize',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belize',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'División de Fútbol Profesional',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Boliviana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série D',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa do Brasil',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa do Brasil',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Barbados Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Barbados FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Brunei Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Brunei FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Brunei Super Cup',
	0,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bhutan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bhutan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botswana Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FA Challenge Cup Botswana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Central African Republic League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Centrafricaine de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Canadian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Canada Soccer',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Canadian Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Canada Soccer',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Challenge League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Promotion League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Schweizer Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional Scotiabank',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Chile',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa de Chile',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Chinese Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'China League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'China League Two',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Chinese FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	 'CLUB',
	'Chinese FA Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'MTN Ligue 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe de Côte d''Ivoire',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'MTN Elite One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cameroon Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Linafoot',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du DR Congo',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National MTN',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Congo',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Torneo BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Superliga BetPlay DIMAYOR',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Comoros Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Comorienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cape Verdean Football Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de Cabo Verde',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Promerica',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División de Costa Rica',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Costa Rican Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional de Fútbol de Cuba',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación de Fútbol de Cuba',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Curaçao Promé Divishon',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federashon Futbòl Kòrsou',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Third Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cypriot Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. česká fotbalová liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fotbalová národní liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Czech Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Czech Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'3. Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Regionalliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'DFB-Pokal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'DFL-Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Djibouti Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Djibouti FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Dominica Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dominica Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'3F Superliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'NordicBet Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Danish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Danish SuperCup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Dominicana de Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Dominicana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Professional League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Algerian Ligue 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe d''Algérie de football',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Super Coupe d''Algérie de football',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Pro Ecuador Serie A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Categoría Serie B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Ecuador',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Egyptian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Egypt Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Egyptian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL League Two',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'FA Community Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eritrean Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eritrean National Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'LaLiga EA Sports',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'LALIGA HYPERMOTION',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa del Rey',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa de España',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Meistriliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Esiliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Estonian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Estonian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ethiopian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ethiopian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Veikkausliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ykkönen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kakkonen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Finnish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fiji Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Fiji Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe de France',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Trophée des Champions',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pohnpei Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federated States of Micronesia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gabon Championnat National D1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Gabon Interclubs',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Georgian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Georgian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ghana Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ghana FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFA League First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Gambian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional da Guiné-Bissau',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional da Guiné Bissau',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Equatoguinean Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Equatoguinean Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gamma Ethniki',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Greek Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Cup of Friendship and Solidarity',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFA Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Grenada Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol de Guatemala',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División de Ascenso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa de Guatemala',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFF National Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Guyana Mayors Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol Profesional de Honduras',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Honduran Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperSport Hrvatska nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Druga nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hrvatski nogometni kup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Hrvatski nogometni superkup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue Haïtienne',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe d''Haïti',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság I',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság II',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Magyar Kupa',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'BRI Liga 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Piala Indonesia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Indian Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I-League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I-League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AIFF Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sports Direct FAI Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Persian Gulf Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azadegan League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hazfi Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Iran Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Iraq Stars League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Iraqi Premier Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Iraq FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Iraqi Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Besta deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Icelandic Men''s Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Icelandic Men''s Football Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligat Ha`Al',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Leumit',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Alef',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Israel State Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Israel Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie D',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Italia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercoppa Italiana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Italia Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercoppa di Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jamaica Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'JFF Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jordanian Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Jordan FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Jordan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J1 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J2 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J3 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Japan Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Emperor''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Japanese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kazakhstan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Kazakhstan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kenyan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FKF President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Kenyan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Pervaja Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kyrgyzstan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Kyrgyzstan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cambodian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Cambodia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kiribati National Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kiribati Islands Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SKNFA Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Saint Kitts and Nevis National Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'K League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'K League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Korean FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kuwait Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kuwait Emir Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Kuwait Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lao League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lao Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lebanese FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Lebanese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liberian First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Liberian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Libyan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Libyan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Libyan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SLFA First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Saint Lucia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Liechtenstein Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liechtensteiner Fussballverband',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sri Lanka Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sri Lanka FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lesotho Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lesotho Independence Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'A Lyga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pirma lyga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lithuanian Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Lithuanian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg National Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg Division of Honour',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Luxembourg Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Virsliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Latvijas Pirmā līga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Latvijas kauss',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Latvian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Moroccan Throne Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Challenge Prince Rainier III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Monegasque de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Divizia Națională',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Divizia A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Moldovan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Moldovan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malagasy Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malagasy de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Dhivehi Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Maldives FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga de Expansión MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Premier de México',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Campeón de Campeones MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva makedonska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Vtora makedonska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup na Makedonija',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Macedonian Supercup',
	0,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malian Première Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Malian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Malta Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Challenge League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Malta Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Myanmar National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'General Aung San Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva crnogorska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Druga crnogorska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Crnogorski fudbalski kup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Mongolian National Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'MFF Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Moçambola',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça de Moçambique',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1 Mauritania',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Mauritanian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Mauritian League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Mauritian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malawi Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malawi',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malaysia Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Malaysia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Namibia Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Namibia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Niger Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Niger Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nigerian Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Nigerian FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nicaraguan Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol',
		'id'
	)::integer
),

(
	'CUP',
	'CLUB',
	'Copa de Nicaragua',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Irish Premiership',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'NIFL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Irish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'NIFL Charity Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Niue Soccer Tournament',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Niue Island Soccer Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eredivisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eerste Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tweede Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'KNVB Beker',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Johan Cruijff Schaal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eliteserien',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Norwegian First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Norwegian Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Mesterfinalen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial A-Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial B-Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ncell Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'New Zealand National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@New Zealand Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Chatham Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@New Zealand Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Oman Professional League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oman Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sultan Qaboos Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oman Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pakistan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Pakistan National Football Challenge Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Asociación Nacional Pro Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Panamá',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Betsson',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Peruvian Segunda División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Bicentenario',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa Peruana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Philippines Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Paulino Alcantara',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Palau Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palau Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Papua New Guinea National Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Papua New Guinea FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ekstraklasa',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I liga polska',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'II liga polska',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Polish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Polish Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Puerto Rico',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Puertorriqueña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'DPR Korea Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hwaebul Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal Betclic',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Terceira Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça de Portugal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supertaça Cândido de Oliveira',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Paraguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'División Intermedia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Paraguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa Paraguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gaza Strip Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Palestine Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Qatar Stars League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Qatari Stars Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Sheikh Jassim Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga II',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cupa României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercupa României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Russian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Russian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Rwanda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Rwandan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Saudi Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Saudi League First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'The Custodian of The Two Holy Mosques Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Saudi Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Premiership',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Scottish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sudan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sudan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Senegal Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Senegal FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Singapore Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Singapore Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Singapore Community Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Solomon Islands S-League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Solomon Islands Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sierra Leone National Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sierra Leone Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Salvadoran Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Salvadoreña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campionato Sammarinese di Calcio',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Titano',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Super Coppa Sammarinese',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Somali First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Somali Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Somalia Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Somalia Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Srbije',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Srpska Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup Srbije',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'South Sudan Football Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'South Sudan National Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'São Tomé and Príncipe Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de São Tomé e Principe',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'São Tomé and Príncipe Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SVB Eerste Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Beker van Suriname',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Suriname President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fortuna Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Slovak Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Slovak Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. SNL',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. SNL',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hervis Pokal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Allsvenskan',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Superettan',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Division 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Division 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Svenska Cupen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Eswatini',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Swazi Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Swazi Charity Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Seychelles First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Seychelles FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Syrian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Syrian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Syrian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Chad Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tchadienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National de Premiere Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Togolaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Thai FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Thailand Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Vysšaja Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tajikistan First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tajikistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Tajikistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Turkmenistan Higher League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Turkmenistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Turkmenistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Futebol Amadora Primeira Divisão',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça 12 de Novembro',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'LFA Super Taça',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Tonga Major League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tonga Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'TT Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Trinidad and Tobago FA Trophy',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Trinidad and Tobago Charity Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tunisian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Tunisian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Süper Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 1. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 2. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 3. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Turkish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Turkish Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Taiwan Football Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Taipei Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tanzanian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tanzania FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uganda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ugandan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ukrainian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Ukrainian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Profesional de Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División Profesional de Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Supercopa Uruguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Major League Soccer',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'USL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'USL League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lamar Hunt U.S. Open Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Uzbekistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Uzbekistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Venezolana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga FUTVE 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Venezuela',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eximbank V League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Vietnamese National Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Vietnamese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cymru Premier',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Welsh Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Samoa National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Samoa Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Superliga e Futbollit të Kosovës',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga e Parë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kosovar Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Kosovar Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Yemeni League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Yemeni President Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'SUPER_CUP',
	'CLUB',
	'Yemeni Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'South African Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'National First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Nedbank Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Zambia Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Zambia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Zimbabwe Premier Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cup of Zimbabwe',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association',
		'id'
	)::integer
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
 * INSERT POSITION
 ******************************************************************************/
INSERT INTO fp_position (role, code, name)
VALUES
('GK', 'GK', 'goalkeeper'),
('DF', 'CB', 'centreBack'),
('DF', 'LB', 'leftBack'),
('DF', 'LD', 'leftDefender'),
('DF', 'RB', 'rightBack'),
('DF', 'RD', 'rightDefender'),
('DF', 'SW', 'sweeper'),
('MF', 'AM', 'attackingMidfield'),
('MF', 'CM', 'centralMidfield'),
('MF', 'DM', 'defensiveMidfield'),
('MF', 'LM', 'leftMidfield'),
('MF', 'MW', 'midWing'),
('MF', 'RM', 'rightMidfield'),
('FW', 'CF', 'centreForward'),
('FW', 'FN', 'falseNine'),
('FW', 'LF', 'leftForward'),
('FW', 'LW', 'leftWinger'),
('FW', 'RW', 'rightWinger'),
('FW', 'RF', 'rightForward'),
('FW', 'SS', 'secondStriker');
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
 * INSERT TROPHY
 ******************************************************************************/
INSERT INTO fp_trophy (type, name, role)
VALUES
('TEAM', 'firstPlace', NULL),
('TEAM', 'secondPlace', NULL),
('TEAM', 'thirdPlace', NULL),
('PLAYER', 'mostValuablePlayer', NULL),
('PLAYER', 'bestStriker', 'FW'),
('PLAYER', 'bestMidfielder', 'MF'),
('PLAYER', 'bestDefender', 'DF'),
('PLAYER', 'bestGoalkeeper', 'GK'),
('PLAYER', 'goalOfTheSeason', NULL);
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
 * INSERT PRIZE
 ******************************************************************************/
INSERT INTO fp_prize (type, name, given, role)
VALUES
('PLAYER', 'Ballon d''Or', 'France Football', NULL),
('PLAYER', 'European Golden Shoe', 'European Sports Media', NULL),
('PLAYER', 'FIFA Fair Play Award', 'FIFA', NULL),
('PLAYER', 'FIFA Puskás Award', 'FIFA', NULL),
('TEAM', 'Targa UEFA', 'UEFA', NULL),
('PLAYER', 'Best goalkeeper of the year IFFHS', 'IFFHS', 'GK');
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
 * INSERT TAG
 ******************************************************************************/
INSERT INTO fp_tag (goalkeeper, positive, name)
VALUES
(
	'FALSE',
	'TRUE',
	'getForwardWheneverPossible'
),
(
	'FALSE',
	'TRUE',
	'staysBackAtAllTimes'
),
(
	'FALSE',
	'TRUE',
	'comesDeepToGetBall'
),
(
	'FALSE',
	'TRUE',
	'dribbleDownTheLeftOrRightFlank'
),
(
	'FALSE',
	'TRUE',
	'dribbleThroughTheCenterOfThePark'
),
(
	'FALSE',
	'TRUE',
	'runsWithTheBallMoreOften'
),
(
	'FALSE',
	'TRUE',
	'runsWithTheBallOccasionally'
),
(
	'FALSE',
	'TRUE',
	'hugsTheTouchline'
),
(
	'FALSE',
	'TRUE',
	'cutsInsideFromRightOrLeftOrBothWings'
),
(
	'FALSE',
	'TRUE',
	'getsIntoTheOppositionAreaWheneverPossible'
),
(
	'FALSE',
	'TRUE',
	'arrivesLateInTheOppositionArea'
),
(
	'FALSE',
	'TRUE',
	'tryToBeatTheOffsideTrap'
),
(
	'FALSE',
	'TRUE',
	'playsWithBackToGoal'
),
(
	'FALSE',
	'TRUE',
	'mainlyStaysInsideThePenaltyAreaWheneverPossible'
),
(
	'FALSE',
	'TRUE',
	'movesIntoChannels'
),
(
	'FALSE',
	'TRUE',
	'playsOneTwos'
),
(
	'FALSE',
	'TRUE',
	'knockTheBallPastHisOpponentWhenTakingHimOn'
),
(
	'FALSE',
	'TRUE',
	'triesKillerBallsOften'
),
(
	'FALSE',
	'TRUE',
	'playsNoThroughBalls'
),
(
	'FALSE',
	'TRUE',
	'triesLongRangePasses'
),
(
	'FALSE',
	'TRUE',
	'playsShortSimplePasses'
),
(
	'FALSE',
	'TRUE',
	'slowDownPlayNowAndThen'
),
(
	'FALSE',
	'TRUE',
	'dwellsOnBall'
),
(
	'FALSE',
	'TRUE',
	'lookForThePassRatherThanAttemptingToScore'
),
(
	'FALSE',
	'TRUE',
	'dictatesTempo'
),
(
	'FALSE',
	'TRUE',
	'likesToSwitchBallToTheOtherFlank'
),
(
	'FALSE',
	'TRUE',
	'likesBallPlayedIntoFeet'
),
(
	'FALSE',
	'TRUE',
	'shootsFromDistance'
),
(
	'FALSE',
	'TRUE',
	'refrainsFromTakingLongShots'
),
(
	'FALSE',
	'TRUE',
	'tryToLobTheKeeperInOneOnOnes'
),
(
	'FALSE',
	'TRUE',
	'likesToRoundKeeper'
),
(
	'FALSE',
	'TRUE',
	'shootsWithPower'
),
(
	'FALSE',
	'TRUE',
	'placesShots'
),
(
	'FALSE',
	'TRUE',
	'attemptsFirstTimeShots'
),
(
	'FALSE',
	'TRUE',
	'attemptsOverheadKicks'
),
(
	'FALSE',
	'TRUE',
	'hitsFreeKicksWithPower'
),
(
	'FALSE',
	'TRUE',
	'triesLongRangeFreeKicks'
),
(
	'FALSE',
	'TRUE',
	'throwHimselfIntoTackles'
),
(
	'FALSE',
	'TRUE',
	'doesNotDivesIntoTackles'
),
(
	'FALSE',
	'TRUE',
	'marksOpponentsTightly'
),
(
	'FALSE',
	'TRUE',
	'bringsBallOutOfDefence'
),
(
	'FALSE',
	'TRUE',
	'triesToPlayWayOutOfTrouble'
),
(
	'FALSE',
	'TRUE',
	'triesTricks'
),
(
	'FALSE',
	'TRUE',
	'curlsBalls'
),
(
	'FALSE',
	'TRUE',
	'usesOutsideOfFoot'
),
(
	'FALSE',
	'TRUE',
	'likesToBeatManRepeatedly'
),
(
	'FALSE',
	'TRUE',
	'movesTheBallToRightOrLeftFootBeforeDribbleAttempt'
),
(
	'FALSE',
	'TRUE',
	'attemptsToDevelopWeakerFooter'
),
(
	'FALSE',
	'TRUE',
	'avoidsUsingWeakerFoot'
),
(
	'FALSE',
	'TRUE',
	'possessLongFlatThrow'
),
(
	'TRUE',
	'TRUE',
	'usesLongThrowsToStartCounterAttacks'
),
(
	'TRUE',
	'TRUE',
	'triesLongRangeFreeKicksGK'
),
(
	'TRUE',
	'TRUE',
	'attemptsToDevelopWeakerFooterGK'
),
(
	'TRUE',
	'TRUE',
	'avoidsUsingWeakerFootGK'
),
(
	'FALSE',
	'TRUE',
	'getsCrowdGoing'
),
(
	'FALSE',
	'FALSE',
	'arguesWithOfficials'
),
(
	'FALSE',
	'TRUE',
	'windsUpOpponents'
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
 * INSERT ADMIN
 ******************************************************************************/
INSERT INTO fp_admin (username, password)
VALUES
('gioele', 'Gio3leIlMagn!fico');
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
 * INSERT TEAM
 ******************************************************************************/
INSERT INTO fp_team (type, short_name, long_name, country_id)
VALUES
(
	'CLUB',
	'ATA',
	'Atalanta',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'BOL',
	'Bologna FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'CRE',
	'US Cremonese',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'EMP',
	'Empoli FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'FIO',
	'ACF Fiorentina',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'INT',
	'Inter',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'JUV',
	'Juventus FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'LAZ',
	'SS Lazio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'LEC',
	'US Lecce',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'MIL',
	'AC Milan',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'MON',
	'AC Monza',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'NAP',
	'SSC Napoli',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'ROM',
	'AS Roma',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SAL',
	'US Salernitana',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SAM',
	'UC Sampdoria',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SAS',
	'US Sassuolo',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'SPE',
	'Spezia Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'TOR',
	'Torino FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'UDI',
	'Udinese Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'VER',
	'Hellas Verona',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'FRO',
	'Frosinone Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'GEN',
	'Genoa CFC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'CAG',
	'Cagliari Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'WOL',
	'VfL Wolfsburg',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'CLUB',
	'CHA',
	'RSC Charleroi',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer
),
(
	'CLUB',
	'LIL',
	'LOSC Lille',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'CLUB',
	'SPA',
	'SPAL',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'VOJ',
	'Fudbalski klub Vojvodina',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer
),
(
	'CLUB',
	'GEN',
	'Koninklijke Racing Club Genk',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer
),
(
	'CLUB',
	'HIL',
	'Al-Hilal SFC',
	get_column('@', 'fp_country@name@Saudi Arabia', 'id')::integer
),
(
	'CLUB',
	'AST',
	'Aston Villa',
	get_column('@', 'fp_country@name@England', 'id')::integer
),
(
	'CLUB',
	'TOT',
	'Tottenham Hotspur FC',
	get_column('@', 'fp_country@name@England', 'id')::integer
),
(
	'CLUB',
	'PAL',
	'Palermo FC',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'PAL',
	'US Ancona',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'CLUB',
	'PSG',
	'FC Paris Saint-Germain',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'CLUB',
	'SIV',
	'Siviglia FC',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'CLUB',
	'SIV',
	'CA Osasuna',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'CLUB',
	'NIZ',
	'OGC Nizza',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'CLUB',
	'KAR',
	'Fatih Karagümrük',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer
),
(
	'CLUB',
	'JHM',
	'Jeonbuk Hyundai Motors',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer
),
(
	'CLUB',
	'BEG',
	'Beijing Guoan',
	get_column('@', 'fp_country@name@China', 'id')::integer
),
(
	'CLUB',
	'FEN',
	'Fenerbahce',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer
),
(
	'CLUB',
	'BAM',
	'FC Bayern Monaco',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'CLUB',
	'PAR',
	'FK Partizani',
	get_column('@', 'fp_country@name@Albania', 'id')::integer
),
(
	'CLUB',
	'SPA',
	'RNK Spalato',	
	get_column('@', 'fp_country@name@Croatia', 'id')::integer
),
(
	'CLUB',
	'ZAG',
	'GNK Dinamo Zagabria',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer
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
 * INSERT FP_PLAYER
 ******************************************************************************/

INSERT INTO fp_player (name, surname, dob, foot, position_id, role, country_id)
VALUES
(
	'Alex',
	'Meret',
	'1997-03-22',
	'LEFT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Pierluigi',
	'Gollini',
	'1995-03-18',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Salvatore',
	'Sirigu',
	'1987-01-12',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Hubert',
	'Idasiak',
	'2002-02-03',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Valerio',
	'Boffelli',
	'2004-09-04',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Davide',
	'Marfella',
	'1999-09-15',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Min-jae',
	'Kim',
	'1996-11-15',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer
),
(
	'Amir',
	'Rrahmani',
	'1994-02-24',
	'EITHER',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Leo Skiri',
	'Østigård',
	'1999-11-28',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Norway', 'id')::integer
),
(
	'Juan Guilherme Nunes',
	'Jesus',
	'1991-06-10',
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Mathías',
	'Olivera',
	'1991-05-27',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer
),
(
	'Mário',
	'Rui',
	'1997-03-22',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-08-04',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Alessandro',
	'Zanoli',
	'2000-10-03',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Bartosz',
	'Bereszyński',
	'1992-07-12',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Stanislav',
	'Lobotka',
	'1994-11-25',
	'EITHER',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer
),
(
	'Diego',
	'Demme',
	'1991-11-21',
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Germany', 'id')::integer
),
(
	'André-Frank Zambo',
	'Anguissa',
	'1995-11-16',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer
),
(
	'Piotr Sebastian',
	'Zieliński',
	'1994-05-20',
	'EITHER',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Poland', 'id')::integer
),
(
	'Tanguy',
	'Ndombélé',
	'1996-12-28',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Karim',
	'Zedadka',
	'2000-06-09',
	'RIGHT',
	get_column('@', 'fp_position@name@leftMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Eljif',
	'Elmas',
	'1999-09-24',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer
),
(
	'Gianluca',
	'Gaetano',
	'2000-05-05',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Khvicha',
	'Kvaratskhelia',
	'2001-02-12',
	'EITHER',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer
),
(
	'Alessio',
	'Zerbin',
	'1999-03-03',
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Hirving Rodrigo',
	'Lozano',
	'1995-07-30',
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Mexico', 'id')::integer
),
(
	'Matteo',
	'Politano',
	'1993-08-03',
	'LEFT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Adam',
	'Ounas',
	'1996-11-11',
	'LEFT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Giacomo',
	'Raspadori',
	'2000-02-18',
	'EITHER',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Victor James',
	'Osimhen',
	'1998-12-29',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer
),
(
	'Giovanni Pablo',
	'Simeone',
	'1995-07-05',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer
),
(
	'Ivan',
	'Provedel',
	'1994-03-17',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Christos',
	'Mandas',
	'2001-09-17',
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Greece', 'id')::integer
),
(
	'Luigi',
	'Sepe',
	'1991-05-08',
	'LEFT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Nicolò',
	'Casale',
	'1998-02-14',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Alessio',
	'Romagnoli',
	'1995-01-12',
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Patricio Gabarrón',
	'Gil',
	'1993-04-17',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Mario',
	'Gila',
	'2000-08-29',
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Luca',
	'Pellegrini',
	'1999-03-07',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Dimitrije',
	'Kamenović',
	'2000-07-16',
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Adam',
	'Marusic',
	'1992-10-17',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Jugoslavia', 'id')::integer
),
(
	'Elseid Gëzim',
	'Hysaj',
	'1994-02-02',
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF',
	get_column('@', 'fp_country@name@Albania', 'id')::integer
),
(
	'Nicolò',
	'Rovella',
	'2001-12-04',
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Danilo',
	'Cataldi',
	'1994-08-06',
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Mattéo Elias Kenzo',
	'Guendouzi',
	'1999-04-14',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@France', 'id')::integer
),
(
	'Luis',
	'Alberto',
	'1992-09-28',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Matías',
	'Vecino',
	'1991-08-24',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer
),
(
	'Manuel',
	'Lazzari',
	'1993-11-29',
	'RIGHT',
	get_column('@', 'fp_position@name@rightMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Daichi',
	'Kamada',
	'1996-08-05',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Japan', 'id')::integer
),
(
	'André',
	'Anderson',
	'1999-09-23',
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Mattia',
	'Zaccagni',
	'1995-06-16',
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Diego Luis',
	'González',
	'2003-01-07',
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer
),
(
	'Saná Eusébio Mango',
	'Fernandes',
	'2006-03-10',
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Guinea-Bissau', 'id')::integer
),
(
	'Gustav Tang',
	'Isaksen',
	'2001-04-19',
	'EITHER',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer
),
(
	'Felipe',
	'Anderson',
	'1993-04-15',
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer
),
(
	'Pedro Eliezer',
	'Rodríguez',
	'1987-07-28',
	'EITHER',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
),
(
	'Cristiano',
	'Lombardi',
	'1995-08-19',
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Taty',
	'Castellanos',
	'1998-10-03',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer
),
(
	'Ciro',
	'Immobile',
	'1990-02-20',
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW',
	get_column('@', 'fp_country@name@Italy', 'id')::integer
),
(
	'Sergej',
	'Milinkovic-Savic',
	'1995-02-27',
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF',
	get_column('@', 'fp_country@name@Spain', 'id')::integer
);


INSERT INTO fp_player (name, surname, dob, country_id, foot, position_id, role)
VALUES
(
	'Jude',
	'Bellingham',
	'2003-06-29',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'EITHER',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Erling',
	'Haaland',
	'2000-07-21',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kylian',
	'Mbappe',
	'1998-12-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Vinicius',
	'Junior',
	'2000-07-12',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bukayo',
	'Saka',
	'2001-09-05',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Jamal',
	'Musiala',
	'2003-02-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'EITHER',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Phil',
	'Foden',
	'2000-05-28',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Lautaro',
	'Martinez',
	'1997-07-22',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Declan',
	'Rice',
	'1994-01-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Harry',
	'Kane',
	'1993-07-28',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Florian',
	'Wirtz',
	'2003-01-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'EITHER',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Federico',
	'Valverde',
	'1998-07-22',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Moises',
	'Caicedo',
	'1997-11-02',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Eduardo',
	'Camavinga',
	'2002-01-10',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Julian',
	'Alvarez',
	'2000-1-31',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Aurelien',
	'Tchouameni',
	'2000-01-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Rafael',
	'Leao',
	'1999-07-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Martin',
	'Odegaard',
	'1998-12-17',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Gabriel',
	'Martinelli',
	'2001-06-18',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bruno',
	'Guimaraes',
	'1997-02-09',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Enzo',
	'Fernandez',
	'2001-01-17',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Josko',
	'Gvardiol',
	'2002-01-23',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Frenkie',
	'de Jong',
	'1997-05-19',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ruben',
	'Dias',
	'1997-05-14',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Bernardo',
	'Silva',
	'1994-08-11',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Leroy',
	'Sane',
	'1996-01-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'William',
	'Saliba',
	'2001-02-05',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Luis',
	'Diaz',
	'1997-01-13',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Dominik',
	'Szoboszlai',
	'2000-10-25',
	get_column('@', 'fp_country@name@Hungary', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Christopher',
	'Nkunku',
	'1997-11-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolo',
	'Barella',
	'1997-02-07',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joshua',
	'Kimmich',
	'1995-02-08',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Xavi',
	'Simons',
	'2003-04-21',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Randal',
	'Kolo Muani',
	'1998-02-12',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Ronald',
	'Araujo',
	'1999-03-27',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Alphonso',
	'Davies',
	'2000-11-02',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Eder',
	'Militao',
	'1998-01-18',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Gabriel',
	'Jesus',
	'1997-04-03',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Alexander',
	'Isak',
	'1999-09-21',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Trent',
	'Alexander-Arnold',
	'1998-10-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'James',
	'Maddison',
	'1997-11-21',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Marcus',
	'Rashford',
	'1997-10-31',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bruno',
	'Fernandes',
	'1994-08-08',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jack',
	'Grealish',
	'1995-09-10',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Evan',
	'Ferguson',
	'2004-10-06',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Rasmus',
	'Hojlund',
	'2003-08-08',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Darwin',
	'Nunez',
	'1999-06-24',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Alexis',
	'Mac Allister',
	'1998-12-24',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jeremy',
	'Doku',
	'2002-12-17',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Lucas',
	'Paqueta',
	'1997-08-23',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Achraf',
	'Hakimi',
	'1998-11-04',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Cristian',
	'Romero',
	'1992-04-16',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Matthijs',
	'de Ligt',
	'1999-08-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Kingsley',
	'Coman',
	'1996-06-23',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mohamed',
	'Salah',
	'1992-06-15',
	get_column('@', 'fp_country@name@Egypt', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Lamime',
	'Yamal',
	'2000-11-28',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Warren',
	'Zaire-Emery',
	'2002-06-08',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Nuno',
	'Mendes',
	'2002-03-19',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Min-jae',
	'Kim',
	'1996-03-15',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Manuel',
	'Ugarte',
	'2001-04-11',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Douglas',
	'Luiz',
	'1994-05-09',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Gabriel',
	'Magalhaes',
	'1997-02-19',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jules',
	'Kounde',
	'1997-11-24',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Takefusa',
	'Kubo',
	'2001-06-20',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Moussa',
	'Diaby',
	'1996-07-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Dusan',
	'Vlahovic',
	'2000-01-20',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Dayot',
	'Upamecano',
	'1998-10-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ollie',
	'Watkins',
	'1994-12-30',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Alessandro',
	'Bastoni',
	'1999-04-13',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ousmane',
	'Dembele',
	'1997-02-08',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Joao',
	'Palhinha',
	'1995-03-09',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Kevin',
	'De Bruyne',
	'1991-06-28',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Levi',
	'Colwill',
	'2002-02-26',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Matheus',
	'Nunes',
	'2000-08-27',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Dejan',
	'Kulusevski',
	'2000-04-20',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Lois',
	'Openda',
	'2000-02-16',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Theo',
	'Hernandez',
	'1997-10-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Ben',
	'White',
	'1997-07-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Marcus',
	'Thuram',
	'1997-08-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kai',
	'Havertz',
	'1999-06-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Mathys',
	'Tel',
	'2005-04-12',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Nico',
	'Williams',
	'2002-07-12',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Alejandro',
	'Balde',
	'2002-10-18',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Romeo',
	'Lavia',
	'2002-01-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Michael',
	'Olise',
	'2001-12-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Santiago',
	'Gimenez',
	'2001-04-09',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Goncalo',
	'Ramos',
	'2001-06-20',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Jonathan',
	'David',
	'2000-01-14',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kaoru',
	'Mitoma',
	'1997-05-20',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Anthony',
	'Gordon',
	'2001-02-23',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Amadou',
	'Onana',
	'2000-02-04',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Jeremie',
	'Frimpong',
	'2000-08-22',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Lisandro',
	'Martinez',
	'1998-01-18',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Reece',
	'James',
	'1999-05-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Cody',
	'Gakpo',
	'1999-05-03',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Martin',
	'Zubimendi',
	'1998-02-16',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Mikel',
	'Oyarzabal',
	'1997-04-08',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Federico',
	'Chiesa',
	'1997-10-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Diogo',
	'Jota',
	'1991-12-04',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mikel',
	'Merino',
	'1991-06-20',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jarrod',
	'Bowen',
	'1996-12-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Dani',
	'Olmo',
	'1998-01-07',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Federico',
	'Dimarco',
	'1997-11-10',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Heung-Min',
	'Son',
	'1992-07-08',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Eberechi',
	'Eze',
	'1998-01-31',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Brennan',
	'Johnson',
	'2001-10-23',
	get_column('@', 'fp_country@name@Wales', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Joao',
	'Neves',
	'1997-03-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Antonio',
	'Silva',
	'1999-10-31',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Cole',
	'Palmer',
	'2002-05-06',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Micky',
	'van de Ven',
	'2000-04-04',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Pedro',
	'Porro',
	'1999-09-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Mohammed',
	'Kudus',
	'2000-02-02',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nahuel',
	'Molina',
	'1998-04-06',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Pau',
	'Torres',
	'1997-02-16',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Sven',
	'Botman',
	'2000-12-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Diogo',
	'Costa',
	'1999-09-09',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Mason',
	'Mount',
	'1999-01-10',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Viktor',
	'Gyokeres',
	'1991-04-29',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Lucas',
	'Hernandez',
	'1996-02-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Milan',
	'Skriniar',
	'1995-02-11',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Mike',
	'Maignan',
	'1995-05-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Serge',
	'Gnabry',
	'1995-07-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Raheem',
	'Sterling',
	'1993-12-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Jacob',
	'Ramsey',
	'2001-01-04',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Conor',
	'Gallagher',
	'2000-02-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Pedro',
	'Neto',
	'2000-03-09',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Axel',
	'Disasi',
	'1998-03-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Manuel',
	'Akanji',
	'1995-07-16',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Oleksandr',
	'Zinchenko',
	'1996-07-15',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Ousmane',
	'Diomande',
	'1998-02-22',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Vitor',
	'Roque',
	'2004-02-28',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Elye',
	'Wahi',
	'2003-01-22',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Victor',
	'Boniface',
	'2000-12-12',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Castello',
	'Lukeba',
	'2002-04-17',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Giorgio',
	'Scalvini',
	'2003-04-14',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Johan',
	'Bakayoko',
	'2001-07-14',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Edmond',
	'Tapsoba',
	'1997-02-15',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Destiny',
	'Udogie',
	'2002-11-18',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Goncalo',
	'Inacio',
	'2001-01-25',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Mykhaylo',
	'Mudryk',
	'2001-05-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Nicolas',
	'Gonzalez',
	'1998-04-23',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Khephren',
	'Thuram',
	'2001-03-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joao',
	'Felix',
	'1999-11-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Morgan',
	'Gibbs-White',
	'1999-01-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jurrien',
	'Timber',
	'2000-06-17',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Exequiel',
	'Palacios',
	'1998-10-5',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Sandro',
	'Tonali',
	'2000-05-08',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Teun',
	'Koopmeiners',
	'1998-08-28',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Benjamin',
	'Pavard',
	'1993-10-28',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Robin',
	'Le Normand',
	'1996-04-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Gianluigi',
	'Donnarumma',
	'1999-02-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Brais',
	'Mendez',
	'1997-01-17',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Fikayo',
	'Tomori',
	'1997-12-19',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Serhou',
	'Guirassy',
	'1994-02-12',
	get_column('@', 'fp_country@name@Guinea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Gregor',
	'Kobel',
	'1997-12-06',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Andre',
	'Onana',
	'1996-04-02',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Ruben',
	'Neves',
	'1997-03-13',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Andreas',
	'Christensen',
	'1996-04-10',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Julian',
	'Brandt',
	'1996-05-02',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Adrien',
	'Rabiot',
	'1995-02-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joao',
	'Cancelo',
	'1994-05-27',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Nathan',
	'Ake',
	'1995-02-18',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Leon',
	'Goretzka',
	'1995-02-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Hakan',
	'Calhanoglu',
	'1994-02-08',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Rico',
	'Lewis',
	'2004-11-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Bryan',
	'Mbeumo',
	'1999-08-07',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Boubacar',
	'Kamara',
	'1999-10-21',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Marc',
	'Guehi',
	'2000-07-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Nayef',
	'Aguerd',
	'1995-03-30',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ibrahima',
	'Konate',
	'1999-05-29',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'John',
	'Stones',
	'1994-05-28',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Luke',
	'Shaw',
	'1995-07-12',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'James',
	'Ward-Prowse',
	'1994-11-01',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Leandro',
	'Trossard',
	'1994-12-04',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mateo',
	'Kovacic',
	'1994-05-06',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolas',
	'Jackson',
	'2001-11-20',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Mohamed',
	'Simakan',
	'1996-03-25',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Piero',
	'Hincapie',
	'2002-01-09',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Odilon',
	'Kosounou',
	'1998-01-04',
	get_column('@', 'fp_country@name@Benin', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Joao',
	'Pedro',
	'2000-09-20',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Manu',
	'Koné',
	'1999-05-17',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jean-Clair',
	'Todibo',
	'1999-01-30',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Oihan',
	'Sancet',
	'2000-04-25',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Pape Matar',
	'Sarr',
	'2002-09-14',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Cheick',
	'Doucoure',
	'2000-01-01',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Max',
	'Kilman',
	'1997-07-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Tino',
	'Livramento',
	'2002-11-18',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Ryan',
	'Gravenberch',
	'2002-05-16',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Benoit',
	'Badiashile',
	'2000-04-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Lutsharel',
	'Geertruida',
	'2000-11-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Ezri',
	'Konsa',
	'1992-11-23',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'David',
	'Hancko',
	'1997-12-13',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Edson',
	'Alvarez',
	'1997-11-24',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Ferran',
	'Torres',
	'2000-02-21',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Harvey',
	'Barnes',
	'1997-07-19',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Nico',
	'Schlotterbeck',
	'1996-12-12',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Diogo',
	'Dalot',
	'1999-10-18',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Rodrigo',
	'Bentancur',
	'1997-06-25',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Frank',
	'Anguissa',
	'1995-04-25',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ismael',
	'Bennacer',
	'1997-12-01',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Pervis',
	'Estupiñán',
	'1998-01-21',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Joe',
	'Willock',
	'1999-08-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Eddie',
	'Nketiah',
	'1998-05-30',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Tammy',
	'Abraham',
	'1997-10-02',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Donyell',
	'Malen',
	'1999-01-21',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Tomas',
	'Soucek',
	'1995-02-27',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Sergej',
	'Milinkovic-Savic',
	'1997-02-20',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'David',
	'Raya',
	'1995-09-15',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Joachim',
	'Andersen',
	'1996-02-13',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ivan',
	'Toney',
	'1998-10-16',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Andrew',
	'Robertson',
	'1994-03-11',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Alejandro',
	'Grimaldo',
	'1991-09-20',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Jan',
	'Oblak',
	'1993-01-07',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Thibaut',
	'Courtois',
	'1992-05-11',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Romelu',
	'Lukaku',
	'1993-05-13',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Marc-André',
	'ter Stegen',
	'1992-04-30',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Lionel',
	'Messi',
	'1987-06-24',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Manuel',
	'Locatelli',
	'1998-01-08',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Matheus',
	'Cunha',
	'1994-05-27',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Wesley',
	'Fofana',
	'2000-12-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ibrahim',
	'Sangare',
	'1997-09-16',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Christian',
	'Pulisic',
	'1998-09-17',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Virgil',
	'van Dijk',
	'1991-07-08',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Arthur',
	'Vermeeren',
	'2001-03-14',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Alejandro',
	'Garnacho',
	'2004-07-01',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Bradley',
	'Barcola',
	'2002-02-26',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Gabri',
	'Veiga',
	'1999-07-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Benjamin',
	'Sesko',
	'2003-05-31',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Aaron',
	'Hickey',
	'2002-06-10',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Yeremy',
	'Pino',
	'2002-01-20',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Harvey',
	'Elliott',
	'2003-04-04',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Malick',
	'Thiaw',
	'2001-08-04',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Folarin',
	'Balogun',
	'2001-07-03',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Giorgi',
	'Mamardashvili',
	'2000-09-16',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Kiernan',
	'Dewsbury-Hall',
	'1998-09-21',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Youssoufa',
	'Moukoko',
	'2004-11-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Ansu',
	'Fati',
	'2002-10-31',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Orkun',
	'Kokcu',
	'2001-01-25',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Joshua',
	'Zirkzee',
	'2001-05-22',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Curtis',
	'Jones',
	'2000-04-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Yves',
	'Bissouma',
	'1996-08-15',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ademola',
	'Lookman',
	'1995-10-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Robert',
	'Sanchez',
	'1997-11-18',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Davide',
	'Frattesi',
	'1994-07-22',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Leon',
	'Bailey',
	'1997-08-03',
	get_column('@', 'fp_country@name@Jamaica', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Fabian',
	'Ruiz',
	'1996-04-13',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Noussair',
	'Mazraoui',
	'1997-11-14',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Takehiro',
	'Tomiyasu',
	'1998-11-16',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Denzel',
	'Dumfries',
	'1995-04-18',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightMidfield', 'id')::integer,
	'MF'
),
(
	'Mathias',
	'Jensen',
	'1999-01-23',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ben',
	'Chilwell',
	'1996-12-21',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Guglielmo',
	'Vicario',
	'1996-04-27',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Marcos',
	'Llorente',
	'1995-01-01',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Miguel',
	'Almiron',
	'1994-02-10',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Aleksandr',
	'Golovin',
	'1996-05-30',
	get_column('@', 'fp_country@name@Russian Federation', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Rodrigo',
	'de Paul',
	'1994-05-27',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jose Maria',
	'Gimenez',
	'1995-01-20',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jose',
	'Gaya',
	'1993-05-25',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'John',
	'McGinnis',
	'1994-10-18',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'David',
	'Alaba',
	'1992-06-24',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Hugo',
	'Larsson',
	'1998-04-20',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jamie',
	'Bynoe-Gittens',
	'2002-08-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Rayan',
	'Ait-Nouri',
	'2001-06-06',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Armando',
	'Broja',
	'1999-09-06',
	get_column('@', 'fp_country@name@Albania', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Youssouf',
	'Fofana',
	'1999-10-28',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Fabio',
	'Vieira',
	'2001-06-13',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Karim',
	'Adeyemi',
	'2002-01-18',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Aaron',
	'Ramsdale',
	'1998-05-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Pedro',
	'Goncalves',
	'2000-06-19',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Matty',
	'Cash',
	'1993-07-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Amine',
	'Gouiri',
	'2001-02-06',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Vitaliy',
	'Mykolenko',
	'1999-05-29',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Kalvin',
	'Phillips',
	'1995-12-04',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Artem',
	'Dovbyk',
	'1996-06-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Scott',
	'McTominay',
	'1996-04-12',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Marcus',
	'Edwards',
	'2003-05-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Taiwo',
	'Awoniyi',
	'1998-08-10',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Sofyan',
	'Amrabat',
	'1996-02-21',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Alex',
	'Iwobi',
	'1996-05-14',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Xaver',
	'Schlager',
	'1995-09-28',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Konrad',
	'Laimer',
	'1997-01-24',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Pierre-Emile',
	'Højbjerg',
	'1995-08-05',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Emiliano',
	'Martinez',
	'1992-09-1',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Aleksandar',
	'Mitrović',
	'1994-09-16',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Thiago',
	'Almada',
	'2001-04-20',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Morten',
	'Hjulmand',
	'1999-08-25',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Leny',
	'Yoro',
	'1999-08-24',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Pablo',
	'Barrios',
	'2005-01-31',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Lesley',
	'Ugochukwu',
	'2004-04-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Samuel',
	'Lino',
	'2002-05-23',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Matias',
	'Soulé',
	'2003-08-15',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Marcos',
	'Leonardo',
	'2000-02-02',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Jarrad',
	'Branthwaite',
	'2003-06-17',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Ilya',
	'Zabarnyi',
	'2002-09-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Simon',
	'Adingra',
	'2002-03-01',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Malo',
	'Gusto',
	'2003-05-06',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Rayan',
	'Cherki',
	'2003-02-17',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Pierre',
	'Kalulu',
	'2000-06-05',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Strahinja',
	'Pavlović',
	'1995-05-20',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Enzo',
	'Millot',
	'2001-11-25',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Alex',
	'Baena',
	'2001-10-07',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Mohamed',
	'Camara',
	'2000-01-07',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Terem',
	'Moffi',
	'1994-05-25',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Anatoliy',
	'Trubin',
	'2001-08-01',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Amine',
	'Adli',
	'2000-05-10',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Roger',
	'Ibanez',
	'1993-11-23',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jesper',
	'Lindstrom',
	'1999-02-27',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Noni',
	'Madueke',
	'2002-04-10',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Juan',
	'Foyth',
	'1998-01-12',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Kevin',
	'Schade',
	'2003-08-25',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'David',
	'Neres',
	'1997-03-03',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Nathan',
	'Collins',
	'1999-08-30',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Rodrigo',
	'Riquelme',
	'2000-05-12',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Charles',
	'De Ketelaere',
	'2001-03-10',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jakub',
	'Kiwior',
	'1998-02-26',
	get_column('@', 'fp_country@name@Poland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Perr',
	'Schuurs',
	'1999-11-26',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Felix',
	'Nmecha',
	'1997-05-10',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jadon',
	'Sancho',
	'2000-03-25',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Emile',
	'Smith Rowe',
	'2000-12-16',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolò',
	'Zaniolo',
	'1999-07-22',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Jonas',
	'Wind',
	'1999-02-03',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Yoane',
	'Wissa',
	'1996-01-12',
	get_column('@', 'fp_country@name@Democratic Republic of the Congo', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Lovro',
	'Majer',
	'1998-01-17',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Sean',
	'Longstaff',
	'1997-01-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Rico',
	'Henry',
	'1993-10-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Vangelis',
	'Pavlidis',
	'1998-11-22',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Gianluca',
	'Scamacca',
	'1999-01-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Lorenzo',
	'Pellegrini',
	'1993-06-19',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Marc',
	'Cucurella',
	'1998-07-22',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Mattia',
	'Zaccagni',
	'1994-05-17',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Mario',
	'Hermoso',
	'1995-04-18',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Viktor',
	'Tsygankov',
	'1991-11-17',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Unai',
	'Simon',
	'1997-02-21',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Dominic',
	'Solanke',
	'1997-01-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Iñaki',
	'Williams',
	'1994-06-12',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Enes',
	'Ünal',
	'1997-05-10',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Thomas',
	'Partey',
	'1993-06-13',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Paulo',
	'Dybala',
	'1993-11-21',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Ruben',
	'Loftus-Cheek',
	'1991-01-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jonathan',
	'Tah',
	'1991-02-11',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Aymeric',
	'Laporte',
	'1994-05-27',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Raphaël',
	'Varane',
	'1993-04-25',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Kurt',
	'Zouma',
	'1994-03-27',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Antoine',
	'Griezmann',
	'1991-03-05',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Marco',
	'Verratti',
	'1992-11-05',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Antonio',
	'Rüdiger',
	'1993-03-31',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Willian',
	'Pacho',
	'1998-04-17',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Joey',
	'Veerman',
	'1998-11-29',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Eljif',
	'Elmas',
	'1994-03-24',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Guido',
	'Rodríguez',
	'1989-04-10',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Christoph',
	'Baumgartner',
	'1999-08-12',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Quilindschy',
	'Hartman',
	'1998-01-13',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Yunus',
	'Musah',
	'2002-11-29',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Tijjani',
	'Reijnders',
	'2000-10-17',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Samuel',
	'Chukwueze',
	'1998-05-22',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Nathan',
	'Tella',
	'1999-07-14',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Weston',
	'McKennie',
	'1998-08-28',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jorrel',
	'Hato',
	'1997-04-07',
	get_column('@', 'fp_country@name@Curaçao', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'João',
	'Gomes',
	'2001-07-20',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Tyrick',
	'Mitchell',
	'1994-01-20',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Julio',
	'Enciso',
	'2000-07-24',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@secondStriker', 'id')::integer,
	'FW'
),
(
	'Bilal',
	'El Khannouss',
	'2000-05-10',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Kang-in',
	'Lee',
	'2001-02-03',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Taylor',
	'Harwood-Bellis',
	'2002-01-30',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Sacha',
	'Boey',
	'2002-09-16',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Facundo',
	'Medina',
	'1990-08-28',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Martin',
	'Terrier',
	'1991-03-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Quinten',
	'Timber',
	'2000-06-21',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Jack',
	'Harrison',
	'1996-05-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Alessandro',
	'Buongiorno',
	'1999-02-03',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Igor',
	'Zubeldia',
	'1997-08-31',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Hiroki',
	'Ito',
	'1999-05-12',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jerdy',
	'Schouten',
	'1991-01-12',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Konstantinos',
	'Tsimikas',
	'1991-10-12',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Denis',
	'Zakaria',
	'1996-11-20',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Emiliano',
	'Buendia',
	'1989-12-16',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Philip',
	'Billing',
	'1996-09-11',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Hirving',
	'Lozano',
	'1992-07-30',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Dominic',
	'Calvert-Lewin',
	'1997-03-16',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Hee-Chan',
	'Hwang',
	'1996-01-26',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Said',
	'Benrahma',
	'1995-08-19',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Orel',
	'Mangala',
	'1993-02-18',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Issa',
	'Diop',
	'1997-01-06',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Vitaly',
	'Janelt',
	'1998-03-10',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Kevin',
	'Danso',
	'1997-09-19',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Joe',
	'Gomez',
	'1997-04-23',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Patrik',
	'Schick',
	'1992-01-24',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Solly',
	'March',
	'1994-07-20',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Giovanni',
	'Di Lorenzo',
	'1993-07-17',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Niklas',
	'Süle',
	'1995-09-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Jordan',
	'Pickford',
	'1994-03-07',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@goalkeeper', 'id')::integer,
	'GK'
),
(
	'Samu',
	'Omordion',
	'1999-01-25',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Carlos',
	'Baleba',
	'2000-12-16',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Alex',
	'Scott',
	'1998-08-25',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Javi',
	'Guerra',
	'1998-01-29',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Dango',
	'Ouattara',
	'2001-01-06',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Milos',
	'Kerkez',
	'2003-06-26',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'El Bilal',
	'Touré',
	'1996-05-03',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Enzo',
	'Le Fée',
	'2000-02-03',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Ander',
	'Barrenetxea',
	'2001-12-28',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Arnaud',
	'Kalimuendo',
	'2002-01-20',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Dwight',
	'McNeil',
	'1993-11-08',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Radu',
	'Dragusin',
	'2002-02-03',
	get_column('@', 'fp_country@name@Romania', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Lazar',
	'Samardžić',
	'2002-03-14',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Miguel',
	'Gutiérrez',
	'2002-07-15',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Dani',
	'Vivian',
	'1999-08-17',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Amar',
	'Dedić',
	'1999-07-28',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'James',
	'Garner',
	'2001-03-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Giovanni',
	'Reyna',
	'2002-11-13',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Ian',
	'Maatsen',
	'2002-04-15',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Aaron',
	'Wan-Bissaka',
	'1997-11-26',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Renan',
	'Lodi',
	'1999-04-08',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Marcos',
	'Sénesi',
	'1997-05-10',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Samuele',
	'Ricci',
	'2000-08-19',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
),
(
	'Matteo',
	'Guendouzi',
	'1999-04-13',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Maxence',
	'Lacroix',
	'2000-04-04',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Caio',
	'Henrique',
	'1997-08-31',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Ismaila',
	'Sarr',
	'1998-02-23',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightWinger', 'id')::integer,
	'FW'
),
(
	'Nicolas',
	'Seiwald',
	'2001-06-04',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Angel',
	'Gomes',
	'2000-08-31',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Nicolò',
	'Casale',
	'1998-12-14',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Yangel',
	'Herrera',
	'1991-01-07',
	get_column('@', 'fp_country@name@Venezuela', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'André',
	'Almeida',
	'1990-09-10',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Carlos',
	'Soler',
	'1997-01-02',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centralMidfield', 'id')::integer,
	'MF'
),
(
	'Ferdi',
	'Kadıoğlu',
	'1996-07-13',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Arthur',
	'Theate',
	'2000-04-25',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreBack', 'id')::integer,
	'DF'
),
(
	'Daichi',
	'Kamada',
	'1996-01-06',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@attackingMidfield', 'id')::integer,
	'MF'
),
(
	'Antonee',
	'Robinson',
	'1997-08-28',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftBack', 'id')::integer,
	'DF'
),
(
	'Noah',
	'Okafor',
	'1999-05-10',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Odsonne',
	'Édouard',
	'1998-01-01',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Kyle',
	'Walker-Peters',
	'1997-04-13',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@rightBack', 'id')::integer,
	'DF'
),
(
	'Noa',
	'Lang',
	'1999-06-17',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	'LEFT',
	get_column('@', 'fp_position@name@leftWinger', 'id')::integer,
	'FW'
),
(
	'Ermedin',
	'Demirović',
	'1998-03-03',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@centreForward', 'id')::integer,
	'FW'
),
(
	'Sander',
	'Berge',
	'1994-02-02',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	'RIGHT',
	get_column('@', 'fp_position@name@defensiveMidfield', 'id')::integer,
	'MF'
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
 * INSERT MILITANCY
 ******************************************************************************/

INSERT INTO fp_militancy (start_year, type, player_id, team_id, team_type)
VALUES
(
	2017,
	'II_PART',
	get_column
	(
		'@',
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@VfL Wolfsburg', 'id')::integer,
	'CLUB'
	
),
(
	2018,
	'FULL',
	get_column
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@RSC Charleroi', 'id')::integer,
	'CLUB'
),
(
	2019,
	'FULL',
	get_column
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@LOSC Lille', 'id')::integer,
	'CLUB'
),
(
	2013,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Fudbalski klub Vojvodina', 'id')::integer,
	'CLUB'
),
(
	2014,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Koninklijke Racing Club Genk', 'id')::integer,
	'CLUB'
),
(
	2023,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Al-Hilal SFC', 'id')::integer,
	'CLUB'
),
(
	2016,
	'I_PART',
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Aston Villa', 'id')::integer,
	'CLUB'
),
(
	2021,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Tottenham Hotspur FC', 'id')::integer,
	'CLUB'
),
(
	2022,
	'I_PART',
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer,
	'CLUB'
),
(
	2006,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Palermo FC', 'id')::integer,
	'CLUB'
),
(
	2007,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@US Cremonese', 'id')::integer,
	'CLUB'
),
(
	2008,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@US Ancona', 'id')::integer,
	'CLUB'
),
(
	2016,
	'I_PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Siviglia FC', 'id')::integer,
	'CLUB'
),
(
	2016,
	'II_PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@CA Osasuna', 'id')::integer,
	'CLUB'
),
(
	2021,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Genoa CFC', 'id')::integer,
	'CLUB'
),
(
	2022,
	'I_PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	'CLUB'
),
(
	2022,
	'II_PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer,
	'CLUB'
),
(
	2023,
	'I_PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@OGC Nizza', 'id')::integer,
	'CLUB'
),
(
	2023,
	'II_PART',
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Fatih Karagümrük', 'id')::integer,
	'CLUB'
),
(
	2021,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@Fenerbahce', 'id')::integer,
	'CLUB'
),
(
	2022,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	'CLUB'
),
(
	2023,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@FC Bayern Monaco', 'id')::integer,
	'CLUB'
),
(
	2015,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_column('@', 'fp_country@name@Jugoslavia', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@FK Partizani', 'id')::integer,
	'CLUB'
),
(
	2016,
	'FULL',
	get_column
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_column('@', 'fp_country@name@Jugoslavia', 'id')::text,
		'id'
	)::integer,
	get_column('@', 'fp_team@long_name@GNK Dinamo Zagabria', 'id')::integer,
	'CLUB'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT MILITANCY FROM Function
 ******************************************************************************/

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@', 
		'fp_player@name@Victor James@surname@Osimhen'
		'@dob@1998-12-29@country_id@' ||
		get_column('@', 'fp_country@name@Nigeria', 'id')::text,
		'id'
	)::integer,
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2024 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Udinese Calcio', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SPAL', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2016 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2017 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Alex@surname@Meret'
		'@dob@1997-03-22@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2018 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Sergej@surname@Milinkovic-Savic'
		'@dob@1995-02-27@country_id@' ||
		get_column('@', 'fp_country@name@Spain', 'id')::text,
		'id'
	)::integer,
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2022 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Hellas Verona', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Atalanta', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2016 AS smallint),
	CAST('II_PART' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Pierluigi@surname@Gollini'
		'@dob@1995-03-18@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2022 AS smallint),
	CAST('II_PART' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Palermo FC', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2009 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2010 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@FC Paris Saint-Germain', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2011 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2015 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Torino FC', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Salvatore@surname@Sirigu'
		'@dob@1987-01-12@country_id@' ||
		get_column('@', 'fp_country@name@Italy', 'id')::text,
		'id'
	)::integer,
	CAST(2017 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Hubert@surname@Idasiak'
		'@dob@2002-02-03@country_id@' ||
		get_column('@', 'fp_country@name@Poland', 'id')::text,
		'id'
	)::integer,
	CAST(2022 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2023 AS smallint),
	CAST('FULL' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Jeonbuk Hyundai Motors', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	CAST(2016 AS smallint),
	CAST('II_PART' AS en_season),
	CAST(2018 AS smallint),
	CAST('I_PART' AS en_season)
);

SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@Beijing Guoan', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Min-jae@surname@Kim'
		'@dob@1996-11-15@country_id@' ||
		get_column('@', 'fp_country@name@South Korea', 'id')::text,
		'id'
	)::integer,
	CAST(2018 AS smallint),
	CAST('II_PART' AS en_season),
	CAST(2020 AS smallint),
	CAST('FULL' AS en_season)
);


SELECT insert_militancy_from_to
(
	CAST('CLUB' AS en_team), 
	get_column('@', 'fp_team@long_name@FK Partizani', 'id')::integer,
	get_column
	(
		'@',
		'fp_player@name@Amir@surname@Rrahmani'
		'@dob@1994-02-24@country_id@' ||
		get_column('@', 'fp_country@name@Jugoslavia', 'id')::text,
		'id'
	)::integer,
	CAST(2013 AS smallint),
	CAST('FULL' AS en_season),
	CAST(2014 AS smallint),
	CAST('FULL' AS en_season)
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
 * INSERT COMPETITION EDITION
 ******************************************************************************/

INSERT INTO fp_competition_edition (start_year, competition_id)
VALUES
(
	2022,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer
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
 * INSERT PARTECIPATION
 ******************************************************************************/
INSERT INTO fp_partecipation (competition_id, start_year, team_id)
VALUES
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Inter', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AC Milan', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Juventus FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AS Roma', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Atalanta', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@ACF Fiorentina', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Sassuolo', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Torino FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Udinese Calcio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Bologna FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@AC Monza', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Empoli FC', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Hellas Verona', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Salernitana', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@Spezia Calcio', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Lecce', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@US Cremonese', 'id')::integer
),
(
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022,
	get_column('@', 'fp_team@long_name@UC Sampdoria', 'id')::integer
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
 * INSERT team_trophy_case
 ******************************************************************************/
INSERT INTO fp_team_trophy_case (team_id, trophy_id, competition_id, start_year)
VALUES
(
	get_column('@', 'fp_team@long_name@SSC Napoli', 'id')::integer,
	get_column('@', 'fp_trophy@name@firstPlace', 'id')::integer,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022
),
(
	get_column('@', 'fp_team@long_name@SS Lazio', 'id')::integer,
	get_column('@', 'fp_trophy@name@secondPlace', 'id')::integer,
	get_column('@', 'fp_competition@name@Serie A', 'id')::integer,
	2022
);
--------------------------------------------------------------------------------




SELECT set_random_all();



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
 * VIEW
 ******************************************************************************/

/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_positions
 *
 * DESC : Mostra informazioni riguardo tutte le posizioni di gioco
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_positions
AS
	SELECT
		fp_position.id::text AS position_id,
		fp_position.role::text AS position_role,
		fp_position.code::text AS position_code,
		fp_position.name::text AS position_name
	FROM
		fp_position
	WHERE
		TRUE
	ORDER BY
		fp_position.role,
		fp_position.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_team_trophy
 *
 * DESC : Mostra informazioni riguardo tutti i trofei calcistici di tipo squadra
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_team_trophy
AS
	SELECT
		fp_trophy.id::text AS trophy_id,
		fp_trophy.name::text AS trophy_name
	FROM
		fp_trophy
	WHERE
		fp_trophy.type = 'TEAM'
	ORDER BY
		fp_trophy.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_player_trophy
 *
 * DESC : Mostra informazioni riguardo tutti i trofei calcistici di tipo giocatore
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_player_trophy
AS
	SELECT
		fp_trophy.id::text AS trophy_id,
		fp_trophy.role::text AS trophy_role,
		fp_trophy.name::text AS trophy_name
	FROM
		fp_trophy
	WHERE
		fp_trophy.type = 'PLAYER'
	ORDER BY
		fp_trophy.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_team_prize
 *
 * DESC : Mostra informazioni riguardo tutti i premi calcistici di tipo squadra
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_team_prize
AS
	SELECT
		fp_prize.id::text AS prize_id,
		fp_prize.name::text AS prize_name
	FROM
		fp_prize
	WHERE
		fp_prize.type = 'TEAM'
	ORDER BY
		fp_prize.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_player_prize
 *
 * DESC : Mostra informazioni riguardo tutti i premi calcistici di tipo calciatore
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_player_prize
AS
	SELECT
		fp_prize.id::text AS prize_id,
		fp_prize.role::text AS prize_role,
		fp_prize.name::text AS prize_name
	FROM
		fp_prize
	WHERE
		fp_prize.type = 'PLAYER'
	ORDER BY
		fp_prize.name;

--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : VIEW
 * NAME : vi_all_tag
 *
 * DESC : Mostra informazioni riguardo tutti i tag
 ******************************************************************************/
CREATE OR REPLACE VIEW vi_all_tag
AS
	SELECT
		fp_tag.id::text AS tag_id,
		fp_tag.name::text AS tag_name
	FROM
		fp_tag
	WHERE
		TRUE
	ORDER BY
		fp_tag.name;

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
 * JAVA FUNCTION OUTPUT
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_admin
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Valuta se l'username e password in ingresso sono di un admin
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_admin
(
    IN  username_admin  text,
    IN  password_admin  text
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
			fp_admin
		WHERE
			fp_admin.username = username_admin::dm_username
            AND
            fp_admin.password = password_admin::dm_password
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_country
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di paesi
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_country
(
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
			fp_country
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_confederation
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di confederazioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_confederation
(
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
			fp_confederation
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_competition
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di competizioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_competition
(
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
			fp_competition
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_team
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_team
(
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
			fp_team
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : count_player
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Restituisce il numero totale di calciatori
 ******************************************************************************/
CREATE OR REPLACE FUNCTION count_player
(
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
			fp_player
		WHERE
			TRUE
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_country
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti i paesi.
 *        I paesi in output possono essere cercati per:
 *         - tipologia
 *         - paese superiore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_country
(
    IN  type_country        text,
    IN  id_super_country    text
)
RETURNS TABLE
        (
            country_id          text,
            country_type        text,
            country_code        text,
            country_name        text,
            super_country_id    text,
            super_country_name  text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        country_id          text    NOT NULL,
        country_type        text    NOT NULL,
        country_code        text    NOT NULL,
        country_name        text    NOT NULL,
        super_country_id    text            ,
        super_country_name  text
    );

    INSERT INTO
        output_table
    SELECT
        inner_country.id::text,
        inner_country.type::text,
        inner_country.code::text,
        inner_country.name::text,
        super_country.id::text,
        super_country.name::text
    FROM
        fp_country AS inner_country
        LEFT OUTER JOIN
        fp_country AS super_country
            ON
            inner_country.super_id = super_country.id
    WHERE
        TRUE;

    
    IF (type_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_type <> type_country;

    END IF;


    IF (id_super_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.super_country_id <> id_super_country;

    END IF;


    RETURN QUERY
        SELECT
            output_table.country_id,
            output_table.country_type,
            output_table.country_code,
            output_table.country_name,
            output_table.super_country_id,
            output_table.super_country_name
        FROM
            output_table
        WHERE
            TRUE
        ORDER BY
            output_table.country_name;
    

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_confederation
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti le confederazioni calcistiche.
 *        Le confederazioni in output possono essere cercate per:
 *         - tipologia
 *         - confederazione superiore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_confederation
(
    IN  type_country    text,
    IN  id_super_conf   text
)
RETURNS TABLE
        (
            conf_id                 text,
            conf_short_name         text,
            conf_long_name          text,
            country_id              text,
            country_name            text,
            country_type            text,
            super_conf_id           text,
            super_conf_short_name   text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        conf_id                 text    NOT NULL,
        conf_short_name         text    NOT NULL,
        conf_long_name          text    NOT NULL,
        country_id              text    NOT NULL,
        country_name            text    NOT NULL,
        country_type            text    NOT NULL,
        super_conf_id           text            ,
        super_conf_short_name   text
    );

    INSERT INTO
        output_table
    SELECT
        inner_confederation.id::text,
        inner_confederation.short_name::text,
        inner_confederation.long_name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.type::text,
        super_confederation.id::text,
        super_confederation.short_name::text
    FROM
        fp_confederation AS inner_confederation
        JOIN
        fp_country
            ON
            inner_confederation.country_id = fp_country.id
        LEFT OUTER JOIN
        fp_confederation AS super_confederation
            ON
            inner_confederation.super_id = super_confederation.id
    WHERE
        TRUE;

    
    IF (type_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_type <> type_country;

    END IF;


    IF (id_super_conf IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.super_conf_id <> id_super_conf;

    END IF;


    RETURN QUERY
        SELECT
            output_table.conf_id,
            output_table.conf_short_name,
            output_table.conf_long_name,
            output_table.country_id,
            output_table.country_name,
            output_table.country_type,
            output_table.super_conf_id,
            output_table.super_conf_short_name
        FROM
            output_table
        ORDER BY
            output_table.conf_long_name;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_competition
 *
 * IN      : text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti le competizioni calcistiche.
 *        Le competizioni in output possono essere cercate per:
 *         - sottostringa del nome
 *         - tipologia
 *         - tipologia squadra di calcio che puo' parteciparvi
 *         - tipologia paese
 *         - continente di appartenenza
 *         - nazione di appartenenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_competition
(
    IN  sub_name_comp   text,
    IN  type_comp       text,
    IN  type_team_comp  text,
    IN  type_country    text,
    IN  id_continent    text,
    IN  id_nation       text
)
RETURNS TABLE
        (
            comp_id         text,
            comp_type       text,
            comp_type_team  text,
            comp_name       text,
            conf_id         text,
            conf_short_name text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        comp_id             text    NOT NULL,
        comp_type           text    NOT NULL,
        comp_type_team      text    NOT NULL,
        comp_name           text    NOT NULL,
        conf_id             text    NOT NULL,
        conf_short_name     text    NOT NULL,
        country_id          text    NOT NULL,
        country_name        text    NOT NULL,
        country_type        text    NOT NULL,
	    country_super_id	text
    );

    INSERT INTO output_table
    SELECT
        fp_competition.id::text,
        fp_competition.type::text,
        fp_competition.team_type::text,
        fp_competition.name::text,
        fp_confederation.id::text,
        fp_confederation.short_name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.type::text,
		fp_country.super_id::text
    FROM
        fp_competition
        JOIN
        fp_confederation
            ON
            fp_competition.confederation_id = fp_confederation.id
        JOIN
        fp_country
            ON
            fp_confederation.country_id = fp_country.id
    WHERE
		TRUE;


    IF (sub_name_comp IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_name_comp) IN lower(output_table.comp_name));

    END IF;


    IF (type_comp IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.comp_type <> type_comp;

    END IF;


    IF (type_team_comp IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.comp_type_team <> type_team_comp;
        
    END IF;


    IF (type_country IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_type <> type_country;

        
        IF (id_continent IS NOT NULL) THEN

            IF ('CONTINENT' = type_country) THEN

                DELETE FROM
                    output_table
                WHERE
                    output_table.country_id <> id_continent;

            ELSIF ('NATION' = type_country) THEN

                DELETE FROM
                    output_table
                WHERE
                    output_table.country_super_id <> id_continent;

                IF (id_nation IS NOT NULL) THEN

                    DELETE FROM
                        output_table
                    WHERE
                        output_table.country_id <> id_nation;

                END IF;

            END IF;

        END IF;

    END IF;
	

    RETURN QUERY
        SELECT
            output_table.comp_id,
            output_table.comp_type,
            output_table.comp_type_team,
            output_table.comp_name,
            output_table.conf_id,
            output_table.conf_short_name,
            output_table.country_id,
            output_table.country_name
        FROM
            output_table
        WHERE
			TRUE
        ORDER BY
            output_table.comp_name;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : filter_competition_edition
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce tutte le edizioni di una competizione calcistica in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION filter_competition_edition
(
    IN  id_comp text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition_edition.start_year::text
        FROM
            fp_competition_edition
        WHERE
            fp_competition_edition.competition_id = id_comp::integer
        ORDER BY
            fp_competition_edition.start_year DESC;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_player
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni per squadre club
 *        o per squadre nazionali giocate da un calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_player
(
    IN  id_player       text,
    IN  type_team_comp  text
)
RETURNS TABLE
        (
            comp_id     text,
            comp_name   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name
        FROM
            fp_play
            JOIN
            fp_competition
                ON
                fp_play.competition_id = fp_competition.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team_comp::en_team
        ORDER BY
            comp_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_player_season
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni per squadre club
 *        o per squadre nazionali giocate da un calciatore in una stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_player_season
(
    IN  id_player   text,
    IN  type_team   text,
    IN  s_year      text
)
RETURNS TABLE
        (
            comp_id     text,
            comp_name   text
        )
AS
$$
BEGIN

    
    RETURN QUERY
        SELECT DISTINCT
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name
        FROM
            fp_play
            JOIN
            fp_competition
                ON
                fp_play.competition_id = fp_competition.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team::en_team
            AND
            fp_play.start_year = s_year::dm_year
        ORDER BY
            comp_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_team
 *
 * IN      : text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti le squadre di calcio.
 *        Le squadre in output possono essere cercate per:
 *         - sottostringa del nome esteso
 *         - sottostringa del nome abbreviato
 *         - tipologia
 *         - continente di appartenenza
 *         - nazione di appartenenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_team
(
    IN  sub_long_name_team  text,
    IN  sub_short_name_team text,
    IN  type_team           text,
    IN  id_continent        text,
    IN  id_nation           text
)
RETURNS TABLE
        (
            team_id         text,
            team_type       text,
            team_short_name text,
            team_long_name  text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        team_id             text    NOT NULL,
        team_type           text    NOT NULL,
        team_short_name     text    NOT NULL,
        team_long_name      text    NOT NULL,
        country_id          text    NOT NULL,
        country_name        text    NOT NULL,
        country_type        text    NOT NULL,
        country_super_id    text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_team.id::text,
        fp_team.type::text,
        fp_team.short_name::text,
        fp_team.long_name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.type::text,
        fp_country.super_id::text
    FROM
        fp_team
        JOIN
        fp_country
            ON
            fp_team.country_id = fp_country.id
    WHERE
		TRUE;


    IF (sub_long_name_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_long_name_team) IN lower(output_table.team_long_name));

    END IF;


    IF (sub_short_name_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_short_name_team) IN lower(output_table.team_short_name));

    END IF;


    IF (type_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.team_type <> type_team;

    END IF;


    IF (id_continent IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_super_id <> id_continent;

    END IF;


    IF (id_nation IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_nation;

    END IF;


    RETURN QUERY
        SELECT
            output_table.team_id,
            output_table.team_type,
            output_table.team_short_name,
            output_table.team_long_name,
            output_table.country_id,
            output_table.country_name
        FROM
            output_table
        WHERE
			TRUE
        ORDER BY
            output_table.team_long_name;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : filter_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardanti le squadre di calcio.
 *        Le squadre in output devono essere filtrate per:
 *         - stagione
 *         - competizione cui partecipano
 ******************************************************************************/
CREATE OR REPLACE FUNCTION filter_team
(
    IN  s_year  text,
    IN  id_comp text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_partecipation
            JOIN
            fp_team
                ON
                fp_partecipation.team_id = fp_team.id
            JOIN
            fp_country
                ON
                fp_team.country_id = fp_country.id
        WHERE
            fp_partecipation.start_year = s_year::integer
            AND
            fp_partecipation.competition_id = id_comp::integer
        ORDER BY
            fp_team.long_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : club_team_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce tutte le squadre di calcio di tipo club in cui il
 *        calciatore in input ha giocato effettivamente
 ******************************************************************************/
CREATE OR REPLACE FUNCTION club_team_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_team.type = 'CLUB'
        ORDER BY
            team_long_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : year_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce tutti gli anni nei quali una squadra di calcio ha militanze
 *        di calciatori o partecipazioni a competizioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION year_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            years.start_year::text AS start_year
        FROM
            (
                (
                    SELECT
                        fp_militancy.start_year
                    FROM
                        fp_militancy
                    WHERE
                        fp_militancy.team_id = id_team::integer
                )
                UNION
                (
                    SELECT
                        fp_partecipation.start_year
                    FROM
                        fp_partecipation
                    WHERE
                        fp_partecipation.team_id = id_team::integer
                )
            ) AS years
        ORDER BY start_year DESC;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : info_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce tutte le informazioni riguardanti una squadra di calcio
 *        in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION info_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            team_id         text,
            team_type       text,
            team_short_name text,
            team_long_name  text,
            country_id      text,
            country_name    text,
            conf_id         text,
            conf_short_name text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id,
            fp_team.type::text AS team_type,
            fp_team.short_name::text AS team_short_name,
            fp_team.long_name::text AS team_long_name,
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name,
            fp_confederation.id::text AS conf_id,
            fp_confederation.short_name::text AS conf_short_name
        FROM
            fp_team
            JOIN
            fp_country
                ON
                fp_team.country_id = fp_country.id
            JOIN
            fp_confederation
                ON
                fp_country.id = fp_confederation.country_id
        WHERE
            fp_team.id = id_team::integer;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : partecipation_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni calcistiche
 *        cui partecipa una squadra di calcio in una specifica stagione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION partecipation_team
(
    IN  id_team text,
    IN  s_year  text
)
RETURNS TABLE
        (
            comp_id         text,
            comp_type       text,
            comp_name       text,
            conf_id         text,
            conf_short_name text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition.id::text AS comp_id,
            fp_competition.type::text AS comp_type,
            fp_competition.name::text AS comp_name,
            fp_confederation.id::text AS conf_id,
            fp_confederation.short_name::text AS conf_short_name
        FROM
            fp_partecipation
            JOIN
            fp_competition
                ON
                fp_partecipation.competition_id = fp_competition.id
            JOIN
            fp_confederation
                ON
                fp_competition.confederation_id = fp_confederation.id
        WHERE
            fp_partecipation.team_id = id_team::integer
            AND
            fp_partecipation.start_year = s_year::integer;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : trophy_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i trofei calcistici vinti da
 *        una squadra di calcio in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION trophy_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            trophy_id       text,
            trophy_name     text,
            comp_id         text,
            comp_start_year text,
            comp_name       text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_trophy.id::text AS trophy_id,
            fp_trophy.name::text AS trophy_name,
            fp_competition.id::text AS comp_id,
            fp_team_trophy_case.start_year::text AS comp_start_year,
            fp_competition.name::text AS comp_name
        FROM
            fp_team_trophy_case
            JOIN
            fp_trophy
                ON
                 fp_team_trophy_case.trophy_id = fp_trophy.id
            JOIN
            fp_competition
                ON
                fp_team_trophy_case.competition_id = fp_competition.id
        WHERE
            fp_team_trophy_case.team_id = id_team::integer
        ORDER BY
            fp_team_trophy_case.start_year DESC,
            fp_competition.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : prize_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i premi calcistici vinti da
 *        una squadra di calcio in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION prize_team
(
    IN  id_team text
)
RETURNS TABLE
        (
            prize_id            text,
            prize_assign_year   text,
            prize_name          text,
            prize_given         text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_prize.id::text AS prize_id,
            fp_team_prize_case.assign_year::text AS prize_assign_year,
            fp_prize.name::text AS prize_name,
            fp_prize.given::text AS prize_given
        FROM
            fp_team_prize_case
            JOIN
            fp_prize
                ON
                 fp_team_prize_case.prize_id = fp_prize.id
        WHERE
            fp_team_prize_case.team_id = id_team::integer
        ORDER BY
            fp_team_prize_case.assign_year DESC,
            fp_prize.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : squad_team
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo la rosa di una squadra di calcio
 *        in una specifica stagione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION squad_team
(
    IN  id_team text,
    IN  s_year  text
)
RETURNS TABLE
        (
            player_id       text,
            player_name     text,
            player_surname  text,
            player_role     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.role::text AS player_role
        FROM
            fp_militancy
            JOIN
            fp_player
                ON
                 fp_militancy.player_id = fp_player.id
        WHERE
            fp_militancy.team_id = id_team::integer
            AND
            fp_militancy.start_year = s_year::integer
        ORDER BY
            fp_player.role;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_player
 *
 * IN      : text, text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti i calciatori.
 *        I calciatori in output possono essere cercati per:
 *         - sottostringa del nome
 *         - sottostringa del cognome
 *         - range eta
 *         - continente di nascita
 *         - nazione di nascita
 *         - ruolo
 *         - posizione principale
 *         - piede preferito
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_player
(
    IN  sub_name_player     text,
    IN  sub_surname_player  text,
    IN  ref_year_player     text,
    IN  min_age_player      text,
    IN  max_age_player      text,
    IN  id_continent        text,
    IN  id_nation           text,
    IN  role_player         text,
    IN  id_pos              text,
    IN  foot_player         text
)
RETURNS TABLE
        (
            player_id           text,
            player_name         text,
            player_surname      text,
            player_dob          text,
            player_foot         text,
            player_role         text,
            player_retired_date text,
            position_id         text,
            position_name       text,
            country_id          text,
            country_name        text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        player_id           text    NOT NULL,
        player_name         text    NOT NULL,
        player_surname      text    NOT NULL,
        player_dob          text    NOT NULL,
        player_foot         text    NOT NULL,
        player_role         text    NOT NULL,
        player_retired_date text            ,
        position_id         text    NOT NULL,
        position_name       text    NOT NULL,
        country_id          text    NOT NULL,
        country_name        text    NOT NULL,
        country_super_id    text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_player.id::text,
        fp_player.name::text,
        fp_player.surname::text,
        fp_player.dob::text,
        fp_player.foot::text,
        fp_player.role::text,
        fp_player_retired.retired_date::text,
        fp_position.id::text,
        fp_position.name::text,
        fp_country.id::text,
        fp_country.name::text,
        fp_country.super_id::text
    FROM
        fp_player
        LEFT OUTER JOIN
        fp_player_retired
            ON
            fp_player.id = fp_player_retired.player_id
        JOIN
        fp_position
            ON
            fp_player.position_id = fp_position.id
        JOIN
        fp_country
            ON
            fp_player.country_id = fp_country.id
    WHERE
        TRUE;


    IF (sub_name_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_name_player) IN lower(output_table.player_name));

    END IF;


    IF (sub_surname_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(sub_surname_player) IN lower(output_table.player_surname));

    END IF;


    IF (ref_year_player IS NOT NULL) THEN

        IF (min_age_player IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                (ref_year_player::integer - extract(year from output_table.player_dob::date)) < min_age_player::integer;

        END IF;

        IF (max_age_player IS NOT NULL) THEN

            DELETE FROM
                output_table
            WHERE
                (ref_year_player::integer - extract(year from output_table.player_dob::date)) > max_age_player::integer;
        
        END IF;

    END IF;


    IF (id_continent IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_super_id <> id_continent;

    END IF;


    IF (id_nation IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.country_id <> id_nation;

    END IF;


    IF (role_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(role_player) IN lower(output_table.player_role::text));
        
    END IF;


    IF (id_pos IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.position_id <> id_pos;
        
    END IF;


    IF (foot_player IS NOT NULL) THEN

        IF ('RIGHT' = foot_player) THEN

            DELETE FROM
                output_table
            WHERE
                output_table.player_foot = 'LEFT';
            
        ELSIF ('LEFT' = foot_player) THEN

            DELETE FROM
                output_table
            WHERE
                output_table.player_foot = 'RIGHT';

        ELSE

            DELETE FROM
                output_table
            WHERE
                output_table.player_foot <> foot_player;

        END IF;
        
    END IF;


    RETURN QUERY
        SELECT
            output_table.player_id,
            output_table.player_name,
            output_table.player_surname,
            output_table.player_dob,
            output_table.player_foot,
            output_table.player_role,
            output_table.player_retired_date,
            output_table.position_id,
            output_table.position_name,
            output_table.country_id,
            output_table.country_name
        FROM
            output_table
        WHERE
            TRUE
        ORDER BY
            output_table.player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : random_player
 *
 * IN      : void
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Restituisce informazioni riguardanti un calciatore scelto casualmente
 ******************************************************************************/
CREATE OR REPLACE FUNCTION random_player
(
)
RETURNS text
AS
$$
DECLARE

    random_id   text;

BEGIN

    
        SELECT
            id::text
        INTO
            random_id
        FROM
            fp_player
        ORDER BY
            random()
        LIMIT
            1;
        

        RETURN random_id;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : filter_player
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardanti i calciatori.
 *        I calciatori in output devono essere filtrati per:
 *         - anno militanza
 *         - squadra di calcio in cui militano
 ******************************************************************************/
CREATE OR REPLACE FUNCTION filter_player
(
    IN  s_year  text,
    IN  id_team text
)
RETURNS TABLE
        (
            player_id       text,
            player_name     text,
            player_surname  text,
            player_role     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.role::text AS player_role
        FROM
            fp_militancy
            JOIN
            fp_player
                ON
                fp_militancy.player_id = fp_player.id
        WHERE
            fp_militancy.start_year = s_year::integer
            AND
            fp_militancy.team_id = id_team::integer
        ORDER BY
            fp_player.role,
            fp_player.surname;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : season_play
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce tutte le stagioni calcistiche in cui il calciatore
 *        ha giocato in una squadra di calcio club o nazionale
 ******************************************************************************/
CREATE OR REPLACE FUNCTION season_play
(
    IN  id_player   text,
    IN  type_team   text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_play.start_year::text AS start_year
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_team.type = type_team::en_team
        ORDER BY
            start_year DESC;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : info_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce tutte le informazioni riferite ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION info_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            player_id           text,
            player_name         text,
            player_surname      text,
            player_dob          text,
            country_name        text,
            player_foot         text,
            position_name       text,
            player_role         text,
            player_retired_date text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.dob::text AS player_dob,
            fp_country.name::text AS country_name,
            fp_player.foot::text AS player_foot,
            fp_position.name::text AS position_name,
            fp_player.role::text AS player_role,
            fp_player_retired.retired_date::text AS player_retired_date
        FROM
            fp_player
            JOIN
            fp_country
                ON
                fp_player.country_id = fp_country.id
            JOIN
            fp_position
                ON
                fp_player.position_id = fp_position.id
            LEFT OUTER JOIN
            fp_player_retired
                ON
                fp_player.id = fp_player_retired.player_id
        WHERE
            fp_player.id = id_player::integer;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : position_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo tutte le posizioni di gioco
 *        associate ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION position_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            position_id     text,
            position_role   text,
            position_code   text,
            position_name   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_position.id::text AS position_id,
            fp_position.role::text AS position_role,
            fp_position.code::text AS position_code,
            fp_position.name::text AS position_name
        FROM
            fp_player_position
            JOIN
            fp_position
                ON
                fp_player_position.position_id = fp_position.id
        WHERE
            fp_player_position.player_id = id_player::integer
        ORDER BY
            fp_position.role,
            fp_position.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : nationality_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo tutte le nazionalita'
 *        associate ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION nationality_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name
        FROM
            fp_nationality
            JOIN
            fp_country
                ON
                fp_nationality.country_id = fp_country.id
        WHERE
            fp_nationality.player_id = id_player::integer
        ORDER BY
            fp_country.name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : search_militancy_player
 *
 * IN      : text, text, text
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardanti i calciatori.
 *        I calciatori in output possono essere cercati per:
 *         - squadra in cui hanno militato
 *         - range di militanza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION search_militancy_player
(
    IN  id_team_militancy   text,
    IN  s_year_militancy    text,
    IN  e_year_militancy    text
)
RETURNS TABLE
        (
            player_id           text,
            player_name         text,
            player_surname      text,
            player_dob          text,
            player_foot         text,
            player_role         text,
            player_retired_date text,
            position_id         text,
            position_name       text,
            country_id          text,
            country_name        text
        )
AS
$$
BEGIN

    IF (s_year_militancy IS NULL) THEN

        s_year_militancy = '1810';
    
    END IF;


    IF (e_year_militancy IS NULL) THEN

        e_year_militancy = extract(year from current_date)::text;
    
    END IF;


    RETURN QUERY
        SELECT DISTINCT
            fp_player.id::text AS player_id,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_player.dob::text AS player_dob,
            fp_player.foot::text AS player_foot,
            fp_player.role::text AS player_role,
            fp_player_retired.retired_date::text AS player_retired_date,
            fp_position.id::text AS position_id,
            fp_position.name::text AS position_name,
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name
        FROM
            fp_player
            LEFT OUTER JOIN
            fp_player_retired
                ON
                fp_player.id = fp_player_retired.player_id
            JOIN
            fp_position
                ON
                fp_player.position_id = fp_position.id
            JOIN
            fp_country
                ON
                fp_player.country_id = fp_country.id
            JOIN
            fp_militancy
                ON
                fp_player.id = fp_militancy.player_id
        WHERE
            fp_militancy.team_id = id_team_militancy::integer
            AND
            fp_militancy.start_year BETWEEN s_year_militancy::integer AND e_year_militancy::integer
        ORDER BY
            player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : total_statistic
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce le statistiche totali di calciatori.
 *        Le statistiche possono essere filtrate per:
 *         - tipologia di squadra di calcio
 *         - ruolo del calciatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION total_statistic
(
    IN  type_team   text,
    IN  role_player text
)
RETURNS TABLE
        (
            player_id       text,
            player_role     text,
            player_name     text,
            player_surname  text,
            match           text,
            goal_scored     text,
            penalty_scored  text,
            assist          text,
            yellow_card     text,
            red_card        text,
            goal_conceded   text,
            penalty_saved   text
        )
AS
$$
BEGIN

    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        player_id       text    NOT NULL,
        player_role     text    NOT NULL,
        player_name     text    NOT NULL,
        player_surname  text    NOT NULL,
        match           text    NOT NULL,
        goal_scored     text    NOT NULL,
        penalty_scored  text    NOT NULL,
        assist          text    NOT NULL,
        yellow_card     text    NOT NULL,
        red_card        text    NOT NULL,
        goal_conceded   text            ,
        penalty_saved   text            ,
        team_type       text    NOT NULL
    );

    INSERT INTO output_table
    SELECT
        fp_player.id::text,
        fp_player.role::text,
        fp_player.name::text,
        fp_player.surname::text,
        fp_play.match::text,
        fp_statistic_general.goal_scored::text,
        fp_statistic_general.penalty_scored::text,
        fp_statistic_general.assist::text,
        fp_statistic_general.yellow_card::text,
        fp_statistic_general.red_card::text,
        fp_statistic_goalkeeper.goal_conceded::text,
        fp_statistic_goalkeeper.penalty_saved::text,
        fp_competition.team_type::text
    FROM
        fp_player
        JOIN
        fp_play
            ON
            fp_player.id = fp_play.player_id
        JOIN
        fp_statistic_general
            ON
            fp_play.id = fp_statistic_general.play_id
        LEFT OUTER JOIN
        fp_statistic_goalkeeper
            ON
            fp_play.id = fp_statistic_goalkeeper.play_id
        JOIN
        fp_competition
            ON
            fp_play.competition_id = fp_competition.id
    WHERE
        TRUE;


    IF (type_team IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            output_table.team_type <> type_team;

    END IF;


    IF (role_player IS NOT NULL) THEN

        DELETE FROM
            output_table
        WHERE
            0 = position(lower(role_player) IN lower(output_table.player_role::text));

    END IF;



    RETURN QUERY
        SELECT
            output_table.player_id AS player_id,
            output_table.player_role AS player_role,
            output_table.player_name AS player_name,
            output_table.player_surname AS player_surname,
            sum(output_table.match::integer)::text AS match,
            sum(output_table.goal_scored::integer)::text AS goal_scored,
            sum(output_table.assist::integer)::text AS assist,
            sum(output_table.yellow_card::integer)::text AS yellow_card,
            sum(output_table.red_card::integer)::text AS red_card,
            sum(output_table.penalty_scored::integer)::text AS penalty_scored,
            sum(output_table.goal_conceded::integer)::text AS goal_conceded,
            sum(output_table.penalty_saved::integer)::text AS penalty_saved
        FROM
            output_table
        GROUP BY
            output_table.player_id,
            output_table.player_role,
            output_table.player_name,
            output_table.player_surname
        ORDER BY
            player_surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_edition_statistic
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce le statistiche di gioco riferite ad una specifica
 *        edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_edition_statistic
(
    IN  s_year  text,
    IN  id_comp text
)
RETURNS TABLE
        (
            team_id                     text,
            team_long_name              text,
            player_id                   text,
            player_role                 text,
            player_name                 text,
            player_surname              text,
            match                       text,
            goal_scored                 text,
            penalty_scored              text,
            assist                      text,
            yellow_card                 text,
            red_card                    text,
            goal_conceded               text,
            penalty_saved               text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_player.id::text AS player_id,
            fp_player.role::text AS player_role,
            fp_player.name::text AS player_name,
            fp_player.surname::text AS player_surname,
            fp_play.match::text AS match,
            fp_statistic_general.goal_scored::text AS goal_scored,
            fp_statistic_general.penalty_scored::text AS penalty_scored,
            fp_statistic_general.assist::text AS assist,
            fp_statistic_general.yellow_card::text AS yellow_card,
            fp_statistic_general.red_card::text AS red_card,
            fp_statistic_goalkeeper.goal_conceded::text AS goal_conceded,
            fp_statistic_goalkeeper.penalty_saved::text AS penalty_saved
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
            JOIN
            fp_player
                ON
                fp_play.player_id = fp_player.id
            JOIN
            fp_statistic_general
                ON
                fp_play.id = fp_statistic_general.play_id
            LEFT OUTER JOIN
            fp_statistic_goalkeeper
                ON
                fp_play.id = fp_statistic_goalkeeper.play_id
        WHERE
            fp_play.start_year = s_year::integer
            AND
            fp_play.competition_id = id_comp::integer
        ORDER BY
            fp_player.surname;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : prize_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i premi calcistici vinti da
 *        un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION prize_player
(
    IN  id_player   text
)
RETURNS TABLE
        (
            prize_id    text,
            prize_year  text,
            prize_name  text,
            prize_given text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_prize.id::text AS prize_id,
            fp_player_prize_case.assign_year::text AS prize_year,
            fp_prize.name::text AS prize_name,
            fp_prize.given::text AS prize_given
        FROM
            fp_player_prize_case
            JOIN
            fp_prize
                ON
                fp_player_prize_case.prize_id = fp_prize.id
        WHERE
            fp_player_prize_case.player_id = id_player::integer
        ORDER BY
            fp_player_prize_case.assign_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : trophy_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo i trofei calcistici vinti da
 *        un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION trophy_player
(
    IN  id_player   text,
    IN  type_team   text
)
RETURNS TABLE
        (
            comp_start_year text,
            comp_id         text,
            comp_name       text,
            team_id         text,
            team_long_name  text,
            trophy_name     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player_trophy_case.start_year::text AS comp_start_year,
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_trophy.name::text AS trophy_name
        FROM
            fp_player_trophy_case
            JOIN
            fp_trophy
                ON
                fp_player_trophy_case.trophy_id = fp_trophy.id
            JOIN
            fp_team
                ON
                fp_player_trophy_case.team_id = fp_team.id
            JOIN
            fp_competition
                ON
                fp_player_trophy_case.competition_id = fp_competition.id
        WHERE
            fp_player_trophy_case.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team::en_team
        ORDER BY
            fp_player_trophy_case.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_goalkeeping
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restutuisce informazioni riguardo gli attributi di portiere
 *        di un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_goalkeeping
(
    IN  id_player text
)
RETURNS TABLE
        (
            aerial_reach			text,
            command_of_area			text,
            communication			text,
            eccentricity			text,
            first_touch_gk			text,
            handling				text,
            kicking					text,
            one_on_ones				text,
            passing_gk				text,
            punching_tendency		text,
            reflexes				text,
            rushing_out_tendency	text,
            throwing				text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_attribute_goalkeeping.aerial_reach::text,
            fp_attribute_goalkeeping.command_of_area::text,
            fp_attribute_goalkeeping.communication::text,
            fp_attribute_goalkeeping.eccentricity::text,
            fp_attribute_goalkeeping.first_touch_gk::text,
            fp_attribute_goalkeeping.handling::text,
            fp_attribute_goalkeeping.kicking::text,
            fp_attribute_goalkeeping.one_on_ones::text,
            fp_attribute_goalkeeping.passing_gk::text,
            fp_attribute_goalkeeping.punching_tendency::text,
            fp_attribute_goalkeeping.reflexes::text,
            fp_attribute_goalkeeping.rushing_out_tendency::text,
            fp_attribute_goalkeeping.throwing::text
        FROM
            fp_attribute_goalkeeping
        WHERE
            fp_attribute_goalkeeping.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_mental
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restutuisce informazioni riguardo gli attributi mentali
 *        di un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_mental
(
    IN  id_player text
)
RETURNS TABLE
        (
            aggression		text,
            anticipation	text,
            bravery			text,
            composure		text,
            concentration	text,
            decision		text,
            determination	text,
            flair			text,
            leadership		text,
            off_the_ball	text,
            positioning		text,
            teamwork		text,
            vision			text,
            work_rate		text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_attribute_mental.aggression::text,
            fp_attribute_mental.anticipation::text,
            fp_attribute_mental.bravery::text,
            fp_attribute_mental.composure::text,
            fp_attribute_mental.concentration::text,
            fp_attribute_mental.decision::text,
            fp_attribute_mental.determination::text,
            fp_attribute_mental.flair::text,
            fp_attribute_mental.leadership::text,
            fp_attribute_mental.off_the_ball::text,
            fp_attribute_mental.positioning::text,
            fp_attribute_mental.teamwork::text,
            fp_attribute_mental.vision::text,
            fp_attribute_mental.work_rate::text
        FROM
            fp_attribute_mental
        WHERE
            fp_attribute_mental.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_physical
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text)
 *
 * DESC : Restutuisce informazioni riguardo gli attributi fisici
 *        di un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_physical
(
    IN  id_player text
)
RETURNS TABLE
        (
            acceleration	text,
            agility			text,
            balance			text,
            jumping_reach	text,
            natural_fitness	text,
            pace			text,
            stamina			text,
            strength		text
        )
AS
$$
BEGIN

            
    RETURN QUERY
        SELECT
            fp_attribute_physical.acceleration::text,
            fp_attribute_physical.agility::text,
            fp_attribute_physical.balance::text,
            fp_attribute_physical.jumping_reach::text,
            fp_attribute_physical.natural_fitness::text,
            fp_attribute_physical.pace::text,
            fp_attribute_physical.stamina::text,
            fp_attribute_physical.strength::text
        FROM
            fp_attribute_physical
        WHERE
            fp_attribute_physical.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_technical
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restutuisce informazioni riguardo gli attributi tecnici
 *        di un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_technical
(
    IN  id_player text
)
RETURNS TABLE
        (
            corners				text,
            crossing			text,
            dribbling			text,
            finishing			text,
            first_touch			text,
            free_kick_taking	text,
            heading				text,
            long_shots			text,
            long_throws			text,
            marking				text,
            passing				text,
            penalty_taking		text,
            tackling			text,
            technique			text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_attribute_technical.corners::text,
            fp_attribute_technical.crossing::text,
            fp_attribute_technical.dribbling::text,
            fp_attribute_technical.finishing::text,
            fp_attribute_technical.first_touch::text,
            fp_attribute_technical.free_kick_taking::text,
            fp_attribute_technical.heading::text,
            fp_attribute_technical.long_shots::text,
            fp_attribute_technical.long_throws::text,
            fp_attribute_technical.marking::text,
            fp_attribute_technical.passing::text,
            fp_attribute_technical.penalty_taking::text,
            fp_attribute_technical.tackling::text,
            fp_attribute_technical.technique::text  
        FROM
            fp_attribute_technical
        WHERE
            fp_attribute_technical.player_id = id_player::integer;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_tag_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce informazioni riguardo i tag associati ad un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_tag_player
(
    IN  id_player text
)
RETURNS TABLE
        (
            tag_id      text,
            tag_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_tag.id::text AS tag_id,
            fp_tag.name::text AS tag_name
        FROM
            fp_player_tag
            JOIN
            fp_tag
                ON
                fp_player_tag.tag_id = fp_tag.id
        WHERE
            fp_player_tag.player_id = id_player::integer
        ORDER BY
            fp_tag.name;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : club_career
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo la carriera nelle squadre di calcio
 *        di tipo club di un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION club_career
(
    IN  id_player text
)
RETURNS TABLE
        (
            militancy_year  text,
            militancy_type  text,
            team_id         text,
            team_long_name  text,
            country_id      text,
            country_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_militancy.start_year::text AS militancy_year,
            fp_militancy.type::text AS militancy_type,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_country.id::text AS country_id,
            fp_country.name::text AS country_name
        FROM
            fp_militancy
            JOIN
            fp_team
                ON
                fp_militancy.team_id = fp_team.id
            JOIN
            fp_country
                ON
                fp_team.country_id = fp_country.id
        WHERE
            fp_militancy.player_id = id_player::integer
            AND
            fp_militancy.team_type = 'CLUB'
        ORDER BY
            fp_militancy.start_year DESC,
            fp_militancy.type DESC;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : national_career
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text)
 *
 * DESC : Restituisce informazioni riguardo la carriera nelle squadre di calcio
 *        di tipo nazionle di un calciatore in input
 ******************************************************************************/
CREATE OR REPLACE FUNCTION national_career
(
    IN  id_player text
)
RETURNS TABLE
        (
            militancy_year  text,
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_militancy.start_year::text AS militancy_year,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_militancy
            JOIN
            fp_team
                ON
                fp_militancy.team_id = fp_team.id
        WHERE
            fp_militancy.player_id = id_player::integer
            AND
            fp_militancy.team_type = 'NATIONAL'
        ORDER BY
            fp_militancy.start_year DESC;
        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_statistic_player
 *
 * IN      : text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo le statistiche di gioco riferite
 *        ad un calciatore in input.
 *        Le statistiche possono essere filtrate per:
 *         - tipo di squadra
 *         - competizione calcistica
 *         - intervallo di stagioni calcistiche
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_statistic_player
(
    IN  id_player           text,
    IN  type_team           text,
    IN  id_team             text,
    IN  id_comp             text,
    IN  s_year_militancy    text,
    IN  e_year_militancy    text
)
RETURNS TABLE
        (
            start_year      text,
            comp_id         text,
            comp_name       text,
            team_id         text,
            team_long_name  text,
            match           text,
            goal_scored     text,
            penalty_scored  text,
            assist          text,
            yellow_card     text,
            red_card        text,
            goal_conceded   text,
            penalty_saved   text
        )
AS
$$
BEGIN

    IF (s_year_militancy IS NULL) THEN

        s_year_militancy = '1810';
    
    END IF;


    IF (e_year_militancy IS NULL) THEN

        e_year_militancy = extract(year from current_date)::text;
    
    END IF;


    DROP TABLE IF EXISTS output_table;

	CREATE TEMPORARY TABLE output_table
    (
        start_year      text    NOT NULL,
        comp_id         text    NOT NULL,
        comp_name       text    NOT NULL,
        team_id         text    NOT NULL,
        team_long_name  text    NOT NULL,
        match           text    NOT NULL,
        goal_scored     text    NOT NULL,
        penalty_scored  text    NOT NULL,
        assist          text    NOT NULL,
        yellow_card     text    NOT NULL,
        red_card        text    NOT NULL,
        goal_conceded   text            ,
        penalty_saved   text            
    );

    INSERT INTO output_table
    SELECT
        fp_play.start_year::text,
        fp_competition.id::text,
        fp_competition.name::text,
        fp_team.id::text,
        fp_team.long_name::text,
        fp_play.match::text,
        fp_statistic_general.goal_scored::text,
        fp_statistic_general.penalty_scored::text,
        fp_statistic_general.assist::text,
        fp_statistic_general.yellow_card::text,
        fp_statistic_general.red_card::text,
        fp_statistic_goalkeeper.goal_conceded::text,
        fp_statistic_goalkeeper.penalty_saved::text
    FROM
        fp_militancy
        JOIN
        fp_play
            ON
            fp_militancy.start_year = fp_play.start_year
            AND
            fp_militancy.team_id = fp_play.team_id
            AND
            fp_militancy.player_id = fp_play.player_id
        JOIN
        fp_competition
            ON
            fp_play.competition_id = fp_competition.id
        JOIN
        fp_team
            ON
            fp_play.team_id = fp_team.id
        JOIN
        fp_statistic_general
            ON
            fp_play.id = fp_statistic_general.play_id
        LEFT OUTER JOIN
        fp_statistic_goalkeeper
            ON
            fp_play.id = fp_statistic_goalkeeper.play_id
    WHERE
        fp_militancy.player_id = id_player::integer
        AND
        fp_militancy.team_type = type_team::en_team
        AND
        fp_militancy.start_year BETWEEN s_year_militancy::integer AND e_year_militancy::integer
    ORDER BY
        fp_militancy.start_year DESC,
        fp_militancy.type DESC;


    IF (id_team IS NOT NULL) THEN

       DELETE FROM
            output_table
        WHERE
            output_table.team_id <> id_team;

    END IF;


    IF (id_comp IS NOT NULL) THEN

       DELETE FROM
            output_table
        WHERE
            output_table.comp_id <> id_comp;

    END IF;



    RETURN QUERY
        SELECT
            output_table.start_year,
            output_table.comp_id,
            output_table.comp_name,
            output_table.team_id,
            output_table.team_long_name,
            output_table.match,
            output_table.goal_scored,
            output_table.penalty_scored,
            output_table.assist,
            output_table.yellow_card,
            output_table.red_card,
            output_table.goal_conceded,
            output_table.penalty_saved
        FROM
            output_table
        WHERE
			TRUE;

        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * JAVA FUNCTION ADMIN
 ******************************************************************************/


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_confederation
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text)
 *
 * DESC : Restitiusce le confederazioni calcistiche di cui una squadra di calcio
 *        e' mebro direttamente o indirettamente
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_confederation
(
    IN  team_id text
)
RETURNS TABLE
        (
            super_super_conf_id text,
            super_conf_id       text,
            conf_id             text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            conf2.super_id::text AS super_super_conf_id,
            conf1.super_id::text AS super_conf_id,
            conf1.id::text AS conf_id
        FROM
            fp_confederation AS conf1
            JOIN
            fp_confederation AS conf2
                ON
                conf1.super_id = conf2.id
        WHERE conf1.id = (SELECT
                                fp_confederation.id
                            FROM
                                fp_confederation
                            WHERE
                                fp_confederation.country_id = (SELECT
                                                                    fp_team.country_id
                                                                FROM
                                                                    fp_team
                                                                WHERE
                                                                    fp_team.id = team_id::integer));
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_national_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Crea una nuova squadra di calcio di tipo nazionale a partire da un paese.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_national_team
(
    IN  id_country  text
)
RETURNS text
AS
$$
DECLARE

	name_country    text;
    code_country    text;
    count_row       integer;
    output_message  text;

BEGIN

	SELECT
        fp_country.name::text,
        fp_country.code::text
    INTO
        name_country,
        code_country
    FROM
        fp_country
    WHERE
        fp_country.id = id_country::integer;



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
		id_country::integer,
		name_country::dm_alnum,
		code_country::dm_code
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;


	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertNationalTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_club_team
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Crea una nuova squadra di calcio di tipo club dato un nome esteso
 *        ed un nome abbreviato.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_club_team
(
    IN  id_country      text,
    IN  long_name_team  text,
    IN  short_name_team text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

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
		'CLUB',
		id_country::integer,
		long_name_team::dm_alnum,
		short_name_team::dm_code
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertClubTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_club_team
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna il nome esteso e/o il nome abbreviato di una squadra di calcio
 *        di tipo club.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_club_team
(
    IN  id_team         text,
    IN  long_name_team  text,
    IN  short_name_team text
)
RETURNS text
AS
$$
DECLARE

    conflict        boolean;
    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        count(*) >= 1
    INTO
        conflict
    FROM
        fp_team
    WHERE
        fp_team.type = 'CLUB'
        AND
        fp_team.long_name = long_name_team::dm_alnum
        AND
        fp_team.id <> id_team::integer;


    IF (conflict) THEN
        output_message = 'errorMessageUpdateClubTeamConflict';
        RETURN output_message;
    END IF;


	UPDATE
		fp_team
	SET
        long_name = long_name_team,
        short_name = short_name_team
	WHERE
        id = id_team::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateClubTeam';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_team
(
    IN  id_team text
)
RETURNS text
AS
$$
DECLARE

    partecipation   boolean;
    militancy       boolean;
    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        count(*) >= 1
    INTO
        partecipation
    FROM
        fp_partecipation
    WHERE
        fp_partecipation.team_id = id_team::integer;
    

    SELECT
        count(*) >= 1
    INTO
        militancy
    FROM
        fp_militancy
    WHERE
        fp_militancy.team_id = id_team::integer;


    IF (partecipation OR militancy) THEN
        output_message = 'errorMessageDeleteTeamReference';
        RETURN output_message;
    END IF;



	DELETE FROM
		fp_team
	WHERE
        id = id_team::integer;	
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteTeam';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_partecipation
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge una partecipazione di una squadra di calcio ad una edizione
 *        di una competizione calcistica.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_partecipation
(
    IN  id_team         text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_partecipation
		(
			start_year,
            competition_id,
            team_id
		)
	VALUES
	(
		start_year_comp::dm_year,
		id_comp::integer,
        id_team::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPartecipation';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_partecipation
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina una partecipazione di una squadra di calcio ad una edizione
 *        di una competizione calcistica.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_partecipation
(
    IN  id_team         text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_partecipation
	WHERE
		fp_partecipation.start_year = start_year_comp::dm_year
        AND
		fp_partecipation.competition_id = id_comp::integer
        AND
        fp_partecipation.team_id = id_team::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePartecipation';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_trophy_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge un trofeo calcistico associato ad una edizione di una
 *        competizione calcistica ad una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_trophy_team
(
    IN  id_team         text,
    IN  id_trophy       text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_team_trophy_case
		(
			team_id,
            trophy_id,
            start_year,
            competition_id
		)
	VALUES
	(
        id_team::integer,
        id_trophy::integer,
		start_year_comp::dm_year,
		id_comp::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertTrophyTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_trophy_team
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina un trofeo calcistico associato ad una edizione di una
 *        competizione calcistica ad una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_trophy_team
(
    IN  id_team         text,
    IN  id_trophy       text,
    IN  id_comp         text,
    IN  start_year_comp text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_team_trophy_case
	WHERE
        fp_team_trophy_case.team_id = id_team::integer
        AND
        fp_team_trophy_case.trophy_id = id_trophy::integer
        AND
		fp_team_trophy_case.start_year = start_year_comp::dm_year
        AND
		fp_team_trophy_case.competition_id = id_comp::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteTrophyTeam';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_prize_team
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge un premio calcistico ad una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_prize_team
(
    IN  id_team     text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_team_prize_case
		(
            team_id,
            prize_id,
            assign_year
		)
	VALUES
	(
        id_team::integer,
        id_prize::integer,
		a_year::dm_year
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPrizeTeam';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_prize_team
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina un premio calcistico ad una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_prize_team
(
    IN  id_team     text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_team_prize_case
	WHERE
        fp_team_prize_case.team_id = id_team::integer
        AND
        fp_team_prize_case.prize_id = id_prize::integer
        AND
		fp_team_prize_case.assign_year = a_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePrizeTeam';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : competition_confederation
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text)
 *
 * DESC : Restituisce informazioni riguardo le competizioni appartenenti
 *        ad una confederazione calcistica e per una certa tipologia di squadra di calcio 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION competition_confederation
(
    IN  id_conf     text,
    IN  type_team   text
)
RETURNS TABLE
        (
            comp_id     text,
            comp_name   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name
        FROM
            fp_competition
        WHERE 
            fp_competition.confederation_id = id_conf::integer
            AND
            fp_competition.team_type = type_team::en_team
        ORDER BY
            fp_competition.name;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : partecipation_year
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text)
 *
 * DESC : Restituisce tutti le stagioni calcistiche nelle quali una squadra
 *        di calcio ha una partecipazione ad una edizione di una competizione
 *        calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION partecipation_year
(
    IN  id_team     text
)
RETURNS TABLE
        (
            start_year  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_partecipation.start_year::text AS start_year
        FROM
            fp_partecipation
        WHERE 
            fp_partecipation.team_id = id_team::integer
        ORDER BY
            fp_partecipation.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_competition_edition
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge una nuova edizione di una competizione calcistica.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_competition_edition
(
    IN  id_comp text,
    IN  s_year  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_competition_edition
		(
            competition_id,
            start_year
		)
	VALUES
	(
        id_comp::integer,
		s_year::dm_year
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertCompetitionEdition';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_competition_edition
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina una nuova edizione di una competizione calcistica.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_competition_edition
(
    IN  id_comp text,
    IN  s_year  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_competition_edition
	WHERE
        fp_competition_edition.competition_id = id_comp::integer
        AND
        fp_competition_edition.start_year = s_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteCompetitionEdition';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : info_competition
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text, text, text, text, text)
 *
 * DESC : Restituisce tutte le informazioni riguardo una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION info_competition
(
    IN  id_comp text
)
RETURNS TABLE
        (
            comp_name       text,
            comp_type       text,
            comp_team_type  text,
            comp_freq       text,
            conf_short_name text,
            country_name    text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_competition.name::text AS comp_name,
            fp_competition.type::text AS comp_type,
            fp_competition.team_type::text AS comp_team_type,
            fp_competition.frequency::text AS comp_freq,
            fp_confederation.short_name::text AS conf_short_name,
            fp_country.name::text AS country_name
        FROM
            fp_competition
            JOIN
            fp_confederation
                ON
                fp_competition.confederation_id = fp_confederation.id
            JOIN
            fp_country
                ON
                fp_confederation.country_id = fp_country.id
        WHERE
            fp_competition.id = id_comp::integer;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_position
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge una posizione di gioco ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_position
(
    IN  id_player   text,
    IN  id_position text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player_position
		(
            player_id,
            position_id
		)
	VALUES
	(
        id_player::integer,
		id_position::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerPosition';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_position
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina una posizione di gioco ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_position
(
    IN  id_player   text,
    IN  id_position text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_position
	WHERE
        fp_player_position.player_id = id_player::integer
        AND
        fp_player_position.position_id = id_position::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerPosition';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_nationality
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge una nazionalita' ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_nationality
(
    IN  id_player   text,
    IN  id_country  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_nationality
		(
            player_id,
            country_id
		)
	VALUES
	(
        id_player::integer,
		id_country::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertNationality';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_nationality
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina una nazionalita' ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_nationality
(
    IN  id_player   text,
    IN  id_country  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_nationality
	WHERE
        fp_nationality.player_id = id_player::integer
        AND
        fp_nationality.country_id = id_country::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteNationality';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_tag
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge un tag ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_tag
(
    IN  id_player   text,
    IN  id_tag      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player_tag
		(
            player_id,
            tag_id
		)
	VALUES
	(
        id_player::integer,
		id_tag::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerTag';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_tag
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina un tag ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_tag
(
    IN  id_player   text,
    IN  id_tag      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_tag
	WHERE
        fp_player_tag.player_id = id_player::integer
        AND
        fp_player_tag.tag_id = id_tag::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerTag';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_year
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Restituisce gli estremi del range di anni validi di un calciatore
 *        sotto forma di stringa concatenata e separata da un separatore
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_year
(
    IN  id_player   text
)
RETURNS text
AS
$$
DECLARE

    year_player     text;
    start_player    integer;
    retired_player  boolean;
    end_player      integer; 

BEGIN

	SELECT
        extract(year from fp_player.dob)::integer
    INTO
        start_player
    FROM
        fp_player
    WHERE
        fp_player.id = id_player::integer;

    
    SELECT
        count(*) >= 1
    INTO
        retired_player
    FROM
        fp_player_retired
    WHERE
        fp_player_retired.player_id = id_player::integer;


	IF (retired_player) THEN

        SELECT
            extract(year from fp_player_retired.retired_date)::integer
        INTO
            retired_player
        FROM
            fp_player_retired
        WHERE
            fp_fp_player_retired.player_id = id_player::integer;
    
    ELSE

        end_player = start_player + max_age();

    END IF;

    start_player = start_player + min_age();

    
    year_player = start_player::text;
    year_player = year_player || '@';
    year_player = year_player || end_player::text;
    

    RETURN year_player;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_prize
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge un premio calcistico ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_prize
(
    IN  id_player   text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	INSERT INTO
		fp_player_prize_case
		(
            player_id,
            prize_id,
            assign_year
		)
	VALUES
	(
        id_player::integer,
		id_prize::integer,
        a_year::dm_year
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerPrize';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_prize
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina un premio calcistico ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_prize
(
    IN  id_player   text,
    IN  id_prize    text,
    IN  a_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_prize_case
	WHERE
        fp_player_prize_case.player_id = id_player::integer
        AND
        fp_player_prize_case.prize_id = id_prize::integer
        AND
        fp_player_prize_case.assign_year = a_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerPrize';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_national_team
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text)
 *
 * DESC : Restituisce informazioni riguardo le squadre di calcio di tipo
 *        nazionali associate ai paesi per i quali un calciatore ha nazionalita'
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_national_team
(
    IN  id_player   text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id, 
            fp_team.long_name::text AS team_long_name
        FROM
            fp_nationality
            JOIN
            fp_team
                ON
                fp_nationality.country_id = fp_team.country_id
        WHERE
            fp_nationality.player_id = id_player::integer
            AND
            fp_team.type = 'NATIONAL';

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_team_year
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE(text, text)
 *
 * DESC : Restituisce tutte le stagioni per le quali un calciatore ha una
 *        militanza in una squadra di calcio di un certo tipo
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_team_year
(
    IN  id_player   text,
    IN  type_team   text,
    IN  s_year      text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_team.id::text AS team_id, 
            fp_team.long_name::text AS team_long_name
        FROM
            fp_militancy
            JOIN
            fp_team
                ON
                fp_militancy.team_id = fp_team.id
        WHERE
            fp_militancy.player_id = id_player::integer
            AND
            fp_militancy.team_type = type_team::en_team
            AND
            fp_militancy.start_year = s_year::dm_year;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player_trophy
 *
 * IN      : text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge un trofeo calcistico di tipo giocatore ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player_trophy
(
    IN  id_player   text,
    IN  id_team     text,
    IN  id_comp     text,
    IN  s_year_comp text,
    IN  id_trophy   text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

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
        id_player::integer,
		id_team::integer,
        id_trophy::integer,
        s_year_comp::dm_year,
        id_comp::integer
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayerTrophy';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player_trophy
 *
 * IN      : text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina un trofeo calcistico di tipo giocatore ad un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player_trophy
(
    IN  id_player   text,
    IN  id_team     text,
    IN  id_comp     text,
    IN  s_year_comp text,
    IN  id_trophy   text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player_trophy_case
	WHERE
        fp_player_trophy_case.player_id = id_player::integer
        AND
        fp_player_trophy_case.team_id = id_team::integer
        AND
        fp_player_trophy_case.trophy_id = id_trophy::integer
        AND
        fp_player_trophy_case.start_year = s_year_comp::dm_year
        AND
        fp_player_trophy_case.competition_id = id_comp::integer;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayerTrophy';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : player_trophy_player
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo tutti i trofei calcistici di tipo
 *        giocatore che un calciatore ha vinto durante la militanza in una
 *        certa tipologia di squadra di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION player_trophy_player
(
    IN  id_player   text,
    IN  type_team   text
)
RETURNS TABLE
        (
            comp_start_year text,
            comp_id         text,
            comp_name       text,
            team_id         text,
            team_long_name  text,
            trophy_id       text,
            trophy_name     text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_player_trophy_case.start_year::text AS comp_start_year,
            fp_competition.id::text AS comp_id,
            fp_competition.name::text AS comp_name,
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name,
            fp_trophy.id::text AS trophy_id,
            fp_trophy.name::text AS trophy_name
        FROM
            fp_player_trophy_case
            JOIN
            fp_trophy
                ON
                fp_player_trophy_case.trophy_id = fp_trophy.id
            JOIN
            fp_team
                ON
                fp_player_trophy_case.team_id = fp_team.id
            JOIN
            fp_competition
                ON
                fp_player_trophy_case.competition_id = fp_competition.id
        WHERE
            fp_player_trophy_case.player_id = id_player::integer
            AND
            fp_competition.team_type = type_team::en_team
            AND
            fp_trophy.type = 'PLAYER'
        ORDER BY
            fp_player_trophy_case.start_year DESC;
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_militancy
 *
 * IN      : text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge una militanza di un calciatore in una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_militancy
(
    IN  id_player       text,
    IN  id_team         text,
    IN  type_team       text,
    IN  s_year          text,
    IN  type_militancy  text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

    IF ('NATIONAL' = type_team::en_team) THEN
        type_militancy = 'FULL';
    END IF;


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
        type_team::en_team,
		id_team::integer,
        id_player::integer,
        s_year::dm_year,
        type_militancy::en_season
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertMilitancy';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_militancy
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Elimina una militanza di un calciatore in una squadra di calcio.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_militancy
(
    IN  id_player   text,
    IN  id_team     text,
    IN  s_year      text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_militancy
	WHERE
        fp_militancy.player_id = id_player::integer
        AND
        fp_militancy.team_id = id_team::integer
        AND
        fp_militancy.start_year = s_year::dm_year;
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeleteMilitancy';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_goalkeeping
 *
 * IN      : text, text, text, text, text, text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna gli attributi di portiere di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_goalkeeping
(
    IN  id_player                   text,
    IN  new_aerial_reach            text,
    IN  new_command_of_area         text,
    IN  new_communication           text,
    IN  new_eccentricity            text,
    IN  new_first_touch_gk          text,
    IN  new_handling                text,
    IN  new_kicking                 text,
    IN  new_one_on_ones             text,
    IN  new_passing_gk              text,
    IN  new_punching_tendency       text,        
    IN  new_reflexes                text,
    IN  new_rushing_out_tendency    text,             
    IN  new_throwing                text
)   
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_goalkeeping
	SET
        aerial_reach = new_aerial_reach::dm_attribute,
        command_of_area = new_command_of_area::dm_attribute,
        communication = new_communication::dm_attribute,
        eccentricity = new_eccentricity::dm_attribute,
        first_touch_gk = new_first_touch_gk::dm_attribute,
        handling = new_handling::dm_attribute,
        kicking = new_kicking::dm_attribute,
        one_on_ones = new_one_on_ones::dm_attribute,
        passing_gk = new_passing_gk::dm_attribute,
        punching_tendency = new_punching_tendency::dm_attribute,
        reflexes = new_reflexes::dm_attribute,
        rushing_out_tendency = new_rushing_out_tendency::dm_attribute,
        throwing = new_throwing::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributeGoalkeeping';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_mental
 *
 * IN      : text, text, text, text, text, text, text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna gli attributi mentali di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_mental
(
    IN  id_player           text,
    IN  new_aggression      text,
    IN  new_anticipation    text,
    IN  new_bravery         text,
    IN  new_composure       text,
    IN  new_concentration   text,
    IN  new_decision        text,
    IN  new_determination   text,
    IN  new_flair           text,
    IN  new_leadership      text,
    IN  new_off_the_ball    text,
    IN  new_positioning     text,
    IN  new_teamwork        text,
    IN  new_vision          text,
    IN  new_work_rate       text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_mental
	SET
        aggression = new_aggression::dm_attribute,
        anticipation = new_anticipation::dm_attribute,
        bravery = new_bravery::dm_attribute,
        composure = new_composure::dm_attribute,
        concentration = new_concentration::dm_attribute,
        decision = new_decision::dm_attribute,
        determination = new_determination::dm_attribute,
        flair = new_flair::dm_attribute,
        leadership = new_leadership::dm_attribute,
        off_the_ball = new_off_the_ball::dm_attribute,
        positioning = new_positioning::dm_attribute,
        teamwork = new_teamwork::dm_attribute,
        vision = new_vision::dm_attribute,
        work_rate = new_work_rate::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributeMental';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_physical
 *
 * IN      : text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna gli attributi fisici di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_physical
(
    IN  id_player           text,
    IN  new_acceleration    text,
    IN  new_agility         text,
    IN  new_balance         text,
    IN  new_jumping_reach   text,
    IN  new_natural_fitness text,
    IN  new_pace            text,
    IN  new_stamina         text,
    IN  new_strength        text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_physical
	SET
        acceleration = new_acceleration::dm_attribute,
        agility = new_agility::dm_attribute,
        balance = new_balance::dm_attribute,
        jumping_reach = new_jumping_reach::dm_attribute,
        natural_fitness = new_natural_fitness::dm_attribute,
        pace = new_pace::dm_attribute,
        stamina = new_stamina::dm_attribute,
        strength = new_strength::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributePhysical';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_attribute_technical
 *
 * IN      : text, text, text, text, text, text, text, text, text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna gli attributi tecnici di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_attribute_technical
(
    IN  id_player               text,
    IN  new_corners				text,
    IN  new_crossing			text,
    IN  new_dribbling			text,
    IN  new_finishing			text,
    IN  new_first_touch			text,
    IN  new_free_kick_taking    text,	
    IN  new_heading				text,
    IN  new_long_shots			text,
    IN  new_long_throws			text,
    IN  new_marking				text,
    IN  new_passing				text,
    IN  new_penalty_taking		text,
    IN  new_tackling			text,
    IN  new_technique			text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


	UPDATE
		fp_attribute_technical
	SET
        corners = new_corners::dm_attribute,
        crossing = new_crossing::dm_attribute,
        dribbling = new_dribbling::dm_attribute,
        finishing = new_finishing::dm_attribute,
        first_touch = new_first_touch::dm_attribute,
        free_kick_taking = new_free_kick_taking::dm_attribute,
        heading = new_heading::dm_attribute,
        long_shots = new_long_shots::dm_attribute,
        long_throws = new_long_throws::dm_attribute,
        marking = new_marking::dm_attribute,
        passing = new_passing::dm_attribute,
        penalty_taking = new_penalty_taking::dm_attribute,
        tackling = new_tackling::dm_attribute,
        technique = new_technique::dm_attribute
	WHERE
        player_id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateAttributeTechnical';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_match
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna il numero di partite giocate da un calciatore in un gioco.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_match
(
    IN  id_play     text,
    IN  new_match   text
)       
RETURNS text    
AS  
$$  
DECLARE 

    type_comp       text;
    type_team       text;

    count_row       integer;
    output_message  text;

BEGIN

    output_message = '';

    SELECT
        fp_competition.type::text,
        fp_competition.team_type::text
    INTO
        type_comp,
        type_team
    FROM
        fp_play
        JOIN
        fp_competition
            ON
            fp_play.competition_id = fp_competition.id
    WHERE
        fp_play.id = id_play::integer;


    IF ('LEAGUE' = type_comp) THEN
        IF (new_match::integer > 40) THEN
            output_message = 'errorMessageUpdateMatch';
        END IF;
	
	ELSIF ('SUPER_CUP' = type_comp) THEN
        IF (new_match::integer > 6) THEN
            output_message = 'errorMessageUpdateMatch';
        END IF;
	
	ELSIF ('CUP' = type_comp) THEN

		IF ('CLUB' = type_team) THEN
            IF (new_match::integer > 128) THEN
                output_message = 'errorMessageUpdateMatch';
            END IF;
	
		ELSIF ('NATIONAL' = type_team) THEN
            IF (new_match::integer > 48) THEN
                output_message = 'errorMessageUpdateMatch';
            END IF;
			
	
		END IF;

	END IF;

    IF (output_message = 'errorMessageUpdateMatch') THEN
        RETURN output_message;
    END IF;

	UPDATE
		fp_play
	SET
        match = new_match::dm_usint
	WHERE
        id = id_play::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateMatch';
    ELSE
        output_message = 'okUpdate';
    END IF;


    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_statistic_general
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna le statistiche generali associate al gioco di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_statistic_general
(
    IN  id_play             text,
    IN  new_goal_scored     text,
    IN  new_assist          text,
    IN  new_yellow_card     text,
    IN  new_red_card        text,
    IN  new_penalty_scored  text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


    UPDATE
        fp_statistic_general
    SET
        goal_scored = new_goal_scored::dm_usint,
        assist = new_assist::dm_usint,
        yellow_card = new_yellow_card::dm_usint,
        red_card = new_red_card::dm_usint,
        penalty_scored = new_penalty_scored::dm_usint
    WHERE
        play_id = id_play::integer;


    
    IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateStatisticGeneral';
    ELSE
        output_message = 'okUpdate';
    END IF;


    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_statistic_goalkeeper
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna le statistiche di portiere associate al gioco di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_statistic_goalkeeper
(
    IN  id_play             text,
    IN  new_goal_conceded   text,
    IN  new_penalty_saved   text
)       
RETURNS text    
AS  
$$  
DECLARE 

    count_row       integer;
    output_message  text;

BEGIN


    UPDATE
        fp_statistic_goalkeeper
    SET
        goal_conceded = new_goal_conceded::dm_usint,
        penalty_saved = new_penalty_saved::dm_usint
    WHERE
        play_id = id_play::integer;

    
    IF (0 = count_row) THEN
        output_message = 'errorMessageUpdateStatisticGoalkeeper';
    ELSE
        output_message = 'okUpdate';
    END IF;


    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_statistic
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiorna le statistiche associate al gioco di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_statistic
(
    IN  id_play             text,
    IN  new_match           text,
    IN  new_goal_scored     text,
    IN  new_assist          text,
    IN  new_yellow_card     text,
    IN  new_red_card        text,
    IN  new_penalty_scored  text,
    IN  new_goal_conceded   text,
    IN  new_penalty_saved   text
)       
RETURNS text    
AS  
$$  
DECLARE

    goalkeeper                  boolean;

    output_message              text;
    match_update_msg            text;
    statistic_general_msg       text;
    statistic_goalkeeper_msg    text;

BEGIN


    match_update_msg = update_match(
        id_play, 
        new_match
    );

    output_message = match_update_msg;

    IF (match_update_msg = 'okUpdate') THEN

        statistic_general_msg = update_statistic_general(
            id_play, 
            new_goal_scored, 
            new_assist,
            new_yellow_card,
            new_red_card,
            new_penalty_scored
        );

        output_message = output_message || '@';
        output_message = statistic_general_msg;


        SELECT
            count(*) >= 1
        INTO
            goalkeeper
        FROM
            fp_statistic_goalkeeper
        WHERE
            play_id = id_play::integer;


        IF (goalkeeper) THEN

            statistic_goalkeeper_msg = update_statistic_goalkeeper(
                id_play, 
                new_goal_conceded, 
                new_penalty_saved
            );
            
            
            output_message = output_message || '@';
            output_message = statistic_goalkeeper_msg;
        
        END IF;

    END IF;
    

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_statistic_player_admin
 *
 * IN      : text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, text, text, text, text)
 *
 * DESC : Restituisce informazioni riguardo le statistiche di gioco
 *        associate ad un calciatore in uno specifico gioco in una squadra di
 *        calcio in una specifica edizione di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_statistic_player_admin
(
    IN  id_player   text,
    IN  id_team     text,
    IN  id_comp     text,
    IN  s_year      text
)
RETURNS TABLE
        (
            play_id         text,
            match           text,
            goal_scored     text,
            penalty_scored  text,
            assist          text,
            yellow_card     text,
            red_card        text,
            goal_conceded   text,
            penalty_saved   text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT
            fp_play.id::text AS play_id,
            fp_play.match::text AS match,
            fp_statistic_general.goal_scored::text AS goal_scored,
            fp_statistic_general.penalty_scored::text AS penalty_scored,
            fp_statistic_general.assist::text AS assist,
            fp_statistic_general.yellow_card::text AS yellow_card,
            fp_statistic_general.red_card::text AS red_card,
            fp_statistic_goalkeeper.goal_conceded::text AS goal_conceded,
            fp_statistic_goalkeeper.penalty_saved::text AS penalty_saved
        FROM
            fp_play
            JOIN
            fp_statistic_general
                ON
                fp_play.id = fp_statistic_general.play_id
            LEFT OUTER JOIN
            fp_statistic_goalkeeper
                ON
                fp_play.id = fp_statistic_goalkeeper.play_id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_play.start_year = s_year::dm_year
            AND
            fp_play.competition_id = id_comp::integer
            AND
            fp_play.team_id = id_team::integer;

        
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : new_player
 *
 * IN      : text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION new_player
(
    IN  new_name        text,
    IN  new_surname     text,
    IN  new_dob         text,
    IN  new_country_id  text,
    IN  new_foot        text,
    IN  new_position_id text
)
RETURNS text
AS
$$
DECLARE

    new_role        text;

    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        role::text
    INTO
        new_role
    FROM
        fp_position
    WHERE
        id = new_position_id::integer;

	INSERT INTO
		fp_player
		(
            name,
            surname,
            dob,
            country_id,
            foot,
            position_id,
            role
		)
	VALUES
	(
        new_name::dm_string,
        new_surname::dm_string,
        new_dob::dm_date,
        new_country_id::integer,
        new_foot::en_foot,
        new_position_id::integer,
        new_role::en_role_mix
	)
	ON CONFLICT DO NOTHING;

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageInsertPlayer';
    ELSE
        output_message = 'okInsert';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : delete_player
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Elimina un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION delete_player
(
    IN  id_player   text
)
RETURNS text
AS
$$
DECLARE

    count_row       integer;
    output_message  text;

BEGIN

	DELETE FROM
		fp_player
	WHERE
        id = id_player::integer;	
	

    GET DIAGNOSTICS count_row = row_count;
	
	IF (0 = count_row) THEN
        output_message = 'errorMessageDeletePlayer';
    ELSE
        output_message = 'okDelete';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : update_player
 *
 * IN      : text, text, text, text, text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : Aggiorna le informazioni di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION update_player
(
    IN  id_player       text,
    IN  new_name        text,
    IN  new_surname     text,
    IN  new_dob         text,
    IN  new_country_id  text,
    IN  new_foot        text,
    IN  new_position_id text
)
RETURNS text
AS
$$
DECLARE

    conflict        boolean;
    count_row       integer;
    output_message  text;

BEGIN

	SELECT
        count(*) >= 1
    INTO
        conflict
    FROM
        fp_player
    WHERE
        fp_player.name = new_name::dm_string
        AND
        fp_player.surname = new_surname::dm_string
        AND
        fp_player.dob = new_dob::dm_date
        AND
        fp_player.country_id = new_country_id::integer
        AND
        fp_player.id <> id_player::integer;


    IF (conflict) THEN
        output_message = 'errorMessageUpdatePlayerConflict';
        RETURN output_message;
    END IF;


	UPDATE
		fp_player
	SET
        name = new_name::dm_string,
        surname = new_surname::dm_string,
        dob = new_dob::dm_date,
        country_id = new_country_id::integer,
        foot = new_foot::en_foot,
        position_id = new_position_id::integer
	WHERE
        id = id_player::integer;


    GET DIAGNOSTICS count_row = row_count;
	

	IF (0 = count_row) THEN
        output_message = 'errorMessageUpdatePlayer';
    ELSE
        output_message = 'okUpdate';
    END IF;

    RETURN output_message;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_play
 *
 * IN      : text, text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text)
 *
 * DESC : Restituisce informazioni riguardo tutti le squadre di calcio
 *        nelle quali un calciatore ha giocato durante una specifica edizione
 *        di una competizione calcistica
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_play
(
    IN  id_player   text,
    IN  s_year      text,
    IN  id_comp     text
)
RETURNS TABLE
        (
            team_id         text,
            team_long_name  text
        )
AS
$$
BEGIN

    RETURN QUERY
        SELECT DISTINCT
            fp_team.id::text AS team_id,
            fp_team.long_name::text AS team_long_name
        FROM
            fp_play
            JOIN
            fp_team
                ON
                fp_play.team_id = fp_team.id
        WHERE
            fp_play.player_id = id_player::integer
            AND
            fp_play.start_year = s_year::dm_year
            AND
            fp_play.competition_id = id_comp::integer
        ORDER BY
            team_long_name;
        

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_retired_date
 *
 * IN      : text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : Aggiunge, aggiorna o elimina la data di ritiro di un calciatore.
 *        Restituisce un messaggio di errore o buona riuscita
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_retired_date
(
    IN  id_player   text,
    IN  r_date      text
)
RETURNS text
AS
$$
DECLARE

    retired         boolean;

    count_row       integer;
    output_message  text;

BEGIN

    SELECT
        count(*) >= 1
    INTO
        retired
    FROM
        fp_player_retired
    WHERE
        player_id = id_player::integer;

    
    IF ((retired) AND (r_date IS NOT NULL)) THEN


        UPDATE
            fp_player_retired
        SET
            retired_date = r_date::dm_date
        WHERE
            player_id = id_player::integer;

        
        GET DIAGNOSTICS count_row = row_count;

        IF (0 = count_row) THEN
            output_message = 'errorMessageUpdateRetiredDate';
        ELSE
            output_message = 'okUpdate';
        END IF;

        RETURN output_message;


    ELSIF ((retired) AND (r_date IS NULL)) THEN


        DELETE FROM
            fp_player_retired
        WHERE
            player_id = id_player::integer;

        
        GET DIAGNOSTICS count_row = row_count;

        IF (0 = count_row) THEN
            output_message = 'errorMessageDeleteRetiredDate';
        ELSE
            output_message = 'okDelete';
        END IF;

        RETURN output_message;


    ELSIF ((NOT retired) AND (r_date IS NOT NULL)) THEN


        INSERT INTO
            fp_player_retired
            (
                player_id,
                retired_date
            )
        VALUES
        (
            id_player::integer,
            r_date::dm_date
        )
        ON CONFLICT DO NOTHING;

        GET DIAGNOSTICS count_row = row_count;
        
        IF (0 = count_row) THEN
            output_message = 'errorMessageInsertRetiredDate';
        ELSE
            output_message = 'okInsert';
        END IF;

        RETURN output_message;


    ELSE
   
        output_message = 'errorMessageRetiredDate';
        RETURN output_message;
  
    END IF;


END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


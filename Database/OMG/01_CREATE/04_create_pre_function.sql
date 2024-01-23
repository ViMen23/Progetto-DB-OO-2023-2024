/******************************************************************************* 
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : competitionUTER SCIENCE                                            
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
 *        Fa uso del catalogo di sistema di Postgresql
 *
 *        NOTA: la funzione considera come database prefedinito "fpdb" e
 *              come schema predefinito "public"
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
 *        Fa uso del catalogo di sistema di Postgresql
 *
 *        NOTA: la funzione considera come database prefedinito "fpdb" e
 *              come schema predefinito "public"
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
 *        Fa uso del catalogo di sistema di Postgresql
 *
 *		  NOTA: la funzione considera come database prefedinito "fpdb" e
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
 *        L'idea di fondo e' quella di sfruttare la formattazione della
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
 *        Sfruttando tali osservazioni mediante SQL dinamico sara' possibile
 *        costruire la query desiderata.
 *        
 *        NOTA: importante osservare che tale funzione sfrutta la buona prassi,
 *              che abbiamo osservato quando possibile e necessario,
 *              di assegnare una chiave surrogata di tipo integer alle tabelle
 *              e di denominarla id  
 *
 *        NOTA: assicurarsi che i valori in input permettano di definire
 *              in modo univoco una riga di una tabella.
 *              Non sono stati effettuati eccessivi, e dovuti, controlli
 *              sull'input in quanto si tratta di una funzione nata con lo
 *              scopo di semplificarci l'inserimento dei dati nel database
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
		SELECT string_to_table(input_string, separator)
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
			-- in questo punto abbiamo sfruttato un'ulteriore peculiarita'
			-- del nostro database
			-- essenzialmente i tipi di dati che gestiamo si possono
			-- dividere in due grandi categorie
			-- categoria "testo", che contiene chiaramente i varchar,
			-- text, ma anche date e altro
			-- e categoria integer, di cui fanno parte i valori numerici
			-- abbiamo pertanto sfruttato il fatto che indipendentemente
			-- dai tipi e domini creati Postgresql salvi nel catalogo
			-- anche l'informazione sui tipi primitivi
			-- pertanto se nel tipo della colonna non e' presente la
			-- sottostringa 'int' si trattera' di un valore testuale
			-- che necessita di essere messo tra singoli apici
			-- per essere correttamente concatenato per formare
			-- la query da eseguire con SQL dinamico
			IF (NOT type_column LIKE '%int%') THEN 
				value_column = quote_literal(value_column);
			END IF;
			
			-- aggiungo per permettere la creazione di una query
			-- che filtra su piu' colonne
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
	-- Per semplificare la visualizzazione e' stato scelto di formattare
	-- la query in modo appropiato, sebbene quella ottenuta con la funzione
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
	-- Per semplificare la visualizzazione e' stato scelto di formattare
	-- la query in modo appropiato, sebbene quella ottenuta con la funzione
	-- sia su una sola riga di testo
	
	OPEN cur_to_execute FOR EXECUTE to_execute;
	
	type_column = get_type_column(name_table, name_column);
	
	-- se la colonna e' di tipo numerico
	IF (type_column LIKE '%int%') THEN
		FETCH cur_to_execute INTO tmp;
		-- e' necessario castarla come text 
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
	-- Per semplificare la visualizzazione e' stato scelto di formattare
	-- la query in modo appropiato, sebbene quella ottenuta con la funzione
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
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : TABLE (text, text, text, text, text, integer)
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION all_references
(
	IN	name_table	text
)
RETURNS TABLE
(
	constr			text,
	table_to_ref	text,
	col_to_ref		text,
	table_ref		text,
	col_ref			text,
	col_ord			integer
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
 * DESC : TODO
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

	where_cond = '';
	name_constr = '';
	
	counter = 0;
	
	FOR row_table
	IN
		SELECT string_to_table(in_string, separator)
	LOOP
		
		IF (0 = counter) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			where_cond = where_cond || 'WHERE ';
			
		ELSIF (1 = (counter % 2)) THEN
		
			name_column = row_table.string_to_table;
			
			IF (NOT column_exists(name_table, name_column)) THEN
				RETURN NULL;
			END IF;
			
			type_column = get_type_column(name_table, name_column);
			
			where_cond = where_cond || name_table || '.' || name_column || ' = ';
			
		ELSIF (0 = (counter % 2)) THEN
		
			value_column = row_table.string_to_table;
			
			IF (NOT type_column LIKE '%int%') THEN
				 
				value_column = quote_literal(value_column);
				
			END IF;
				
			where_cond = where_cond || value_column || ' AND ';
			
		END IF;
		
		counter = counter + 1;
		
	END LOOP;

	where_cond = trim(where_cond, ' AND ');
	
	where_cond = where_cond || ';';


	counter = 0;

	FOR row_table
	IN
		SELECT * FROM all_references(name_table)
	LOOP
		
		IF (row_table.constr <> name_constr) THEN
		
			to_execute = '';
			to_execute = to_execute || 'SELECT count(*)';
			to_execute = to_execute || ' FROM ' || name_table;
			to_execute = to_execute || ' JOIN ' || row_table.table_ref;
			to_execute = to_execute || ' ON ' || name_table || '.' || row_table.col_to_ref;
			to_execute = to_execute || ' = ' || row_table.table_ref || '.' || row_table.col_ref;
		
		ELSE
			
			to_execute = to_execute || ' JOIN ' || row_table.table_ref;
			to_execute = to_execute || ' ON ' || name_table || '.' || row_table.col_to_ref;
			to_execute = to_execute || ' = ' || row_table.table_ref || '.' || row_table.col_ref;
			
		END IF;
		
		
		IF (1 = row_table.col_ord) THEN
			
			to_execute = to_execute || ' ' || where_cond;
			
			RAISE NOTICE '%', to_execute;

			EXECUTE to_execute INTO counter;
			
			IF (counter > 0) THEN
				
				RETURN TRUE;
				
			END IF;
				
		END IF;
		
	END LOOP;

	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
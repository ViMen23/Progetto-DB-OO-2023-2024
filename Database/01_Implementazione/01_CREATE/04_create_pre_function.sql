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

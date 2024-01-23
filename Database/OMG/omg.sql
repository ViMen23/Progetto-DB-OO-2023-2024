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
 *        E' stato scelto di utilizzare lo schema public in quanto e'
 *        il percorso di ricerca predefinito per ogni database in Postgresql,
 *        in questo modo si rendera' il codice piu' leggibile                            
 ******************************************************************************/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
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
 * DESC : TODO
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
 * NAME : dm_pdate
 *
 * DESC : Dominio contenente le date precedenti o uguali a quella corrente
 ******************************************************************************/
CREATE DOMAIN dm_pdate AS date
CHECK
(
	value <= current_date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_string
 *
 * DESC : TODO
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
 * NAME : dm_password
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_password AS varchar(255)
CHECK
(
	value ~ '(?=^[\u0020-\u007E]{8,255}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_code
 *
 * DESC : TODO
 ******************************************************************************/
CREATE DOMAIN dm_code AS varchar(3)
CHECK
(
	value ~ '(?=^[\u0041-\u005A]{2,3}$)'
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
 * NAME : dm_username
 *
 * DESC : TODO
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
 * NAME : dm_year
 *
 * DESC : Dominio contenente gli anni precedenti o uguali a quello corrente
 ******************************************************************************/
CREATE DOMAIN dm_year AS smallint
CHECK
(
	value BETWEEN 0 AND (extract(year from current_date) + 1)
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
 * NAME : en_feature
 *
 * DESC : Enum delle possibili tipologie di attributi per un calciatore
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
 * NAME : en_competition
 *
 * DESC : Enum delle possibili tipologie di competizioni calcistiche
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
 * DESC : Enum delle possibili tipologie di paesi
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
 * DESC : Enum delle possibili tipologie di ruoli di un calciatore
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
 * NAME : en_team
 *
 * DESC : Enum delle possibili tipologie di squadre di calcio
 ******************************************************************************/
CREATE TYPE en_team AS ENUM
(
	'CLUB',
	'NATIONAL'
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : ENUM TYPE
 * NAME : en_award
 *
 * DESC : Enum delle possibili tipologie di trofei e premi calcistici
 ******************************************************************************/
CREATE TYPE en_award AS ENUM
(
	'PLAYER',
	'TEAM'
);
--------------------------------------------------------------------------------


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
 * DESC : Tabella contentente informazioni riguardanti i paesi
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
 * DESC : Tabella contentente informazioni riguardanti
 *        le confederazioni calcistiche
 ******************************************************************************/
CREATE TABLE fp_confederation
(
	id			serial		NOT NULL,
	country_id	integer		NOT NULL,
	short_name	dm_alnum 	NOT NULL,
	long_name	dm_alnum	NOT NULL,
	super_id	integer				  -- confederazione di grado immediatamente
	                                  -- superiore della quale e' membro
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
 * DESC : Un paese deve appartenere al piu' ad una confederazione calcistica
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
 *        calcistica di grado immediatamente superiore della quale e' membro.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata sulla
 *        confederazione calcistica membro 
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
 * DESC : Una confederazione calcistica fa riferimento al paese di appartenenza.
 *        Un cambiamento del paese di appartenenza si ripercuotera' a cascata
 *        sulla confederazione calcistica
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
 * DESC : Tabella contentente informazioni riguardanti le squadre di calcio
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
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team TABLE
 * NAME : team_fk_country
 *
 * DESC : Una squadra di calcio fa riferimento al paese di appartenenza.
 *        Un cambiamento del paese di appartenenza si ripercuotera' a cascata
 *        sulla squadra di calcio
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
 *        di appartenenza.
 *        Un cambiamento della confederazione calcistica di appartenenza
 *        si ripercuotera' a cascata sulla squadra di calcio
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
 * DESC : Tabella contentente informazioni riguardanti
 *        le competizioni calcistiche
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
 *        calcistica di appartenenza.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata sulla
 *        competizione calcistica 
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
 * DESC : Tabella contentente informazioni riguardanti le edizioni
 *        delle competizioni calcistiche
 ******************************************************************************/
CREATE TABLE fp_competition_edition
(
	id				serial		NOT NULL,
	start_year		dm_year		NOT NULL,
	end_year		dm_year		NOT NULL,
	competition_id	integer		NOT NULL,
	total_team		dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_competition_edition TABLE
 * NAME : pk_competition_edition
 *
 * DESC : Non possono esistere edizioni di competizioni calcistiche diverse
 *        con lo stesso id
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT pk_competition_edition
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_competition_edition TABLE
 * NAME : uq_competition_edition
 *
 * DESC : Ogni edizione di una competizione calcistica deve iniziare
 *        in un anno diverso
 ******************************************************************************/
ALTER TABLE	fp_competition_edition
ADD CONSTRAINT uq_competition_edition
UNIQUE
(
	start_year,
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
 *        NOTA: il valore massimo, sebbene arbitrario, e' stato ottenuto
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
 *        competizione calcistica cui appartiene.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata
 *        sull'edizione della competizione calcistica 
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
 * DESC : Tabella contentente informazioni riguardanti la partecipazione
 *        di una squadra di calcio ad un'edizione di una competizioni calcistica
 ******************************************************************************/
CREATE TABLE fp_partecipation
(
	competition_edition_id	integer	NOT NULL,
	team_id					integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_partecipation TABLE
 * NAME : pk_partecipation
 *
 * DESC : Ogni squadra di calcio puo' partecipare al piu' una volta ad
 *        un'edizione di una competizione calcistica
 ******************************************************************************/
ALTER TABLE	fp_partecipation
ADD CONSTRAINT pk_partecipation
PRIMARY KEY
(
	competition_edition_id,
	team_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_partecipation TABLE
 * NAME : partecipation_fk_competition_edition
 *
 * DESC : La partecipazione di una squadra di calcio ad un'edizione di una
 *        competizione calcistica fa riferimento all'edizione della competizione
 *        calcistica in questione.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata sulla
 *        partecipazione
 ******************************************************************************/
ALTER TABLE	fp_partecipation
ADD CONSTRAINT partecipation_fk_competition_edition
FOREIGN KEY
(
	competition_edition_id
)
REFERENCES fp_competition_edition
(
	id
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
 *        in questione.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata sulla
 *        partecipazione
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
 * DESC : Tabella contentente informazioni riguardanti i calciatori
 ******************************************************************************/
CREATE TABLE fp_player
(
	id			serial		NOT NULL,
	name		dm_string	NOT NULL,
	surname		dm_string	NOT NULL,
	foot		en_foot		NOT NULL, -- piede preferito
	country_id	integer		NOT NULL, -- id del paese di nascita
	dob			dm_pdate	NOT NULL, -- data di nascita
	career_time	daterange			  -- periodo di tempo nel quale il
	                                  -- calciatore ha giocato
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
 * DESC : Un calciatore fa riferimento al paese di nascita.
 *        Un cambiamento del paese di nascita si ripercuotera' a cascata
 *        sull calciatore
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
 * NAME : fp_nationality
 *
 * DESC : Tabella contentente informazioni riguardanti le nazionalita'
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
 * DESC : Ogni calciatore non puo' essere associato piu' di una volta allo
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
 * DESC : La nazionalita' di un calciatore fa riferimento al paese in questione.
 *        Un cambiamento del paese si ripercuotera' a cascata sulla
 *        nazionalita'
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
 * DESC : La nazionalita' di un calciatore fa riferimento al calciatore
 *        in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata sulla
 *        nazionalita'
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
 * DESC : Tabella contentente informazioni riguardanti la militanza
 *        di un calciatore in una squadra di calcio
 ******************************************************************************/
CREATE TABLE fp_militancy
(
	id			serial		NOT NULL,
	team_id		integer		NOT NULL,
	player_id	integer		NOT NULL,
	date_range	daterange	NOT NULL,
	match		dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_militancy TABLE
 * NAME : pk_militancy
 *
 * DESC : Non possono esistere militanze diverse con lo stesso id
 ******************************************************************************/
ALTER TABLE fp_militancy
ADD CONSTRAINT pk_militancy
PRIMARY KEY
(
	id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : UNIQUE CONSTRAINT - fp_militancy TABLE
 * NAME : uq_militancy
 *
 * DESC : Un calciatore non puo' militare nella stessa squadra di calcio
 *        nello stesso intervallo di tempo
 ******************************************************************************/
ALTER TABLE fp_militancy
ADD CONSTRAINT uq_militancy
UNIQUE
(
	team_id,
	player_id,
	date_range
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_militancy TABLE
 * NAME : militancy_fk_team
 *
 * DESC : La militanza di un calciatore in una squadra di calcio
 *        fa riferimento alla squadra di calcio in questione.
 *        Un cambiamento della squadra di calcio si ripercuotera' a cascata
 *        sulla militanza
 ******************************************************************************/
ALTER TABLE	fp_militancy
ADD CONSTRAINT militancy_fk_team
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
 * TYPE : FOREIGN KEY CONSTRAINT - fp_militancy TABLE
 * NAME : militancy_fk_player
 *
 * DESC : La militanza di un calciatore in una squadra di calcio
 *        fa riferimento al calciatore in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata sulla
 *        militanza
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
 * DESC : Tabella contentente informazioni riguardanti i tag che e' possibile
 *        associare ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_tag
(
	id			serial			NOT NULL,
	type		en_feature	NOT NULL,
	name		dm_string		NOT NULL,
	description	dm_string
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
 * DESC : Tabella contentente informazioni riguardanti i tag associati
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
 * DESC : Un calciatore puo' essere associato ad un tag al piu' una volta
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
 *        al calciatore in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata
 *        sull'associazione
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
 *        al tag in questione.
 *        Un cambiamento del tag si ripercuotera' a cascata
 *        sull'associazione
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
ON DELETE RESTRICT
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_position
 *
 * DESC : Tabella contentente informazioni riguardanti le posizioni di gioco
 *        che un calciatore puo' assumere nel campo di gioco
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
 * DESC : Tabella contentente informazioni riguardanti le posizioni di gioco
 *        associate ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_position
(
	player_id	integer		NOT NULL,
	position_id	integer		NOT NULL,
	match		dm_usint	NOT NULL  -- numero di partite giocate dal
	                                  -- calciatore nella posizione
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_position TABLE  
 * NAME : pk_player_position
 *
 * DESC : Un calciatore puo' essere associato ad una posizione di gioco
 *        al piu' una volta
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
 *        fa riferimento al calciatore in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata
 *        sull'associazione
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
 *        fa riferimento al calciatore in questione.
 *        Un cambiamento della posizione di gioco si ripercuotera' a cascata
 *        sull'associazione
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
 * DESC : Tabella contentente informazioni riguardanti gli attributi che
 *        e' possibile associare ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_attribute
(
	id			serial		NOT NULL,
	type		en_feature	NOT NULL,
	name		dm_string	NOT NULL,
	description	dm_string
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
 * DESC : Tabella contentente informazioni riguardanti gli attributi
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
 * DESC : Un calciatore puo' essere associato ad un attributo al piu' una volta
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
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_attribute TABLE
 * NAME : player_attribute_fk_player
 *
 * DESC : L'associazione di un calciatore ad un attributo
 *        fa riferimento al calciatore in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata
 *        sull'associazione
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
 *        fa riferimento all'attributo in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata
 *        sull'associazione
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
 * DESC : Tabella contentente informazioni riguardanti le statistiche che
 *        e' possibile associare ad un calciatore
 ******************************************************************************/
CREATE TABLE fp_statistic
(
	id			serial		NOT NULL,
	role		en_role_mix	NOT NULL,
	name		dm_string	NOT NULL,
	description	dm_string
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
 * DESC : Tabella contentente informazioni riguardanti i trofei calcistici
 ******************************************************************************/
CREATE TABLE fp_trophy
(
	id			serial		NOT NULL,
	type		en_award	NOT NULL,
	role		en_role_mix	NOT NULL,
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
 * DESC : Tabella contentente informazioni riguardanti i trofei calcistici
 *        vinti da una squadra di calcio
 ******************************************************************************/
CREATE TABLE fp_team_trophy_case
(
	team_id					integer	NOT NULL,
	trophy_id				integer	NOT NULL,
	competition_edition_id	integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_team_trophy_case TABLE
 * NAME : pk_team_trophy_case
 *
 * DESC : Una squadra di calcio puo' vincere il trofeo associato
 *        ad un'edizione di una competizione calcistica al piu' una volta
 ******************************************************************************/
ALTER TABLE	fp_team_trophy_case
ADD CONSTRAINT pk_team_trophy_case
PRIMARY KEY
(
	team_id,
	trophy_id,
	competition_edition_id	
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_team_trophy_case TABLE
 * NAME : team_trophy_case_fk_partecipation
 *
 * DESC : Un trofeo calcistico vinto da una squadra di calcio fa
 *        riferimento alla partecipazione della suddetta squadra
 *        all'edizione della competizione calcistica cui e' associato
 *        il trofeo vinto.
 *        Un cambiamento della partecipazione si ripercuotera' a cascata
 *        sull trofeo vinto
 ******************************************************************************/
ALTER TABLE	fp_team_trophy_case
ADD CONSTRAINT team_trophy_case_fk_partecipation
FOREIGN KEY
(
	competition_edition_id,
	team_id
)
REFERENCES fp_partecipation
(
	competition_edition_id,
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
 *        riferimento al trofeo in questione.
 *        Un cambiamento del trofeo calcistico si ripercuotera' a cascata
 *        sull trofeo vinto
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
 * DESC : Tabella contentente informazioni riguardanti i trofei calcistici
 *        vinti da un calciatore
 ******************************************************************************/
CREATE TABLE fp_player_trophy_case
(
	player_id				integer NOT NULL,
	team_id					integer	NOT NULL,
	trophy_id				integer	NOT NULL,
	competition_edition_id	integer	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : pk_player_trophy_case
 *
 * DESC : Un calciatore che milita in una squadra di calcio puo' vincere
 *        il trofeo associato ad un'edizione di una competizione calcistica
 *        al piu' una volta
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT pk_player_trophy_case
PRIMARY KEY
(
	player_id,
	team_id,
	trophy_id,
	competition_edition_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : player_trophy_case_fk_player
 *
 * DESC : Un trofeo calcistico vinto da un calciatore che fa riferimento
 *        al calciatore in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata
 *        sull trofeo vinto
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT player_trophy_case_fk_player
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
 * TYPE : FOREIGN KEY CONSTRAINT - fp_player_trophy_case TABLE
 * NAME : player_trophy_case_fk_partecipation
 *
 * DESC : Un trofeo calcistico vinto da un calciatore fa riferimento
 *        alla partecipazione della squadra di calcio all'edizione
 *        della competizione calcistica cui e' associato il trofeo vinto.
 *        Un cambiamento della partecipazione si ripercuotera' a cascata
 *        sull trofeo vinto
 ******************************************************************************/
ALTER TABLE	fp_player_trophy_case
ADD CONSTRAINT player_trophy_case_fk_partecipation
FOREIGN KEY
(
	competition_edition_id,
	team_id
)
REFERENCES fp_partecipation
(
	competition_edition_id,
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
 *        al trofeo calcistico in questione.
 *        Un cambiamento del trofeo calcistico si ripercuotera' a cascata
 *        sull trofeo vinto
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
 * DESC : Tabella contentente informazioni riguardanti i premi calcistici
 ******************************************************************************/
CREATE TABLE fp_prize
(
	id			serial		NOT NULL,
	type		en_award	NOT NULL,
	role		en_role_mix	NOT NULL,
	name		dm_string	NOT NULL,
	description	dm_string			,
	given		dm_string	NOT NULL  -- ente che assegna il premio calcistico
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
 * TYPE : TABLE
 * NAME : fp_team_prize_case
 *
 * DESC : Tabella contentente informazioni riguardanti i premi calcistici
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
 * DESC : Una squadra di calcio puo' vincere un premio calcistico in un anno
 *        al piu' una volta
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
 *        al premio in questione.
 *        Un cambiamento del premio si ripercuotera' a cascata
 *        sul premio vinto
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
 *        alla squadra in questione.
 *        Un cambiamento della squadra si ripercuotera' a cascata
 *        sul premio vinto
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
 * DESC : Tabella contentente informazioni riguardanti i premi calcistici
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
 * DESC : Una calciatore puo' vincere un premio calcistico in un anno
 *        al piu' una volta
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
 *        al calciatore in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata
 *        sul premio vinto
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
 *        al premio in questione.
 *        Un cambiamento del premio si ripercuotera' a cascata
 *        sul premio vinto
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
 * DESC : Tabella contentente informazioni riguardanti il numero di partite
 *        giocate in una posizione del campo da gioco da un calciatore
 *        in una squadra di calcio partecipante ad un'edizione
 *        di una competizione calcistica
 *
 *        NOTA: per semplificare la notazione ci riferiremo a tale concetto
 *              come "gioco"
 ******************************************************************************/
CREATE TABLE fp_play
(
	id						serial		NOT NULL,
	competition_edition_id	integer		NOT NULL,
	team_id					integer		NOT NULL,
	player_id				integer		NOT NULL,
	position_id				integer		NOT NULL,
	match					dm_usint	NOT NULL
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
 * DESC : Una calciatore puo' essere associato ad una posizione
 *        in una squadra di calcio partecipante ad un'edizione
 *        di una competizione calcistica al piu' una volta
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT uq_play
UNIQUE
(
	competition_edition_id,
	team_id,
	player_id,
	position_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : CHECK CONSTRAINT - ck_play TABLE  
 * NAME : ck_play
 *
 * DESC : Una calciatore deve giocare almeno una partita in una posizione
 *        in una squadra di calcio partecipante ad un'edizione
 *        di una competizione calcistica
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
 * DESC : Un gioco fa riferimento alla partecipazione di una squadra di calcio
 *        ad un'edizione di una competizione calcistica.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata sul gioco
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT play_fk_partecipation
FOREIGN KEY
(
	competition_edition_id,
	team_id
)
REFERENCES fp_partecipation
(
	competition_edition_id,
	team_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_play TABLE  
 * NAME : play_fk_player_position
 *
 * DESC : Un gioco fa riferimento all'associazione tra un calciatore ed
 *        una posizione del campo da gioco.
 *        Un cambiamento di quest'ultima si ripercuotera' a cascata sul gioco
 ******************************************************************************/
ALTER TABLE fp_play
ADD CONSTRAINT play_fk_player_position
FOREIGN KEY
(
	player_id,
	position_id
)
REFERENCES fp_player_position
(
	player_id,
	position_id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_play_statistic
 *
 * DESC : Tabella contentente informazioni riguardanti le statistiche
 *        associate ad un gioco
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
 * DESC : Ad un gioco puo' essere associata al piu' una statistica
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
 *        fa riferimento al gioco in questione.
 *        Un cambiamento del gioco si ripercuotera' a cascata
 *        sull'associazione
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
 *        fa riferimento alla statistica in questione.
 *        Un cambiamento della statistica si ripercuotera' a cascata
 *        sull'associazione
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
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_militancy_statistic
 *
 * DESC : Tabella contentente informazioni riguardanti le statistiche
 *        associate ad una militanza
 ******************************************************************************/
CREATE TABLE fp_militancy_statistic
(
	militancy_id	integer		NOT NULL,
	statistic_id	integer		NOT NULL,
	score			dm_usint	NOT NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : PRIMARY KEY CONSTRAINT - fp_militancy_statistic TABLE  
 * NAME : pk_militancy_statistic
 *
 * DESC : Ad una militanza puo' essere associata al piu' una statistica
 ******************************************************************************/
ALTER TABLE fp_militancy_statistic
ADD CONSTRAINT pk_militancy_statistic
PRIMARY KEY
(
	militancy_id,
	statistic_id
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_militancy_statistic TABLE
 * NAME : militancy_statistic_fk_militancy
 *
 * DESC : L'associazione di una militanza ad una statistica
 *        fa riferimento alla militanza in questione.
 *        Un cambiamento della militanza si ripercuotera' a cascata
 *        sull'associazione
 ******************************************************************************/
ALTER TABLE fp_militancy_statistic
ADD CONSTRAINT militancy_statistic_fk_militancy
FOREIGN KEY
(
	militancy_id
)
REFERENCES fp_militancy
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_militancy_statistic TABLE
 * NAME : militancy_statistic_fk_statistic
 *
 * DESC : L'associazione di una militanza ad una statistica
 *        fa riferimento alla statistica in questione.
 *        Un cambiamento della statistica si ripercuotera' a cascata
 *        sull'associazione
 ******************************************************************************/
ALTER TABLE fp_militancy_statistic
ADD CONSTRAINT militancy_statistic_fk_statistic
FOREIGN KEY
(
	statistic_id
)
REFERENCES fp_statistic
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : TABLE
 * NAME : fp_user_account
 *
 * DESC : Tabella contentente informazioni riguardanti gli account utente
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
 * NAME : can_be_member
 *
 * IN      : fp_confederation.id%TYPE, fp_confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se la prima confederazione calcistica in input
 *        puo' essere membro della seconda confederazione calcistica in input
 *        in base al tipo di paese ad esse associato.
 *        
 *        NOTA: per non appesantire eccessivamente la notazione in questa
 *              funzione useremo impropriamente il nome di variabile "type_conf"
 *              per denotare il tipo del paese associato alla confederazione 
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_be_member
(
	IN	id_conf			fp_confederation.id%TYPE,
	IN	id_super_conf	fp_confederation.id%TYPE
)
RETURNS boolean
AS
$$
DECLARE

	tmp				text;
	id_country		integer;

	type_conf		text;
	type_super_conf	text;
	
BEGIN
	
	-- prendo il tipo del paese associato alla confederazione memebro
	tmp = get_column('fp_confederation', 'id_country', id_conf);
	id_country = CAST(tmp AS integer);					
	type_conf = get_column('fp_country', 'type', id_country);

	-- prendo il tipo del paese associato alla confederazione avente membro
	tmp = get_column('fp_confederation', 'id_country', id_super_conf);
	id_country = CAST(tmp AS integer);					
	type_super_conf = get_column('fp_country', 'type', id_country);

	IF
	(
		('NATION' = type_conf AND 'CONTINENT' = type_super_conf)
		OR
		('CONTINENT' = type_conf AND 'WORLD' = type_super_conf)
		OR
		('WORLD' = type_conf AND type_super_conf IS NULL)
	)
	THEN
		RETURN TRUE;
	END IF;
	
	RAISE NOTICE 'Confederation (id = %) cannot be member of confederation (id = %)', id_conf, id_super_conf;
	RETURN FALSE;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : is_nation
 *
 * IN      : fp_country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se l'id di un paese in input e' di una nazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION is_nation
(
	IN	id_country	fp_country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_country	text;

BEGIN
	
	type_country = get_column('fp_country', 'type', id_country);

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
 * NAME : conf_from_comp_ed
 *
 * IN      : fp_competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : fp_confederation.id%TYPE
 *
 * DESC : Funzione che dato in input l'id di un'edizione di una competizione
 *        calcistica restituisce l'id della confederazione calcistica associata
 ******************************************************************************/
CREATE OR REPLACE FUNCTION conf_from_comp_ed
(
	IN	id_comp_ed	fp_competition_edition.id%TYPE
)
RETURNS fp_confederation.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	id_comp	integer;

	id_conf	integer;

BEGIN
	
	-- prendo la competizione associata all'edizione
	tmp = get_column('fp_competition_edition', 'competition_id', id_comp_ed);
	id_comp = CAST(tmp AS integer);

	-- prendo la confederazione associata alla competizione
	tmp = get_column('fp_competition', 'confederation_id', id_comp);
	id_conf = CAST(tmp AS integer);

	RETURN id_conf;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_edition
 *
 * IN      : fp_competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che dato in input l'id di una competizione calcistica valuta
 *        se essa ha edizioni nel database
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_edition
(
	IN	id_comp	fp_competition.id%TYPE
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
 * IN      : fp_competition.id%TYPE, dm_year
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una competizione calcistica puo' avere
 *        un'edizione che inizia in un determinato anno, rispetto alla
 *        sua frequenza
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_freq
(
	IN	id_comp	fp_competition.id%TYPE,
	IN	s_year	dm_year                 -- anno di inizio
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp		text;
	freq	integer;
	a_year	integer; -- un anno di inizio di un'edizione
	
BEGIN
	
	tmp = get_column('fp_competition', 'frequency', id_comp);
	freq = CAST(tmp AS integer);

	-- se la frequenza della competizione calcistica e' annnuale o irregolare
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

		-- ...e valuto se l'anno di inizio in input e' accettabile
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
 * IN      : fp_team.id%TYPE, fp_confederation.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio appartiene ad una
 *        confederazione calcistica membro di un'altra confederazione
 *        
 *        NOTA: per non appesantire eccessivamente la notazione in questa
 *              funzione useremo impropriamente il nome di variabile "type_conf"
 *              per denotare il tipo del paese associato alla confederazione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION belong_to
(
	IN	id_team	fp_team.id%TYPE,
	IN	id_conf	fp_confederation.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp					text;

	type_conf			text;

	id_country			integer;

	id_conf_to_check	integer;
	
BEGIN

	-- prendo il tipo del paese associato alla confederazione memebro
	tmp = get_column('fp_confederation', 'id_country', id_conf);
	id_country = CAST(tmp AS integer);					
	type_conf = get_column('fp_country', 'type', id_country);

	-- prendo la confederazione calcistica associata alla squadra di calcio
	tmp = get_column('fp_team', 'confederation_id', id_team);
	id_conf_to_check = CAST(tmp AS integer);

	-- se la confederazione in input e' nazionale
	IF ('NATION' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;

	-- prendo la confederazione calcistica contenente quella
	-- associata alla squadra di calcio
	tmp = get_column('fp_confederation', 'super_id', id_conf_to_check);
	id_conf_to_check = CAST(tmp AS integer);
	
	-- se la confederazione in input e' continentale
	IF ('CONTINENT' = type_conf) THEN
		IF (id_conf_to_check = id_conf) THEN
			RETURN TRUE;
		END IF;
	END IF;
	
	-- prendo la confederazione calcistica che contiene quella contenente quella
	-- associata alla squadra di calcio
	tmp = get_column('fp_confederation', 'super_id', id_conf_to_check);
	id_conf_to_check = CAST(tmp AS integer);
	
	-- se la confederazione in input e' mondiale
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
 * NAME : has_place
 *
 * IN      : fp_competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un'edizione di una competizione calcistica
 *        ha ancora posti a disposizione per squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_place
(
	IN	id_comp_ed	fp_competition_edition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	tot_team	integer;

	have		boolean;

BEGIN
	
	tmp = get_column('fp_competition_edition', 'total_team', id_comp_ed);
	tot_team = CAST(tmp AS integer);

	have = FALSE;

	SELECT
		count(*) < tot_team
	INTO
		have
	FROM
		fp_partecipation
	WHERE
		competition_edition_id = id_comp_ed;

	IF (NOT have) THEN
		RAISE NOTICE 'Competition edition (id = %) does not have place', id_comp_ed;
	END IF;

	RETURN have;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_role
 *
 * IN      : fp_player.id%TYPE, en_role
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un giocatore e' associato ad un ruolo di gioco
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_role
(
	IN	id_player		fp_player.id%TYPE,
	IN	role_to_check	en_role
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	pos_player	integer;
	role_pos	text;

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

		role_pos = get_column('fp_position', 'role', pos_player);

		IF (role_pos = role_to_check) THEN
			RETURN TRUE;
		END IF;

	END LOOP;

	RAISE NOTICE 'Player (id =  %) does not have role %', id_player, role_to_check;
	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : range_edition
 *
 * IN      : fp_competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : Funzione che restituisce l'intervallo di tempo, in termini di
 *        data inizio e data fine di un'edizione di una competizione calcistica
 *
 *        NOTA: si tratta di date arbitrarie ottenute chiaramente per eccesso
 *              ma che sono state ottenute facendo numerossisime indagini
 *              avvalendosi di varie fonti (Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION range_edition
(
	IN	id_comp_ed	fp_competition_edition.id%TYPE
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	time_range	daterange;
	
	s_year		integer; -- anno di inizio
	e_year		integer; -- anno di fine

	s_date		date; -- data di inizio
	e_date		date; -- data di fine

BEGIN
	
	s_year = get_column('fp_competition_edition', 'start_year', id_comp_ed);
	e_year = get_column('fp_competition_edition', 'end_year', id_comp_ed);

	-- se l'edizione termina nello stesso anno di inizio
	IF (s_year = e_year) THEN
		-- ..supponiamo che l'edizione duri tutto l'anno
		s_date = make_date(s_year, 01, 01);
		e_date = make_date(s_year, 12, 31);
	-- altrimenti
	ELSE
		-- ..supponiamo che la competizione duri un anno a partire dal primo agosto
		s_date = make_date(s_year, 08, 01);
		e_date = make_date(e_year, 07, 31);
	END IF;

	time_range = daterange(s_date, e_date, '[]');

	RETURN time_range;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : play_in_during
 *
 * IN      : fp_player.id%TYPE, fp_team.id%TYPE, daterange 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore gioca in una squadra di calcio
 *        durante un intervallo di tempo, espresso come range di date
 ******************************************************************************/
CREATE OR REPLACE FUNCTION play_in_during
(
	IN	id_player	fp_player.id%TYPE,
	IN	id_team		fp_team.id%TYPE,
	IN	time_range	daterange
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	play	boolean;

BEGIN
	
	play = FALSE;

	SELECT
		count(*) >= 1
	INTO
		play
	FROM
		fp_militancy
	WHERE
		team_id = id_team
		AND
		player_id = id_player
		AND
		date_range && time_range;

	IF (NOT play) THEN
		RAISE NOTICE 'Player (id = %) does not play in team (id = %) during date range %', id_player, id_team, time_range;
	END IF;

	RETURN play;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : pos_fit_stat
 *
 * IN      : fp_position.id%TYPE, fp_statistic.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una posizione del campo di gioco e'
 *        associabile ad una statistica
 *
 *        NOTA: considerando l'enum "en_role_mix" possiamo osservare facilmente
 *              che una posizione e' associabile ad una statistica
 *              se e soltanto se il ruolo della posizione e' una sottostringa
 *              del tipo della statistica in questione
 ******************************************************************************/
CREATE OR REPLACE FUNCTION pos_fit_stat
(
	IN	id_pos		fp_position.id%TYPE,
	IN	id_stat		fp_statistic.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	role_pos	text;
	type_stat	text;

BEGIN
	
	role_pos = get_column('fp_position', 'role', id_pos);
	type_stat = get_column('fp_statistic', 'type', id_stat);

	IF (position(role_pos in type_stat) > 0) THEN
		RETURN TRUE;
	END IF;

	RAISE NOTICE 'Position (id = %) cannot be associated wiht statistic (id = %)', id_pos, id_stat;
	RETURN FALSE;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : team_fit_comp
 *
 * IN      : fp_team.id%TYPE, fp_competition.id%TYPE 
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se una squadra di calcio e' compatibile con
 *        una competizione calcistica.
 ******************************************************************************/
CREATE OR REPLACE FUNCTION team_fit_comp
(
	IN	id_team		fp_team.id%TYPE,
	IN	id_comp		fp_competition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_team		text;
	type_team_comp	text;

	compatibile		boolean;

BEGIN
	
	compatibile = FALSE;

	type_team = get_column('fp_team', 'type', id_team);
	type_team_comp = get_column('fp_competition', 'team_type', id_comp);
	
	IF (type_team = type_team_comp) THEN
		compatibile = TRUE;
	ELSE
		RAISE NOTICE 'Team (id = %) is not compatible to competition (id = %)', id_team, id_comp;
	END IF;

	RETURN compatibile;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : fp_player.id%TYPE
 *
 * IN      : date
 * INOUT   : void
 * OUT     : void
 * RETURNS : daterange
 *
 * DESC : Funzione che restituisce l'intervallo valido di tempo di possibile
 *        attivita' per un calciatore
 *
 *        NOTE: le eta' minime e massime sono arbitrarie ma ottenute mediante
 *              numerose ricerche (su Wikipidia, Transfermarkt,..)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION valid_daterange
(
	IN	id_player	fp_player.id%TYPE
)
RETURNS daterange
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp			text;

	min_age		integer;
	max_age		integer;

	dob_player	date;	
	year_dob	integer;
	month_dob	integer;
	day_dob		integer;

	valid_range	daterange;
	s_valid		date;
	e_valid		date;

BEGIN
	
	min_age = 14;
	max_age = 50;

	tmp = get_column('fp_player', 'dob', id_player);
	dob_player = CAST(tmp AS date);

	year_dob = extract(year from dob);
	month_dob = extract(month from dob);
	day_dob = extract(day from dob);

	-- gestione del caso particolare nel quale il calciatore
	-- sia nato il 29 febbraio
	IF (2 = month_dob AND 29 = day_dob) THEN
		month_dob = 3;
		day_dob = 1;
	END IF;

	s_valid = make_date(year_dob + min_age, month_dob, day_dob);
	e_valid = make_date(year_dob + max_age, month_dob, day_dob);

	valid_range = daterange(s_valid, e_valid, '[]');

	RETURN valid_range;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_club_militancy
 *
 * IN      : fp_player.id%TYPE, daterange
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_club_militancy
(
	IN	id_player	fp_player.id%TYPE,
	IN	range_date	daterange
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
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
			player_id = id_player
			AND
			upper(date_range) IS NOT NULL
			AND
			date_range && range_date
	);

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : free_national_militancy
 *
 * IN      : fp_player.id%TYPE, fp_country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION free_national_militancy
(
	IN	id_player	fp_player.id%TYPE,
	IN	id_country	fp_country.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
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
			player_id = id_player
			AND
			upper(date_range) IS NULL
	);	
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : corr_tot_team
 *
 * IN      : fp_competition.id%TYPE, dm_usint
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se il numero massimo di squadre di calcio che
 *        possono partecipare ad una competizione calcistica sia coerente
 *        con il tipo di competizione
 *
 *        NOTE: i valori limite sono arbitrari ma ottenuti grazie a numerose
 *              ricerche (su Wikipidia, Transfermarkt, ...)
 ******************************************************************************/
CREATE OR REPLACE FUNCTION corr_tot_team
(
	IN	id_comp		fp_competition.id%TYPE,
	IN	tot_team	dm_usint
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				text;

	id_conf			integer;

	id_country		integer;

	type_country	text;
	type_comp		text;
	
BEGIN
	
	type_comp = get_column('fp_competition', 'type', id_comp);

	-- se la competizione calcistica e' una supercoppa
	IF ('SUPER CUP' = type_comp) THEN
		-- al massimo sono possibili 6 squadre partecipanti
		IF (tot_team <= 6) THEN
			RETURN TRUE;
		END IF;
	-- se la competizione calcistica e' un campionato
	ELSIF ('LEAGUE' = type_comp) THEN
		-- al massimo sono possibili 50 squadre partecipanti
		IF (tot_team <= 50) THEN
			RETURN TRUE;
		END IF;
	-- se la competizione calcistica e' un torneo
	ELSIF ('CUP' = type_comp) THEN

		tmp = get_column('fp_competition', 'confederation_id', id_comp);
		id_conf = CAST(tmp_text AS integer);

		tmp = get_column('fp_confederation', 'country_id', id_conf);
		id_country = CAST(tmp_text AS integer);

		type_country = get_column('fp_country', 'type', id_country);

		-- se si tratta di una coppa nazionale
		IF ('NATION' = type_country) THEN
			-- e' una competizione ad eliminazione diretta
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
 * IN      : fp_competition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF fp_competition.id%TYPE
 *
 * DESC : Funzione che restituisce l'id di tutte le competizioni calcistiche
 *        simili a quella in input.
 *
 *        NOTA: per simile si intende una competizione calcistica
 *              dello stesso tipo e alla quale possono partecipare
 *              lo stesso tipo di squadre di calcio
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp
(
	IN	id_comp	fp_competition.id%TYPE
)
RETURNS SETOF fp_competition.id%TYPE
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
 * IN      : fp_competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : SETOF fp_competition_edition.id%TYPE
 *
 * DESC : Funzione che restituisce l'id di tutte le edizioni di competizioni
 *        calcistiche simili a quella in input.
 *
 *        NOTA: per simile si intende un'edizione di una competizione
 *              calcistica simile con lo stesso anno di inizio e fine
 ******************************************************************************/
CREATE OR REPLACE FUNCTION similar_comp_ed
(
	IN	id_comp_ed	fp_competition_edition.id%TYPE
)
RETURNS SETOF fp_competition.id%TYPE
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	rec_comp_ed	record;

BEGIN
	
	rec_comp_ed = get_record('fp_competition_edition', id_comp_ed);

	RETURN QUERY
		SELECT
			id
		FROM
			fp_competition_edition
		WHERE
			start_year = rec_comp_ed.start_year
			AND
			end_year = rec_comp_ed.end_year
			AND
			competition_id IN (SELECT similar_comp(rec_comp_ed.competition_id));
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : can_take_part
 *
 * IN      : fp_team.id%TYPE, fp_competition_edition.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION can_take_part
(
	IN	id_team		fp_team.id%TYPE,
	IN	id_comp_ed	fp_competition_edition.id%TYPE
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	can	boolean;

BEGIN
	
	can = FALSE;

	SELECT
		count(*) < 1
	INTO
		can
	FROM
		fp_partecipation
	WHERE
		team_id = id_team
		AND
		competition_edition_id IN (SELECT similar_comp_ed(id_comp_ed));

	IF (NOT can) THEN
		RAISE NOTICE 'Team (id = %) cannot partecipate to competition edition (id = %)', id_team, id_comp_ed;
	END IF;

	RETURN can;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : has_nationality
 *
 * IN      : fp_player.id%TYPE, fp_country.id%TYPE
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : Funzione che valuta se un calciatore ha una certa nazionalita'
 ******************************************************************************/
CREATE OR REPLACE FUNCTION has_nationality
(
	IN	id_player	fp_player.id%TYPE,
	IN	id_country	fp_country.id%TYPE
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
 * TYPE : TRIGGER FUNCTION - tg_bi_confederation TRIGGER 
 * NAME : tf_bi_confederation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_confederation
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (can_be_member(NEW.id, NEW.super_id)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_team TRIGGER 
 * NAME : tf_bi_team
 *
 * DESC : TODO
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

	IF (is_nation(NEW.country_id) AND NEW.country_id = id_country_conf) THEN

		IF ('CLUB' = NEW.type) THEN
		
			RETURN NEW;
		
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
 * TYPE : TRIGGER FUNCTION - tg_bi_competition TRIGGER 
 * NAME : tf_bi_competition
 *
 * DESC : TODO
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
	type_country_conf	text;

BEGIN

	tmp = get_column('fp_confederation', 'country_id', NEW.confederation_id);
	id_country_conf = CAST(tmp AS integer);

	type_country_conf = get_column('fp_country', 'type', id_country_conf);

	IF (type_country_conf <> 'NATION' OR NEW.team_type <> 'NATIONAL') THEN

		RETURN NEW;
	
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_competition_edition TRIGGER 
 * NAME : tf_bi_competition_edition
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_competition_edition
(
)
RETURNS trigger
AS
$$
BEGIN

	IF (NOT has_edition(NEW.competition_id)) THEN

		RETURN NEW;
	
	ELSE
	
		IF
		(
			corr_freq(NEW.competition_id, NEW.start_year)
			AND
			corr_tot_team(NEW.competition_id, NEW.total_team)
		) 
		THEN
	
			RETURN NEW;
	
		END IF;
	
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_partecipation TRIGGER 
 * NAME : tf_bi_partecipation
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_partecipation
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp		text;
	id_conf	integer;
	id_comp	integer;

BEGIN

	id_conf = conf_from_comp_ed(NEW.competition_edition_id);

	tmp = get_column('fp_competition_edition', 'competition_id', NEW.competition_edition_id);
	id_comp = CAST(tmp AS integer);

	IF
	(
		has_place(NEW.competition_edition_id)
		AND
		belong_to(NEW.team_id, id_conf)
		AND
		team_fit_comp(NEW.team_id, id_comp)
		AND
		can_take_part(NEW.team_id, NEW.competition_edition_id)
	)
	THEN
		RETURN NEW;
	END IF;
	
	raise notice 'SOMETHING HAS GONE WRONG';
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_player TRIGGER 
 * NAME : tf_bi_player
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player
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
 * TYPE : TRIGGER FUNCTION - tg_bi_nationality TRIGGER 
 * NAME : tf_bi_nationality
 *
 * DESC : TODO
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
 * TYPE : TRIGGER FUNCTION - tg_bi_militancy TRIGGER 
 * NAME : tf_bi_militancy
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_militancy
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp			text;
	dob_player	date;
	type_team	text;
	valid_range	daterange;

BEGIN

	tmp = get_column('fp_player', 'dob', NEW.player_id);
	dob_player = CAST(tmp AS date);
	
	valid_range = valid_daterange(dob_player);

	type_team = get_column('fp_team', 'type', NEW.team_id);

	IF ('CLUB' = type_team) THEN

		IF
		(
			NEW.date_range <@ valid_range
			AND
			free_club_militancy(NEW.player_id, NEW.date_range)
		)
		THEN
			RETURN NEW;
		END IF;

	ELSIF ('NATIONAL' = type_team) THEN

		IF
		(
			has_nationality(NEW.player_id, rec_team.country_id)
			AND
			upper(NEW.date_range) IS NULL
			AND
			lower(NEW.date_range) <@ valid_range
			AND
			free_national_militancy(NEW.player_id, rec_team.country_id)
		)
		THEN
			RETURN NEW;
		END IF;

	END IF;

	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_player_tag TRIGGER 
 * NAME : tf_bi_player_tag
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_tag
(
)
RETURNS trigger
AS
$$
DECLARE

	type_tag	text;

BEGIN

	type_tag = get_column('fp_tag', 'type', NEW.tag_id);

	IF
	(
		type_tag <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_tag AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION - tg_bi_player_attribute TRIGGER 
 * NAME : tf_bi_player_attribute
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_attribute
(
)
RETURNS trigger
AS
$$
DECLARE

	type_column	text;

BEGIN

	type_column = get_column('fp_attribute', 'type', NEW.attribute_id);

	IF
	(
		type_column <> 'GOALKEEPER'
		OR
		('GOALKEEPER' = type_column AND has_role(NEW.player_id, 'GK'))
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
 * TYPE : TRIGGER FUNCTION - tg_bi_team_trophy_case TRIGGER 
 * NAME : tf_bi_team_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;

BEGIN

	type_trohy = get_column('fp_trophy', 'type', NEW.trophy_id);

	IF ('TEAM' = type_trohy) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_player_trophy_case TRIGGER 
 * NAME : tf_bi_player_trophy_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_player_trophy_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_trohy	text;
	time_range	daterange;
	existence	integer;

BEGIN

	time_range = range_edition(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN

		type_trohy = get_column('fp_trophy', 'type', NEW.trophy_id);

		IF ('TEAM' = type_trohy) THEN

			existence = NULL;

			SELECT
				id
			INTO
				existence
			FROM
				fp_team_trophy_case
			WHERE
				competition_edition_id = NEW.competition_edition_id
				AND
				team_id = NEW.team_id
				AND
				trophy_id = NEW.trophy_id;
			
			IF (existence IS NOT NULL) THEN
				RETURN NEW;
			END IF;
		ELSE
			RETURN NEW;
		END IF;

	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_team_prize_case TRIGGER 
 * NAME : tf_bi_team_prize_case
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_team_prize_case
(
)
RETURNS trigger
AS
$$
DECLARE

	type_prize	text;

BEGIN

	type_prize = get_column('fp_prize', 'type', NEW.prize_id);

	IF ('TEAM' = type_prize) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_play TRIGGER 
 * NAME : tf_bi_play
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play
(
)
RETURNS trigger
AS
$$
DECLARE

	time_range	daterange;

BEGIN

	time_range = range_edition(NEW.competition_edition_id);

	IF (play_in_during(NEW.player_id, NEW.team_id, time_range)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : TRIGGER FUNCTION - tg_bi_play_statistic TRIGGER 
 * NAME : tf_bi_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION tf_bi_play_statistic
(
)
RETURNS trigger
AS
$$
DECLARE

	tmp				text;
	id_player_pos	integer;
	id_pos			integer;

BEGIN

	tmp = get_column('fp_play', 'player_position_id', NEW.play_id);
	id_player_pos = CAST(tmp AS integer);

	tmp = get_column('fp_player_position', 'position_id', id_player_pos);
	id_pos = CAST(tmp AS integer);


	IF (pos_fit_stat(id_pos, statistic_id)) THEN
		RETURN NEW;
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
 * NAME : tg_bi_confederation
 *
 * DESC : Trigger per l'inserimento di una nuova confederazione calcistica
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_confederation
BEFORE INSERT ON fp_confederation
FOR EACH ROW
EXECUTE FUNCTION tf_bi_confederation();
--------------------------------------------------------------------------------


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
 * NAME : tg_bi_player_trophy_case
 *
 * DESC : Trigger per l'inserimento di un nuovo trofeo calcistico assegnato
 *        ad un calciatore
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_player_trophy_case
BEFORE INSERT ON fp_player_trophy_case
FOR EACH ROW
EXECUTE FUNCTION tf_bi_player_trophy_case();
--------------------------------------------------------------------------------


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
 * NAME : tg_bi_play_statistic
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE TRIGGER tg_bi_play_statistic
BEFORE INSERT ON fp_play_statistic
FOR EACH ROW
EXECUTE FUNCTION tf_bi_play_statistic();
--------------------------------------------------------------------------------


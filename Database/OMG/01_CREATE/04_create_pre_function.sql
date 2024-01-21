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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION table_exists
(
	IN	name_table	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			information_schema.tables 
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : attr_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION attr_exists
(
	IN	name_table	text,
	IN	name_attr	text
)
RETURNS boolean
RETURNS NULL ON NULL INPUT
AS
$$
BEGIN
	
	RETURN
	(
		SELECT
			count(*) >= 1
		FROM
			information_schema.columns 
		WHERE
			table_catalog = 'fpdb'
			AND
			table_schema = 'public'
			AND
			table_name = name_table
			AND
			column_name = name_attr
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_type_attr
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_type_attr
(
	IN	name_table	text,
	IN	name_attr	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	type_attr text;

BEGIN
	
	SELECT
		data_type
	INTO
		type_attr
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_attr;
		
	RETURN type_attr;
	
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
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_id
(
	IN	separator	text,
	IN	in_string	text
)
RETURNS integer
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	count		integer;	
	name_table	text;
	name_attr	text;
	value_attr	text;
	type_attr	text;
	row_table	record;
	to_execute	text;
	id_to_find	integer;
	
BEGIN
	
	to_execute = '';

	id_to_find = NULL;
	count = 0;

	FOR row_table IN SELECT string_to_table(in_string, separator)
	LOOP
		
		IF (0 = count) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			to_execute = to_execute || 'SELECT id ';
			to_execute = to_execute || 'FROM ' || name_table || ' WHERE ';
			
		ELSIF (1 = (count % 2)) THEN
		
			name_attr = row_table.string_to_table;
			
			IF (NOT attr_exists(name_table, name_attr)) THEN
				RETURN NULL;
			END IF;
			
			type_attr = get_type_attr(name_table, name_attr);
			
			to_execute = to_execute || name_attr || ' = ';
			
		ELSIF (0 = (count % 2)) THEN
		
			value_attr = row_table.string_to_table;
			
			IF (NOT type_attr LIKE '%int%') THEN
				 
				value_attr = quote_literal(value_attr);
				
			END IF;
				
			to_execute = to_execute || value_attr || ' AND ';
			
		END IF;
		
		count = count + 1;
		
	END LOOP;
	
	to_execute = trim(to_execute, ' AND ');
	
	to_execute = to_execute || ';';
	
	EXECUTE to_execute INTO id_to_find;
	
	RETURN id_to_find;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attr
 *
 * IN      : text, text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attr
(
	IN	name_table	text,
	IN	name_attr	text,
	IN	value_id	integer
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	tmp				integer;
	type_attr		text;
	value_attr		text;
	to_execute		text;
	cur_to_execute	refcursor;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	IF (NOT attr_exists(name_table, name_attr)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = '';
	to_execute = to_execute || 'SELECT ' || name_attr;
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	OPEN cur_to_execute FOR EXECUTE to_execute;
	
	type_attr = get_type_attr(name_table, name_attr);
	
	IF (type_attr LIKE '%int%') THEN
		
		FETCH cur_to_execute INTO tmp;
		 
		value_attr = CAST(tmp AS text); 
		
	ELSE
	
		FETCH cur_to_execute INTO value_attr;
	
	END IF;
	
	CLOSE cur_to_execute;

	RETURN value_attr;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_rec
 *
 * IN      : text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : record
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_rec
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
	
	to_execute = '';
	to_execute = to_execute || 'SELECT *';
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
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
RETURNS TABLE (constr text, table_to_ref text, col_to_ref text, table_ref text, col_ref text, col_ord integer)
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
			(ccu.column_name = 'id' OR (ccu.column_name = kcu.column_name))
		ORDER BY
			ccu.constraint_name, kcu.ordinal_position DESC;
			
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

	name_table	text;
	name_attr	text;
	value_attr	text;
	type_attr	text;
	row_table	record;
	name_constr	text;
	to_execute	text;
	where_cond	text;
	counter		integer;
	
BEGIN

	where_cond = '';
	name_constr = '';
	counter = 0;
	
	FOR row_table IN SELECT string_to_table(in_string, separator)
	LOOP
		
		IF (0 = counter) THEN

			name_table = row_table.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			where_cond = where_cond || 'WHERE ';
			
		ELSIF (1 = (counter % 2)) THEN
		
			name_attr = row_table.string_to_table;
			
			IF (NOT attr_exists(name_table, name_attr)) THEN
				RETURN NULL;
			END IF;
			
			type_attr = get_type_attr(name_table, name_attr);
			
			where_cond = where_cond || name_table || '.' || name_attr || ' = ';
			
		ELSIF (0 = (counter % 2)) THEN
		
			value_attr = row_table.string_to_table;
			
			IF (NOT type_attr LIKE '%int%') THEN
				 
				value_attr = quote_literal(value_attr);
				
			END IF;
				
			where_cond = where_cond || value_attr || ' AND ';
			
		END IF;
		
		counter = counter + 1;
		
	END LOOP;

	where_cond = trim(where_cond, ' AND ');
	
	where_cond = where_cond || ';';


	counter = 0;

	FOR row_table IN SELECT * FROM all_references(name_table)
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
			
			EXECUTE to_execute INTO counter;
			
			IF (counter > 0) THEN
				
				RETURN TRUE;
				
			END IF;
				
		END IF;
		
		RETURN FALSE;
		
	END LOOP;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------
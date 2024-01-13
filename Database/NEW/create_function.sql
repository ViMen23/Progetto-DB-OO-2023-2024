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
 * TYPE : FUNCTION
 * NAME : table_exists
 * DESC : TODO
 *
 *        IN      : text
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
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
 * NAME : attribute_exists
 * DESC : TODO
 *
 *        IN      : text
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION attribute_exists
(
	IN	name_table		text,
	IN	name_attribute	text
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
			column_name = name_attribute
	);
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_type
 * DESC : TODO
 *
 *        IN      : text
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_type
(
	IN	name_table		text,
	IN	name_attribute	text
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	attribute_type text; 

BEGIN
	
	
	SELECT
		data_type
	INTO
		attribute_type
	FROM
		information_schema.columns 
	WHERE
		table_catalog = 'fpdb'
		AND
		table_schema = 'public'
		AND
		table_name = name_table
		AND
		column_name = name_attribute;
		
	RETURN attribute_type;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------




/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_id
 * DESC : TODO
 *
 *        IN      : text
 *        INOUT   : void
 *        OUT     : void
 *
 *        RETURNS : boolean
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

	id_to_find	integer := NULL;
	to_execute	text := '';
	
	count	integer := 0;
	
	name_table		text;
	name_attribute	text;
	value_attribute	text;
	type_attribute	text;

	input RECORD;
	
BEGIN
	
	FOR input IN
		SELECT string_to_table(input_string, separator)
	LOOP
		
		IF (0 = count) THEN

			name_table = input.string_to_table;
			
			IF (NOT table_exists(name_table)) THEN
				RETURN NULL;
			END IF;
			
			to_execute = to_execute || 'SELECT id ';
			to_execute = to_execute || 'FROM ' || name_table || ' WHERE ';
			
		ELSIF (1 = (count % 2)) THEN
		
			name_attribute = input.string_to_table;
			
			IF (NOT attribute_exists(name_table, name_attribute)) THEN
				RETURN NULL;
			END IF;
			
			type_attribute = get_attribute_type(name_table, name_attribute);
			
			to_execute = to_execute || name_attribute || ' = ';
			
		ELSIF (0 = (count % 2)) THEN
		
			value_attribute = input.string_to_table;
			
			IF (NOT type_attribute LIKE '%int%') THEN
				
				SELECT quote_literal(value_attribute)
				INTO value_attribute;
				
			END IF;
				
			to_execute = to_execute || value_attribute || ' AND ';
			
		END IF;
		
		count = count + 1;
		
	END LOOP;
	
	
	SELECT trim(to_execute, ' AND ')
	INTO to_execute;
	
	to_execute = to_execute || ';';
	
	EXECUTE to_execute INTO id_to_find;
	
	RETURN id_to_find;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

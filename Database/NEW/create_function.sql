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
 * NAME : attribute_exists
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : boolean
 *
 * DESC : TODO
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
 *
 * IN      : text, text
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
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



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : get_attribute_from_id
 *
 * IN      : text, text, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : text
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION get_attribute_from_id
(
	IN	name_table		text,
	IN	name_attribute	text,
	IN	value_id		integer
)
RETURNS text
RETURNS NULL ON NULL INPUT
AS
$$
DECLARE

	to_execute	text	:= ''; 
	
	type_attribute	text;
	
	output_cursor	refcursor;
	integer_output	integer;
	
	value_attribute	text;
	
BEGIN
	
	IF (NOT table_exists(name_table)) THEN
		RETURN NULL;
	END IF;
	
	IF (NOT attribute_exists(name_table, name_attribute)) THEN
		RETURN NULL;
	END IF;
	
	to_execute = to_execute || 'SELECT ' || name_attribute;
	to_execute = to_execute || ' FROM ' || name_table;
	to_execute = to_execute || ' WHERE id = ' || value_id || ';';
	
	
	
	OPEN output_cursor FOR EXECUTE to_execute;
	
	
	
	type_attribute = get_attribute_type(name_table, name_attribute);
	
	
	
	IF (type_attribute LIKE '%int%') THEN
		
		FETCH output_cursor INTO integer_output;
		
		SELECT CAST(integer_output AS text)
		INTO value_attribute; 
		
	ELSE
	
		FETCH output_cursor INTO value_attribute;
	
	END IF;
	
	CLOSE output_cursor;

	
	SELECT quote_literal(value_attribute)
	INTO value_attribute;
		
	RETURN value_attribute;
	
END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_total_team
 *
 * IN      : integer, integer, integer
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_total_team
(
	IN	num_group		integer,
	IN	team_group	integer,
	IN	team_knock	integer
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
BEGIN

	IF (0 = num_group) THEN
		RETURN team_knock;
	ELSE
		RETURN num_group * team_group;
	END IF;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_min_match
 *
 * IN      : integer, integer, boolean, boolean, integer, boolean
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_min_match
(
	IN	num_group		integer,
	IN	team_group	integer,
	IN	ha_group		boolean,
	IN	oc_group		boolean,
	IN	team_knock	integer,
	IN	ha_knock		boolean
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
DECLARE

	min integer := 0; -- variable to accumulate minimum number of match

BEGIN

	-- if there are not groups the competition is just knockout type
	IF (0 = num_group) THEN
		-- miminum number of matches for each team is 1
		min = 1;
		
		-- if knock out phase is home and away type
		IF (ha_knock) THEN
			-- double the minimum
			min = min * 2;
		END IF;
		
	ELSE
		-- if there are groups, a team will necessarily have to play
		-- against all the teams in the same group
		min = team_group - 1;
		
		-- if group phase is home and away type
		IF (ha_group) THEN
			-- double the minimum
			min = min * 2;
		END IF;
		
		-- if group phase is open and closure type
		IF (oc_group) THEN
			-- double the minimum
			min = min * 2;
		END IF;
		
	END IF;

	RETURN min;

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------



/*******************************************************************************
 * TYPE : FUNCTION
 * NAME : set_formula_max_match
 *
 * IN      : integer, integer, boolean, boolean, integer, boolean
 * INOUT   : void
 * OUT     : void
 * RETURNS : integer
 *
 * DESC : TODO
 ******************************************************************************/
CREATE OR REPLACE FUNCTION set_formula_max_match
(
	IN	num_group		integer,
	IN	team_group	integer,
	IN	ha_group		boolean,
	IN	oc_group		boolean,
	IN	team_knock	integer,
	IN	ha_knock		boolean
)
RETURNS integer
RETURNS NULL ON NULL INPUT
IMMUTABLE
AS
$$
DECLARE

	max integer := 0; -- variable to accumulate maximum number of match

BEGIN
	
	-- if there is a group phase
	IF (num_group <> 0) THEN
		-- a team will necessarily have to play against
		-- all the teams in its group
		max = team_group - 1;
		
		-- if group phase is home and away type
		IF (ha_group) THEN
			-- double the maximum
			max = max * 2;
		END IF;
		
		-- if group phase is open and closure type
		IF (oc_group) THEN
			-- double the maximum
			max = max * 2;
		END IF;
		
	END IF;
	-- if there is a knock out phase
	IF (team_knock <> 0) THEN
		-- add all matches till final
		max = max + CAST(log(2, team_knock) AS integer);
		
		-- if knock phase is home and away type
		IF (ha_knock) THEN
			-- add all matches except final
			max = max + CAST(log(2, team_knock) AS integer) - 1;
		END IF;
		
	END IF;
	
	RETURN max;	

END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------

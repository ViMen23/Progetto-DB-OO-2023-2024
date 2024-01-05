--****************************************************************************************
--* FOOTBALL PLAYER DATABASE
--****************************************************************************************

------------------------------------------------------------------------------------------
-- UNIVERSITY : FEDERICO II - NAPOLI
-- FIELD      : COMPUTER SCIENCE
-- CLASS      : DATA BASES I
-- THEACHER   : SILVIO BARRA
-- YEAR       : 2023-2024
------------------------------------------------------------------------------------------

--****************************************************************************************
--* TRIGGERS
--****************************************************************************************


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_country
------------------------------------------------------------------------------------------
-- trigger function for trigger new_country
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.tf_new_country()
RETURNS trigger
AS
$$
BEGIN

	IF (NEW.type = 'WORLD') THEN
		IF (fpdb.fp.no_world()) THEN
			RETURN NEW;
		END IF;
	ELSE
		IF (fpdb.fp.in_correct_country(NEW.type, fpdb.fp.get_country_type(NEW.super))) THEN
			RETURN NEW;
		END IF;
	END IF;
	
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- TRIGGER: new_country
------------------------------------------------------------------------------------------
-- trigger to check that when a world type country is inserted
-- a world does not already exist
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_country
BEFORE INSERT ON fpdb.fp.cty
FOR EACH ROW
EXECUTE FUNCTION fpdb.fp.tf_new_country();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_player
------------------------------------------------------------------------------------------
-- trigger function for trigger new_player
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.tf_new_player()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (fpdb.fp.is_nation(NEW.cty) AND fpdb.fp.is_born(NEW.b_date, NEW.cty)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-- TRIGGER: new_player
------------------------------------------------------------------------------------------
-- trigger to check that a new country to be inserted that is not of type world
-- is contained in the appropriate country type
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_player
BEFORE INSERT ON fpdb.fp.fply
FOR EACH ROW
EXECUTE FUNCTION fpdb.fp.tf_new_player();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_team
------------------------------------------------------------------------------------------
-- trigger function for trigger new_team
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.tf_new_team()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF ( NEW.type = 'CLUB' ) THEN
		IF ( fpdb.fp.is_nation( NEW.cty ) AND
			fpdb.fp.is_cteam_after_cty( NEW.s_year, NEW.e_year, NEW.cty ) ) THEN
			
			RETURN NEW;
		END IF;
	ELSE
		IF
		( 
			( fpdb.fp.is_nation( NEW.cty ) ) AND
			( fpdb.fp.get_country_name( NEW.cty ) = NEW.name ) AND
			( fpdb.fp.is_nteam_after_cty( NEW.s_year, NEW.e_year, NEW.cty ) )
			
		) THEN
			RETURN NEW;
		END IF;
	END IF;
	
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-- TRIGGER: new_team
------------------------------------------------------------------------------------------
-- TODO: comment trigger
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_team
BEFORE INSERT ON fpdb.fp.team
FOR EACH ROW
EXECUTE FUNCTION fpdb.fp.tf_new_team();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_conf
------------------------------------------------------------------------------------------
-- trigger function for trigger new_conf
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.tf_new_conf()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN
	IF
	( 
		(fpdb.fp.in_correct_country(NEW.type, fpdb.fp.get_confederation_type(NEW.super) ) )
		AND
		( fpdb.fp.is_cteam_after_cty( NEW.s_year, NEW.e_year, NEW.cty ) ) 
	) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-- TRIGGER: new_conf
------------------------------------------------------------------------------------------
-- TODO: comment trigger
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_conf
BEFORE INSERT ON fpdb.fp.conf
FOR EACH ROW
EXECUTE FUNCTION fpdb.fp.tf_new_conf();
------------------------------------------------------------------------------------------





-----------------------------------------TRASH--------------------------------------------
/*
------------------------------------------------------------------------------------------
-- TRIGGER: player_country_nation
------------------------------------------------------------------------------------------
-- trigger to check that a new country to be inserted that is not of type world
-- is contained in the appropriate country type
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER fpdb.fp.player_country_nation
BEFOR INSERT ON fpdb.fp.fply_cty
FOR EACH ROW
EXECUTE FUNCTION fpdb.fp.tf_is_country_nation()
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_is_born_country_nation
------------------------------------------------------------------------------------------
-- trigger function for trigger player_nation
-- trigger function for trigger team_nation
-- trigger function for trigger player_country_nation
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION fpdb.fp.tf_is_country_nation()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (fpdb.fp.is_nation(NEW.cty)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------


CREATE OR REPLACE FUNCTION is_nation_function() RETURNS trigger AS
$$
DECLARE
	name_country  country.name%TYPE;
BEGIN
	SELECT name INTO name_country
	FROM country
	WHERE code = NEW.country;

	IF (name_country = NEW.name) THEN
		RETURN NEW;
	END IF;
	
	RAISE EXCEPTION 'ERROR. The name of national team must be equal to nation name';
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER national_team_name
BEFORE INSERT ON team
FOR EACH ROW
WHEN (NEW.type = 'NATIONAL')
EXECUTE FUNCTION national_team_name_function();

--------------------------------------------------------------------
CREATE OR REPLACE FUNCTION player_born_country_function() RETURNS trigger AS
$$
DECLARE
	pb_year	country.start_year%TYPE = extract(year from (NEW.birth_date);
	cs_year	country.start_year%TYPE;
	ce_year country.end_year%TYPE;
BEGIN
	SELECT start_year, end_year INTO cs_year, ce_year
	FROM country
	WHERE code = NEW.country; 

	IF (cs_year <= pb_year) THEN
		IF (ce_year IS NOT NULL) THEN
			IF (pb_year <= ce_year) THEN
				RETURN NEW;
			END IF;
		ELSE
			RETURN NEW;	
		END IF
	END IF;
	
	RAISE EXCEPTION 'ERROR. The player was born in a country that not exists';
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER player_born_country
BEFORE INSERT ON player
FOR EACH ROW
EXECUTE FUNCTION player_born_country_function();

-------------------------------------------------------
CREATE OR REPLACE FUNCTION team_country_function() RETURNS trigger AS
$$
DECLARE
	cs_year	country.start_year%TYPE;
	ce_year country.end_year%TYPE;
BEGIN
	SELECT start_year, end_year INTO cs_year, ce_year
	FROM country
	WHERE code = NEW.country;
	
	IF (cs_year <= NEW.start_year) THEN
		IF (ce_year IS NOT NULL) THEN
			IF (NEW.start_year <= ce_year) THEN
				RETURN NEW;
			END IF;
		ELSE
			RETURN NEW;
		END IF;
	END IF;
	
	RAISE EXCEPTION 'ERROR. Team belongs to a country that not exists';
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER team_country
BEFORE INSERT ON team
FOR EACH ROW
EXECUTE FUNCTION team_country_function();
											  */

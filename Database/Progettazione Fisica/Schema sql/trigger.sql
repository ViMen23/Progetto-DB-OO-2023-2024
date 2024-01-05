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
CREATE OR REPLACE FUNCTION tf_new_country()
RETURNS trigger
AS
$$
BEGIN

	IF (NEW.type = 'WORLD') THEN
		IF (no_world()) THEN
			RETURN NEW;
		END IF;
	ELSE
		IF (insu_country(NEW.type, country_ty(NEW.super))) THEN
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
BEFORE INSERT ON country
FOR EACH ROW
EXECUTE FUNCTION tf_new_country();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_player
------------------------------------------------------------------------------------------
-- trigger function for trigger new_player
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_new_player()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		is_nation(NEW.country)
		AND
		is_in_country(CAST(extract(year from NEW.b_date) AS integer), NEW.country)
	)
	THEN
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
BEFORE INSERT ON player
FOR EACH ROW
EXECUTE FUNCTION tf_new_player();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_team
------------------------------------------------------------------------------------------
-- trigger function for trigger new_team
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_new_team()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (is_nation(NEW.country) AND is_in_country(NEW.s_year, NEW.e_year, NEW.country)) THEN
		IF ('CLUB' = NEW.type) THEN
			RETURN NEW;
		ELSE
			IF
			(
				NEW.e_year IS NOT DISTINCT FROM country_ey(NEW.country)
				AND
				NEW.name IS NOT DISTINCT FROM country_nm(NEW.country)
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

------------------------------------------------------------------------------------------
-- TRIGGER: new_team
------------------------------------------------------------------------------------------
-- TODO: comment trigger
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_team
BEFORE INSERT ON team
FOR EACH ROW
EXECUTE FUNCTION tf_new_team();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_conf
------------------------------------------------------------------------------------------
-- trigger function for trigger new_conf
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_new_conf()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN
	IF
	( 
		(insu_country(NEW.type, conf_ty(NEW.super)))
		AND
		(is_in_country(NEW.s_year, NEW.e_year, NEW.country)) 
	)
	THEN
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
BEFORE INSERT ON conf
FOR EACH ROW
EXECUTE FUNCTION tf_new_conf();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_p_country
------------------------------------------------------------------------------------------
-- trigger function for trigger new_p_country
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_new_p_country()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (is_nation(NEW.country)) THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-- TRIGGER: new_p_country
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_p_country
BEFORE INSERT ON p_country
FOR EACH ROW
EXECUTE FUNCTION tf_new_p_country();
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_comp
------------------------------------------------------------------------------------------
-- trigger function for trigger new_comp
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_new_comp()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		('NATION' = conf_ty(NEW.conf) AND NEW.t_type <> 'NATIONAL')
		AND
		(is_in_conf(NEW.s_year, NEW.e_year, NEW.conf))	
	)
	THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-- TRIGGER: new_comp
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_comp
BEFORE INSERT ON comp
FOR EACH ROW
EXECUTE FUNCTION tf_new_comp();
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_new_comp_ed
------------------------------------------------------------------------------------------
-- trigger function for trigger new_comp_ed
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_new_comp_ed()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF
	(
		is_in_comp(NEW.s_year, NEW.e_year, NEW.comp)
		AND
		(0 = (NEW.s_year - comp_sy(NEW.comp)) % comp_fq(comp))
		AND
		ctrl_comp(comp_ty(NEW.comp), NEW.n_team, NEW.n_match)
	)
	THEN
		RETURN NEW;
	END IF;
	
	RETURN NULL;

END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------------------------
-- TRIGGER: new_comp_ed
------------------------------------------------------------------------------------------
-- TODO
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER new_comp_ed
BEFORE INSERT ON comp_ed
FOR EACH ROW
EXECUTE FUNCTION tf_new_comp_ed();
------------------------------------------------------------------------------------------

-----------------------------------------TRASH--------------------------------------------
/*
------------------------------------------------------------------------------------------
-- TRIGGER: player_country_nation
------------------------------------------------------------------------------------------
-- trigger to check that a new country to be inserted that is not of type world
-- is contained in the appropriate country type
------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER player_country_nation
BEFOR INSERT ON player_country
FOR EACH ROW
EXECUTE FUNCTION tf_is_country_nation()
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- TRIGGER FUNCTION: tf_is_born_country_nation
------------------------------------------------------------------------------------------
-- trigger function for trigger player_nation
-- trigger function for trigger team_nation
-- trigger function for trigger player_country_nation
--------------------------------------------------------------
CREATE OR REPLACE FUNCTION tf_is_country_nation()
RETURNS trigger
AS
$$
DECLARE
	
BEGIN

	IF (is_nation(NEW.country)) THEN
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

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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
 * NAME : nationalien_fk_country
 *
 * DESC : La nazionalita' di un calciatore fa riferimento al paese in questione.
 *        Un cambiamento del paese si ripercuotera' a cascata sulla
 *        nazionalita'
 ******************************************************************************/
ALTER TABLE	fp_nationality
ADD CONSTRAINT nationalien_fk_country
FOREIGN KEY
(
	country_id
)
REFERENCES fp_country
(
	id
)
ON DELETE CASCADE
ON UPDATE CASCADE;
--------------------------------------------------------------------------------

/*******************************************************************************
 * TYPE : FOREIGN KEY CONSTRAINT - fp_nationality TABLE
 * NAME : nationalien_fk_player
 *
 * DESC : La nazionalita' di un calciatore fa riferimento al calciatore
 *        in questione.
 *        Un cambiamento del calciatore si ripercuotera' a cascata sulla
 *        nazionalita'
 ******************************************************************************/
ALTER TABLE	fp_nationality
ADD CONSTRAINT nationalien_fk_player
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
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
UNIQUE
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

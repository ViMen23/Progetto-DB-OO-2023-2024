package controller;

import dao.*;
import gui.Regex;
import model.*;
import postgresImplDAO.*;

import java.util.*;

/**
 * Contiene metodi per l'interazione tra i package gui, model e il database.
 */
public class Controller
{
	private static Controller controllerInstance = null;
	private static boolean adminConnected = false;

	/**
	 * Costruttore privato.
	 * <p>
	 * Previene l'instanziazione diretta della classe Controller
	 * dall'esterno.
	 */
	private Controller()
	{
	}

	/**
	 * Metodo getInstance.
	 * <p>
	 * Restituisce l'istanza singleton di Controller.
	 * <p>
	 * @return L'istanza singleton di Controller.
	 */
	public static Controller getInstance()
	{
		if (null == controllerInstance) {
			controllerInstance = new Controller();
		}

		return controllerInstance;
	}


	/*--------------------------------------------------------------------------------------------------------
	 * ADMIN
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Determina se un utente è un amministratore.
	 * <p>
	 * @param username Il nome utente.
	 * @param password La password.
	 * @return True se l'utente è un amministratore, false altrimenti.
	 */
	public Boolean isAdmin(String username,
												 String password)
	{
		if (null == username || !(Regex.patternUsername.matcher(username).find())) {
			return false;
		}

		if (null == password || !(Regex.patternPassword.matcher(password).find())) {
			return false;
		}

		if (adminConnected) {
			return false;
		}

		AdminDAO adminDAO = new PostgresImplAdminDAO();
		adminConnected = adminDAO.isAdminDB(username, password);
		return adminConnected;
	}


	/**
	 * Disconnette l'amministratore.
	 */
	public void logoutAdmin()
	{
		if (adminConnected) {
			adminConnected = false;
		}
	}


	/**
	 * Restituisce lo stato di connessione dell'amministratore.
	 * <p>
	 * @return True se l'amministratore è connesso, false altrimenti.
	 */
	public boolean isAdminConnected()
	{
		return adminConnected;
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COUNTRY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Restituisce il numero di Paesi presenti nel database.
	 * <p>
	 * @return Il numero di Paesi presenti nel database.
	 */
	public Integer countCountry()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		return countryDAO.countCountryDB();
	}


	/**
	 * Imposta i dati per la combobox dei Paesi.
	 * <p>
	 * Questo metodo recupera i dati dei Paesi dal database in base al tipo di Paese
	 * e all'ID del Super Paese specificati e li inserisce nelle strutture dati fornite
	 * come parametri.
	 * <p>
	 * @param countryType Il tipo di Paese.
	 * @param superCountryID L'ID del Super Paese.
	 * @param comboBoxData La lista che conterrà i nomi dei Paesi da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi dei Paesi e i loro ID.
	 */
	public void setCountryComboBox(String countryType,
																 String superCountryID,
																 Vector<String> comboBoxData,
																 Map<String, String> comboBoxMap)
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.fetchCountryDB(
						countryType,
						superCountryID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la tabella dei Paesi.
	 * <p>
	 * Questo metodo recupera i dati dei Paesi dal database in base al tipo di Paese
	 * e all'ID del Super Paese specificati e li inserisce nella struttura dati fornita
	 * come parametro.
	 * <p>
	 * @param countryType Il tipo di Paese.
	 * @param superCountryID L'ID del Super Paese.
	 * @param tableData La matrice che conterrà i dati dei Paesi da visualizzare nella tabella.
	 */
	public void setCountryTable(String countryType,
															String superCountryID,
															Vector<Vector<String>> tableData)
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.fetchCountryDB(
						countryType,
						superCountryID,
						tableData
		);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * CONFEDERATION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Restituisce il numero di Confederazioni presenti nel database.
	 *
	 * @return Il numero di Confederazioni presenti nel database.
	 */
	public Integer countConfederations()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		return confederationDAO.countConfederationDB();
	}


	/**
	 * Imposta i dati per la combobox delle Confederazioni.
	 * <p>
	 * Questo metodo recupera i dati delle Confederazioni dal database in base al tipo di Paese
	 * e all'ID della Super Confederazione specificati e li inserisce nelle strutture dati fornite
	 * come parametri.
	 * <p>
	 * @param countryType Il tipo di Paese.
	 * @param superConfederationID L'ID della Super Confederazione.
	 * @param comboBoxData La lista che conterrà i nomi delle Confederazioni da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Confederazioni e i loro ID.
	 */
	public void setConfederationComboBox(String countryType,
																			 String superConfederationID,
																			 Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap)
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						countryType,
						superConfederationID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la tabella delle Confederazioni.
	 * <p>
	 * Questo metodo recupera i dati delle Confederazioni dal database in base al tipo di Paese
	 * e all'ID della Super Confederazione specificati e li inserisce nella struttura dati fornita
	 * come parametro.
	 * <p>
	 * @param countryType Il tipo di Paese.
	 * @param superConfederationID L'ID della Super Confederazione.
	 * @param tableData La matrice che conterrà i dati delle Confederazioni da visualizzare nella tabella.
	 */
	public void setConfederationTable(String countryType,
																		String superConfederationID,
																		Vector<Vector<String>> tableData)
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						countryType,
						superConfederationID,
						tableData
		);
	}


	/**
	 * Recupera le Confederazioni di appartenenza di una Squadra.
	 * <p>
	 * Questo metodo recupera le Confederazioni associate a una Squadra specificata
	 * e inserisce i dati nella struttura dati fornita come parametro.
	 * <p>
	 * @param teamID L'ID della Squadra.
	 * @param mapData La mappa che conterrà i dati della Confederazione (nome e ID).
	 */
	public void setConfederationMap(String teamID,
																	Map<String, String> mapData)
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						teamID,
						mapData
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COMPETITION
	 *------------------------------------------------------------------------------------------------------*/



	/**
	 * Restituisce il numero di Competizioni presenti nel database.
	 * <p>
	 * @return Il numero di Competizioni presenti nel database.
	 */
	public Integer countCompetitions()
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.countCompetitionDB();
	}


	/**
	 * Restituisce i dati di una Competizione in una mappa.
	 * <p>
	 * @param competitionID L'ID della Competizione.
	 * @param infoMap La mappa che conterrà i dati della Competizione.
	 */
	public void setCompetitionInfoMap(String competitionID,
																		Map<String, String> infoMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						competitionID,
						infoMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Competizioni.
	 * <p>
	 * Questo metodo recupera i dati delle Competizioni dal database in base ai criteri forniti
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param playerID L'ID del Giocatore.
	 * @param teamType Il tipo di Squadra.
	 * @param comboBoxData La lista che conterrà i nomi delle Competizioni da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Competizioni e i loro ID.
	 */
	public void setCompetitionComboBox(String playerID,
																		 String teamType,
																		 Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						playerID,
						teamType,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Competizioni.
	 * <p>
	 * Questo metodo recupera i dati delle Competizioni dal database in base ai criteri forniti
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param competitionSubName Il nome parziale della Competizione.
	 * @param competitionType Il tipo di Competizione.
	 * @param competitionTeamType Il tipo di Squadra della Competizione.
	 * @param competitionCountryType Il tipo di Nazione della Competizione.
	 * @param competitionContinentID L'ID del Continente della Competizione.
	 * @param competitionNationID L'ID della Nazione della Competizione.
	 * @param comboBoxData La lista che conterrà i nomi delle Competizioni da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Competizioni e i loro ID.
	 */
	public void setCompetitionComboBox(String competitionSubName,
																		 String competitionType,
																		 String competitionTeamType,
																		 String competitionCountryType,
																		 String competitionContinentID,
																		 String competitionNationID,
																		 Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle edizioni di una Competizione.
	 * <p>
	 * @param teamType Il tipo di Squadra.
	 * @param competitionID L'ID della Competizione.
	 * @param comboBoxData La lista che conterrà i nomi delle edizioni da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle edizioni e i loro ID.
	 */
	public void setCompetitionEditionComboBox(String teamType,
																						String competitionID,
																						Vector<String> comboBoxData,
																						Map<String, String> comboBoxMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionEditionDB(
						teamType,
						competitionID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Competizioni di una Confederazione.
	 * <p>
	 * @param confederationID L'ID della Confederazione.
	 * @param teamType Il tipo di Squadra.
	 * @param comboBoxData La lista che conterrà i nomi delle Competizioni da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Competizioni e i loro ID.
	 */
	public void setCompetitionConfederationComboBox(String confederationID,
																									String teamType,
																									Vector<String> comboBoxData,
																									Map<String, String> comboBoxMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionConfederationDB(
						confederationID,
						teamType,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la tabella delle Competizioni.
	 * <p>
	 * Questo metodo recupera i dati delle Competizioni dal database in base ai criteri forniti
	 * e li inserisce nella struttura dati fornita come parametro. Ogni elemento della matrice `tableData`
	 * rappresenta una riga della tabella, e ogni elemento all'interno di una riga rappresenta una colonna.
	 * <p>
	 * @param competitionSubName Il nome parziale della Competizione.
	 * @param competitionType Il tipo di Competizione.
	 * @param competitionTeamType Il tipo di Squadra della Competizione.
	 * @param competitionCountryType Il tipo di Paese della Competizione.
	 * @param competitionContinentID L'ID del Continente della Competizione.
	 * @param competitionNationID L'ID della Nazione della Competizione.
	 * @param tableData La matrice che conterrà i dati delle Competizioni da visualizzare nella tabella.
	 */
	public void setCompetitionTable(String competitionSubName,
																	String competitionType,
																	String competitionTeamType,
																	String competitionCountryType,
																	String competitionContinentID,
																	String competitionNationID,
																	Vector<Vector<String>> tableData)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						tableData
		);
	}


	/**
	 * Imposta i dati per la tabella delle Competizioni (vista admin).
	 * <p>
	 * Questo metodo recupera i dati delle Competizioni dal database in base ai criteri forniti
	 * e li inserisce nelle strutture dati fornite come parametri. La struttura `tableData`
	 * contiene i dati visualizzabili nella tabella, mentre la struttura `tableMap` contiene
	 * informazioni aggiuntive associate a ciascuna cella della tabella.
	 * <p>
	 * @param competitionSubName Il nome parziale della Competizione.
	 * @param competitionType Il tipo di Competizione.
	 * @param competitionTeamType Il tipo di Squadra della Competizione.
	 * @param competitionCountryType Il tipo di Paese della Competizione.
	 * @param competitionContinentID L'ID del Continente della Competizione.
	 * @param competitionNationID L'ID della Nazione della Competizione.
	 * @param tableData La matrice che conterrà i dati delle Competizioni da visualizzare nella tabella.
	 * @param tableMap La mappa che conterrà informazioni aggiuntive associate a ciascuna cella della tabella.
	 */
	public void setCompetitionTableAdmin(String competitionSubName,
																			 String competitionType,
																			 String competitionTeamType,
																			 String competitionCountryType,
																			 String competitionContinentID,
																			 String competitionNationID,
																			 Vector<Vector<String>> tableData,
																			 Map<Integer, Map<Integer, String>> tableMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionAdminDB(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						tableData,
						tableMap
		);
	}



	/**
	 * Imposta i dati per la tabella delle edizioni di una Competizione (vista admin).
	 * <p>
	 * Questo metodo recupera i dati delle edizioni di una Competizione dal database in base ai criteri forniti
	 * e li inserisce nelle strutture dati fornite come parametri. La struttura `tableData`
	 * contiene i dati visualizzabili nella tabella, mentre la struttura `tableMap` contiene
	 * informazioni aggiuntive associate a ciascuna cella della tabella.
	 * <p>
	 * @param competitionID L'ID della Competizione.
	 * @param teamType Il tipo di Squadra.
	 * @param tableData La matrice che conterrà i dati delle edizioni da visualizzare nella tabella.
	 * @param tableMap La mappa che conterrà informazioni aggiuntive associate a ciascuna cella della tabella.
	 */
	public void setCompetitionTableAdmin(String competitionID,
																			 String teamType,
																			 Vector<Vector<Object>> tableData,
																			 Map<Integer, Map<Integer, String>> tableMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionEditionAdminDB(
						competitionID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Competizioni a cui un Giocatore ha partecipato.
	 * <p>
	 * Questo metodo recupera i dati delle edizioni di una Competizione a cui un Giocatore ha partecipato
	 * dal database in base ai criteri forniti e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param playerID L'ID del Giocatore.
	 * @param teamType Il tipo di Squadra.
	 * @param startYear L'anno di inizio.
	 * @param comboBoxData La lista che conterrà i nomi delle edizioni da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle edizioni e i loro ID.
	 */
	public void setCompetitionPlayComboBox(String playerID,
																				 String teamType,
																				 String startYear,
																				 Vector<String> comboBoxData,
																				 Map<String, String> comboBoxMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionPlayDB(
						playerID,
						teamType,
						startYear,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Crea una nuova edizione di una Competizione.
	 * <p>
	 * Questo metodo può essere eseguito solo da un utente con privilegi di amministratore.
	 * Crea una nuova edizione della Competizione nel database con l'anno di inizio specificato.
	 * <p>
	 * @param competitionID L'ID della Competizione.
	 * @param competitionStartYear L'anno di inizio della nuova edizione.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String newCompetitionEdition(String competitionID,
																			String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.newCompetitionEditionDB(
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Elimina un'edizione di una Competizione.
	 * <p>
	 * Questo metodo può essere eseguito solo da un utente con privilegi di amministratore.
	 * Elimina l'edizione della Competizione specificata dal database.
	 * <p>
	 * @param competitionID L'ID della Competizione.
	 * @param competitionStartYear L'anno di inizio dell'edizione da eliminare.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String deleteCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.deleteCompetitionEditionDB(
						competitionID,
						competitionStartYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TEAM
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Calcola il numero totale di Squadre nel database.
	 * <p>
	 * @return Il numero totale di Squadre presenti nel database.
	 */
	public Integer countTeams()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.countTeamDB();
	}


	/**
	 * Imposta i dati per la combobox delle Squadre.
	 * <p>
	 * Questo metodo recupera i dati delle Squadre dal database in base ai criteri forniti
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param teamSubLongName Il nome parziale lungo della Squadra.
	 * @param teamSubShortName Il nome parziale corto della Squadra.
	 * @param teamType Il tipo di Squadra.
	 * @param teamContinentID L'ID del Continente della Squadra.
	 * @param teamNationID L'ID della Nazione della Squadra.
	 * @param comboBoxData La lista che conterrà i nomi delle Squadre da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Squadre e i loro ID.
	 */
	public void setTeamComboBox(String teamSubLongName,
															String teamSubShortName,
															String teamType,
															String teamContinentID,
															String teamNationID,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamComboDB(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamContinentID,
						teamNationID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Squadre di un Giocatore.
	 * <p>
	 * Questo metodo recupera le Squadre a cui è associato un Giocatore dal database in base all'ID del Giocatore fornito
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param playerID L'ID del Giocatore.
	 * @param comboBoxData La lista che conterrà i nomi delle Squadre da visualizzare nella combobox.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Squadre e i loro ID.
	 */
	public void setTeamComboBox(String playerID,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						playerID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle stagioni di una Squadra.
	 * <p>
	 * Questo metodo recupera gli anni in cui una Squadra ha partecipato a dei campionati
	 * dal database in base all'ID e al tipo di Squadra forniti e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param teamID L'ID della Squadra.
	 * @param teamType Il tipo di Squadra.
	 * @param comboBoxData La lista che conterrà gli anni in cui la Squadra ha partecipato a dei campionati.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra gli anni e altre informazioni.
	 */
	public void setTeamYearComboBox(String teamID,
																	String teamType,
																	Vector<String> comboBoxData,
																	Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamID,
						teamType,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la tabella delle Squadre.
	 * <p>
	 * Questo metodo recupera i dati delle Squadre dal database in base ai criteri forniti
	 * e li inserisce nelle strutture dati fornite come parametri. La struttura `tableData`
	 * contiene i dati visualizzabili nella tabella, mentre la struttura `tableMap` contiene
	 * informazioni aggiuntive associate a ciascuna cella della tabella. Può essere utilizzata
	 * per personalizzare la visualizzazione della tabella.
	 * <p>
	 * @param teamSubLongName Il nome parziale lungo della Squadra.
	 * @param teamSubShortName Il nome parziale corto della Squadra.
	 * @param teamType Il tipo di Squadra.
	 * @param teamContinentID L'ID del Continente della Squadra.
	 * @param teamNationID L'ID della Nazione della Squadra.
	 * @param tableData La matrice che conterrà i dati delle Squadre da visualizzare nella tabella.
	 * @param tableMap La mappa che conterrà informazioni aggiuntive associate a ciascuna cella della tabella.
	 */
	public void setTeamTable(String teamSubLongName,
													 String teamSubShortName,
													 String teamType,
													 String teamContinentID,
													 String teamNationID,
													 Vector<Vector<String>> tableData,
													 Map<Integer, Map<Integer, String>> tableMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamContinentID,
						teamNationID,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta la mappa con le informazioni di una Squadra.
	 * <p>
	 * Questo metodo recupera le informazioni di una Squadra dal database in base all'ID fornito
	 * e le inserisce nella mappa `infoMap`.
	 * <p>
	 * @param teamID L'ID della Squadra.
	 * @param infoMap La mappa che conterrà le informazioni della Squadra.
	 */
	public void setTeamInfoMap(String teamID,
														 Map<String, String> infoMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamID,
						infoMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Squadre partecipanti a un'edizione di una Competizione.
	 * <p>
	 * Questo metodo recupera le Squadre partecipanti a un'edizione specifica di una Competizione
	 * dal database in base all'anno di inizio e all'ID della Competizione forniti e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param competitionStartYear L'anno di inizio dell'edizione della Competizione.
	 * @param competitionID L'ID della Competizione.
	 * @param comboBoxData La lista che conterrà i nomi delle Squadre partecipanti.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Squadre e i loro ID.
	 */
	public void setTeamComboBox(String competitionStartYear,
															String competitionID,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamCompetitionDB(
						competitionStartYear,
						competitionID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Nazionali di un Giocatore.
	 * <p>
	 * Questo metodo recupera le Nazionali a cui è associato un Giocatore dal database in base all'ID del Giocatore fornito
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param playerID L'ID del Giocatore.
	 * @param comboBoxData La lista che conterrà i nomi delle Nazionali.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Nazionali e i loro ID.
	 */
	public void setNationalTeamComboBox(String playerID,
																			Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamComboBoxDB(
						playerID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle Squadre di un Giocatore in un arco temporale.
	 * <p>
	 * Questo metodo recupera le Squadre a cui è stato associato un Giocatore in un arco temporale specificato
	 * dal database in base all'ID del Giocatore, al tipo di Squadra e all'anno di inizio forniti
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param playerID L'ID del Giocatore.
	 * @param teamType Il tipo di Squadra.
	 * @param startYear L'anno di inizio dell'arco temporale.
	 * @param comboBoxData La lista che conterrà i nomi delle Squadre.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra i nomi delle Squadre e i loro ID.
	 */
	public void setTeamComboBox(String playerID,
															String teamType,
															String startYear,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						playerID,
						teamType,
						startYear,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta i dati per la combobox delle stagioni di un Giocatore in una Competizione.
	 * <p>
	 * Questo metodo recupera gli anni in cui un Giocatore ha partecipato a un'edizione specifica di una Competizione
	 * dal database in base all'ID del Giocatore, all'anno di inizio e all'ID della Competizione forniti
	 * e li inserisce nelle strutture dati fornite come parametri.
	 * <p>
	 * @param playerID L'ID del Giocatore.
	 * @param competitionStartYear L'anno di inizio dell'edizione della Competizione.
	 * @param competitionID L'ID della Competizione.
	 * @param comboBoxData La lista che conterrà gli anni in cui il Giocatore ha partecipato.
	 * @param comboBoxMap La mappa che conterrà l'associazione tra gli anni e altre informazioni.
	 */
	public void setTeamPlayComboBox(String playerID,
																	String competitionStartYear,
																	String competitionID,
																	Vector<String> comboBoxData,
																	Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamPlayDB(
						playerID,
						competitionStartYear,
						competitionID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta la vista 'Stagione' di una Squadra.
	 * <p>
	 * Questo metodo recupera i dati relativi a una stagione di una Squadra dal database in base all'ID della Squadra e all'anno di inizio forniti.
	 * I dati vengono inseriti nelle strutture dati fornite come parametri. La struttura `infoTeamMap` contiene le informazioni generali della Squadra,
	 * `teamSquadTableData` contiene i dati della rosa della Squadra, `teamSquadTableMap` contiene informazioni aggiuntive associate a ciascuna cella
	 * della tabella della rosa, `teamPartecipationTableData` contiene i dati sulle partecipazioni della Squadra alle Competizioni.
	 * <p>
	 * @param teamID L'ID della Squadra.
	 * @param startYear L'anno di inizio della stagione.
	 * @param infoTeamMap La mappa che conterrà le informazioni generali della Squadra.
	 * @param teamSquadTableData La matrice che conterrà i dati della rosa.
	 * @param teamSquadTableMap La mappa che conterrà informazioni aggiuntive associate a ciascuna cella della tabella della rosa.
	 * @param teamPartecipationTableData La matrice che conterrà i dati sulle partecipazioni della Squadra alle Competizioni.
	 */
	public void setTeamSeasonView(String teamID,
																String startYear,
																Map<String, String> infoTeamMap,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap,
																Vector<Vector<Object>> teamPartecipationTableData)
	{
		setTeamInfoMap(teamID, infoTeamMap);
		setPartecipationTable(teamID, startYear, teamPartecipationTableData);
		setTeamSquadTable(teamID, startYear, teamSquadTableData, teamSquadTableMap);
	}


	/**
	 * Imposta la vista 'Palmares' di una Squadra.
	 * <p>
	 * Questo metodo recupera i dati relativi al palmares di una Squadra dal database in base all'ID della Squadra e al tipo di Squadra forniti.
	 * I dati vengono inseriti nelle strutture dati fornite come parametri. La struttura `infoTeamMap` contiene le informazioni generali della Squadra,
	 * `teamTrophyTableData` contiene i dati sui trofei vinti dalla Squadra, `teamPrizeTableData` contiene i dati sui premi vinti dalla Squadra.
	 * <p>
	 * @param teamID L'ID della Squadra.
	 * @param teamType Il tipo di Squadra.
	 * @param infoTeamMap La mappa che conterrà le informazioni generali della Squadra.
	 * @param teamTrophyTableData La matrice che conterrà i dati sui trofei vinti.
	 * @param teamPrizeTableData La matrice che conterrà i dati sui premi vinti.
	 */
	public void setTeamCaseView(String teamID,
															String teamType,
															Map<String, String> infoTeamMap,
															Vector<Vector<String>> teamTrophyTableData,
															Vector<Vector<String>> teamPrizeTableData)
	{
		setTeamInfoMap(teamID, infoTeamMap);
		setTeamPrizeTable(teamID, teamPrizeTableData);
		setTeamTrophyTable(teamID, teamType, teamTrophyTableData);
	}


	/**
	 * Crea una nuova Squadra.
	 * <p>
	 * Questo metodo permette di creare una nuova Squadra nel database.
	 * Vengono effettuate delle verifiche sui dati forniti in ingresso tramite espressioni regolari per garantirne la validità.
	 * Solo gli utenti con privilegi di amministratore possono creare nuove Squadre.
	 * <p>
	 * @param teamType Il tipo di Squadra.
	 * @param teamLongName Il nome completo della Squadra.
	 * @param teamShortName Il codice identificativo della Squadra.
	 * @param countryID L'ID del Paese a cui appartiene la Squadra.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String createTeam(String teamType,
													 String teamLongName,
													 String teamShortName,
													 String countryID)
	{
		String message = null;

		if (!adminConnected) {
			message = "errorNoAdmin";
			return message;
		}

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			if (!Regex.patternAlnum.matcher(teamLongName).find()) {
				message = "errorMessageInput";
				return message;
			}

			if (!Regex.patternCode.matcher(teamShortName).find()) {
				message = "errorMessageInput";
				return message;
			}

			TeamDAO teamDAO = new PostgresImplTeamDAO();
			message = teamDAO.newClubTeamDB(countryID, teamLongName, teamShortName);
		} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			TeamDAO teamDAO = new PostgresImplTeamDAO();
			message = teamDAO.newNationalTeamDB(countryID);
		}

		return message;
	}


	/**
	 * Aggiorna i dati di una Squadra.
	 * <p>
	 * Questo metodo permette di modificare i dati di una Squadra già esistente nel database. Solo gli aggiornamenti di Squadre di club sono consentiti.
	 * Vengono effettuate delle verifiche sui dati forniti in ingresso tramite espressioni regolari per garantirne la validità.
	 * Solo gli utenti con privilegi di amministratore possono modificare le Squadre.
	 * <p>
	 * @param teamID L'ID della Squadra da modificare.
	 * @param teamType Il tipo di Squadra.
	 * @param teamLongName Il nuovo nome completo della Squadra.
	 * @param teamShortName Il nuovo codice identificativo della Squadra.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String updateTeam(String teamID,
													 String teamType,
													 String teamLongName,
													 String teamShortName)
	{
		String message = null;

		if (!adminConnected) {
			message = "errorNoAdmin";
			return message;
		}

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			message = "error";
			return message;
		}

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			if (!Regex.patternAlnum.matcher(teamLongName).find()) {
				message = "errorMessageInput";
				return message;
			}

			if (!Regex.patternCode.matcher(teamShortName).find()) {
				message = "errorMessageInput";
				return message;
			}

			TeamDAO teamDAO = new PostgresImplTeamDAO();
			message = teamDAO.updateClubTeamDB(teamID, teamLongName, teamShortName);
		}

		return message;
	}


	/**
	 * Elimina una Squadra.
	 * <p>
	 * Questo metodo permette di eliminare una Squadra esistente nel database. Solo gli utenti con privilegi di amministratore possono eliminare le Squadre.
	 * <p>
	 * @param teamID L'ID della Squadra da eliminare.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String deleteTeam(String teamID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.deleteTeamDB(teamID);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PLAYER
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Conta il numero di giocatori nel database.
	 * <p>
	 * @return Il numero di giocatori nel database.
	 */
	public Integer countPlayers()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.countPlayerDB();
	}


	/**
	 * Recupera le informazioni di un giocatore specifico dal database e le inserisce nella mappa data.
	 * <p>
	 * @param playerID L'ID del giocatore da cui recuperare le informazioni.
	 * @param infoPlayerMap La mappa che conterrà le informazioni del giocatore.
	 */
	public void setPlayerInfoMap(String playerID,
															 Map<String, String> infoPlayerMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						playerID,
						infoPlayerMap
		);
	}


	/**
	 * Recupera le informazioni dei giocatori che fanno parte di una squadra in una specifica stagione e le prepara per la visualizzazione in un ComboBox.
	 * <p>
	 * @param startYear L'anno di inizio della stagione.
	 * @param teamID L'ID della squadra.
	 * @param playerInfoVector Il vettore che conterrà le informazioni da visualizzare nel ComboBox.
	 * @param playerInfoMap La mappa che conterrà le informazioni complete dei giocatori.
	 */
	public void setPlayerComboBox(String startYear,
																String teamID,
																Vector<String> playerInfoVector,
																Map<String, String> playerInfoMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						startYear,
						teamID,
						playerInfoVector,
						playerInfoMap
		);
	}


	/**
	 * Recupera le stagioni in cui un giocatore ha militato in una Squadra specifica e le prepara per la visualizzazione in un ComboBox.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamType Il tipo di Squadra.
	 * @param seasonVector Il vettore che conterrà le stagioni in cui il giocatore ha militato.
	 * @param seasonMap La mappa che conterrà informazioni aggiuntive sulle stagioni.
	 */
	public void setPlayerComboBoxYear(String playerID,
																		String teamType,
																		Vector<String> seasonVector,
																		Map<String, String> seasonMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerYearDB(
						playerID,
						teamType,
						seasonVector,
						seasonMap
		);
	}


	/**
	 * Recupera i giocatori che soddisfano determinati criteri di ricerca e li prepara per la visualizzazione in una tabella.
	 * <p>
	 * @param playerSubName Stringa parziale del cognome del giocatore.
	 * @param playerSubSurname Stringa parziale del nome del giocatore.
	 * @param playerReferringYear Anno di riferimento per la ricerca.
	 * @param playerMinAge Età minima del giocatore.
	 * @param playerMaxAge Età massima del giocatore.
	 * @param playerContinentID ID del continente del giocatore.
	 * @param playerNationID ID della nazione del giocatore.
	 * @param playerRole Ruolo del giocatore.
	 * @param playerPositionID ID della posizione del giocatore.
	 * @param playerFoot Piede preferito del giocatore.
	 * @param playerTableData La matrice che conterrà i dati dei giocatori trovati.
	 * @param playerTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui giocatori.
	 */
	public void setPlayerTable(String playerSubName,
														 String playerSubSurname,
														 String playerReferringYear,
														 String playerMinAge,
														 String playerMaxAge,
														 String playerContinentID,
														 String playerNationID,
														 String playerRole,
														 String playerPositionID,
														 String playerFoot,
														 Vector<Vector<String>> playerTableData,
														 Map<Integer, Map<Integer, String>> playerTableMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						playerSubName,
						playerSubSurname,
						playerReferringYear,
						playerMinAge,
						playerMaxAge,
						playerContinentID,
						playerNationID,
						playerRole,
						playerPositionID,
						playerFoot,
						playerTableData,
						playerTableMap
		);
	}


	/**
	 * Recupera i giocatori che hanno militato in una Squadra specifica in un intervallo di anni e li prepara per la visualizzazione in una tabella.
	 * <p>
	 * @param militancyPlayerTeamID L'ID della Squadra.
	 * @param militancyPlayerStartYear L'anno di inizio dell'intervallo.
	 * @param militancyPlayerEndYear L'anno di fine dell'intervallo.
	 * @param playerTableData La matrice che conterrà i dati dei giocatori trovati.
	 * @param playerTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui giocatori.
	 */
	public void setPlayerTable(String militancyPlayerTeamID,
														 String militancyPlayerStartYear,
														 String militancyPlayerEndYear,
														 Vector<Vector<String>> playerTableData,
														 Map<Integer, Map<Integer, String>> playerTableMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						militancyPlayerTeamID,
						militancyPlayerStartYear,
						militancyPlayerEndYear,
						playerTableData,
						playerTableMap
		);
	}


	/**
	 * Imposta la visualizzazione generale di un giocatore.
	 * <p>
	 * Questo metodo recupera le informazioni di un giocatore, la sua posizione e le sue nazionalità,
	 * e le prepara per la visualizzazione in un'interfaccia utente.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param infoPlayerMap La mappa che conterrà le informazioni generali del giocatore.
	 * @param playerPositionTableData La matrice che conterrà i dati sulle posizioni del giocatore.
	 * @param playerNationalityTableData La matrice che conterrà i dati sulle nazionalità del giocatore.
	 */
	public void setPlayerGeneralView(String playerID,
																	 Map<String, String> infoPlayerMap,
																	 Vector<Vector<String>> playerPositionTableData,
																	 Vector<Vector<String>> playerNationalityTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPositionTable(playerID, playerPositionTableData);
		setNationalityTable(playerID, playerNationalityTableData);
	}


	/**
	 * Imposta la visualizzazione dettagliata di un giocatore.
	 * <p>
	 * Questo metodo recupera le informazioni dettagliate di un giocatore, inclusi i suoi attributi calcistici e i suoi tag,
	 * e le prepara per la visualizzazione in un'interfaccia utente.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param infoPlayerMap La mappa che conterrà le informazioni generali del giocatore.
	 * @param playerAttributeGoalkeepingTableData La matrice che conterrà i dati sugli attributi di portiere del giocatore.
	 * @param playerAttributeMentalTableData La matrice che conterrà i dati sugli attributi mentali del giocatore.
	 * @param playerAttributePhysicalTableData La matrice che conterrà i dati sugli attributi fisici del giocatore.
	 * @param playerAttributeTechnicalTableData La matrice che conterrà i dati sugli attributi tecnici del giocatore.
	 * @param playerTagTableData La matrice che conterrà i dati sui tag del giocatore.
	 */
	public void setPlayerDetailedView(String playerID,
																		Map<String, String> infoPlayerMap,
																		Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																		Vector<Vector<String>> playerAttributeMentalTableData,
																		Vector<Vector<String>> playerAttributePhysicalTableData,
																		Vector<Vector<String>> playerAttributeTechnicalTableData,
																		Vector<Vector<String>> playerTagTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setAttributeGoalkeepingTable(playerID, playerAttributeGoalkeepingTableData);
		setAttributeMentalTable(playerID, playerAttributeMentalTableData);
		setAttributePhysicalTable(playerID, playerAttributePhysicalTableData);
		setAttributeTechnicalTable(playerID, playerAttributeTechnicalTableData);
		setTagTable(playerID, playerTagTableData);
	}


	/**
	 * Imposta la visualizzazione della carriera di un giocatore.
	 * <p>
	 * Questo metodo recupera la carriera di un giocatore, sia nei club che nelle nazionali,
	 * e la prepara per la visualizzazione in un'interfaccia utente.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param infoPlayerMap La mappa che conterrà le informazioni generali del giocatore.
	 * @param playerClubCareerTableData La matrice che conterrà i dati sulla carriera del giocatore nei club.
	 * @param playerClubCareerTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sulla carriera del giocatore nei club.
	 * @param playerNationalCareerTableData La matrice che conterrà i dati sulla carriera del giocatore nelle nazionali.
	 * @param playerNationalCareerTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sulla carriera del giocatore nelle nazionali.
	 */
	public void setPlayerCareerView(String playerID,
																	Map<String, String> infoPlayerMap,
																	Vector<Vector<String>> playerClubCareerTableData,
																	Map<Integer, Map<Integer, String>> playerClubCareerTableMap,
																	Vector<Vector<String>> playerNationalCareerTableData,
																	Map<Integer, Map<Integer, String>> playerNationalCareerTableMap)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setClubCareerTable(playerID, playerClubCareerTableData, playerClubCareerTableMap);
		setNationalCareerTable(playerID, playerNationalCareerTableData, playerNationalCareerTableMap);
	}


	/**
	 * Imposta la visualizzazione delle statistiche di un giocatore.
	 * <p>
	 * Questo metodo recupera le statistiche di un giocatore in un determinato periodo e per una specifica competizione,
	 * e le prepara per la visualizzazione in un'interfaccia utente.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamType Il tipo di Squadra.
	 * @param teamID L'ID della Squadra.
	 * @param competitionID L'ID della competizione.
	 * @param startYear L'anno di inizio del periodo.
	 * @param endYear L'anno di fine del periodo.
	 * @param infoPlayerMap La mappa che conterrà le informazioni generali del giocatore.
	 * @param playerStatisticTableData La matrice che conterrà i dati statistici del giocatore.
	 * @param playerStatisticTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sulle statistiche del giocatore.
	 */
	public void setPlayerStatisticView(String playerID,
																		 String teamType,
																		 String teamID,
																		 String competitionID,
																		 String startYear,
																		 String endYear,
																		 Map<String, String> infoPlayerMap,
																		 Vector<Vector<Object>> playerStatisticTableData,
																		 Map<Integer, Map<Integer, String>> playerStatisticTableMap)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPlayerStatisticTable(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear,
						playerStatisticTableData,
						playerStatisticTableMap
		);
	}


	/**
	 * Imposta la visualizzazione del palmarès di un giocatore.
	 * <p>
	 * Questo metodo recupera i trofei vinti da un giocatore a livello di club e nazionale,
	 * e i premi individuali ricevuti, e li prepara per la visualizzazione in un'interfaccia utente.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param infoPlayerMap La mappa che conterrà le informazioni generali del giocatore.
	 * @param playerClubTrophyTableData La matrice che conterrà i dati sui trofei vinti dal giocatore a livello di club.
	 * @param playerClubTrophyTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui trofei vinti dal giocatore a livello di club.
	 * @param playerNationalTrophyTableData La matrice che conterrà i dati sui trofei vinti dal giocatore a livello nazionale.
	 * @param playerNationalTrophyTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui trofei vinti dal giocatore a livello nazionale.
	 * @param playerPrizeTableData La matrice che conterrà i dati sui premi individuali ricevuti dal giocatore.
	 */
	public void setPlayerCaseView(String playerID,
																Map<String, String> infoPlayerMap,
																Vector<Vector<String>> playerClubTrophyTableData,
																Map<Integer, Map<Integer, String>> playerClubTrophyTableMap,
																Vector<Vector<String>> playerNationalTrophyTableData,
																Map<Integer, Map<Integer, String>> playerNationalTrophyTableMap,
																Vector<Vector<String>> playerPrizeTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPlayerTrophyTable(playerID, "CLUB", playerClubTrophyTableData, playerClubTrophyTableMap);
		setPlayerTrophyTable(playerID, "NATIONAL", playerNationalTrophyTableData, playerNationalTrophyTableMap);
		setPlayerPrizeTable(playerID, playerPrizeTableData);
	}


	/**
	 * Recupera un giocatore casuale dal database.
	 * <p>
	 * @return L'ID del giocatore casuale.
	 */
	public String getRandomPlayer()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.randomPlayerDB();
	}


	/**
	 * Recupera l'anno di nascita del giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @return L'anno di nascita del giocatore.
	 */
	public String setPlayerYear(String playerID)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.fetchPlayerYearDB(playerID);
	}


	/**
	 * Crea un nuovo giocatore nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param name Il nome del giocatore.
	 * @param surname Il cognome del giocatore.
	 * @param dob La data di nascita del giocatore.
	 * @param countryID L'ID del paese del giocatore.
	 * @param foot Il piede preferito del giocatore.
	 * @param positionID L'ID della posizione del giocatore.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String newPlayer(String name,
													String surname,
													String dob,
													String countryID,
													String foot,
													String positionID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.newPlayerDB(
						name,
						surname,
						dob,
						countryID,
						foot,
						positionID
		);
	}


	/**
	 * Elimina un giocatore dal database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param playerID L'ID del giocatore da eliminare.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String deletePlayer(String playerID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.deletePlayerDB(playerID);
	}


	/**
	 * Aggiorna le informazioni di un giocatore nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param playerID L'ID del giocatore da aggiornare.
	 * @param name Il nuovo nome del giocatore.
	 * @param surname Il nuovo cognome del giocatore.
	 * @param dob La nuova data di nascita del giocatore.
	 * @param countryID Il nuovo ID del paese del giocatore.
	 * @param foot Il nuovo piede preferito del giocatore.
	 * @param positionID Il nuovo ID della posizione del giocatore.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String updatePlayer(String playerID,
														 String name,
														 String surname,
														 String dob,
														 String countryID,
														 String foot,
														 String positionID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.updatePlayerDB(
						playerID,
						name,
						surname,
						dob,
						countryID,
						foot,
						positionID
		);
	}


	/**
	 * Imposta la data di ritiro di un giocatore nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param playerID L'ID del giocatore di cui impostare la data di ritiro.
	 * @param retiredDate La nuova data di ritiro del giocatore.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String setRetiredDate(String playerID,
															 String retiredDate)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.setRetiredDateDB(
						playerID,
						retiredDate
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * POSITION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Imposta un ComboBox con i nomi delle posizioni recuperando i dati dal database.
	 *
	 * @param positionNameVector Il vettore che conterrà i nomi delle posizioni da mostrare nel ComboBox.
	 * @param positionNameMap La mappa che conterrà le informazioni aggiuntive sulle posizioni (ID, nome).
	 */
	public void setPositionComboBox(Vector<String> positionNameVector,
																	Map<String, String> positionNameMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						positionNameVector,
						positionNameMap
		);
	}


	/**
	 * Imposta una tabella con le posizioni del giocatore recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le posizioni.
	 * @param playerPositionTableData La matrice che conterrà i dati sulle posizioni del giocatore da mostrare nella tabella.
	 */
	public void setPositionTable(String playerID,
															 Vector<Vector<String>> playerPositionTableData)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						playerID,
						playerPositionTableData
		);
	}


	/**
	 * Imposta una tabella con informazioni dettagliate sulle posizioni del giocatore recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le posizioni.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setPositionTable(String playerID,
															 Vector<Vector<Object>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Aggiunge una posizione a un giocatore nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param playerID L'ID del giocatore a cui aggiungere la posizione.
	 * @param positionID L'ID della posizione da aggiungere.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String addPlayerPosition(String playerID,
																	String positionID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.newPlayerPositionDB(
						playerID,
						positionID
		);
	}


	/**
	 * Rimuove una posizione da un giocatore nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere la posizione.
	 * @param positionID L'ID della posizione da rimuovere.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String removePlayerPosition(String playerID,
																		 String positionID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.deletePlayerPositionDB(
						playerID,
						positionID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * STATISTIC
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Imposta una tabella con le statistiche totali recuperando i dati dal database.
	 * <p>
	 * @param teamType Il tipo di squadra.
	 * @param playerRole Il ruolo del giocatore.
	 * @param statisticTableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param statisticTableDataMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setStatisticTable(String teamType,
																String playerRole,
																Vector<Vector<Object>> statisticTableData,
																Map<Integer, Map<Integer, String>> statisticTableDataMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticTotalDB(
						teamType,
						playerRole,
						statisticTableData,
						statisticTableDataMap
		);
	}


	/**
	 * Imposta una tabella con le statistiche per un'edizione specifica di una competizione recuperando i dati dal database.
	 * <p>
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param competitionID L'ID della competizione.
	 * @param statisticTableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param statisticTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setStatisticCompetitionEditionTable(String competitionStartYear,
																									String competitionID,
																									Vector<Vector<Object>> statisticTableData,
																									Map<Integer, Map<Integer, String>> statisticTableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticEditionDB(
						competitionStartYear,
						competitionID,
						statisticTableData,
						statisticTableMap
		);
	}


	/**
	 * Imposta una tabella con le statistiche di un giocatore specifico recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le statistiche.
	 * @param teamType Il tipo di squadra.
	 * @param teamID L'ID della squadra.
	 * @param competitionID L'ID della competizione.
	 * @param startYear L'anno di inizio del periodo da considerare per le statistiche.
	 * @param endYear L'anno di fine del periodo da considerare per le statistiche.
	 * @param playerStatisticTableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param playerStatisticTableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setPlayerStatisticTable(String playerID,
																			String teamType,
																			String teamID,
																			String competitionID,
																			String startYear,
																			String endYear,
																			Vector<Vector<Object>> playerStatisticTableData,
																			Map<Integer, Map<Integer, String>> playerStatisticTableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticPlayerDB(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear,
						playerStatisticTableData,
						playerStatisticTableMap
		);
	}


	/**
	 * Imposta una mappa di dati statistici per la visualizzazione nell'interfaccia amministrativa, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le statistiche.
	 * @param teamID L'ID della squadra del giocatore.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param dataMap La mappa che verrà riempita con i dati statistici da visualizzare.
	 * @return L'ID che identifica il gioco di un calciatore associato alle statistiche
	 */
	public String setStatisticMapAdmin(String playerID,
																		 String teamID,
																		 String competitionID,
																		 String competitionStartYear,
																		 Map<String, String> dataMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		return statisticDAO.fetchStatisticAdminDB(
						playerID,
						teamID,
						competitionID,
						competitionStartYear,
						dataMap
		);
	}


	/**
	 * Aggiorna le statistiche di una partita nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param playID L'ID della partita di cui si vogliono aggiornare le statistiche.
	 * @param match Il numero della partita.
	 * @param goalScored Il numero di gol segnati.
	 * @param assist Il numero di assist effettuati.
	 * @param yellowCard Il numero di cartellini gialli ricevuti.
	 * @param redCard Il numero di cartellini rossi ricevuti.
	 * @param penaltyScored Il numero di rigori segnati.
	 * @param goalConceded Il numero di gol subiti.
	 * @param penaltySaved Il numero di rigori parati.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String updateStatistic(String playID,
																String match,
																String goalScored,
																String assist,
																String yellowCard,
																String redCard,
																String penaltyScored,
																String goalConceded,
																String penaltySaved)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		return statisticDAO.updateStatisticDB(
						playID,
						match,
						goalScored,
						assist,
						yellowCard,
						redCard,
						penaltyScored,
						goalConceded,
						penaltySaved
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PARTECIPATION
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * Imposta una tabella con le partecipazioni di una squadra ad una competizione in un anno specifico, recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare le partecipazioni.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param teamPartecipationTableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setPartecipationTable(String teamID,
																		String competitionStartYear,
																		Vector<Vector<Object>> teamPartecipationTableData)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationDB(teamID, competitionStartYear, teamPartecipationTableData);
	}


	/**
	 * Imposta una tabella con le partecipazioni di una squadra ad una competizione in un anno specifico, recuperando i dati dal database (versione per l'interfaccia amministrativa).
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare le partecipazioni.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param teamPartecipationTableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setPartecipationTableAdmin(String teamID,
																				 String competitionStartYear,
																				 Vector<Vector<Object>> teamPartecipationTableData,
																				 Map<Integer, Map<Integer, String>> tableMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationAdminDB(
						teamID,
						competitionStartYear,
						teamPartecipationTableData,
						tableMap
		);
	}


	/**
	 * Imposta un ComboBox con gli anni di partecipazione di una squadra ad una competizione, recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare gli anni di partecipazione.
	 * @param teamType Il tipo di squadra.
	 * @param partecipationYearVector Il vettore che conterrà gli anni di partecipazione da mostrare nel ComboBox.
	 * @param partecipationYearMap La mappa che conterrà informazioni aggiuntive sugli anni di partecipazione.
	 */
	public void setPartecipationYearComboBox(String teamID,
																					 String teamType,
																					 Vector<String> partecipationYearVector,
																					 Map<String, String> partecipationYearMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationYearDB(
						teamID,
						teamType,
						partecipationYearVector,
						partecipationYearMap
		);
	}


	/**
	 * Imposta un ComboBox con le competizioni a cui ha partecipato una squadra in un anno specifico, recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare le partecipazioni.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param partecipationNameVector Il vettore che conterrà i nomi delle competizioni da mostrare nel ComboBox.
	 * @param partecipationNameMap La mappa che conterrà informazioni aggiuntive sulle competizioni.
	 */
	public void setPartecipationComboBox(String teamID,
																			 String competitionStartYear,
																			 Vector<String> partecipationNameVector,
																			 Map<String, String> partecipationNameMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationDB(
						teamID,
						competitionStartYear,
						partecipationNameVector,
						partecipationNameMap
		);
	}



	/**
	 * Elimina una partecipazione di una squadra ad una competizione dal database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param teamID L'ID della squadra la cui partecipazione deve essere eliminata.
	 * @param competitionID L'ID della competizione da cui eliminare la partecipazione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String deletePartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.deletePartecipationDB(teamID, competitionID, competitionStartYear);
	}


	/**
	 * Crea una nuova partecipazione di una squadra ad una competizione nel database. Solo gli utenti con privilegi di amministratore possono effettuare tale operazione.
	 * <p>
	 * @param teamID L'ID della squadra che partecipa alla competizione.
	 * @param competitionID L'ID della competizione a cui la squadra partecipa.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String createPartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.newPartecipationDB(teamID, competitionID, competitionStartYear);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * MILITANCY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Imposta una tabella con la rosa della squadra per una stagione specifica, recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vuole visualizzare la rosa.
	 * @param startYear L'anno di inizio della stagione.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setTeamSquadTable(String teamID,
																String startYear,
																Vector<Vector<String>> tableData,
																Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(teamID, startYear, tableData, tableMap);
	}


	/**
	 * Imposta una tabella con le Carriere Nazionali di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le carriere nazionali.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setNationalCareerTable(String playerID,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNationalDB(playerID, tableData, tableMap);
	}

	/**
	 * Imposta una tabella con le Carriere di Club di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le carriere di club.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setClubCareerTable(String playerID,
																 Vector<Vector<String>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClubDB(playerID, tableData, tableMap);
	}


	/**
	 * Imposta una tabella con le Carriere Nazionali di un giocatore per l'interfaccia amministrativa, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le carriere nazionali.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setNationalCareerAdmin(String playerID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNationalAdminDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta una tabella con le Carriere di Club di un giocatore per l'interfaccia amministrativa, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le carriere di club.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setClubCareerAdmin(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClubAdminDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Crea un nuovo record di militanza di un giocatore in una squadra nel database (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamID L'ID della squadra.
	 * @param teamType Il tipo di squadra.
	 * @param startYear L'anno di inizio della militanza.
	 * @param seasonType Il tipo di stagione.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String newMilitancy(String playerID,
														 String teamID,
														 String teamType,
														 String startYear,
														 String seasonType)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		return militancyDAO.newMilitancyDB(
						playerID,
						teamID,
						teamType,
						startYear,
						seasonType
		);
	}


	/**
	 * Elimina un record di militanza di un giocatore in una squadra dal database (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamID L'ID della squadra.
	 * @param startYear L'anno di inizio della militanza da eliminare.
	 * @return Un messaggio di successo o un messaggio di errore.
	 */
	public String deleteMilitancy(String playerID,
																String teamID,
																String startYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		return militancyDAO.deleteMilitancyDB(
						playerID,
						teamID,
						startYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TROPHY
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * Imposta un ComboBox con i nomi dei trofei vinti dalle squadre, recuperando i dati dal database.
	 * <p>
	 * @param comboBoxData Il vettore che conterrà i nomi dei trofei da mostrare nel ComboBox.
	 * @param comboBoxMap La mappa che conterrà informazioni aggiuntive sui trofei.
	 */
	public void setTeamTrophyComboBox(Vector<String> comboBoxData,
																		Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophyDB(comboBoxData, comboBoxMap);
	}


	/**
	 * Imposta un ComboBox con i nomi dei trofei vinti dai giocatori, recuperando i dati dal database.
	 * <p>
	 * @param comboBoxData Il vettore che conterrà i nomi dei trofei da mostrare nel ComboBox.
	 * @param comboBoxMap La mappa che conterrà informazioni aggiuntive sui trofei.
	 */
	public void setPlayerTrophyComboBox(Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchPlayerTrophyDB(comboBoxData, comboBoxMap);
	}


	/**
	 * Imposta una tabella con i trofei vinti da una squadra in un certo campionato, recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare i trofei.
	 * @param teamType Il tipo di squadra.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setTeamTrophyTable(String teamID,
																 String teamType,
																 Vector<Vector<String>> tableData)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						teamID,
						teamType,
						tableData
		);
	}


	/**
	 * Imposta una tabella con i trofei vinti da una squadra in un certo campionato (versione per l'interfaccia amministrativa), recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare i trofei.
	 * @param teamType Il tipo di squadra.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setTeamTrophyTableAdmin(String teamID,
																			String teamType,
																			Vector<Vector<Object>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophyAdminDB(
						teamID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta una tabella con i trofei vinti da un giocatore in una certa squadra, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare i trofei.
	 * @param teamType Il tipo di squadra in cui il giocatore ha vinto i trofei.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setPlayerTrophyTable(String playerID,
																	 String teamType,
																	 Vector<Vector<String>> tableData,
																	 Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						playerID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta una tabella con i trofei vinti da un giocatore in una certa squadra (versione per l'interfaccia amministrativa), recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare i trofei.
	 * @param teamType Il tipo di squadra in cui il giocatore ha vinto i trofei.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setPlayerTrophyTableAdmin(String playerID,
																				String teamType,
																				Vector<Vector<Object>> tableData,
																				Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyPlayerAdminDB(
						playerID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Assegna un trofeo ad una squadra per una specifica competizione (per l'amministratore).
	 * <p>
	 * @param teamID L'ID della squadra a cui assegnare il trofeo.
	 * @param trophyID L'ID del trofeo da assegnare.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String assignTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.newTrophyTeamDB(
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Rimuove un trofeo precedentemente assegnato ad una squadra per una specifica competizione (per l'amministratore).
	 * <p>
	 * @param teamID L'ID della squadra da cui rimuovere il trofeo.
	 * @param trophyID L'ID del trofeo da rimuovere.
	 * @param competitionID L'ID della competizione in cui era stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String removeTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.deleteTrophyTeamDB(
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Assegna un trofeo ad un giocatore per una specifica competizione (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare il trofeo.
	 * @param teamID L'ID della squadra in cui il giocatore ha vinto il trofeo.
	 * @param trophyID L'ID del trofeo da assegnare.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String assignTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.newTrophyPlayerDB(
						playerID,
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Rimuove un trofeo precedentemente assegnato ad un giocatore per una specifica competizione (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere il trofeo.
	 * @param teamID L'ID della squadra in cui il giocatore aveva vinto il trofeo.
	 * @param trophyID L'ID del trofeo da rimuovere.
	 * @param competitionID L'ID della competizione in cui era stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String removeTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.deleteTrophyPlayerDB(
						playerID,
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PRIZE
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * Imposta un ComboBox con i nomi dei premi vinti dalle squadre, recuperando i dati dal database.
	 * <p>
	 * @param comboBoxData Il vettore che conterrà i nomi dei premi da mostrare nel ComboBox.
	 * @param comboBoxMap La mappa che conterrà informazioni aggiuntive sui premi.
	 */
	public void setTeamPrizeComboBox(Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeDB(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta un ComboBox con i nomi dei premi vinti dai giocatori, recuperando i dati dal database.
	 * <p>
	 * @param comboBoxData Il vettore che conterrà i nomi dei premi da mostrare nel ComboBox.
	 * @param comboBoxMap La mappa che conterrà informazioni aggiuntive sui premi.
	 */
	public void setPlayerPrizeComboBox(Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrizeDB(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Imposta una tabella con i premi vinti da una squadra, recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare i premi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setTeamPrizeTable(String teamID,
																Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizeDB(teamID, tableData);
	}


	/**
	 * Imposta una tabella con i premi vinti da una squadra (versione per l'interfaccia amministrativa), recuperando i dati dal database.
	 * <p>
	 * @param teamID L'ID della squadra di cui si vogliono visualizzare i premi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setTeamPrizeTableAdmin(String teamID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeAdminDB(
						teamID,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta una tabella con i premi vinti da un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare i premi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizePlayerDB(playerID, tableData);
	}


	/**
	 * Assegna un premio ad una squadra per un anno specifico (per l'amministratore).
	 * <p>
	 * @param teamID L'ID della squadra a cui assegnare il premio.
	 * @param prizeID L'ID del premio da assegnare.
	 * @param assignedYear L'anno in cui è stato assegnato il premio.
	 * @return Un messaggio di conferma o un messaggio di errore se l'amministratore non è collegato.
	 */
	public String assignPrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPrizeTeamDB(
						teamID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * Rimuove un premio precedentemente assegnato ad una squadra per un anno specifico (per l'amministratore).
	 * <p>
	 * @param teamID L'ID della squadra da cui rimuovere il premio.
	 * @param prizeID L'ID del premio da rimuovere.
	 * @param assignedYear L'anno in cui era stato assegnato il premio.
	 * @return Un messaggio di conferma o un messaggio di errore se l'amministratore non è collegato.
	 */
	public String removePrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePrizeTeamDB(
						teamID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * Imposta una tabella con i premi vinti da un giocatore (versione per l'interfaccia amministrativa), recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare i premi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<Object>> tableData,
																	Map<Integer, Map<Integer, String>> tableMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrizeDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Assegna un premio a un giocatore per un anno specifico (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare il premio.
	 * @param prizeID L'ID del premio da assegnare.
	 * @param assignedYear L'anno in cui è stato assegnato il premio.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String addPlayerPrize(String playerID,
															 String prizeID,
															 String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPlayerPrizeDB(
						playerID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * Rimuove un premio precedentemente assegnato a un giocatore per un anno specifico (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere il premio.
	 * @param prizeID L'ID del premio da rimuovere.
	 * @param assignedYear L'anno in cui era stato assegnato il premio.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String deletePlayerPrize(String playerID,
																	String prizeID,
																	String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePlayerPrizeDB(
						playerID,
						prizeID,
						assignedYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * NATIONALITY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Imposta una tabella con le nazionalità di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le nazionalità.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setNationalityTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(
						playerID,
						tableData
		);
	}


	/**
	 * Imposta una tabella con le nazionalità di un giocatore (versione per l'interfaccia amministrativa), recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare le nazionalità.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 * @param tableMap La mappa bidimensionale che conterrà informazioni aggiuntive sui dati da mostrare nella tabella.
	 */
	public void setNationalityTable(String playerID,
																	Vector<Vector<Object>> tableData,
																	Map<Integer, Map<Integer, String>> tableMap)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Assegna una nazionalità a un giocatore (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare la nazionalità.
	 * @param countryID L'ID del paese da assegnare come nazionalità.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String addNationality(String playerID,
															 String countryID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		return nationalityDAO.newNationalityDB(
						playerID,
						countryID
		);
	}


	/**
	 * Rimuove una nazionalità precedentemente assegnata a un giocatore (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere la nazionalità.
	 * @param countryID L'ID del paese precedentemente assegnato come nazionalità.
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String removeNationality(String playerID,
																	String countryID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		return nationalityDAO.deleteNationalityDB(
						playerID,
						countryID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * ATTRIBUTE
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Imposta una tabella con gli attributi relativi alle abilità da portiere di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare gli attributi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setAttributeGoalkeepingTable(String playerID,
																					 Vector<Vector<String>> tableData)
	{
		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		attributeGoalkeepingDAO.fetchAttributeGoalkeepingDB(playerID, tableData);
	}


	/**
	 * Imposta una tabella con gli attributi mentali di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare gli attributi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setAttributeMentalTable(String playerID,
																			Vector<Vector<String>> tableData)
	{
		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		attributeMentalDAO.fetchAttributeMentalDB(playerID, tableData);
	}


	/**
	 * Imposta una tabella con gli attributi fisici di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare gli attributi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setAttributePhysicalTable(String playerID,
																				Vector<Vector<String>> tableData)
	{
		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		attributePhysicalDAO.fetchAttributePhysicalDB(playerID, tableData);
	}


	/**
	 * Imposta una tabella con gli attributi tecnici di un giocatore, recuperando i dati dal database.
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono visualizzare gli attributi.
	 * @param tableData La matrice che conterrà i dati da mostrare nella tabella.
	 */
	public void setAttributeTechnicalTable(String playerID,
																				 Vector<Vector<String>> tableData)
	{
		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		attributeTechnicalDAO.fetchAttributeTechnicalDB(playerID, tableData);
	}


	/**
	 * Aggiorna gli attributi relativi alle abilità da portiere di un giocatore (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono aggiornare gli attributi.
	 * @param aerialReach Il nuovo valore da assegnare all'attributo "Aerial Reach".
	 * @param commandOfArea Il nuovo valore da assegnare all'attributo "Command of Area".
	 * @param communication Il nuovo valore da assegnare all'attributo "Communication".
	 * @param eccentricity Il nuovo valore da assegnare all'attributo "Eccentricity".
	 * @param firstTouchGk Il nuovo valore da assegnare all'attributo "First Touch Gk".
	 * @param handling Il nuovo valore da assegnare all'attributo "Handling".
	 * @param kicking Il nuovo valore da assegnare all'attributo "Kicking".
	 * @param oneOnOnes Il nuovo valore da assegnare all'attributo "One on Ones".
	 * @param passingGk Il nuovo valore da assegnare all'attributo "Passing Gk".
	 * @param punchingTendency Il nuovo valore da assegnare all'attributo "Punching Tendency".
	 * @param reflexes Il nuovo valore da assegnare all'attributo "Reflexes".
	 * @param rushingOutTendency Il nuovo valore da assegnare all'attributo "Rushing Out Tendency".
	 * @param throwing Il nuovo valore da assegnare all'attributo "Throwing".
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String updateAttributeGoalkeeping(String playerID,
																					 String aerialReach,
																					 String commandOfArea,
																					 String communication,
																					 String eccentricity,
																					 String firstTouchGk,
																					 String handling,
																					 String kicking,
																					 String oneOnOnes,
																					 String passingGk,
																					 String punchingTendency,
																					 String reflexes,
																					 String rushingOutTendency,
																					 String throwing)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		return attributeGoalkeepingDAO.updateAttributeGoalkeepingDB(
						playerID,
						aerialReach,
						commandOfArea,
						communication,
						eccentricity,
						firstTouchGk,
						handling,
						kicking,
						oneOnOnes,
						passingGk,
						punchingTendency,
						reflexes,
						rushingOutTendency,
						throwing
		);
	}


	/**
	 * Aggiorna gli attributi mentali di un giocatore (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono tualizare gli attributi.
	 * @param aggression Il nuovo valore da assegnare all'attributo "Aggression".
	 * @param anticipation Il nuovo valore da assegnare all'attributo "Anticipation".
	 * @param bravery Il nuovo valore da assegnare all'attributo "Bravery".
	 * @param composure Il nuovo valore da assegnare all'attributo "Composure".
	 * @param concentration Il nuovo valore da assegnare all'attributo "Concentration".
	 * @param decision Il nuovo valore da assegnare all'attributo "Decision".
	 * @param determination Il nuovo valore da assegnare all'attributo "Determination".
	 * @param flair Il nuovo valore da assegnare all'attributo "Flair".
	 * @param leadership Il nuovo valore da assegnare all'attributo "Leadership".
	 * @param offTheBall Il nuovo valore da assegnare all'attributo "Off the Ball".
	 * @param positioning Il nuovo valore da assegnare all'attributo "Positioning".
	 * @param teamwork Il nuovo valore da assegnare all'attributo "Teamwork".
	 * @param vision Il nuovo valore da assegnare all'attributo "Vision".
	 * @param workRate Il nuovo valore da assegnare all'attributo "Work Rate".
	 * @return Un messaggio di conferma o un messaggio di errore.
	 */
	public String updateAttributeMental(String playerID,
																			String aggression,
																			String anticipation,
																			String bravery,
																			String composure,
																			String concentration,
																			String decision,
																			String determination,
																			String flair,
																			String leadership,
																			String offTheBall,
																			String positioning,
																			String teamwork,
																			String vision,
																			String workRate)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		return attributeMentalDAO.updateAttributeMentalDB(
						playerID,
						aggression,
						anticipation,
						bravery,
						composure,
						concentration,
						decision,
						determination,
						flair,
						leadership,
						offTheBall,
						positioning,
						teamwork,
						vision,
						workRate
		);
	}


	/**
	 * Aggiorna gli attributi fisici di un giocatore (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono aggiornare gli attributi.
	 * @param acceleration Il nuovo valore da assegnare all'attributo "Acceleration".
	 * @param agility Il nuovo valore da assegnare all'attributo "Agility".
	 * @param balance Il nuovo valore da assegnare all'attributo "Balance".
	 * @param jumpingReach Il nuovo valore da assegnare all'attributo "Jumping Reach".
	 * @param naturalFitness Il nuovo valore da assegnare all'attributo "Natural Fitness".
	 * @param pace Il nuovo valore da assegnare all'attributo "Pace".
	 * @param stamina Il nuovo valore da assegnare all'attributo "Stamina".
	 * @param strength Il nuovo valore da assegnare all'attributo "Strength".
	 * @return Un messaggio di conferma o un messaggio di errore se l'amministratore non è collegato.
	 */
	public String updateAttributePhysical(String playerID,
																				String acceleration,
																				String agility,
																				String balance,
																				String jumpingReach,
																				String naturalFitness,
																				String pace,
																				String stamina,
																				String strength)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		return attributePhysicalDAO.updateAttributePhysicalDB(
						playerID,
						acceleration,
						agility,
						balance,
						jumpingReach,
						naturalFitness,
						pace,
						stamina,
						strength
		);
	}


	/**
	 * Aggiorna gli attributi tecnici di un giocatore (per l'amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore di cui si vogliono tualizare gli attributi.
	 * @param corners Il nuovo valore da assegnare all'attributo "Corners".
	 * @param crossing Il nuovo valore da assegnare all'attributo "Crossing".
	 * @param dribbling Il nuovo valore da assegnare all'attributo "Dribbling".
	 * @param finishing Il nuovo valore da assegnare all'attributo "Finishing".
	 * @param firstTouch Il nuovo valore da assegnare all'attributo "First Touch".
	 * @param freeKickTaking Il nuovo valore da assegnare all'attributo "Free Kick Taking".
	 * @param heading Il nuovo valore da assegnare all'attributo "Heading".
	 * @param longShots Il nuovo valore da assegnare all'attributo "Long Shots".
	 * @param longThrows Il nuovo valore da assegnare all'attributo "Long Throws".
	 * @param marking Il nuovo valore da assegnare all'attributo "Marking".
	 * @param passing Il nuovo valore da assegnare all'attributo "Passing".
	 * @param penaltyTaking Il nuovo valore da assegnare all'attributo "Penalty Taking".
	 * @param tackling Il nuovo valore da assegnare all'attributo "Tackling".
	 * @param technique Il nuovo valore da assegnare all'attributo "Technique".
	 * @return Un messaggio di conferma o un messaggio di errore se l'amministratore non è collegato.
	 */
	public String updateAttributeTechnical(String playerID,
																				 String corners,
																				 String crossing,
																				 String dribbling,
																				 String finishing,
																				 String firstTouch,
																				 String freeKickTaking,
																				 String heading,
																				 String longShots,
																				 String longThrows,
																				 String marking,
																				 String passing,
																				 String penaltyTaking,
																				 String tackling,
																				 String technique)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		return attributeTechnicalDAO.updateAttributeTechnicalDB(
						playerID,
						corners,
						crossing,
						dribbling,
						finishing,
						firstTouch,
						freeKickTaking,
						heading,
						longShots,
						longThrows,
						marking,
						passing,
						penaltyTaking,
						tackling,
						technique
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TAG
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Imposta la tabella dei tag associata a un giocatore.
	 * <p>
	 * @param playerID L'ID del giocatore per cui impostare la tabella dei tag.
	 * @param tableData I dati della tabella dei tag.
	 */
	public void setTagTable(String playerID,
													Vector<Vector<String>> tableData)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						playerID,
						tableData
		);
	}


	/**
	 * Imposta la tabella dei tag associata a un giocatore.
	 * <p>
	 * @param playerID L'ID del giocatore per cui impostare la tabella dei tag.
	 * @param tableData I dati della tabella dei tag.
	 * @param tableMap Una mappa che fornisce informazioni aggiuntive per le celle della tabella.
	 */
	public void setTagTable(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Imposta i dati per una combobox di tag.
	 * <p>
	 * @param comboBoxData I dati per la combobox.
	 * @param comboBoxMap Una mappa che fornisce informazioni aggiuntive per le voci della combobox.
	 */
	public void setTagComboBox(Vector<String> comboBoxData,
														 Map<String, String> comboBoxMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Aggiunge un tag a un giocatore (per amministratori).
	 * <p>
	 * @param playerID L'ID del giocatore a cui aggiungere il tag.
	 * @param tagID L'ID del tag da aggiungere.
	 * @return Una stringa che indica il risultato dell'operazione.
	 */
	public String addPlayerTag(String playerID,
														 String tagID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.newPlayerTagDB(
						playerID,
						tagID
		);
	}


	/**
	 * Rimuove un tag da un giocatore (per amministratori).
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere il tag.
	 * @param tagID L'ID del tag da rimuovere.
	 * @return Una stringa che indica il risultato dell'operazione.
	 */
	public String removePlayerTag(String playerID,
																String tagID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.deletePlayerTagDB(
						playerID,
						tagID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/
}

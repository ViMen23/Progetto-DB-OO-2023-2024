package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle competizioni calcistiche.
 */
public interface CompetitionDAO
{
	/**
	 * Conta il numero di competizioni nel database.
	 * <p>
	 * @return Il numero di competizioni.
	 */
	int countCompetitionDB();


	/**
	 * Recupera i dati di un'edizione di una competizione dal database.
	 * <p>
	 * @param teamType Il tipo di squadra.
	 * @param competitionID L'ID della competizione.
	 * @param comboBoxData Un vettore per popolare una combo box con i dati recuperati.
	 * @param comboBoxMap Una mappa per associare i valori della combo box ai valori del database.
	 */
	void fetchCompetitionEditionDB(String teamType,
																 String competitionID,
																 Vector<String> comboBoxData,
																 Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni sulle competizioni dal database in base a vari parametri.
	 * <p>
	 * @param competitionSubName Il nome parziale della competizione.
	 * @param competitionType Il tipo di competizione.
	 * @param competitionTeamType Il tipo di squadra della competizione.
	 * @param competitionCountryType Il tipo di paese della competizione.
	 * @param competitionContinentID L'ID del continente della competizione.
	 * @param competitionNationID L'ID della nazione della competizione.
	 * @param tableData Un vettore per popolare una tabella con i dati recuperati.
	 */
	void fetchCompetitionDB(String competitionSubName,
													String competitionType,
													String competitionTeamType,
													String competitionCountryType,
													String competitionContinentID,
													String competitionNationID,
													Vector<Vector<String>> tableData);


	/**
	 * Recupera informazioni sulle competizioni dal database in base a vari parametri.
	 * <p>
	 * @param competitionSubName Il nome parziale della competizione.
	 * @param competitionType Il tipo di competizione.
	 * @param competitionTeamType Il tipo di squadra della competizione.
	 * @param competitionCountryType Il tipo di paese della competizione.
	 * @param competitionContinentID L'ID del continente della competizione.
	 * @param competitionNationID L'ID della nazione della competizione.
	 * @param comboBoxData Un vettore per popolare una combo box con i dati recuperati.
	 * @param comboBoxMap Una mappa per associare i valori della combo box ai valori del database.
	 */
	void fetchCompetitionDB(String competitionSubName,
													String competitionType,
													String competitionTeamType,
													String competitionCountryType,
													String competitionContinentID,
													String competitionNationID,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni sulle competizioni a cui ha partecipato un giocatore.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamType Il tipo di squadra.
	 * @param comboBoxData Un vettore per popolare una combo box con i nomi delle competizioni.
	 * @param comboBoxMap Una mappa per associare i nomi delle competizioni agli ID nel database.
	 */
	void fetchCompetitionDB(String playerID,
													String teamType,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni sulle competizioni appartenenti a una confederazione specifica.
	 * <p>
	 * @param confederationID L'ID della confederazione.
	 * @param teamType Il tipo di squadra.
	 * @param comboBoxData Un vettore per popolare una combo box con i nomi delle competizioni.
	 * @param comboBoxMap Una mappa per associare i nomi delle competizioni agli ID nel database.
	 */
	void fetchCompetitionConfederationDB(String confederationID,
																			 String teamType,
																			 Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni sulle competizioni del database (sezione amministratore).
	 * <p>
	 * @param competitionSubName Il nome parziale della competizione.
	 * @param competitionType Il tipo di competizione.
	 * @param competitionTeamType Il tipo di squadra della competizione.
	 * @param competitionCountryType Il tipo di paese della competizione.
	 * @param competitionContinentID L'ID del continente della competizione.
	 * @param competitionNationID L'ID della nazione della competizione.
	 * @param tableData Un vettore per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa per associare i valori della tabella ai valori del database.
	 */
	void fetchCompetitionAdminDB(String competitionSubName,
															 String competitionType,
															 String competitionTeamType,
															 String competitionCountryType,
															 String competitionContinentID,
															 String competitionNationID,
															 Vector<Vector<String>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera informazioni dettagliate sulle edizioni di una competizione per la sezione amministrativa del database.
	 * <p>
	 * @param competitionID L'ID della competizione.
	 * @param teamType Il tipo di squadra.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchCompetitionEditionAdminDB(String competitionID,
																			String teamType,
																			Vector<Vector<Object>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Crea una nuova edizione di una competizione nel database.
	 * <p>
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio indicante il risultato dell'operazione.
	 */
	String newCompetitionEditionDB(String competitionID,
																 String competitionStartYear);


	/**
	 * Elimina un'edizione di una competizione dal database.
	 * <p>
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio indicante il risultato dell'operazione.
	 */
	String deleteCompetitionEditionDB(String competitionID,
																		String competitionStartYear);


	/**
	 * Recupera informazioni dettagliate su una competizione dal database.
	 * <p>
	 * @param competitionID L'ID della competizione.
	 * @param infoMap Una mappa per memorizzare le informazioni recuperate.
	 */
	void fetchCompetitionDB(String competitionID,
													Map<String, String> infoMap);

	/**
	 * Recupera informazioni sulle competizioni giocate da un giocatore in un anno specifico.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamType Il tipo di squadra.
	 * @param startYear L'anno di inizio della competizione.
	 * @param comboBoxData Un vettore per popolare una combo box con i nomi delle competizioni.
	 * @param comboBoxMap Una mappa per associare i nomi delle competizioni agli ID nel database.
	 */
	void fetchCompetitionPlayDB(String playerID,
															String teamType,
															String startYear,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap);

}

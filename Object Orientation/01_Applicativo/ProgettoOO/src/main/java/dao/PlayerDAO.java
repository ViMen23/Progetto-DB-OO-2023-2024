package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi ai calciatori.
 */
public interface PlayerDAO
{
	/**
	 * Conta il numero di giocatori presenti nel database.
	 * <p>
	 * @return Il numero totale di giocatori nel database.
	 */
	int countPlayerDB();


	/**
	 * Recupera le informazioni dettagliate di un giocatore dal database in base al suo ID.
	 * <p>
	 * @param playerID L'ID del giocatore da recuperare.
	 * @param infoMap Una mappa per popolare con le informazioni del giocatore.
	 */
	void fetchPlayerDB(String playerID,
										 Map<String, String> infoMap);


	/**
	 * Recupera i giocatori di una squadra in un determinato anno per popolare una combobox.
	 * <p>
	 * @param startYear L'anno di riferimento per i giocatori da recuperare.
	 * @param teamID L'ID della squadra di cui recuperare i giocatori.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con la lista dei giocatori.
	 * @param comboBoxMap Una mappa per associare i valori della combobox agli ID dei giocatori nel database.
	 */
	void fetchPlayerDB(String startYear,
										 String teamID,
										 Vector<String> comboBoxData,
										 Map<String, String> comboBoxMap);


	/**
	 * Recupera giocatori in base a criteri di ricerca avanzati per popolare una tabella.
	 * <p>
	 * @param playerSubName Una porzione del nome del giocatore da ricercare.
	 * @param playerSubSurname Una porzione del cognome del giocatore da ricercare.
	 * @param playerReferringYear L'anno di riferimento per la ricerca.
	 * @param playerMinAge L'età minima dei giocatori da ricercare.
	 * @param playerMaxAge L'età massima dei giocatori da ricercare.
	 * @param playerContinentID L'ID del continente del giocatore da ricercare.
	 * @param playerNationID L'ID della nazione del giocatore da ricercare.
	 * @param playerRole Il ruolo del giocatore da ricercare.
	 * @param playerPositionID L'ID del ruolo del giocatore da ricercare.
	 * @param playerFoot Il piede preferito del giocatore da ricercare.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i risultati della ricerca.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchPlayerDB(String playerSubName,
										 String playerSubSurname,
										 String playerReferringYear,
										 String playerMinAge,
										 String playerMaxAge,
										 String playerContinentID,
										 String playerNationID,
										 String playerRole,
										 String playerPositionID,
										 String playerFoot,
										 Vector<Vector<String>> tableData,
										 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera giocatori in base a criteri di militanza in una squadra per popolare una tabella.
	 * <p>
	 * @param militancyPlayerTeamID L'ID della squadra per la quale cercare le militanze dei giocatori.
	 * @param militancyPlayerStartYear L'anno di inizio della militanza da ricercare.
	 * @param militancyPlayerEndYear L'anno di fine della militanza da ricercare.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i risultati della ricerca.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchPlayerDB(String militancyPlayerTeamID,
										 String militancyPlayerStartYear,
										 String militancyPlayerEndYear,
										 Vector<Vector<String>> tableData,
										 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera gli anni in cui un giocatore ha giocato o potrebbe giocare in una squadra, in base al tipo di squadra.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamType Il tipo di squadra.
	 * @param comboBoxData Un vettore di stringhe per popolare una combobox con gli anni recuperati.
	 * @param comboBoxMap Una mappa per associare i valori della combobox ai valori del database.
	 */
	void fetchPlayerYearDB(String playerID,
												 String teamType,
												 Vector<String> comboBoxData,
												 Map<String, String> comboBoxMap);


	/**
	 * Recupera gli anni validi di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @return Una stringa contenente informazioni riguardo gli anni validi del giocatore.
	 */
	String fetchPlayerYearDB(String playerID);


	/**
	 * Crea un nuovo giocatore nel database.
	 * <p>
	 * @param name Il nome del giocatore.
	 * @param surname Il cognome del giocatore.
	 * @param dob La data di nascita del giocatore.
	 * @param countryID L'ID della nazione del giocatore.
	 * @param foot Il piede preferito del giocatore.
	 * @param positionID L'ID del ruolo del giocatore.
	 * @return Un messaggio di conferma.
	 */
	String newPlayerDB(String name,
										 String surname,
										 String dob,
										 String countryID,
										 String foot,
										 String positionID);


	/**
	 * Elimina un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore da eliminare.
	 * @return Un messaggio di conferma.
	 */
	String deletePlayerDB(String playerID);


	/**
	 * Aggiorna le informazioni di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da aggiornare.
	 * @param name Il nuovo nome del giocatore.
	 * @param surname Il nuovo cognome del giocatore.
	 * @param dob La nuova data di nascita del giocatore.
	 * @param countryID Il nuovo ID della nazione del giocatore.
	 * @param foot Il nuovo piede preferito del giocatore.
	 * @param positionID Il nuovo ID del ruolo del giocatore.
	 * @return Un messaggio di conferma.
	 */
	String updatePlayerDB(String playerID,
												String name,
												String surname,
												String dob,
												String countryID,
												String foot,
												String positionID);


	/**
	 * Imposta la data del ritiro di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui impostare la data del ritiro.
	 * @param retiredDate La data del ritiro del giocatore.
	 * @return Un messaggio di conferma.
	 */
	String setRetiredDateDB(String playerID,
													String retiredDate);

	/**
	 * Seleziona un giocatore casuale dal database.
	 * <p>
	 * @return L'ID del giocatore casuale.
	 */
	String randomPlayerDB();

}

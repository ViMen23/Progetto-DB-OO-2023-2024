package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle militanze di calciatori in squadre di calcio.
 */
public interface MilitancyDAO
{
	/**
	 * Recupera informazioni sulle militanze dei giocatori in una squadra a partire da un determinato anno.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param startYear L'anno di inizio da cui recuperare le militanze.
	 * @param tableData Un vettore di vettori di stringhe per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchMilitancyDB(String teamID,
												String startYear,
												Vector<Vector<String>> tableData,
												Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera informazioni sulle militanze di un giocatore in squadre nazionali.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di stringhe per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchMilitancyNationalDB(String playerID,
																Vector<Vector<String>> tableData,
																Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera informazioni sulle militanze di un giocatore in squadre di club.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di stringhe per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchMilitancyClubDB(String playerID,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera informazioni dettagliate sulle militanze nazionali di un giocatore del database (sezione amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchMilitancyNationalAdminDB(String playerID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera informazioni dettagliate sulle militanze di club di un giocatore del database (sezione amministratore).
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchMilitancyClubAdminDB(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Crea una nuova militanza di un giocatore in una squadra nel database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamID L'ID della squadra.
	 * @param teamType Il tipo di squadra.
	 * @param startYear L'anno di inizio della militanza.
	 * @param seasonType Il tipo di stagione.
	 * @return Un messaggio di conferma.
	 */
	String newMilitancyDB(String playerID,
												String teamID,
												String teamType,
												String startYear,
												String seasonType);

	/**
	 * Elimina una militanza di un giocatore in una squadra dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamID L'ID della squadra.
	 * @param startYear L'anno di inizio della militanza da eliminare.
	 * @return Un messaggio di conferma.
	 */
	String deleteMilitancyDB(String playerID,
													 String teamID,
													 String startYear);
}

package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi ai premi calcistici.
 */
public interface PrizeDAO
{
	/**
	 * Assegna un premio a una squadra nel database.
	 * <p>
	 * @param teamID L'ID della squadra a cui assegnare il premio.
	 * @param prizeID L'ID del premio da assegnare.
	 * @param assignedYear L'anno in cui assegnare il premio.
	 * @return Un messaggio di conferma.
	 */
	String newPrizeTeamDB(String teamID,
												String prizeID,
												String assignedYear);


	/**
	 * Rimuove un premio assegnato a una squadra nel database.
	 * <p>
	 * @param teamID L'ID della squadra da cui rimuovere il premio.
	 * @param prizeID L'ID del premio da rimuovere.
	 * @param assignedYear L'anno in cui è stato assegnato il premio da rimuovere.
	 * @return Un messaggio di conferma.
	 */
	String deletePrizeTeamDB(String teamID,
													 String prizeID,
													 String assignedYear);


	/**
	 * Recupera i premi assegnati a una squadra specifica e popola una tabella con i risultati.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i premi.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati dei premi recuperati.
	 */
	void fetchPrizeDB(String teamID,
										Vector<Vector<String>> tableData);


	/**
	 * Recupera i premi assegnati a un giocatore specifico e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i premi.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati dei premi recuperati.
	 */
	void fetchPrizePlayerDB(String playerID,
													Vector<Vector<String>> tableData);


	/**
	 * Recupera informazioni dettagliate sui premi assegnati a una squadra specifica per l'amministrazione e popola una tabella.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i premi.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i dati dei premi recuperati e i dati aggiuntivi.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchTeamPrizeAdminDB(String teamID,
														 Vector<Vector<Object>> tableData,
														 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera i premi assegnati alle squadre nel database e popola una combobox.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i premi recuperati.
	 * @param comboBoxMap Una mappa per associare i valori della combobox agli ID dei premi nel database.
	 */
	void fetchTeamPrizeDB(Vector<String> comboBoxData,
												Map<String, String> comboBoxMap);


	/**
	 * Recupera i premi disponibili nel database e popola una combobox per la selezione di un premio da assegnare a un giocatore.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i premi recuperati.
	 * @param comboBoxMap Una mappa per associare i valori della combobox agli ID dei premi nel database.
	 */
	void fetchPlayerPrizeDB(Vector<String> comboBoxData,
													Map<String, String> comboBoxMap);


	/**
	 * Recupera i premi assegnati a un giocatore specifico e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i premi.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i dati dei premi recuperati e i dati aggiuntivi.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchPlayerPrizeDB(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Assegna un premio a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare il premio.
	 * @param prizeID L'ID del premio da assegnare.
	 * @param assignedYear L'anno in cui assegnare il premio.
	 * @return Un messaggio di conferma.
	 */
	String newPlayerPrizeDB(String playerID,
													String prizeID,
													String assignedYear);


	/**
	 * Rimuove un premio assegnato a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere il premio.
	 * @param prizeID L'ID del premio da rimuovere.
	 * @param assignedYear L'anno in cui è stato assegnato il premio da rimuovere.
	 * @return Un messaggio di conferma.
	 */
	String deletePlayerPrizeDB(String playerID,
														 String prizeID,
														 String assignedYear);
}

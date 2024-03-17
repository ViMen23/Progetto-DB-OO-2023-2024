package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle posizioni di gioco.
 */
public interface PositionDAO
{
	/**
	 * Recupera le posizioni di gioco associate a un giocatore specifico e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le posizioni.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati delle posizioni recuperate.
	 */
	void fetchPositionDB(String playerID,
											 Vector<Vector<String>> tableData);

	/**
	 * Recupera le posizioni di gioco disponibili nel database e popola una combobox.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con le posizioni recuperate.
	 * @param comboBoxMap Una mappa per associare i valori della combobox agli ID delle posizioni nel database.
	 */
	void fetchPositionDB(Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni dettagliate sulle posizioni di gioco associate a un giocatore specifico e popola una tabella.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le posizioni.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i dati delle posizioni recuperate e i dati aggiuntivi.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchPositionDB(String playerID,
											 Vector<Vector<Object>> tableData,
											 Map<Integer, Map<Integer, String>> tableMap);

	/**
	 * Aggiunge una nuova posizione di gioco a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui aggiungere la posizione.
	 * @param positionID L'ID della posizione da aggiungere al giocatore.
	 * @return Un messaggio di conferma.
	 */
	String newPlayerPositionDB(String playerID,
														 String positionID);

	/**
	 * Rimuove una posizione di gioco da un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere la posizione.
	 * @param positionID L'ID della posizione da rimuovere dal giocatore.
	 * @return Un messaggio di conferma.
	 */
	String deletePlayerPositionDB(String playerID,
																String positionID);
}

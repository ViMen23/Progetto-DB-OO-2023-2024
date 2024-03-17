package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi ai tag.
 */
public interface TagDAO
{
	/**
	 * Recupera i tag associati a un giocatore specifico e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i tag.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i tag recuperati.
	 */
	void fetchTagDB(String playerID,
									Vector<Vector<String>> tableData);


	/**
	 * Recupera tutti i tag disponibili nel database e popola una combobox per la selezione dei tag.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i tag recuperati.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID dei tag nel database.
	 */
	void fetchTagDB(Vector<String> comboBoxData,
									Map<String, String> comboBoxMap);


	/**
	 * Recupera i tag associati a un giocatore specifico, fornendo dati aggiuntivi in formato tabella nidificata.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i tag.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i tag recuperati e i dati aggiuntivi.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchTagDB(String playerID,
									Vector<Vector<Object>> tableData,
									Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Assegna un tag a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare il tag.
	 * @param tagID L'ID del tag da assegnare.
	 * @return Un messaggio di conferma.
	 */
	String newPlayerTagDB(String playerID,
												String tagID);


	/**
	 * Rimuove un tag assegnato a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere il tag.
	 * @param tagID L'ID del tag da rimuovere.
	 * @return Un messaggio di conferma.
	 */
	String deletePlayerTagDB(String playerID,
													 String tagID);
}

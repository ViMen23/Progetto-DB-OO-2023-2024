package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle nazionalita' dei calciatori.
 */
public interface NationalityDAO
{
	/**
	 * Recupera informazioni sulla nazionalità di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di stringhe per popolare una tabella con i dati recuperati.
	 */
	void fetchNationalityDB(String playerID,
													Vector<Vector<String>> tableData);

	/**
	 * Recupera informazioni dettagliate sulla nazionalità di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchNationalityDB(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap);

	/**
	 * Aggiunge una nazionalità a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param countryID L'ID della nazionalità da aggiungere.
	 * @return Un messaggio di conferma.
	 */
	String newNationalityDB(String playerID,
													String countryID);

	/**
	 * Elimina una nazionalità di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param countryID L'ID della nazionalità da eliminare.
	 * @return Un messaggio di conferma.
	 */
	String deleteNationalityDB(String playerID,
														 String countryID);
}

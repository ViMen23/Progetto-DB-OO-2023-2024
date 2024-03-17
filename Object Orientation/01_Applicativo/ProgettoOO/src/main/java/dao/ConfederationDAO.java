package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle confederazioni calcistiche.
 */
public interface ConfederationDAO
{
	/**
	 * Conta il numero di confederazioni nel database.
	 * <p>
	 * @return Il numero di confederazioni.
	 */
	int countConfederationDB();


	/**
	 * Recupera informazioni sulle confederazioni dal database per la visualizzazione in una tabella.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superConfederationID L'ID della super confederazione.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati recuperati.
	 */
	void fetchConfederationDB(String countryType,
														String superConfederationID,
														Vector<Vector<String>> tableData);

	/**
	 * Recupera informazioni sulle confederazioni dal database per popolare una combo box.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superConfederationID L'ID della super confederazione.
	 * @param comboBoxData Un vettore di stringhe per popolare la combo box con i nomi delle confederazioni.
	 * @param comboBoxMap Una mappa per associare i nomi delle confederazioni agli ID nel database.
	 */
	void fetchConfederationDB(String countryType,
														String superConfederationID,
														Vector<String> comboBoxData,
														Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni sulla confederazione a cui appartiene una squadra.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param confederationMap Una mappa per memorizzare le informazioni sulla confederazione recuperata.
	 */
	void fetchConfederationDB(String teamID,
														Map<String, String> confederationMap);
}

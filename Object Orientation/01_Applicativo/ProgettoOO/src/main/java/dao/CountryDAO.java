package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi ai paesi.
 */
public interface CountryDAO
{
	/**
	 * Conta il numero di paesi nel database.
	 * <p>
	 * @return Il numero di paesi.
	 */
	int countCountryDB();

	/**
	 * Recupera informazioni sui paesi dal database per popolare una combo box.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superCountryID L'ID del super paese.
	 * @param comboBoxData Un vettore di stringhe per popolare la combo box con i nomi dei paesi.
	 * @param comboBoxMap Una mappa per associare i nomi dei paesi agli ID nel database.
	 */
	void fetchCountryDB(String countryType,
											String superCountryID,
											Vector<String> comboBoxData,
											Map<String, String> comboBoxMap);

	/**
	 * Recupera informazioni sui paesi dal database per la visualizzazione in una tabella.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superCountryID L'ID del super paese.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati recuperati.
	 */
	void fetchCountryDB(String countryType,
											String superCountryID,
											Vector<Vector<String>> tableData);
}

package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle partecipazioni di una squadra ad una competizione.
 */
public interface PartecipationDAO
{
	/**
	 * Crea una nuova partecipazione di una squadra a una competizione nel database.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	String newPartecipationDB(String teamID,
														String competitionID,
														String competitionStartYear);

	/**
	 * Elimina una partecipazione di una squadra a una competizione dal database.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione da eliminare.
	 * @return Un messaggio di conferma.
	 */
	String deletePartecipationDB(String teamID,
															 String competitionID,
															 String competitionStartYear);

	/**
	 * Recupera informazioni sulle partecipazioni di una squadra a competizioni dal database.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionStartYear L'anno di inizio delle competizioni da recuperare.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 */
	void fetchPartecipationDB(String teamID,
														String competitionStartYear,
														Vector<Vector<Object>> tableData);


	/**
	 * Recupera gli anni delle competizioni a cui una squadra ha partecipato o potrebbe partecipare.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param teamType Il tipo di squadra.
	 * @param comboBoxData Un vettore di stringhe per popolare una combobox con gli anni delle competizioni.
	 * @param comboBoxMap Una mappa per associare i valori della combobox ai valori del database.
	 */
	void fetchPartecipationYearDB(String teamID,
																String teamType,
																Vector<String> comboBoxData,
																Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni sulle competizioni a cui una squadra ha partecipato in un determinato anno.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionStartYear L'anno di inizio delle competizioni da recuperare.
	 * @param comboBoxData Un vettore di stringhe per popolare una combobox con le competizioni.
	 * @param comboBoxMap Una mappa per associare i valori della combobox ai valori del database.
	 */
	void fetchPartecipationDB(String teamID,
														String competitionStartYear,
														Vector<String> comboBoxData,
														Map<String, String> comboBoxMap);


	/**
	 * Recupera informazioni dettagliate sulle partecipazioni di una squadra a competizioni dal database (sezione amministrativa).
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionStartYear L'anno di inizio delle competizioni da recuperare.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchPartecipationAdminDB(String teamID,
																 String competitionStartYear,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap);
}

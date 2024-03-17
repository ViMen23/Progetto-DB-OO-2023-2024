package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi ai trofei calcistici.
 */
public interface TrophyDAO
{
	/**
	 * Assegna un nuovo trofeo a una squadra nel database.
	 * <p>
	 * @param teamID L'ID della squadra che ha vinto il trofeo.
	 * @param trophyID L'ID del trofeo da assegnare.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	String newTrophyTeamDB(String teamID,
												 String trophyID,
												 String competitionID,
												 String competitionStartYear);

	/**
	 * Rimuove un trofeo assegnato a una squadra dal database.
	 * <p>
	 * @param teamID L'ID della squadra a cui è stato assegnato il trofeo.
	 * @param trophyID L'ID del trofeo da rimuovere.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	String deleteTrophyTeamDB(String teamID,
														String trophyID,
														String competitionID,
														String competitionStartYear);

	/**
	 * Recupera i trofei vinti da una squadra dal database e popola una tabella con i risultati.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i trofei.
	 * @param teamType Il tipo di squadra.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati dei trofei recuperati.
	 */
	void fetchTrophyDB(String teamID,
										 String teamType,
										 Vector<Vector<String>> tableData);

	/**
	 * Recupera i trofei vinti dalle squadre a cui un giocatore è affiliato dal database
	 * e popola una tabella con i risultati, fornendo una mappatura per i valori visualizzati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i trofei vinti dalle squadre affiliate.
	 * @param teamType Il tipo di squadra.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati dei trofei recuperati.
	 * @param tableMap Una mappa a due livelli per associare i valori visualizzati nella tabella
	 *                  agli ID corrispondenti nel database.
	 */
	void fetchTrophyDB(String playerID,
										 String teamType,
										 Vector<Vector<String>> tableData,
										 Map<Integer, Map<Integer, String>> tableMap);

	/**
	 * Recupera i trofei vinti da una squadra dal database, fornendo dati aggiuntivi per la gestione amministrativa,
	 * e popola una tabella con i risultati, fornendo una mappatura per i valori visualizzati.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i trofei.
	 * @param teamType Il tipo di squadra.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i dati dei trofei recuperati,
	 *                  includendo informazioni aggiuntive per la gestione amministrativa.
	 * @param tableMap Una mappa a due livelli per associare i valori visualizzati nella tabella
	 *                  agli ID corrispondenti nel database.
	 */
	void fetchTeamTrophyAdminDB(String teamID,
															String teamType,
															Vector<Vector<Object>> tableData,
															Map<Integer, Map<Integer, String>> tableMap);

	/**
	 * Recupera le squadre vincitrici di trofei dal database e popola una combobox con i risultati.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre vincitrici.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamTrophyDB(Vector<String> comboBoxData,
												 Map<String, String> comboBoxMap);


	/**
	 * Recupera i giocatori che hanno vinto trofei dal database e popola una combobox con i risultati.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi dei giocatori.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID dei giocatori nel database.
	 */
	void fetchPlayerTrophyDB(Vector<String> comboBoxData,
													 Map<String, String> comboBoxMap);


	/**
	 * Assegna un nuovo trofeo a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare il trofeo.
	 * @param teamID L'ID della squadra che ha vinto il trofeo.
	 * @param trophyID L'ID del trofeo da assegnare.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	String newTrophyPlayerDB(String playerID,
													 String teamID,
													 String trophyID,
													 String competitionID,
													 String competitionStartYear);

	/**
	 * Rimuove un trofeo assegnato a un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui era stato assegnato il trofeo.
	 * @param teamID L'ID della squadra che ha vinto il trofeo.
	 * @param trophyID L'ID del trofeo da rimuovere.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	String deleteTrophyPlayerDB(String playerID,
															String teamID,
															String trophyID,
															String competitionID,
															String competitionStartYear);

	/**
	 * Recupera i trofei vinti da un giocatore dal database, fornendo dati aggiuntivi per la gestione amministrativa,
	 * e popola una tabella con i risultati, fornendo una mappatura per i valori visualizzati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i trofei vinti.
	 * @param teamType Il tipo di squadra in cui il giocatore ha vinto i trofei.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i dati dei trofei recuperati,
	 *                  includendo informazioni aggiuntive per la gestione amministrativa.
	 * @param tableMap Una mappa a due livelli per associare i valori visualizzati nella tabella
	 *                  agli ID corrispondenti nel database.
	 */
	void fetchTrophyPlayerAdminDB(String playerID,
																String teamType,
																Vector<Vector<Object>> tableData,
																Map<Integer, Map<Integer, String>> tableMap);
}

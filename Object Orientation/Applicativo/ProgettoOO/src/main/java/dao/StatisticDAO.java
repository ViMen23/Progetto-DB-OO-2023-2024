package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle statistiche.
 */
public interface StatisticDAO
{
	/**
	 * Recupera le statistiche di un giocatore specifico in base ai parametri forniti e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le statistiche.
	 * @param teamType Il tipo di squadra.
	 * @param teamID L'ID della squadra del giocatore.
	 * @param competitionID L'ID della competizione.
	 * @param startYear L'anno di inizio del periodo di riferimento.
	 * @param endYear L'anno di fine del periodo di riferimento.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con le statistiche recuperate.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchStatisticPlayerDB(String playerID,
															String teamType,
															String teamID,
															String competitionID,
															String startYear,
															String endYear,
															Vector<Vector<Object>> tableData,
															Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera le statistiche di un'edizione specifica di una competizione e popola una tabella con i risultati.
	 * <p>
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param competitionID L'ID della competizione.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con le statistiche recuperate.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchStatisticEditionDB(String competitionStartYear,
															 String competitionID,
															 Vector<Vector<Object>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera le statistiche totali, raggruppate per tipo di squadra e ruolo del giocatore, e popola una tabella con i risultati.
	 * <p>
	 * @param teamType Il tipo di squadra.
	 * @param playerRole Il ruolo del giocatore.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con le statistiche recuperate.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchStatisticTotalDB(String teamType,
														 String playerRole,
														 Vector<Vector<Object>> tableData,
														 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera le statistiche per la visualizzazione nell'area amministrativa.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le statistiche.
	 * @param teamID L'ID della squadra del giocatore.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param dataMap Una mappa per memorizzare le statistiche recuperate, associando nomi di chiavi a valori.
	 */
	String fetchStatisticAdminDB(String playerID,
															 String teamID,
															 String competitionID,
															 String competitionStartYear,
															 Map<String, String> dataMap);


	/**
	 * Aggiorna le statistiche di un giocatore nel database.
	 * <p>
	 * @param playID L'ID univoco della giocata da aggiornare.
	 * @param match Il numero di partite a cui si riferiscono le statistiche.
	 * @param goalScored Il numero di gol segnati dal giocatore.
	 * @param assist Il numero di assist forniti dal giocatore.
	 * @param yellowCard Il numero di cartellini gialli.
	 * @param redCard Il numero di cartellini rossi.
	 * @param penaltyScored Il numero di rigori realizzati dal giocatore.
	 * @param goalConceded Il numero di gol subiti dal giocatore.
	 * @param penaltySaved Il numero di rigori parati dal giocatore.
	 * @return Una stringa di conferma dell'aggiornamento.
	 */
	String updateStatisticDB(String playID,
													 String match,
													 String goalScored,
													 String assist,
													 String yellowCard,
													 String redCard,
													 String penaltyScored,
													 String goalConceded,
													 String penaltySaved);
}

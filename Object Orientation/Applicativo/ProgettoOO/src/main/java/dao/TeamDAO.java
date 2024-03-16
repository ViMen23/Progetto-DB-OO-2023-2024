package dao;

import java.util.Map;
import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi alle squadre di calcio.
 */
public interface TeamDAO
{
	/**
	 * Conta il numero totale di squadre presenti nel database.
	 * <p>
	 * @return Il numero totale di squadre.
	 */
	int countTeamDB();


	/**
	 * Crea una nuova squadra nazionale nel database.
	 * <p>
	 * @param countryID L'ID del paese a cui appartiene la squadra nazionale.
	 * @return Un messaggio di conferma.
	 */
	String newNationalTeamDB(String countryID);


	/**
	 * Crea una nuova squadra di club nel database.
	 * <p>
	 * @param countryID L'ID del paese in cui ha sede la squadra di club.
	 * @param teamLongName Il nome completo della squadra di club.
	 * @param teamShortName Il nome abbreviato della squadra di club.
	 * @return Un messaggio di conferma.
	 */
	String newClubTeamDB(String countryID,
											 String teamLongName,
											 String teamShortName);


	/**
	 * Aggiorna i dati di una squadra di club esistente nel database.
	 * <p>
	 * @param teamID L'ID della squadra di club da aggiornare.
	 * @param teamLongName Il nuovo nome completo della squadra di club.
	 * @param teamShortName Il nuovo nome abbreviato della squadra di club.
	 * @return Un messaggio di conferma.
	 */
	String updateClubTeamDB(String teamID,
													String teamLongName,
													String teamShortName);


	/**
	 * Rimuove una squadra dal database.
	 * <p>
	 * @param teamID L'ID della squadra da rimuovere.
	 * @return Un messaggio di conferma.
	 */
	String deleteTeamDB(String teamID);


	/**
	 * Recupera le squadre dal database in base a vari criteri di ricerca e popola una tabella con i risultati.
	 * <p>
	 * @param teamSubLongName Una stringa contenuta nel nome completo della squadra da ricercare.
	 * @param teamSubShortName Una stringa contenuta nel nome abbreviato della squadra da ricercare.
	 * @param teamType Il tipo di squadra da ricercare.
	 * @param teamContinentID L'ID del continente della squadra da ricercare.
	 * @param teamNationID L'ID del paese della squadra da ricercare.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati delle squadre recuperate.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	void fetchTeamDB(String teamSubLongName,
									 String teamSubShortName,
									 String teamType,
									 String teamContinentID,
									 String teamNationID,
									 Vector<Vector<String>> tableData,
									 Map<Integer, Map<Integer, String>> tableMap);


	/**
	 * Recupera le squadre del database a cui un giocatore è affiliato e popola una combobox con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le squadre.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamDB(String playerID,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);


	/**
	 * Recupera le squadre del database in base al tipo di squadra e popola una combobox con i risultati.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i dati, se noto.
	 * @param teamType Il tipo di squadra da ricercare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamDB(String teamID,
									 String teamType,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);

	/**
	 * Recupera le squadre dal database in base a vari criteri di ricerca e popola una combobox con i risultati.
	 * <p>
	 * @param teamSubLongName Una stringa contenuta nel nome completo della squadra da ricercare.
	 * @param teamSubShortName Una stringa contenuta nel nome abbreviato della squadra da ricercare.
	 * @param teamType Il tipo di squadra da ricercare.
	 * @param teamContinentID L'ID del continente della squadra da ricercare.
	 * @param teamNationID L'ID del paese della squadra da ricercare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamComboDB(String teamSubLongName,
												String teamSubShortName,
												String teamType,
												String teamContinentID,
												String teamNationID,
												Vector<String> comboBoxData,
												Map<String, String> comboBoxMap);


	/**
	 * Recupera le informazioni dettagliate di una squadra specifica dal database e le popola in una mappa.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare le informazioni.
	 * @param infoTeamMap Una mappa per associare i nomi dei campi informativi ai rispettivi valori recuperati dal database.
	 */
	void fetchTeamDB(String teamID,
									 Map<String, String> infoTeamMap);


	/**
	 * Recupera le squadre che hanno partecipato a una specifica competizione e popola una combobox con i risultati.
	 * <p>
	 * @param competitionStartYear L'anno di inizio della competizione da ricercare.
	 * @param competitionID L'ID della competizione da ricercare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamCompetitionDB(String competitionStartYear,
															String competitionID,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap);

	/**
	 * Recupera le squadre a cui un giocatore è affiliato e popola una combobox con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le squadre.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamComboBoxDB(String playerID,
													 Vector<String> comboBoxData,
													 Map<String, String> comboBoxMap);


	/**
	 * Recupera le squadre a cui un giocatore è affiliato in un determinato periodo,
	 * filtrando per tipo di squadra, e popola una combobox con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le squadre.
	 * @param teamType Il tipo di squadra da ricercare.
	 * @param startYear L'anno di inizio del periodo di affiliazione da considerare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamDB(String playerID,
									 String teamType,
									 String startYear,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);


	/**
	 * Recupera le squadre in cui un giocatore ha giocato in una specifica competizione
	 * e popola una combobox con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le squadre.
	 * @param competitionStartYear L'anno di inizio della competizione da ricercare.
	 * @param competitionID L'ID della competizione da ricercare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	void fetchTeamPlayDB(String playerID,
											 String competitionStartYear,
											 String competitionID,
											 Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap);
}

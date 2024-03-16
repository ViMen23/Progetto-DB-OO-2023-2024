package postgresImplDAO;

import dao.TeamDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia TeamDAO.
 */
public class PostgresImplTeamDAO
				implements TeamDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplTeamDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Conta il numero totale di squadre presenti nel database.
	 * <p>
	 * @return Il numero totale di squadre.
	 */
	@Override
	public int countTeamDB()
	{
		int count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_team()}");
			cs.registerOutParameter(1, Types.INTEGER);

			cs.execute();

			count = cs.getInt(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return count;
	}


	/**
	 * Crea una nuova squadra nazionale nel database.
	 * <p>
	 * @param countryID L'ID del paese a cui appartiene la squadra nazionale.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newNationalTeamDB(String countryID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_national_team(?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, countryID);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Crea una nuova squadra di club nel database.
	 * <p>
	 * @param countryID L'ID del paese in cui ha sede la squadra di club.
	 * @param teamLongName Il nome completo della squadra di club.
	 * @param teamShortName Il nome abbreviato della squadra di club.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newClubTeamDB(String countryID,
															String teamLongName,
															String teamShortName)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_club_team(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, countryID);
			cs.setString(3, teamLongName);
			cs.setString(4, teamShortName);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Aggiorna i dati di una squadra di club esistente nel database.
	 * <p>
	 * @param teamID L'ID della squadra di club da aggiornare.
	 * @param teamLongName Il nuovo nome completo della squadra di club.
	 * @param teamShortName Il nuovo nome abbreviato della squadra di club.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String updateClubTeamDB(String teamID,
																 String teamLongName,
																 String teamShortName)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_club_team(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, teamLongName);
			cs.setString(4, teamShortName);

			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Rimuove una squadra dal database.
	 * <p>
	 * @param teamID L'ID della squadra da rimuovere.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deleteTeamDB(String teamID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_team(?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);

			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


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
	@Override
	public void fetchTeamDB(String teamSubLongName,
													String teamSubShortName,
													String teamType,
													String teamContinentID,
													String teamNationID,
													Vector<Vector<String>> tableData,
													Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_team(?, ?, ?, ?, ?)}");
			cs.setString(1, teamSubLongName);
			cs.setString(2, teamSubShortName);
			cs.setString(3, teamType);
			cs.setString(4, teamContinentID);
			cs.setString(5, teamNationID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> teamLongNameMap = new HashMap<>();


			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("team_long_name"));
				vector.add(rs.getString("team_short_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("team_type")));
				vector.add(rs.getString("country_name"));

				tableData.add(vector);
				teamLongNameMap.put(rs.getRow() - 1, rs.getString("team_id"));
			}

			tableMap.put(0, teamLongNameMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le squadre del database a cui un giocatore è affiliato e popola una combobox con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le squadre.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	@Override
	public void fetchTeamDB(String playerID,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call club_team_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("team_long_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le squadre del database in base al tipo di squadra e popola una combobox con i risultati.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i dati, se noto.
	 * @param teamType Il tipo di squadra da ricercare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	@Override
	public void fetchTeamDB(String teamID,
													String teamType,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call year_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					comboBoxData.add(season);
					comboBoxMap.put(season, rs.getString("start_year"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					comboBoxData.add(rs.getString("start_year"));
					comboBoxMap.put(comboBoxData.getLast(), comboBoxData.getLast());
				}
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


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
	@Override
	public void fetchTeamComboDB(String teamSubLongName,
															 String teamSubShortName,
															 String teamType,
															 String teamContinentID,
															 String teamNationID,
															 Vector<String> comboBoxData,
															 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_team(?, ?, ?, ?, ?)}");
			cs.setString(1, teamSubLongName);
			cs.setString(2, teamSubShortName);
			cs.setString(3, teamType);
			cs.setString(4, teamContinentID);
			cs.setString(5, teamNationID);

			ResultSet rs = cs.executeQuery();


			while (rs.next()) {
				comboBoxData.add(rs.getString("team_long_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("team_id"));
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le informazioni dettagliate di una squadra specifica dal database e le popola in una mappa.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare le informazioni.
	 * @param infoTeamMap Una mappa per associare i nomi dei campi informativi ai rispettivi valori recuperati dal database.
	 */
	@Override
	public void fetchTeamDB(String teamID,
													Map<String, String> infoTeamMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				infoTeamMap.put(GuiConfiguration.getMessage("team").toUpperCase(), rs.getString("team_long_name"));
				infoTeamMap.put(GuiConfiguration.getMessage("code"), rs.getString("team_short_name"));
				infoTeamMap.put(GuiConfiguration.getMessage("type").toUpperCase(), GuiConfiguration.getMessage(rs.getString("team_type")));
				infoTeamMap.put(GuiConfiguration.getMessage("country"), rs.getString("country_name"));
				infoTeamMap.put(GuiConfiguration.getMessage("confederation"), rs.getString("conf_short_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le squadre che hanno partecipato a una specifica competizione e popola una combobox con i risultati.
	 * <p>
	 * @param competitionStartYear L'anno di inizio della competizione da ricercare.
	 * @param competitionID L'ID della competizione da ricercare.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	@Override
	public void fetchTeamCompetitionDB(String competitionStartYear,
																		 String competitionID,
																		 Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_team(?, ?)}");
			cs.setString(1, competitionStartYear);
			cs.setString(2, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("team_long_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le squadre a cui un giocatore è affiliato e popola una combobox con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le squadre.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre recuperate.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	@Override
	public void fetchTeamComboBoxDB(String playerID,
																	Vector<String> comboBoxData,
																	Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call player_national_team(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("team_long_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


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
	@Override
	public void fetchTeamDB(String playerID,
													String teamType,
													String startYear,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call player_team_year(?, ?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);
			cs.setString(3, startYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("team_long_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


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
	@Override
	public void fetchTeamPlayDB(String playerID,
															String competitionStartYear,
															String competitionID,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call team_play(?, ?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, competitionStartYear);
			cs.setString(3, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("team_long_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

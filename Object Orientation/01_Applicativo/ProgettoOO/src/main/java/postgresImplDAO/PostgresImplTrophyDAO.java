package postgresImplDAO;

import dao.TrophyDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia TrophyDAO.
 */
public class PostgresImplTrophyDAO
				implements TrophyDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplTrophyDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Assegna un nuovo trofeo a una squadra nel database.
	 * <p>
	 * @param teamID L'ID della squadra che ha vinto il trofeo.
	 * @param trophyID L'ID del trofeo da assegnare.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newTrophyTeamDB(String teamID,
																String trophyID,
																String competitionID,
																String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_trophy_team(?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, trophyID);
			cs.setString(4, competitionID);
			cs.setString(5, competitionStartYear);

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
	 * Rimuove un trofeo assegnato a una squadra dal database.
	 * <p>
	 * @param teamID L'ID della squadra a cui è stato assegnato il trofeo.
	 * @param trophyID L'ID del trofeo da rimuovere.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deleteTrophyTeamDB(String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_trophy_team(?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, trophyID);
			cs.setString(4, competitionID);
			cs.setString(5, competitionStartYear);

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
	 * Recupera i trofei vinti da una squadra dal database e popola una tabella con i risultati.
	 * <p>
	 * @param teamID L'ID della squadra di cui recuperare i trofei.
	 * @param teamType Il tipo di squadra.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati dei trofei recuperati.
	 */
	@Override
	public void fetchTrophyDB(String teamID,
														String teamType,
														Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call trophy_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();


			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					season = rs.getString("comp_start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("comp_start_year")) + 1);

					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					vector.add(rs.getString("comp_start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
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
	 * Recupera i trofei vinti dalle squadre a cui un giocatore è affiliato dal database
	 * e popola una tabella con i risultati, fornendo una mappatura per i valori visualizzati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i trofei vinti dalle squadre affiliate.
	 * @param teamType Il tipo di squadra.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati dei trofei recuperati.
	 * @param tableMap Una mappa a due livelli per associare i valori visualizzati nella tabella
	 *                  agli ID corrispondenti nel database.
	 */
	@Override
	public void fetchTrophyDB(String playerID,
														String teamType,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call trophy_player(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();


			Map<Integer, String> teamMap = new HashMap<>();
			int row = 0;

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					season = rs.getString("comp_start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("comp_start_year")) + 1);

					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					teamMap.put(row, rs.getString("team_id"));
					++row;
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					vector.add(rs.getString("comp_start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					teamMap.put(row, rs.getString("team_id"));
					++row;
				}
			}

			tableMap.put(2, teamMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


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
	@Override
	public void fetchTeamTrophyAdminDB(String teamID,
																		 String teamType,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call trophy_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> seasonMap = new HashMap<>();
			Map<Integer, String> competitionMap = new HashMap<>();
			Map<Integer, String> trophyMap = new HashMap<>();

			int row = 0;

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					season = rs.getString("comp_start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("comp_start_year")) + 1);

					vector.add(false);
					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					seasonMap.put(row, rs.getString("comp_start_year"));
					competitionMap.put(row, rs.getString("comp_id"));
					trophyMap.put(row, rs.getString("trophy_id"));

					++row;
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					vector.add(false);
					vector.add(rs.getString("comp_start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					seasonMap.put(row, rs.getString("comp_start_year"));
					competitionMap.put(row, rs.getString("comp_id"));
					trophyMap.put(row, rs.getString("trophy_id"));

					++row;
				}
			}

			tableMap.put(1, seasonMap);
			tableMap.put(2, competitionMap);
			tableMap.put(3, trophyMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le squadre vincitrici di trofei dal database e popola una combobox con i risultati.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi delle squadre vincitrici.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID delle squadre nel database.
	 */
	@Override
	public void fetchTeamTrophyDB(Vector<String> comboBoxData,
																Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_team_trophy");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				comboBoxData.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("trophy_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera i giocatori che hanno vinto trofei dal database e popola una combobox con i risultati.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i nomi dei giocatori.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID dei giocatori nel database.
	 */
	@Override
	public void fetchPlayerTrophyDB(Vector<String> comboBoxData,
																	Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_player_trophy");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String data = "";
				data += "[";
				data += GuiConfiguration.getMessage(rs.getString("trophy_role"));
				data += "] ";
				data += GuiConfiguration.getMessage(rs.getString("trophy_name"));

				comboBoxData.add(data);
				comboBoxMap.put(data, rs.getString("trophy_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


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
	@Override
	public String newTrophyPlayerDB(String playerID,
																	String teamID,
																	String trophyID,
																	String competitionID,
																	String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_player_trophy(?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, teamID);
			cs.setString(4, competitionID);
			cs.setString(5, competitionStartYear);
			cs.setString(6, trophyID);

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
	 * Rimuove un trofeo assegnato a un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui era stato assegnato il trofeo.
	 * @param teamID L'ID della squadra che ha vinto il trofeo.
	 * @param trophyID L'ID del trofeo da rimuovere.
	 * @param competitionID L'ID della competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deleteTrophyPlayerDB(String playerID,
																		 String teamID,
																		 String trophyID,
																		 String competitionID,
																		 String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_player_trophy(?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, teamID);
			cs.setString(4, competitionID);
			cs.setString(5, competitionStartYear);
			cs.setString(6, trophyID);

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
	@Override
	public void fetchTrophyPlayerAdminDB(String playerID,
																			 String teamType,
																			 Vector<Vector<Object>> tableData,
																			 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call player_trophy_player(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> seasonMap = new HashMap<>();
			Map<Integer, String> competitionMap = new HashMap<>();
			Map<Integer, String> teamMap = new HashMap<>();
			Map<Integer, String> trophyMap = new HashMap<>();

			int row = 0;

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					season = rs.getString("comp_start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("comp_start_year")) + 1);

					vector.add(false);
					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					seasonMap.put(row, rs.getString("comp_start_year"));
					competitionMap.put(row, rs.getString("comp_id"));
					teamMap.put(row, rs.getString("team_id"));
					trophyMap.put(row, rs.getString("trophy_id"));

					++row;
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					vector.add(false);
					vector.add(rs.getString("comp_start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(GuiConfiguration.getMessage(rs.getString("trophy_name")));

					tableData.add(vector);
					seasonMap.put(row, rs.getString("comp_start_year"));
					competitionMap.put(row, rs.getString("comp_id"));
					teamMap.put(row, rs.getString("team_id"));
					trophyMap.put(row, rs.getString("trophy_id"));

					++row;
				}
			}

			tableMap.put(1, seasonMap);
			tableMap.put(2, competitionMap);
			tableMap.put(3, teamMap);
			tableMap.put(4, trophyMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

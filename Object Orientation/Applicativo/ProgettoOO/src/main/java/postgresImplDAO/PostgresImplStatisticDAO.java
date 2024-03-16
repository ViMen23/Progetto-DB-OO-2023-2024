package postgresImplDAO;

import dao.StatisticDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia StatisticDAO.
 */
public class PostgresImplStatisticDAO
				implements StatisticDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplStatisticDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


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
	@Override
	public void fetchStatisticPlayerDB(String playerID,
																		 String teamType,
																		 String teamID,
																		 String competitionID,
																		 String startYear,
																		 String endYear,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_statistic_player(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);
			cs.setString(3, teamID);
			cs.setString(4, competitionID);
			cs.setString(5, startYear);
			cs.setString(6, endYear);

			ResultSet rs = cs.executeQuery();


			Map<Integer, String> teamMap = new HashMap<>();
			int row = 0;

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(rs.getInt("match"));
					vector.add(rs.getInt("goal_scored"));
					vector.add(rs.getInt("penalty_scored"));
					vector.add(rs.getInt("assist"));
					vector.add(rs.getInt("yellow_card"));
					vector.add(rs.getInt("red_card"));
					vector.add(rs.getInt("goal_conceded"));
					vector.add(rs.getInt("penalty_saved"));

					tableData.add(vector);
					teamMap.put(row, rs.getString("team_id"));
					++row;
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					vector.add(rs.getString("start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(rs.getInt("match"));
					vector.add(rs.getInt("goal_scored"));
					vector.add(rs.getInt("penalty_scored"));
					vector.add(rs.getInt("assist"));
					vector.add(rs.getInt("yellow_card"));
					vector.add(rs.getInt("red_card"));
					vector.add(rs.getInt("goal_conceded"));
					vector.add(rs.getInt("penalty_saved"));

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
	 * Recupera le statistiche di un'edizione specifica di una competizione e popola una tabella con i risultati.
	 * <p>
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param competitionID L'ID della competizione.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con le statistiche recuperate.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchStatisticEditionDB(String competitionStartYear,
																			String competitionID,
																			Vector<Vector<Object>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_edition_statistic(?, ?)}");
			cs.setString(1, competitionStartYear);
			cs.setString(2, competitionID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> teamMap = new HashMap<>();
			Map<Integer, String> playerMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);


				vector.add(rs.getString("team_long_name"));
				vector.add(role);
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_surname"));
				vector.add(rs.getInt("match"));
				vector.add(rs.getInt("goal_scored"));
				vector.add(rs.getInt("penalty_scored"));
				vector.add(rs.getInt("assist"));
				vector.add(rs.getInt("yellow_card"));
				vector.add(rs.getInt("red_card"));
				vector.add(rs.getInt("goal_conceded"));
				vector.add(rs.getInt("penalty_saved"));

				tableData.add(vector);
				teamMap.put(row, rs.getString("team_id"));
				playerMap.put(row, rs.getString("player_id"));
				++row;
			}

			tableMap.put(0, teamMap);
			tableMap.put(3, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le statistiche totali, raggruppate per tipo di squadra e ruolo del giocatore, e popola una tabella con i risultati.
	 * <p>
	 * @param teamType Il tipo di squadra.
	 * @param playerRole Il ruolo del giocatore.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con le statistiche recuperate.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchStatisticTotalDB(String teamType,
																		String playerRole,
																		Vector<Vector<Object>> tableData,
																		Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call total_statistic(?, ?)}");
			cs.setString(1, teamType);
			cs.setString(2, playerRole);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> playerMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);


				vector.add(role);
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_surname"));
				vector.add(rs.getInt("match"));
				vector.add(rs.getInt("goal_scored"));
				vector.add(rs.getInt("penalty_scored"));
				vector.add(rs.getInt("assist"));
				vector.add(rs.getInt("yellow_card"));
				vector.add(rs.getInt("red_card"));
				vector.add(rs.getInt("goal_conceded"));
				vector.add(rs.getInt("penalty_saved"));

				tableData.add(vector);
				playerMap.put(row, rs.getString("player_id"));
				++row;
			}

			tableMap.put(2, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera le statistiche per la visualizzazione nell'area amministrativa.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le statistiche.
	 * @param teamID L'ID della squadra del giocatore.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @param dataMap Una mappa per memorizzare le statistiche recuperate, associando nomi di chiavi a valori.
	 */
	@Override
	public String fetchStatisticAdminDB(String playerID,
																			String teamID,
																			String competitionID,
																			String competitionStartYear,
																			Map<String, String> dataMap)
	{
		String playID = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{call get_statistic_player_admin(?, ?, ?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamID);
			cs.setString(3, competitionID);
			cs.setString(4, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				dataMap.put(GuiConfiguration.getMessage("match"), rs.getString("match"));
				dataMap.put(GuiConfiguration.getMessage("goalScored"), rs.getString("goal_scored"));
				dataMap.put(GuiConfiguration.getMessage("penaltyScored"), rs.getString("penalty_scored"));
				dataMap.put(GuiConfiguration.getMessage("assist"), rs.getString("assist"));
				dataMap.put(GuiConfiguration.getMessage("yellowCard"), rs.getString("yellow_card"));
				dataMap.put(GuiConfiguration.getMessage("redCard"), rs.getString("red_card"));
				dataMap.put(GuiConfiguration.getMessage("goalConceded"), rs.getString("goal_conceded"));
				dataMap.put(GuiConfiguration.getMessage("penaltySaved"), rs.getString("penalty_saved"));

				playID = rs.getString("play_id");
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return playID;
	}


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
	@Override
	public String updateStatisticDB(String playID,
																	String match,
																	String goalScored,
																	String assist,
																	String yellowCard,
																	String redCard,
																	String penaltyScored,
																	String goalConceded,
																	String penaltySaved)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_statistic(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playID);
			cs.setString(3, match);
			cs.setString(4, goalScored);
			cs.setString(5, assist);
			cs.setString(6, yellowCard);
			cs.setString(7, redCard);
			cs.setString(8, penaltyScored);
			cs.setString(9, goalConceded);
			cs.setString(10, penaltySaved);

			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}
}

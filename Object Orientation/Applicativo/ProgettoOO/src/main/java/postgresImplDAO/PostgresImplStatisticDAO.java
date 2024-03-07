package postgresImplDAO;

import dao.StatisticDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class PostgresImplStatisticDAO
				implements StatisticDAO
{
	private Connection conn;
	public PostgresImplStatisticDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void fetchStatisticDB(String teamType,
															 String playerRole,
															 List<String> listPlayerID,
															 List<String> listPlayerRole,
															 List<String> listPlayerName,
															 List<String> listPlayerSurname,
															 List<String> listStatisticMatch,
															 List<String> listStatisticGoalScored,
															 List<String> listStatisticPenaltyScored,
															 List<String> listStatisticAssist,
															 List<String> listStatisticYellowCard,
															 List<String> listStatisticRedCard,
															 List<String> listStatisticGoalConceded,
															 List<String> listStatisticPenaltySaved)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call all_total_statistics(?, ?)}");
			cs.setString(1, teamType);
			cs.setString(2, playerRole);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPlayerID.add(rs.getString("player_id"));
				listPlayerRole.add(rs.getString("player_role"));
				listPlayerName.add(rs.getString("player_name"));
				listPlayerSurname.add(rs.getString("player_surname"));
				listStatisticMatch.add(rs.getString("match"));
				listStatisticGoalScored.add(rs.getString("goal_scored"));
				listStatisticPenaltyScored.add(rs.getString("penalty_scored"));
				listStatisticAssist.add(rs.getString("assist"));
				listStatisticYellowCard.add(rs.getString("yellow_card"));
				listStatisticRedCard.add(rs.getString("red_card"));
				listStatisticGoalConceded.add(rs.getString("goal_conceded"));
				listStatisticPenaltySaved.add(rs.getString("penalty_saved"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchStatisticDB(String competitionStartYear,
															 String competitionID,
															 List<String> listTeamID,
															 List<String> listTeamLongName,
															 List<String> listPlayerID,
															 List<String> listPlayerRole,
															 List<String> listPlayerName,
															 List<String> listPlayerSurname,
															 List<String> listStatisticMatch,
															 List<String> listStatisticGoalScored,
															 List<String> listStatisticPenaltyScored,
															 List<String> listStatisticAssist,
															 List<String> listStatisticYellowCard,
															 List<String> listStatisticRedCard,
															 List<String> listStatisticGoalConceded,
															 List<String> listStatisticPenaltySaved)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_edition_statistics(?, ?)}");
			cs.setString(1, competitionStartYear);
			cs.setString(2, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTeamID.add(rs.getString("team_id"));
				listTeamLongName.add(rs.getString("team_long_name"));
				listPlayerID.add(rs.getString("player_id"));
				listPlayerRole.add(rs.getString("player_role"));
				listPlayerName.add(rs.getString("player_name"));
				listPlayerSurname.add(rs.getString("player_surname"));
				listStatisticMatch.add(rs.getString("match"));
				listStatisticGoalScored.add(rs.getString("goal_scored"));
				listStatisticPenaltyScored.add(rs.getString("penalty_scored"));
				listStatisticAssist.add(rs.getString("assist"));
				listStatisticYellowCard.add(rs.getString("yellow_card"));
				listStatisticRedCard.add(rs.getString("red_card"));
				listStatisticGoalConceded.add(rs.getString("goal_conceded"));
				listStatisticPenaltySaved.add(rs.getString("penalty_saved"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchStatisticDB(String playerID,
															 String teamType,
															 String teamID,
															 String competitionID,
															 String startYear,
															 String endYear,
															 List<String> listCompetitionStartYear,
															 List<String> listCompetitionID,
															 List<String> listCompetitionName,
															 List<String> listTeamID,
															 List<String> listTeamLongName,
															 List<String> listStatisticMatch,
															 List<String> listStatisticGoalScored,
															 List<String> listStatisticPenaltyScored,
															 List<String> listStatisticAssist,
															 List<String> listStatisticYellowCard,
															 List<String> listStatisticRedCard,
															 List<String> listStatisticGoalConceded,
															 List<String> listStatisticPenaltySaved)
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

			while (rs.next()) {
				listCompetitionStartYear.add(rs.getString("start_year"));
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionName.add(rs.getString("comp_name"));
				listTeamID.add(rs.getString("team_id"));
				listTeamLongName.add(rs.getString("team_long_name"));
				listStatisticMatch.add(rs.getString("match"));
				listStatisticGoalScored.add(rs.getString("goal_scored"));
				listStatisticPenaltyScored.add(rs.getString("penalty_scored"));
				listStatisticAssist.add(rs.getString("assist"));
				listStatisticYellowCard.add(rs.getString("yellow_card"));
				listStatisticRedCard.add(rs.getString("red_card"));
				listStatisticGoalConceded.add(rs.getString("goal_conceded"));
				listStatisticPenaltySaved.add(rs.getString("penalty_saved"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchStatisticPlayer(String playerID,
																	 String teamType,
																	 String teamID,
																	 String competitionID,
																	 String startYear,
																	 String endYear,
																	 Vector<Vector<String>> playerStatisticTableData,
																	 Map<Integer, Map<Integer, String>> playerStatisticTableMap)
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

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					vector.add(season);
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(rs.getString("match"));
					vector.add(rs.getString("goal_scored"));
					vector.add(rs.getString("penalty_scored"));
					vector.add(rs.getString("assist"));
					vector.add(rs.getString("yellow_card"));
					vector.add(rs.getString("red_card"));
					vector.add(rs.getString("goal_conceded"));
					vector.add(rs.getString("penalty_saved"));

					playerStatisticTableData.add(vector);
					teamMap.put(rs.getRow() - 1, rs.getString("team_id"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<String> vector = new Vector<>();

					vector.add(rs.getString("start_year"));
					vector.add(rs.getString("comp_name"));
					vector.add(rs.getString("team_long_name"));
					vector.add(rs.getString("match"));
					vector.add(rs.getString("goal_scored"));
					vector.add(rs.getString("penalty_scored"));
					vector.add(rs.getString("assist"));
					vector.add(rs.getString("yellow_card"));
					vector.add(rs.getString("red_card"));
					vector.add(rs.getString("goal_conceded"));
					vector.add(rs.getString("penalty_saved"));

					playerStatisticTableData.add(vector);
					teamMap.put(rs.getRow() - 1, rs.getString("team_id"));
				}
			}

			playerStatisticTableMap.put(2, teamMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchStatisticEdition(String competitionStartYear,
																		String competitionID,
																		Vector<Vector<String>> statisticTableData,
																		Map<Integer, Map<Integer, String>> statisticTableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_edition_statistics(?, ?)}");
			cs.setString(1, competitionStartYear);
			cs.setString(2, competitionID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> teamMap = new HashMap<>();
			Map<Integer, String> playerMap = new HashMap<>();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
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
				vector.add(rs.getString("match"));
				vector.add(rs.getString("goal_scored"));
				vector.add(rs.getString("penalty_scored"));
				vector.add(rs.getString("assist"));
				vector.add(rs.getString("yellow_card"));
				vector.add(rs.getString("red_card"));
				vector.add(rs.getString("goal_conceded"));
				vector.add(rs.getString("penalty_saved"));

				statisticTableData.add(vector);
				teamMap.put(rs.getRow() - 1, rs.getString("team_id"));
				playerMap.put(rs.getRow() - 1, rs.getString("player_id"));
			}

			statisticTableMap.put(0, teamMap);
			statisticTableMap.put(3, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchStatisticTotal(String teamType,
																	String playerRole,
																	Vector<Vector<String>> statisticTableData,
																	Map<Integer, Map<Integer, String>> statisticTableDataMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call all_total_statistics(?, ?)}");
			cs.setString(1, teamType);
			cs.setString(2, playerRole);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> playerMap = new HashMap<>();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
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
				vector.add(rs.getString("match"));
				vector.add(rs.getString("goal_scored"));
				vector.add(rs.getString("penalty_scored"));
				vector.add(rs.getString("assist"));
				vector.add(rs.getString("yellow_card"));
				vector.add(rs.getString("red_card"));
				vector.add(rs.getString("goal_conceded"));
				vector.add(rs.getString("penalty_saved"));

				statisticTableData.add(vector);
				playerMap.put(rs.getRow() - 1, rs.getString("player_id"));
			}

			statisticTableDataMap.put(2, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

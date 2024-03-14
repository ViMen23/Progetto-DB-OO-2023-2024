package postgresImplDAO;

import dao.TrophyDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class PostgresImplTrophyDAO
				implements TrophyDAO
{
	private Connection conn;

	public PostgresImplTrophyDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


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

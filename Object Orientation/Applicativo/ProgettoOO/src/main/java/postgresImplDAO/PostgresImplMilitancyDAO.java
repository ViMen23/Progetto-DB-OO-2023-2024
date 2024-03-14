package postgresImplDAO;

import dao.MilitancyDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class PostgresImplMilitancyDAO
				implements MilitancyDAO
{
	private Connection conn;

	public PostgresImplMilitancyDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void fetchMilitancyDB(String teamID,
															 String startYear,
															 Vector<Vector<String>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call squad_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, startYear);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> playerMap = new HashMap<>();
			int row = 0;

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


	@Override
	public void fetchMilitancyNationalDB(String playerID,
																			 Vector<Vector<String>> tableData,
																			 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call national_career(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> teamMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("militancy_year"));
				vector.add(rs.getString("team_long_name"));

				tableData.add(vector);
				teamMap.put(row, rs.getString("team_id"));
				++row;
			}

			tableMap.put(1, teamMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchMilitancyClubDB(String playerID,
																	 Vector<Vector<String>> tableData,
																	 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call club_career(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> teamMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
				String season = null;

				season = rs.getString("militancy_year");
				season += "/";
				season += (Integer.parseInt(rs.getString("militancy_year")) + 1);

				vector.add(season);
				vector.add(GuiConfiguration.getMessage(rs.getString("militancy_type")));
				vector.add(rs.getString("team_long_name"));
				vector.add(rs.getString("country_name"));

				tableData.add(vector);
				teamMap.put(row, rs.getString("team_id"));
				++row;
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
	public void fetchMilitancyNationalAdminDB(String playerID,
																						Vector<Vector<Object>> tableData,
																						Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call national_career(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> seasonMap = new HashMap<>();
			Map<Integer, String> teamMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("militancy_year"));
				vector.add(rs.getString("team_long_name"));

				tableData.add(vector);
				seasonMap.put(row, rs.getString("militancy_year"));
				teamMap.put(row, rs.getString("team_id"));
				++row;
			}

			tableMap.put(1, seasonMap);
			tableMap.put(2, teamMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchMilitancyClubAdminDB(String playerID,
																				Vector<Vector<Object>> tableData,
																				Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call club_career(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> seasonMap = new HashMap<>();
			Map<Integer, String> teamMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();
				String season = null;

				season = rs.getString("militancy_year");
				season += "/";
				season += (Integer.parseInt(rs.getString("militancy_year")) + 1);

				vector.add(false);
				vector.add(season);
				vector.add(GuiConfiguration.getMessage(rs.getString("militancy_type")));
				vector.add(rs.getString("team_long_name"));
				vector.add(rs.getString("country_name"));

				tableData.add(vector);
				seasonMap.put(row, rs.getString("militancy_year"));
				teamMap.put(row, rs.getString("team_id"));
				++row;
			}

			tableMap.put(1, seasonMap);
			tableMap.put(3, teamMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public String newMilitancyDB(String playerID,
															 String teamID,
															 String teamType,
															 String startYear,
															 String seasonType)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_militancy(?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, teamID);
			cs.setString(4, teamType);
			cs.setString(5, startYear);
			cs.setString(6, seasonType);

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
	public String deleteMilitancyDB(String playerID,
																	String teamID,
																	String startYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_militancy(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, teamID);
			cs.setString(4, startYear);

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

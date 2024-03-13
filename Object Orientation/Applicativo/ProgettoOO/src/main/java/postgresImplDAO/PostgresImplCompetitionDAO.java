package postgresImplDAO;

import dao.CompetitionDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class PostgresImplCompetitionDAO
				implements CompetitionDAO
{
	private Connection conn;

	public PostgresImplCompetitionDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public int countCompetitionDB()
	{
		int count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_competition()}");
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


	@Override
	public void fetchCompetitionEditionDB(String teamType,
																				String competitionID,
																				Vector<String> comboBoxData,
																				Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_competition_edition(?)}");
			cs.setString(1, competitionID);

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


	@Override
	public void fetchCompetitionDB(String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID,
																 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competition(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, competitionSubName);
			cs.setString(2, competitionType);
			cs.setString(3, competitionTeamType);
			cs.setString(4, competitionCountryType);
			cs.setString(5, competitionContinentID);
			cs.setString(6, competitionNationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("comp_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type")));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type_team")));
				vector.add(rs.getString("conf_short_name"));
				vector.add(rs.getString("country_name"));

				tableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchCompetitionDB(String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID,
																 Vector<String> comboBoxData,
																 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competition(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, competitionSubName);
			cs.setString(2, competitionType);
			cs.setString(3, competitionTeamType);
			cs.setString(4, competitionCountryType);
			cs.setString(5, competitionContinentID);
			cs.setString(6, competitionNationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("comp_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchCompetitionDB(String playerID,
																 String teamType,
																 Vector<String> comboBoxData,
																 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_player(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("comp_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchCompetitionConfederationDB(String confederationID,
																							String teamType,
																							Vector<String> comboBoxData,
																							Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_confederation(?, ?)}");
			cs.setString(1, confederationID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("comp_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchCompetitionAdminDB(String competitionSubName,
																			String competitionType,
																			String competitionTeamType,
																			String competitionCountryType,
																			String competitionContinentID,
																			String competitionNationID,
																			Vector<Vector<String>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competition(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, competitionSubName);
			cs.setString(2, competitionType);
			cs.setString(3, competitionTeamType);
			cs.setString(4, competitionCountryType);
			cs.setString(5, competitionContinentID);
			cs.setString(6, competitionNationID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> competitonMap = new HashMap<>();
			Map<Integer, String> teamTypeMap = new HashMap<>();

			int row = 0;

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("comp_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type")));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type_team")));
				vector.add(rs.getString("conf_short_name"));
				vector.add(rs.getString("country_name"));

				tableData.add(vector);
				competitonMap.put(row, rs.getString("comp_id"));
				teamTypeMap.put(row, rs.getString("comp_type_team"));

				++row;
			}

			tableMap.put(0, competitonMap);
			tableMap.put(2, teamTypeMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchCompetitionEditionAdminDB(String competitionID,
																						 String teamType,
																						 Vector<Vector<Object>> tableData,
																						 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_competition_edition(?)}");
			cs.setString(1, competitionID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> seasonMap = new HashMap<>();

			int row = 0;

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					vector.add(false);
					vector.add(season);

					tableData.add(vector);
					seasonMap.put(row, rs.getString("start_year"));

					++row;
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					Vector<Object> vector = new Vector<>();

					vector.add(false);
					vector.add(rs.getString("start_year"));

					tableData.add(vector);
					seasonMap.put(row, rs.getString("start_year"));

					++row;
				}
			}

			tableMap.put(1, seasonMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public String newCompetitionEditionDB(String competitionID,
																				String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_competition_edition(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, competitionID);
			cs.setString(3, competitionStartYear);

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
	public String deleteCompetitionEditionDB(String competitionID,
																					 String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_competition_edition(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, competitionID);
			cs.setString(3, competitionStartYear);

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
	public void fetchCompetitionDB(String competitionID,
																 Map<String, String> infoMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_competition(?)}");
			cs.setString(1, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				infoMap.put(GuiConfiguration.getMessage("competition").toUpperCase(), rs.getString("comp_name"));
				infoMap.put(GuiConfiguration.getMessage("type"), GuiConfiguration.getMessage(rs.getString("comp_type")));
				infoMap.put(GuiConfiguration.getMessage("teamType").toUpperCase(), GuiConfiguration.getMessage(rs.getString("comp_team_type")));
				infoMap.put(GuiConfiguration.getMessage("frequency"), rs.getString("comp_freq"));
				infoMap.put(GuiConfiguration.getMessage("confederation"), rs.getString("conf_short_name"));
				infoMap.put(GuiConfiguration.getMessage("country"), rs.getString("country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchCompetitionPlayDB(String playerID,
																		 String teamType,
																		 String startYear,
																		 Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_player_season(?, ?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);
			cs.setString(3, startYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("comp_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

package postgresImplDAO;

import dao.CompetitionDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
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
	public void fetchCompetitionDB(String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID,
																 List<String> listCompetitionID,
																 List<String> listCompetitionType,
																 List<String> listCompetitionTeamType,
																 List<String> listCompetitionName,
																 List<String> listConfederationID,
																 List<String> listConfederationShortName,
																 List<String> listCountryID,
																 List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, competitionSubName);
			cs.setString(2, competitionType);
			cs.setString(3, competitionTeamType);
			cs.setString(4, competitionCountryType);
			cs.setString(5, competitionContinentID);
			cs.setString(6, competitionNationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionType.add(rs.getString("comp_type"));
				listCompetitionTeamType.add(rs.getString("comp_type_team"));
				listCompetitionName.add(rs.getString("comp_name"));
				listConfederationID.add(rs.getString("conf_id"));
				listConfederationShortName.add(rs.getString("conf_short_name"));
				listCountryID.add(rs.getString("country_id"));
				listCountryName.add(rs.getString("country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countCompetitionDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_competitions()}");
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
	public void fetchCompetitionDB(String competitionID,
																 List<String> listCompetitionEdition)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_competition_edition(?)}");
			cs.setString(1, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCompetitionEdition.add(rs.getString("start_year"));
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
																 List<String> listCompetitionID,
																 List<String> listCompetitionName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_player(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionName.add(rs.getString("comp_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCompetitionEdition(String teamType,
																			String competitionID,
																			Vector<String> competitionEditionVector,
																			Map<String, String> competitionEditionMap)
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

					competitionEditionVector.add(season);
					competitionEditionMap.put(season, rs.getString("start_year"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					competitionEditionVector.add(rs.getString("start_year"));
					competitionEditionMap.put(competitionEditionVector.getLast(), competitionEditionVector.getLast());
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
	public void fetchCompetition(String competitionSubName,
															 String competitionType,
															 String competitionTeamType,
															 String competitionCountryType,
															 String competitionContinentID,
															 String competitionNationID,
															 Vector<Vector<String>> competitionTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?, ?, ?)}");
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

				competitionTableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCompetition(String competitionSubName,
															 String competitionType,
															 String competitionTeamType,
															 String competitionCountryType,
															 String competitionContinentID,
															 String competitionNationID,
															 Vector<String> competitionNameVector,
															 Map<String, String> competitionNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, competitionSubName);
			cs.setString(2, competitionType);
			cs.setString(3, competitionTeamType);
			cs.setString(4, competitionCountryType);
			cs.setString(5, competitionContinentID);
			cs.setString(6, competitionNationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				competitionNameVector.add(rs.getString("comp_name"));
				competitionNameMap.put(competitionNameVector.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCompetition(String playerID,
															 String teamType,
															 Vector<String> competitionNameVector,
															 Map<String, String> competitionNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_player(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				competitionNameVector.add(rs.getString("comp_name"));
				competitionNameMap.put(competitionNameVector.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCompetitionConfederation(String confederationID,
																						String teamType,
																						Vector<String> competitionNameVector,
																						Map<String, String> competitionNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_competition_confederation(?, ?)}");
			cs.setString(1, confederationID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				competitionNameVector.add(rs.getString("comp_name"));
				competitionNameMap.put(competitionNameVector.getLast(), rs.getString("comp_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCompetitionAdmin(String competitionSubName,
																		String competitionType,
																		String competitionTeamType,
																		String competitionCountryType,
																		String competitionContinentID,
																		String competitionNationID,
																		Vector<Vector<String>> tableData,
																		Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?, ?, ?)}");
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
				teamTypeMap.put(row, rs.getString("comp_type"));

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
	public void fetchCompetitionEditionAdmin(String competitionID,
																					 String teamType,
																					 Vector<Vector<Object>> tableData,
																					 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call competition_year(?)}");
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
}

package postgresImplDAO;

import dao.TeamDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class PostgresImplTeamDAO
				implements TeamDAO
{
	private Connection conn;

	public PostgresImplTeamDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void fetchTeamDB(String teamSubLongName,
													String teamSubShortName,
													String teamType,
													String teamContinentID,
													String teamNationID,
													List<String> listTeamID,
													List<String> listTeamType,
													List<String> listTeamShortName,
													List<String> listTeamLongName,
													List<String> listCountryID,
													List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_teams(?, ?, ?, ?, ?)}");
			cs.setString(1, teamSubLongName);
			cs.setString(2, teamSubShortName);
			cs.setString(3, teamType);
			cs.setString(4, teamContinentID);
			cs.setString(5, teamNationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTeamID.add(rs.getString("team_id"));
				listTeamType.add(rs.getString("team_type"));
				listTeamShortName.add(rs.getString("team_short_name"));
				listTeamLongName.add(rs.getString("team_long_name"));
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
	public Integer countTeamDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_teams()}");
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
	public void fetchTeamDB(String competitionStartYear,
													String competitionID,
													List<String> listTeamID,
													List<String> listTeamLongName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_teams(?, ?)}");
			cs.setString(1, competitionStartYear);
			cs.setString(2, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTeamID.add(rs.getString("team_id"));
				listTeamLongName.add(rs.getString("team_long_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeamDB(String teamID,
													Map<String, String> mapTeamInfo)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				mapTeamInfo.put("teamID", rs.getString("team_id"));
				mapTeamInfo.put("teamType", rs.getString("team_type"));
				mapTeamInfo.put("teamShortName", rs.getString("team_short_name"));
				mapTeamInfo.put("teamLongName", rs.getString("team_long_name"));
				mapTeamInfo.put("countryID", rs.getString("country_id"));
				mapTeamInfo.put("countryName", rs.getString("country_name"));
				mapTeamInfo.put("confederationID", rs.getString("conf_id"));
				mapTeamInfo.put("confederationShortName", rs.getString("conf_short_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeamDB(String playerID,
													List<String> listTeamID,
													List<String> listTeamLongName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call club_team_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTeamID.add(rs.getString("team_id"));
				listTeamLongName.add(rs.getString("team_long_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeamDB(String teamID,
													List<String> listTeamYear)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call year_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTeamYear.add(rs.getString("start_year"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

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

	@Override
	public void fetchTeam(String teamSubLongName,
												String teamSubShortName,
												String teamType,
												String teamContinentID,
												String teamNationID,
												Vector<Vector<String>> teamTableData,
												Map<Integer, Map<Integer, String>> teamTableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_teams(?, ?, ?, ?, ?)}");
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

				teamTableData.add(vector);
				teamLongNameMap.put(rs.getRow() - 1, rs.getString("team_id"));
			}

			teamTableMap.put(0, teamLongNameMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeam(String playerID,
												Vector<String> teamLongNameVector,
												Map<String, String> teamLongNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call club_team_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				teamLongNameVector.add(rs.getString("team_long_name"));
				teamLongNameMap.put(teamLongNameVector.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeam(String teamID,
												String teamType,
												Vector<String> teamYearVector,
												Map<String, String> teamYearMap)
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

					teamYearVector.add(season);
					teamYearMap.put(season, rs.getString("start_year"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					teamYearVector.add(rs.getString("start_year"));
					teamYearMap.put(teamYearVector.getLast(), teamYearVector.getLast());
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
	public void fetchTeamCombo(String teamSubLongName,
														 String teamSubShortName,
														 String teamType,
														 String teamContinentID,
														 String teamNationID,
														 Vector<String> teamLongNameVector,
														 Map<String, String> teamLongNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_teams(?, ?, ?, ?, ?)}");
			cs.setString(1, teamSubLongName);
			cs.setString(2, teamSubShortName);
			cs.setString(3, teamType);
			cs.setString(4, teamContinentID);
			cs.setString(5, teamNationID);

			ResultSet rs = cs.executeQuery();


			while (rs.next()) {
				teamLongNameVector.add(rs.getString("team_long_name"));
				teamLongNameMap.put(teamLongNameVector.getLast(), rs.getString("team_id"));
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeam(String teamID,
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

	@Override
	public void fetchTeamCompetition(String competitionStartYear,
																	 String competitionID,
																	 Vector<String> teamLongNameVector,
																	 Map<String, String> teamLongNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_teams(?, ?)}");
			cs.setString(1, competitionStartYear);
			cs.setString(2, competitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				teamLongNameVector.add(rs.getString("team_long_name"));
				teamLongNameMap.put(teamLongNameVector.getLast(), rs.getString("team_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeamComboBox(String playerID,
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

	@Override
	public void fetchTeam(String playerID,
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
}

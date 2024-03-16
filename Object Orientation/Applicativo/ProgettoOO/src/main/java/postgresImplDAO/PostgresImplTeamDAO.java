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

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia TeamDAO.
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

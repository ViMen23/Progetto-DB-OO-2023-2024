package postgresImplDAO;

import dao.TeamDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;
import java.util.Map;

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
	public void newNationalTeamDB(String countryID,
																String message)
	{
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
	}

	@Override
	public void newClubTeamDB(String countryID,
														String teamLongName,
														String teamShortName,
														String message)
	{
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
	}

	@Override
	public void updateClubTeamDB(String teamID,
															 String teamLongName,
															 String teamShortName,
															 String message)
	{
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
	}

	@Override
	public void deleteTeamDB(String teamID,
													 String message)
	{
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
	}
}

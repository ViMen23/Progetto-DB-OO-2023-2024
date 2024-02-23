package postgresImplDAO;

import dao.TeamDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;

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
	public void teamsDB(String teamSubLongName,
											String teamSubShortName,
											String teamType,
											String teamCountryType,
											String teamCountryID,
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
			cs.setString(4, teamCountryType);
			cs.setString(5, teamCountryID);

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
	public Integer countAllTeamsDB()
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
}

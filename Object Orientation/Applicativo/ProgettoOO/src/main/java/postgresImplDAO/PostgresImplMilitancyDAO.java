package postgresImplDAO;

import dao.MilitancyDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
															 List<String> listPlayerID,
															 List<String> listPlayerName,
															 List<String> listPlayerSurname,
															 List<String> listPlayerRole)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call squad_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, startYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPlayerID.add(rs.getString("player_id"));
				listPlayerName.add(rs.getString("player_name"));
				listPlayerSurname.add(rs.getString("player_surname"));
				listPlayerRole.add(rs.getString("player_role"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchMilitancyDB(String playerID,
															 List<String> listMilitancyYear,
															 List<String> listMilitancyType,
															 List<String> listTeamID,
															 List<String> listTeamLongName,
															 List<String> listCountryID,
															 List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_club_career_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listMilitancyYear.add(rs.getString("militancy_year"));
				listMilitancyType.add(rs.getString("militancy_type"));
				listTeamID.add(rs.getString("team_id"));
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
	public void fetchMilitancyDB(String playerID,
															 List<String> listMilitancyYear,
															 List<String> listTeamID,
															 List<String> listTeamLongName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_national_career_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listMilitancyYear.add(rs.getString("militancy_year"));
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
}

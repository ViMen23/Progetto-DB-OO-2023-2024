package postgresImplDAO;

import dao.PlayerDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;
import java.util.Map;

public class PostgresImplPlayerDAO
				implements PlayerDAO
{
	private Connection conn;
	public PostgresImplPlayerDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchPlayerDB(String playerSubName,
														String playerSubSurname,
														String playerReferringYear,
														String playerMinAge,
														String playerMaxAge,
														String playerContinentID,
														String playerNationID,
														String playerRole,
														String playerPositionID,
														String playerFoot,
														List<String> listPlayerID,
														List<String> listPlayerName,
														List<String> listPlayerSurname,
														List<String> listPlayerDob,
														List<String> listPlayerFoot,
														List<String> listPlayerRole,
														List<String> listPlayerRetiredDate,
														List<String> listPositionID,
														List<String> listPositionName,
														List<String> listCountryID,
														List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_players(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.setString(1, playerSubName);
			cs.setString(2, playerSubSurname);
			cs.setString(3, playerReferringYear);
			cs.setString(4, playerMinAge);
			cs.setString(5, playerMaxAge);
			cs.setString(6, playerContinentID);
			cs.setString(7, playerNationID);
			cs.setString(8, playerRole);
			cs.setString(9, playerPositionID);
			cs.setString(10, playerFoot);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPlayerID.add(rs.getString("player_id"));
				listPlayerName.add(rs.getString("player_name"));
				listPlayerSurname.add(rs.getString("player_surname"));
				listPlayerDob.add(rs.getString("player_dob"));
				listPlayerFoot.add(rs.getString("player_foot"));
				listPlayerRole.add(rs.getString("player_role"));
				listPlayerRetiredDate.add(rs.getString("player_retired_date"));
				listPositionID.add(rs.getString("position_id"));
				listPositionName.add(rs.getString("position_name"));
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
	public Integer countPlayerDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_players()}");
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
	public void fetchPlayerDB(String militancyPlayerTeamID,
														String militancyPlayerStartYear,
														String militancyPlayerEndYear,
														List<String> listPlayerID,
														List<String> listPlayerName,
														List<String> listPlayerSurname,
														List<String> listPlayerDob,
														List<String> listPlayerFoot,
														List<String> listPlayerRole,
														List<String> listPlayerRetiredDate,
														List<String> listPositionID,
														List<String> listPositionName,
														List<String> listCountryID,
														List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_militancy_players(?, ?, ?)}");
			cs.setString(1, militancyPlayerTeamID);
			cs.setString(2, militancyPlayerStartYear);
			cs.setString(3, militancyPlayerEndYear);


			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPlayerID.add(rs.getString("player_id"));
				listPlayerName.add(rs.getString("player_name"));
				listPlayerSurname.add(rs.getString("player_surname"));
				listPlayerDob.add(rs.getString("player_dob"));
				listPlayerFoot.add(rs.getString("player_foot"));
				listPlayerRole.add(rs.getString("player_role"));
				listPlayerRetiredDate.add(rs.getString("player_retired_date"));
				listPositionID.add(rs.getString("position_id"));
				listPositionName.add(rs.getString("position_name"));
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
	public void fetchPlayerDB(String startYear,
							String teamID,
							List<String> listPlayerID,
							List<String> listPlayerName,
							List<String> listPlayerSurname,
							List<String> listPlayerRole)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_players(?, ?)}");
			cs.setString(1, startYear);
			cs.setString(2, teamID);


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
	public void fetchPlayerDB(String playerID,
														Map<String, String> mapPlayerInfo)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				mapPlayerInfo.put("playerID", rs.getString("player_id"));
				mapPlayerInfo.put("playerName", rs.getString("player_name"));
				mapPlayerInfo.put("playerSurname", rs.getString("player_surname"));
				mapPlayerInfo.put("playerDob", rs.getString("player_dob"));
				mapPlayerInfo.put("countryName", rs.getString("country_name"));
				mapPlayerInfo.put("playerFoot", rs.getString("player_foot"));
				mapPlayerInfo.put("positionName", rs.getString("position_name"));
				mapPlayerInfo.put("playerRole", rs.getString("player_role"));
				mapPlayerInfo.put("playerRetiredDate", rs.getString("player_retired_date"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

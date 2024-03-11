package postgresImplDAO;

import dao.PlayerDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

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

	@Override
	public void fetchPlayerDB(String playerID,
														List<String> startYearSeason)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call season_play(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				startYearSeason.add(rs.getString("start_year"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayer(String playerID,
													Map<String, String> infoPlayerMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				String role = "";

				infoPlayerMap.put(GuiConfiguration.getMessage("name").toUpperCase(), rs.getString("player_name"));
				infoPlayerMap.put(GuiConfiguration.getMessage("surname").toUpperCase(), rs.getString("player_surname"));
				infoPlayerMap.put(GuiConfiguration.getMessage("dob").toUpperCase(), rs.getString("player_dob"));
				infoPlayerMap.put(GuiConfiguration.getMessage("bornCountry"), rs.getString("country_name"));
				infoPlayerMap.put(GuiConfiguration.getMessage("foot").toUpperCase(), GuiConfiguration.getMessage(rs.getString("player_foot")));
				infoPlayerMap.put(GuiConfiguration.getMessage("mainPosition"), GuiConfiguration.getMessage(rs.getString("position_name")));

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				infoPlayerMap.put(GuiConfiguration.getMessage("role"), role);

				if (null == rs.getString("player_retired_date")) {
					infoPlayerMap.put(GuiConfiguration.getMessage("retiredDate").toUpperCase(), "");
				} else {
					infoPlayerMap.put(GuiConfiguration.getMessage("retiredDate").toUpperCase(), rs.getString("player_retired_date"));
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
	public void fetchPlayer(String startYear,
													String teamID,
													Vector<String> playerInfoVector,
													Map<String, String> playerInfoMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_players(?, ?)}");
			cs.setString(1, startYear);
			cs.setString(2, teamID);


			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				String playerInfo = "";
				String role = "";

				playerInfo += "[";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				playerInfo += role;
				playerInfo += "] ";
				playerInfo += rs.getString("player_name");
				playerInfo += " ";
				playerInfo += rs.getString("player_surname");

				playerInfoVector.add(playerInfo);
				playerInfoMap.put(playerInfoVector.getLast(), rs.getString("player_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayer(String playerSubName,
													String playerSubSurname,
													String playerReferringYear,
													String playerMinAge,
													String playerMaxAge,
													String playerContinentID,
													String playerNationID,
													String playerRole,
													String playerPositionID,
													String playerFoot,
													Vector<Vector<String>> playerTableData,
													Map<Integer, Map<Integer, String>> playerTableMap)
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

			Map<Integer, String> playerMap = new HashMap<>();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
				String role = "";


				vector.add(rs.getString("player_surname"));
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_dob"));
				vector.add(rs.getString("country_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("player_foot")));

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				vector.add(role);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));

				if (null == rs.getString("player_retired_date")) {
					vector.add("");
				} else {
					vector.add(rs.getString("player_retired_date"));
				}


				playerTableData.add(vector);
				playerMap.put(rs.getRow() - 1, rs.getString("player_id"));
			}

			playerTableMap.put(0, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayer(String militancyPlayerTeamID,
													String militancyPlayerStartYear,
													String militancyPlayerEndYear,
													Vector<Vector<String>> playerTableData,
													Map<Integer, Map<Integer, String>> playerTableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_militancy_players(?, ?, ?)}");
			cs.setString(1, militancyPlayerTeamID);
			cs.setString(2, militancyPlayerStartYear);
			cs.setString(3, militancyPlayerEndYear);


			ResultSet rs = cs.executeQuery();

			Map<Integer, String> playerMap = new HashMap<>();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
				String role = "";


				vector.add(rs.getString("player_surname"));
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_dob"));
				vector.add(rs.getString("country_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("player_foot")));

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				vector.add(role);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));

				if (null == rs.getString("player_retired_date")) {
					vector.add("");
				} else {
					vector.add(rs.getString("player_retired_date"));
				}


				playerTableData.add(vector);
				playerMap.put(rs.getRow() - 1, rs.getString("player_id"));
			}

			playerTableMap.put(0, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayerYear(String playerID,
															String teamType,
															Vector<String> seasonVector,
															Map<String, String> seasonMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call season_play(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					seasonVector.add(season);
					seasonMap.put(season, rs.getString("start_year"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					seasonVector.add(rs.getString("start_year"));
					seasonMap.put(seasonVector.getLast(), seasonVector.getLast());
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
	public void fetchPlayerYear(String playerID,
															String playerStartYear,
															String playerEndYear)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{SELECT * INTO ?, ? FROM player_year(?)}");
			cs.setString(1, playerID);
			cs.setString(2, playerStartYear);
			cs.setString(3, playerEndYear);

			cs.execute();

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

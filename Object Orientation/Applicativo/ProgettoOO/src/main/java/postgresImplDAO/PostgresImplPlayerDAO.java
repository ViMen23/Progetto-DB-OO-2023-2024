package postgresImplDAO;

import dao.PlayerDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia PlayerDAO.
 */
public class PostgresImplPlayerDAO
				implements PlayerDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplPlayerDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public int countPlayerDB()
	{
		int count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_player()}");
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
	public void fetchPlayerDB(String playerID,
														Map<String, String> infoMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				infoMap.put(GuiConfiguration.getMessage("name").toUpperCase(), rs.getString("player_name"));
				infoMap.put(GuiConfiguration.getMessage("surname").toUpperCase(), rs.getString("player_surname"));
				infoMap.put(GuiConfiguration.getMessage("dob").toUpperCase(), rs.getString("player_dob"));
				infoMap.put(GuiConfiguration.getMessage("bornCountry"), rs.getString("country_name"));
				infoMap.put(GuiConfiguration.getMessage("foot").toUpperCase(), GuiConfiguration.getMessage(rs.getString("player_foot")));
				infoMap.put(GuiConfiguration.getMessage("mainPosition"), GuiConfiguration.getMessage(rs.getString("position_name")));
				infoMap.put(GuiConfiguration.getMessage("role"), role);
				infoMap.put(GuiConfiguration.getMessage("retiredDate").toUpperCase(), rs.getString("player_retired_date"));
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
														Vector<String> comboBoxData,
														Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_player(?, ?)}");
			cs.setString(1, startYear);
			cs.setString(2, teamID);


			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				String playerInfo = "";
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				playerInfo += "[";
				playerInfo += role;
				playerInfo += "] ";
				playerInfo += rs.getString("player_name");
				playerInfo += " ";
				playerInfo += rs.getString("player_surname");

				comboBoxData.add(playerInfo);
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("player_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
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
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_player(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
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

				vector.add(rs.getString("player_surname"));
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_dob"));
				vector.add(rs.getString("country_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("player_foot")));
				vector.add(role);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));
				vector.add(rs.getString("player_retired_date"));


				tableData.add(vector);
				playerMap.put(row, rs.getString("player_id"));
				++row;
			}

			tableMap.put(0, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchPlayerDB(String militancyPlayerTeamID,
														String militancyPlayerStartYear,
														String militancyPlayerEndYear,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_militancy_player(?, ?, ?)}");
			cs.setString(1, militancyPlayerTeamID);
			cs.setString(2, militancyPlayerStartYear);
			cs.setString(3, militancyPlayerEndYear);


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

				vector.add(rs.getString("player_surname"));
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_dob"));
				vector.add(rs.getString("country_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("player_foot")));
				vector.add(role);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));
				vector.add(rs.getString("player_retired_date"));

				tableData.add(vector);
				playerMap.put(row, rs.getString("player_id"));
				++row;
			}

			tableMap.put(0, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchPlayerYearDB(String playerID,
																String teamType,
																Vector<String> comboBoxData,
																Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call season_play(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

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
	public String fetchPlayerYearDB(String playerID)
	{
		String playerYear = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call player_year(?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);

			cs.execute();

			playerYear = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return playerYear;
	}


	@Override
	public String newPlayerDB(String name,
														String surname,
														String dob,
														String countryID,
														String foot,
														String positionID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_player(?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, name);
			cs.setString(3, surname);
			cs.setString(4, dob);
			cs.setString(5, countryID);
			cs.setString(6, foot);
			cs.setString(7, positionID);

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
	public String deletePlayerDB(String playerID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_player(?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);

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
	public String updatePlayerDB(String playerID,
															 String name,
															 String surname,
															 String dob,
															 String countryID,
															 String foot,
															 String positionID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_player(?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, name);
			cs.setString(4, surname);
			cs.setString(5, dob);
			cs.setString(6, countryID);
			cs.setString(7, foot);
			cs.setString(8, positionID);


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
	public String setRetiredDateDB(String playerID,
																 String retiredDate)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call set_retired_date(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, retiredDate);


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
	public String randomPlayerDB()
	{
		String randomID = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call random_player()}");
			cs.registerOutParameter(1, Types.VARCHAR);

			cs.execute();

			randomID = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return randomID;
	}

}

package postgresImplDAO;

import dao.PrizeDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia PrizeDAO.
 */
public class PostgresImplPrizeDAO
				implements PrizeDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplPrizeDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public String newPrizeTeamDB(String teamID,
															 String prizeID,
															 String assignedYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_prize_team(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, prizeID);
			cs.setString(4, assignedYear);

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
	public String deletePrizeTeamDB(String teamID,
																	String prizeID,
																	String assignedYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_prize_team(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, prizeID);
			cs.setString(4, assignedYear);

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
	public void fetchPrizeDB(String teamID,
													 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call prize_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("prize_assign_year"));
				vector.add(rs.getString("prize_name"));
				vector.add(rs.getString("prize_given"));

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
	public void fetchPrizePlayerDB(String playerID,
																 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call prize_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("prize_year"));
				vector.add(rs.getString("prize_name"));
				vector.add(rs.getString("prize_given"));

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
	public void fetchTeamPrizeAdminDB(String teamID,
																		Vector<Vector<Object>> tableData,
																		Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call prize_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> yearMap = new HashMap<>();
			Map<Integer, String> prizeMap = new HashMap<>();

			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("prize_assign_year"));
				vector.add(rs.getString("prize_name"));
				vector.add(rs.getString("prize_given"));

				tableData.add(vector);
				yearMap.put(row, rs.getString("prize_assign_year"));
				prizeMap.put(row, rs.getString("prize_id"));

				++row;
			}

			tableMap.put(1, yearMap);
			tableMap.put(2, prizeMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTeamPrizeDB(Vector<String> comboBoxData,
															 Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_team_prize");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("prize_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("prize_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayerPrizeDB(Vector<String> comboBoxData,
																 Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_player_prize");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String data = "";
				data += "[";
				data += GuiConfiguration.getMessage(rs.getString("prize_role"));
				data += "] ";
				data += rs.getString("prize_name");

				comboBoxData.add(data);
				comboBoxMap.put(data, rs.getString("prize_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayerPrizeDB(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call prize_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> assignYearMap = new HashMap<>();
			Map<Integer, String> prizeMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("prize_year"));
				vector.add(rs.getString("prize_name"));
				vector.add(rs.getString("prize_given"));

				tableData.add(vector);
				assignYearMap.put(row, rs.getString("prize_year"));
				prizeMap.put(row, rs.getString("prize_id"));
				++row;
			}

			tableMap.put(1, assignYearMap);
			tableMap.put(2, prizeMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String newPlayerPrizeDB(String playerID,
																 String prizeID,
																 String assignedYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_player_prize(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, prizeID);
			cs.setString(4, assignedYear);

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
	public String deletePlayerPrizeDB(String playerID,
																		String prizeID,
																		String assignedYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_player_prize(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, prizeID);
			cs.setString(4, assignedYear);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}
}

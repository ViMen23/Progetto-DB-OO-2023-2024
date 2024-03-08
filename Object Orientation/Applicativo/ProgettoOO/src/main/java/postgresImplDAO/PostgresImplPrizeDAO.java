package postgresImplDAO;

import dao.PrizeDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class PostgresImplPrizeDAO
				implements PrizeDAO
{
	private Connection conn;

	public PostgresImplPrizeDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchTeamPrizeDB(String teamID,
															 List<String> listPrizeID,
															 List<String> listPrizeAssignYear,
															 List<String> listPrizeName,
															 List<String> listPrizeGiven)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call prize_team(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPrizeID.add(rs.getString("prize_id"));
				listPrizeAssignYear.add(rs.getString("prize_assign_year"));
				listPrizeName.add(rs.getString("prize_name"));
				listPrizeGiven.add(rs.getString("prize_given"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPlayerPrizeDB(String playerID,
																 List<String> listPrizeAssignYear,
																 List<String> listPrizeName,
																 List<String> listPrizeGiven)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_prize_case(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPrizeAssignYear.add(rs.getString("prize_year"));
				listPrizeName.add(rs.getString("prize_name"));
				listPrizeGiven.add(rs.getString("prize_given"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String newPrizeTeam(String teamID,
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
	public String deletePrizeTeam(String teamID,
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
	public void fetchPrize(String teamID,
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
	public void fetchPrizePlayer(String playerID,
															 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_prize_case(?)}");
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
	public void fetchTeamPrizeAdmin(String teamID,
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
	public void fetchTeamPrize(Vector<String> comboBoxData,
														 Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_team_prize");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				comboBoxData.add(GuiConfiguration.getMessage(rs.getString("prize_name")));
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
	public void fetchPlayerPrize(Vector<String> comboBoxData,
															 Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_player_trophy");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String data = "";
				data += "[";
				data += GuiConfiguration.getMessage(rs.getString("prize_role"));
				data += "] ";
				data += GuiConfiguration.getMessage(rs.getString("prize_name"));

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
}

package postgresImplDAO;

import dao.PrizeDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;

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
	public void newPrizeTeam(String teamID,
													 String prizeID,
													 String assignedYear,
													 String message)
	{
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
	}

	@Override
	public void deletePrizeTeam(String teamID,
															String prizeID,
															String assignedYear,
															String message)
	{
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
	}
}

package postgresImplDAO;

import dao.PrizeDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}

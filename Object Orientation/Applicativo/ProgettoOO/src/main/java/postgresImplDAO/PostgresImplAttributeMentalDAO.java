package postgresImplDAO;

import dao.AttributeMentalDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class PostgresImplAttributeMentalDAO
				implements AttributeMentalDAO
{
	private Connection conn;

	public PostgresImplAttributeMentalDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchAttributeMentalDB(String playerID,
																		 Map<String, String> mapAttributeMental)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_mental(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				mapAttributeMental.put("aggression", rs.getString("aggression"));
				mapAttributeMental.put("anticipation", rs.getString("anticipation"));
				mapAttributeMental.put("bravery", rs.getString("bravery"));
				mapAttributeMental.put("composure", rs.getString("composure"));
				mapAttributeMental.put("concentration", rs.getString("concentration"));
				mapAttributeMental.put("decision", rs.getString("decision"));
				mapAttributeMental.put("determination", rs.getString("determination"));
				mapAttributeMental.put("flair", rs.getString("flair"));
				mapAttributeMental.put("leadership", rs.getString("leadership"));
				mapAttributeMental.put("offTheBall", rs.getString("off_the_ball"));
				mapAttributeMental.put("positioning", rs.getString("positioning"));
				mapAttributeMental.put("teamwork", rs.getString("teamwork"));
				mapAttributeMental.put("vision", rs.getString("vision"));
				mapAttributeMental.put("workRate", rs.getString("work_rate"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

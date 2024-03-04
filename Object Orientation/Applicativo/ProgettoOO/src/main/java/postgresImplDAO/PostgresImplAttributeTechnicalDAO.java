package postgresImplDAO;

import dao.AttributeTechnicalDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class PostgresImplAttributeTechnicalDAO
				implements AttributeTechnicalDAO
{
	private Connection conn;

	public PostgresImplAttributeTechnicalDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchAttributeTechnicalDB(String playerID,
																				Map<String, String> mapAttributeTechnical)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_technical(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				mapAttributeTechnical.put("corners", rs.getString("corners"));
				mapAttributeTechnical.put("crossing", rs.getString("crossing"));
				mapAttributeTechnical.put("dribbling", rs.getString("dribbling"));
				mapAttributeTechnical.put("finishing", rs.getString("finishing"));
				mapAttributeTechnical.put("firstTouch", rs.getString("first_touch"));
				mapAttributeTechnical.put("freeKickTaking", rs.getString("free_kick_taking"));
				mapAttributeTechnical.put("heading", rs.getString("heading"));
				mapAttributeTechnical.put("longShots", rs.getString("long_shots"));
				mapAttributeTechnical.put("longThrows", rs.getString("long_throws"));
				mapAttributeTechnical.put("marking", rs.getString("marking"));
				mapAttributeTechnical.put("passing", rs.getString("passing"));
				mapAttributeTechnical.put("penaltyTaking", rs.getString("penalty_taking"));
				mapAttributeTechnical.put("tackling", rs.getString("tackling"));
				mapAttributeTechnical.put("technique", rs.getString("technique"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

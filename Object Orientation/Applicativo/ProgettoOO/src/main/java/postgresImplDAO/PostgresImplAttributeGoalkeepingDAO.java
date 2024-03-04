package postgresImplDAO;

import dao.AttributeGoalkeepingDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class PostgresImplAttributeGoalkeepingDAO
				implements AttributeGoalkeepingDAO
{
	private Connection conn;

	public PostgresImplAttributeGoalkeepingDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchAttributeGoalkeepingDB(String playerID,
																					Map<String, String> mapAttributeGoalkeeping)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_goalkeeping(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				mapAttributeGoalkeeping.put("aerialReach", rs.getString("aerial_reach"));
				mapAttributeGoalkeeping.put("commandOfArea", rs.getString("command_of_area"));
				mapAttributeGoalkeeping.put("communication", rs.getString("communication"));
				mapAttributeGoalkeeping.put("eccentricity", rs.getString("eccentricity"));
				mapAttributeGoalkeeping.put("firstTouchGk", rs.getString("first_touch_gk"));
				mapAttributeGoalkeeping.put("handling", rs.getString("handling"));
				mapAttributeGoalkeeping.put("kicking", rs.getString("kicking"));
				mapAttributeGoalkeeping.put("oneOnOnes", rs.getString("one_on_ones"));
				mapAttributeGoalkeeping.put("passingGk", rs.getString("passing_gk"));
				mapAttributeGoalkeeping.put("punchingTendency", rs.getString("punching_tendency"));
				mapAttributeGoalkeeping.put("reflexes", rs.getString("reflexes"));
				mapAttributeGoalkeeping.put("rushingOutTendency", rs.getString("rushing_out_tendency"));
				mapAttributeGoalkeeping.put("throwing", rs.getString("throwing"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

package postgresImplDAO;

import dao.AttributePhysicalDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class PostgresImplAttributePhysicalDAO
				implements AttributePhysicalDAO
{
	private Connection conn;

	public PostgresImplAttributePhysicalDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchAttributePhysicalDB(String playerID,
																			 Map<String, String> mapAttributePhysical)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_physical(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				mapAttributePhysical.put("acceleration", rs.getString("acceleration"));
				mapAttributePhysical.put("agility", rs.getString("agility"));
				mapAttributePhysical.put("balance", rs.getString("balance"));
				mapAttributePhysical.put("jumpingReach", rs.getString("jumping_reach"));
				mapAttributePhysical.put("naturalFitness", rs.getString("natural_fitness"));
				mapAttributePhysical.put("pace", rs.getString("pace"));
				mapAttributePhysical.put("stamina", rs.getString("stamina"));
				mapAttributePhysical.put("strenght", rs.getString("strenght"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

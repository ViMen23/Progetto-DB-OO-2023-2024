package postgresImplDAO;

import dao.AttributePhysicalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

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
				mapAttributePhysical.put("strength", rs.getString("strength"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchAttributePhysical(String playerID,
																		 Vector<Vector<String>> playerAttributePhysicalTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_physical(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("acceleration")); add(rs.getString("acceleration"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("agility")); add(rs.getString("agility"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("balance")); add(rs.getString("balance"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("jumpingReach")); add(rs.getString("jumping_reach"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("naturalFitness")); add(rs.getString("natural_fitness"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("pace")); add(rs.getString("pace"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("stamina")); add(rs.getString("stamina"));}});
				playerAttributePhysicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("strength")); add(rs.getString("strength"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributePhysical(String playerID,
																				String acceleration,
																				String agility,
																				String balance,
																				String jumpingReach,
																				String naturalFitness,
																				String pace,
																				String stamina,
																				String strength)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_attribute_physical(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, acceleration);
			cs.setString(4, agility);
			cs.setString(5, balance);
			cs.setString(6, jumpingReach);
			cs.setString(7, naturalFitness);
			cs.setString(8, pace);
			cs.setString(9, stamina);
			cs.setString(10, strength);


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

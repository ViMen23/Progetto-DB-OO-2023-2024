package postgresImplDAO;

import dao.AttributePhysicalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia AttributePhysicalDAO.
 */
public class PostgresImplAttributePhysicalDAO
				implements AttributePhysicalDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
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
																			 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_physical(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("acceleration")); add(rs.getString("acceleration"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("agility")); add(rs.getString("agility"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("balance")); add(rs.getString("balance"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("jumpingReach")); add(rs.getString("jumping_reach"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("naturalFitness")); add(rs.getString("natural_fitness"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("pace")); add(rs.getString("pace"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("stamina")); add(rs.getString("stamina"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("strength")); add(rs.getString("strength"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributePhysicalDB(String playerID,
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

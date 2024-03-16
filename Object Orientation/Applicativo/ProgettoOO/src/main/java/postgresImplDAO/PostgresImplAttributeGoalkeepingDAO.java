package postgresImplDAO;

import dao.AttributeGoalkeepingDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia AttributeGoalkeepingDAO.
 */
public class PostgresImplAttributeGoalkeepingDAO
				implements AttributeGoalkeepingDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
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
																					Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_goalkeeping(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("aerialReach")); add(rs.getString("aerial_reach"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("commandOfArea")); add(rs.getString("command_of_area"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("communication")); add(rs.getString("communication"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("eccentricity")); add(rs.getString("eccentricity"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("firstTouchGk")); add(rs.getString("first_touch_gk"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("handling")); add(rs.getString("handling"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("kicking")); add(rs.getString("kicking"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("oneOnOnes")); add(rs.getString("one_on_ones"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("passingGk")); add(rs.getString("passing_gk"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("punchingTendency")); add(rs.getString("punching_tendency"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("reflexes")); add(rs.getString("reflexes"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("rushingOutTendency")); add(rs.getString("rushing_out_tendency"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("throwing")); add(rs.getString("throwing"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributeGoalkeepingDB(String playerID,
																						 String aerialReach,
																						 String commandOfArea,
																						 String communication,
																						 String eccentricity,
																						 String firstTouchGk,
																						 String handling,
																						 String kicking,
																						 String oneOnOnes,
																						 String passingGk,
																						 String punchingTendency,
																						 String reflexes,
																						 String rushingOutTendency,
																						 String throwing)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_attribute_goalkeeping(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, aerialReach);
			cs.setString(4, commandOfArea);
			cs.setString(5, communication);
			cs.setString(6, eccentricity);
			cs.setString(7, firstTouchGk);
			cs.setString(8, handling);
			cs.setString(9, kicking);
			cs.setString(10, oneOnOnes);
			cs.setString(11, passingGk);
			cs.setString(12, punchingTendency);
			cs.setString(13, reflexes);
			cs.setString(14, rushingOutTendency);
			cs.setString(15, throwing);


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

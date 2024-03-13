package postgresImplDAO;

import dao.AttributeGoalkeepingDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

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

	@Override
	public void fetchAttributeGoalkeeping(String playerID,
																				Vector<Vector<String>> playerAttributeGoalkeepingTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_goalkeeping(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("aerialReach")); add(rs.getString("aerial_reach"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("commandOfArea")); add(rs.getString("command_of_area"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("communication")); add(rs.getString("communication"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("eccentricity")); add(rs.getString("eccentricity"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("firstTouchGk")); add(rs.getString("first_touch_gk"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("handling")); add(rs.getString("handling"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("kicking")); add(rs.getString("kicking"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("oneOnOnes")); add(rs.getString("one_on_ones"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("passingGk")); add(rs.getString("passing_gk"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("punchingTendency")); add(rs.getString("punching_tendency"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("reflexes")); add(rs.getString("reflexes"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("rushingOutTendency")); add(rs.getString("rushing_out_tendency"));}});
				playerAttributeGoalkeepingTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("throwing")); add(rs.getString("throwing"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributeGoalkeeping(String playerID,
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

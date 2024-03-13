package postgresImplDAO;

import dao.AttributeMentalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

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

	@Override
	public void fetchAttributeMental(String playerID,
																	 Vector<Vector<String>> playerAttributeMentalTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_mental(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("aggression")); add(rs.getString("aggression"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("anticipation")); add(rs.getString("anticipation"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("bravery")); add(rs.getString("bravery"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("composure")); add(rs.getString("composure"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("concentration")); add(rs.getString("concentration"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("decision")); add(rs.getString("decision"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("determination")); add(rs.getString("determination"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("flair")); add(rs.getString("flair"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("leadership")); add(rs.getString("leadership"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("offTheBall")); add(rs.getString("off_the_ball"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("positioning")); add(rs.getString("positioning"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("teamwork")); add(rs.getString("teamwork"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("vision")); add(rs.getString("vision"));}});
				playerAttributeMentalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("workRate")); add(rs.getString("work_rate"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributeMental(String playerID,
																			String aggression,
																			String anticipation,
																			String bravery,
																			String composure,
																			String concentration,
																			String decision,
																			String determination,
																			String flair,
																			String leadership,
																			String offTheBall,
																			String positioning,
																			String teamwork,
																			String vision,
																			String workRate)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_attribute_mental(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, aggression);
			cs.setString(4, anticipation);
			cs.setString(5, bravery);
			cs.setString(6, composure);
			cs.setString(7, concentration);
			cs.setString(8, decision);
			cs.setString(9, determination);
			cs.setString(10, flair);
			cs.setString(11, leadership);
			cs.setString(12, offTheBall);
			cs.setString(13, positioning);
			cs.setString(14, teamwork);
			cs.setString(15, vision);
			cs.setString(16, workRate);


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

package postgresImplDAO;

import dao.AttributeMentalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
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
																		 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_mental(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("aggression")); add(rs.getString("aggression"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("anticipation")); add(rs.getString("anticipation"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("bravery")); add(rs.getString("bravery"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("composure")); add(rs.getString("composure"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("concentration")); add(rs.getString("concentration"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("decision")); add(rs.getString("decision"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("determination")); add(rs.getString("determination"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("flair")); add(rs.getString("flair"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("leadership")); add(rs.getString("leadership"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("offTheBall")); add(rs.getString("off_the_ball"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("positioning")); add(rs.getString("positioning"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("teamwork")); add(rs.getString("teamwork"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("vision")); add(rs.getString("vision"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("workRate")); add(rs.getString("work_rate"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributeMentalDB(String playerID,
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

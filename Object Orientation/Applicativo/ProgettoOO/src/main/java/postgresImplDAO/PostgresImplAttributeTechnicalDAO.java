package postgresImplDAO;

import dao.AttributeTechnicalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia AttributeTechnicalDAO.
 */
public class PostgresImplAttributeTechnicalDAO
				implements AttributeTechnicalDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
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
																				Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_technical(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("corners")); add(rs.getString("corners"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("crossing")); add(rs.getString("crossing"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("dribbling")); add(rs.getString("dribbling"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("finishing")); add(rs.getString("finishing"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("firstTouch")); add(rs.getString("first_touch"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("freeKickTaking")); add(rs.getString("free_kick_taking"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("heading")); add(rs.getString("heading"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("longShots")); add(rs.getString("long_shots"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("longThrows")); add(rs.getString("long_throws"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("marking")); add(rs.getString("marking"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("passing")); add(rs.getString("passing"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("penaltyTaking")); add(rs.getString("penalty_taking"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("tackling")); add(rs.getString("tackling"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("technique")); add(rs.getString("technique"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributeTechnicalDB(String playerID,
																					 String corners,
																					 String crossing,
																					 String dribbling,
																					 String finishing,
																					 String firstTouch,
																					 String freeKickTaking,
																					 String heading,
																					 String longShots,
																					 String longThrows,
																					 String marking,
																					 String passing,
																					 String penaltyTaking,
																					 String tackling,
																					 String technique)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_attribute_technical(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, corners);
			cs.setString(4, crossing);
			cs.setString(5, dribbling);
			cs.setString(6, finishing);
			cs.setString(7, firstTouch);
			cs.setString(8, freeKickTaking);
			cs.setString(9, heading);
			cs.setString(10, longShots);
			cs.setString(11, longThrows);
			cs.setString(12, marking);
			cs.setString(13, passing);
			cs.setString(14, penaltyTaking);
			cs.setString(15, tackling);
			cs.setString(16, technique);


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

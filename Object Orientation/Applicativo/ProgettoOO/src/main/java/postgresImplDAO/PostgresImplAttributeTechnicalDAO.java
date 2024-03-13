package postgresImplDAO;

import dao.AttributeTechnicalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

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

	@Override
	public void fetchAttributeTechnical(String playerID,
																			Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_technical(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("corners")); add(rs.getString("corners"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("crossing")); add(rs.getString("crossing"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("dribbling")); add(rs.getString("dribbling"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("finishing")); add(rs.getString("finishing"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("firstTouch")); add(rs.getString("first_touch"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("freeKickTaking")); add(rs.getString("free_kick_taking"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("heading")); add(rs.getString("heading"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("longShots")); add(rs.getString("long_shots"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("longThrows")); add(rs.getString("long_throws"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("marking")); add(rs.getString("marking"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("passing")); add(rs.getString("passing"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("penaltyTaking")); add(rs.getString("penalty_taking"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("tackling")); add(rs.getString("tackling"));}});
				playerAttributeTechnicalTableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("technique")); add(rs.getString("technique"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public String updateAttributeTechnical(String playerID,
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

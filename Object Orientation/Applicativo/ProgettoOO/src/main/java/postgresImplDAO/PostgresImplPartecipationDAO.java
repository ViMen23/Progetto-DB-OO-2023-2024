package postgresImplDAO;

import dao.PartecipationDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia PartecipationDAO.
 */
public class PostgresImplPartecipationDAO
				implements PartecipationDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplPartecipationDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public String newPartecipationDB(String teamID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_partecipation(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, competitionID);
			cs.setString(4, competitionStartYear);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}

	@Override
	public String deletePartecipationDB(String teamID,
																			String competitionID,
																			String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_partecipation(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, competitionID);
			cs.setString(4, competitionStartYear);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}

	@Override
	public void fetchPartecipationDB(String teamID,
																	 String competitionStartYear,
																	 Vector<Vector<Object>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(rs.getString("comp_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type")));
				vector.add(rs.getString("conf_short_name"));

				tableData.add(vector);
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPartecipationYearDB(String teamID,
																			 String teamType,
																			 Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_year(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					comboBoxData.add(season);
					comboBoxMap.put(season, rs.getString("start_year"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					comboBoxData.add(rs.getString("start_year"));
					comboBoxMap.put(comboBoxData.getLast(), comboBoxData.getLast());
				}
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPartecipationDB(String teamID,
																	 String competitionStartYear,
																	 Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();


			while (rs.next()) {
				comboBoxData.add(rs.getString("comp_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("comp_id"));
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPartecipationAdminDB(String teamID,
																				String competitionStartYear,
																				Vector<Vector<Object>> tableData,
																				Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> competitionMap = new HashMap<>();

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("comp_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type")));
				vector.add(rs.getString("conf_short_name"));

				tableData.add(vector);
				competitionMap.put(rs.getRow() - 1, rs.getString("comp_id"));
			}

			tableMap.put(1, competitionMap);


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

package postgresImplDAO;

import dao.PartecipationDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.List;
import java.util.Vector;

public class PostgresImplPartecipationDAO
				implements PartecipationDAO
{
	private Connection conn;

	public PostgresImplPartecipationDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void fetchPartecipationDB(String teamID,
																	 String competitionStartYear,
																	 List<String> listCompetitionID,
																	 List<String> listCompetitionType,
																	 List<String> listCompetitionName,
																	 List<String> listConfederationID,
																	 List<String> listConfederationShortName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionType.add(rs.getString("comp_type"));
				listCompetitionName.add(rs.getString("comp_name"));
				listConfederationID.add(rs.getString("conf_id"));
				listConfederationShortName.add(rs.getString("conf_short_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void newPartecipationDB(String teamID,
																 String competitionID,
																 String competitionStartYear,
																 String message)
	{
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
	}

	@Override
	public void deletePartecipationDB(String teamID,
																		String competitionID,
																		String competitionStartYear,
																		String message)
	{
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
	}

	@Override
	public void fetchPartecipation(String teamID,
																 String competitionStartYear,
																 Vector<Vector<Object>> teamPartecipationTableData)
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

				teamPartecipationTableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

package postgresImplDAO;

import dao.PartecipationDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
}

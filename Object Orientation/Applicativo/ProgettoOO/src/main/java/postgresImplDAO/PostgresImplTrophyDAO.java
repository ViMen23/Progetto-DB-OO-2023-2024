package postgresImplDAO;

import dao.TrophyDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PostgresImplTrophyDAO
				implements TrophyDAO
{
	private Connection conn;

	public PostgresImplTrophyDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchTrophyDB(String teamID,
														String competitionStartYear,
														List<String> listTrophyID,
														List<String> listTrophyName,
														List<String> listCompetitionID,
														List<String> listCompetitionName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call trophy_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTrophyID.add(rs.getString("trophy_id"));
				listTrophyName.add(rs.getString("trophy_name"));
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionName.add(rs.getString("comp_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

package postgresImplDAO;

import dao.CompetitionDAO;
import database.DatabaseConnection;
import java.sql.*;
import java.util.List;

public class PostgresImplCompetitionDAO
				implements CompetitionDAO
{
	private Connection conn;

	public PostgresImplCompetitionDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void fetchCompetitionDB(String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID,
																 List<String> listCompetitionID,
																 List<String> listCompetitionType,
																 List<String> listCompetitionTeamType,
																 List<String> listCompetitionName,
																 List<String> listConfederationID,
																 List<String> listConfederationShortName,
																 List<String> listCountryID,
																 List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?, ?, ?)}");
			cs.setString(1, competitionSubName);
			cs.setString(2, competitionType);
			cs.setString(3, competitionTeamType);
			cs.setString(4, competitionCountryType);
			cs.setString(5, competitionContinentID);
			cs.setString(6, competitionNationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCompetitionID.add(rs.getString("comp_id"));
				listCompetitionType.add(rs.getString("comp_type"));
				listCompetitionTeamType.add(rs.getString("comp_type_team"));
				listCompetitionName.add(rs.getString("comp_name"));
				listConfederationID.add(rs.getString("conf_id"));
				listConfederationShortName.add(rs.getString("conf_short_name"));
				listCountryID.add(rs.getString("country_id"));
				listCountryName.add(rs.getString("country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countCompetitionDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_competitions()}");
			cs.registerOutParameter(1, Types.INTEGER);

			cs.execute();

			count = cs.getInt(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return count;
	}
}

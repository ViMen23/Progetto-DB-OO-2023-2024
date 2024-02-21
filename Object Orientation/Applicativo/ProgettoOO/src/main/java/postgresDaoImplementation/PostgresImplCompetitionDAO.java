package postgresDaoImplementation;

import dao.CompetitionsDAO;
import database.DatabaseConnection;
import java.sql.*;
import java.util.List;

public class PostgresImplCompetitionDAO
				implements CompetitionsDAO
{
	private Connection conn;

	public PostgresImplCompetitionDAO() {
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void competitionsDB(String subNameCompetition,
														 String typeCompetition, String typeTeamCompetition,
														 String countryCompetitionID,
														 List<String> competitionID,
														 List<String> competitionType, List<String> competitionTeamType, List<String> competitionName,
														 List<String> confederationID, List<String> confederationShortName,
														 List<String> countryID, List<String> countryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?)}");
			cs.setString(1, subNameCompetition);
			cs.setString(2, typeCompetition);
			cs.setString(3, typeTeamCompetition);
			cs.setString(4, countryCompetitionID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				competitionID.add(rs.getString("comp_id"));
				competitionType.add(rs.getString("comp_type"));
				competitionTeamType.add(rs.getString("comp_type_team"));
				competitionName.add(rs.getString("comp_name"));
				confederationID.add(rs.getString("conf_id"));
				confederationShortName.add(rs.getString("conf_short_name"));
				countryID.add(rs.getString("country_id"));
				countryName.add(rs.getString("country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countAllCompetitionsDB()
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

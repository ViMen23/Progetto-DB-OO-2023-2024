package postgresDaoImplementation;

import dao.SearchCompetitionsDao;
import database.DatabaseConnection;
import model.Competition;
import model.Confederation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SearchCompetitionsPostgresDaoImpl
				implements SearchCompetitionsDao
{
	private Connection conn;

	public SearchCompetitionsPostgresDaoImpl() {
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void searchCompetitionsDB(String subNameCompetition,
																	 String typeCompetition, String typeTeamCompetition,
																	 String countryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_competitions(?, ?, ?, ?)}");
			cs.setString(1, subNameCompetition);
			cs.setString(2, typeCompetition);
			cs.setString(3, typeTeamCompetition);
			cs.setString(4, countryName);
			ResultSet rs = cs.executeQuery();

			while (rs.next()) {

				new Competition
								(
												rs.getString("comp_type"),
												rs.getString("comp_type_team"),
												rs.getString("comp_name"),
												rs.getString("conf_short_name"),
												rs.getString("country_name")
								);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

}

package postgresDaoImplementation;

import dao.CountryDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;

public class PostgresImplCountryDAO
				implements CountryDAO
{
	private Connection conn;

	public PostgresImplCountryDAO() {
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void countriesDB(String type, String superCountryID,
													List<String> countryID, List<String> countryType,
													List<String> countryCode, List<String> countryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_countries(?, ?)}");
			cs.setString(1, type);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				countryID.add(rs.getString("country_id"));
				countryType.add(rs.getString("country_type"));
				countryCode.add(rs.getString("country_code"));
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
	public Integer countAllCountriesDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_countries()}");
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

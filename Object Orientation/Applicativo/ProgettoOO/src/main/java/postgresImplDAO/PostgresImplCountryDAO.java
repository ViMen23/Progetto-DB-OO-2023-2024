package postgresImplDAO;

import dao.CountryDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;

public class PostgresImplCountryDAO
				implements CountryDAO
{
	private Connection conn;

	public PostgresImplCountryDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void fetchCountryDB(String countryType,
														 String superCountryID,
														 List<String> listCountryID,
														 List<String> listCountryType,
														 List<String> listCountryCode,
														 List<String> listCountryName,
														 List<String> listSuperCountryID,
														 List<String> listSuperCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_countries(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCountryID.add(rs.getString("country_id"));
				listCountryType.add(rs.getString("country_type"));
				listCountryCode.add(rs.getString("country_code"));
				listCountryName.add(rs.getString("country_name"));
				listSuperCountryID.add(rs.getString("super_country_id"));
				listSuperCountryName.add(rs.getString("super_country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countCountryDB()
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

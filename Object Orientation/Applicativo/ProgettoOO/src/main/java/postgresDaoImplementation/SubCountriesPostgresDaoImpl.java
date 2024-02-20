package postgresDaoImplementation;

import dao.SubCountriesDao;
import database.DatabaseConnection;
import model.Country;

import java.sql.*;
import java.util.List;

public class SubCountriesPostgresDaoImpl
				implements SubCountriesDao
{
	private Connection conn;

	public SubCountriesPostgresDaoImpl() {
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void subCountriesDB(String superCountryName,
														 List<Integer> countryID, List<String> countryType, List<String> countryCode,
														 List<String> countryName, List<String> superCountryCode)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call all_sub_countries(?)}");
			cs.setString(1, superCountryName);
			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				countryID.add(rs.getInt("id_sub_country"));
				countryType.add(rs.getString("type_sub_country"));
				countryCode.add(rs.getString("code_sub_country"));
				countryName.add(rs.getString("name_sub_country"));
				superCountryCode.add(rs.getString("code_super_country"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

}

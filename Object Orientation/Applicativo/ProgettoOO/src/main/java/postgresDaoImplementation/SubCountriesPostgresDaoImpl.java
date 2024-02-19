package postgresDaoImplementation;

import dao.SubCountriesDao;
import database.DatabaseConnection;
import model.Country;

import java.sql.*;

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
	public void subCountriesDB(String superCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call all_sub_countries(?)}");
			cs.setString(1, superCountryName);
			ResultSet rs = cs.executeQuery();

			while (rs.next()) {

				new Country
								(
												rs.getString("type_sub_country"),
												rs.getString("code_sub_country"),
												rs.getString("name_sub_country"),
												rs.getString("code_super_country")
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

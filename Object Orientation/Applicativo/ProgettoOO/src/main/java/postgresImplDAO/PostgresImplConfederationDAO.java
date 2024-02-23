package postgresImplDAO;

import dao.ConfederationDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.List;

public class PostgresImplConfederationDAO
				implements ConfederationDAO
{
	private Connection conn;

	public PostgresImplConfederationDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void fetchConfederationDB(String countryType,
																	 String superConfederationID,
																	 List<String> listConfederationID,
																	 List<String> listConfederationShortName,
																	 List<String> listConfederationLongName,
																	 List<String> listCountryID,
																	 List<String> listCountryName,
																	 List<String> listCountryType,
																	 List<String> listSuperConfederationID,
																	 List<String> listSuperConfederationShortName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_confederations(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superConfederationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listConfederationID.add(rs.getString("conf_id"));
				listConfederationShortName.add(rs.getString("conf_short_name"));
				listConfederationLongName.add(rs.getString("conf_long_name"));
				listCountryID.add(rs.getString("country_id"));
				listCountryName.add(rs.getString("country_name"));
				listCountryType.add(rs.getString("country_type"));
				listSuperConfederationID.add(rs.getString("super_conf_id"));
				listSuperConfederationShortName.add(rs.getString("super_conf_short_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countConfederationDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_confederations()}");
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

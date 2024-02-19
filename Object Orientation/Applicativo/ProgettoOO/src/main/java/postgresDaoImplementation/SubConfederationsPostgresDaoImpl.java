package postgresDaoImplementation;

import dao.SubConfederationsDao;
import database.DatabaseConnection;
import model.Confederation;

import java.sql.*;

public class SubConfederationsPostgresDaoImpl
				implements SubConfederationsDao
{
	private Connection conn;

	public SubConfederationsPostgresDaoImpl() {
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void subConfederationsDB(String superConfederationName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call all_sub_confederations(?)}");
			cs.setString(1, superConfederationName);
			ResultSet rs = cs.executeQuery();

			while (rs.next()) {

				new Confederation
								(
												rs.getString("short_name_sub_conf"),
												rs.getString("long_name_sub_conf"),
												rs.getString("name_country_sub_conf"),
												rs.getString("short_name_super_conf")
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

package postgresImplDAO;

import dao.AdminDAO;
import database.DatabaseConnection;

import java.sql.*;

public class PostgresImplAdminDAO
				implements AdminDAO
{
	private Connection conn;

	public PostgresImplAdminDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public Boolean isAdminDB(String username,
													 String password)
	{
		Boolean valid = false;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call is_admin_valid(?, ?)}");
			cs.registerOutParameter(1, Types.BOOLEAN);
			cs.setString(2, username);
			cs.setString(3, password);

			cs.execute();

			valid = cs.getBoolean(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return valid;
	}
}

package postgresDaoImplementation;

import dao.RowExistsDao;
import database.DatabaseConnection;

import java.lang.reflect.Type;
import java.sql.*;

public class RowExistsPostgresDaoImpl
				implements RowExistsDao
{
	private Connection conn;

	public RowExistsPostgresDaoImpl() {
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Boolean rowExistsDB(String separator, String string)
	{
		Boolean output = false;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call row_exists(?, ?)}");
			cs.registerOutParameter(1, Types.BOOLEAN);
			cs.setString(2, separator);
			cs.setString(3, string);

			cs.execute();

			output = cs.getBoolean(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return output;
	}

}

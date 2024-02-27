package postgresImplDAO;

import dao.NationalityDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PostgresImplNationalityDAO
				implements NationalityDAO
{
	private Connection conn;
	public PostgresImplNationalityDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchNationalityDB(String playerID,
																 List<String> listCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call nationality_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCountryName.add(rs.getString("country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

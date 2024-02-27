package postgresImplDAO;

import dao.TagDAO;
import database.DatabaseConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PostgresImplTagDAO
				implements TagDAO
{
	private Connection conn;
	public PostgresImplTagDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void fetchTagDB(String playerID,
												 List<String> listTagName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_tag_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listTagName.add(rs.getString("tag_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

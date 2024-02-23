package postgresImplDAO;

import dao.PositionDAO;
import database.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PostgresImplPositionDAO
				implements PositionDAO
{
	private Connection conn;
	public PostgresImplPositionDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void fetchPositionDB(List<String> listPositionID,
															List<String> listPositionRole,
															List<String> listPositionCode,
															List<String> listPositionName)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_positions");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				listPositionID.add(rs.getString("position_id"));
				listPositionRole.add(rs.getString("position_code"));
				listPositionCode.add(rs.getString("position_role"));
				listPositionName.add(rs.getString("position_name"));
			}
		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

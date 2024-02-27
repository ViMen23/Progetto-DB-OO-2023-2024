package postgresImplDAO;

import dao.PositionDAO;
import database.DatabaseConnection;

import java.sql.*;
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

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPositionDB(String playerID,
															List<String> listPositionRole,
															List<String> listPositionCode,
															List<String> listPositionName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call position_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listPositionRole.add(rs.getString("position_code"));
				listPositionCode.add(rs.getString("position_role"));
				listPositionName.add(rs.getString("position_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

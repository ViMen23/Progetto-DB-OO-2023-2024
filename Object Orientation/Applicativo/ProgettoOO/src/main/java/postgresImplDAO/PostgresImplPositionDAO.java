package postgresImplDAO;

import dao.PositionDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.List;
import java.util.Map;
import java.util.Vector;

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
				listPositionRole.add(rs.getString("position_role"));
				listPositionCode.add(rs.getString("position_code"));
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
				listPositionRole.add(rs.getString("position_role"));
				listPositionCode.add(rs.getString("position_code"));
				listPositionName.add(rs.getString("position_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPosition(String playerID,
														Vector<Vector<String>> playerPositionTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call position_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(GuiConfiguration.getMessage(rs.getString("position_role")));
				vector.add(rs.getString("position_code"));
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));

				playerPositionTableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchPosition(Vector<String> positionNameVector,
														Map<String, String> positionNameMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_positions");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String positionInfo = "";
				positionInfo += "[";
				positionInfo += GuiConfiguration.getMessage(rs.getString("position_role"));
				positionInfo += "] ";
				positionInfo += GuiConfiguration.getMessage(rs.getString("position_name"));

				positionNameVector.add(positionInfo);
				positionNameMap.put(positionInfo, rs.getString("position_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

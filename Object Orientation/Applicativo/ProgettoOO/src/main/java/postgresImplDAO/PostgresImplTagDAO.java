package postgresImplDAO;

import dao.TagDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

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

	@Override
	public void fetchTag(String playerID,
											 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_tag_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("tag_name"));

				tableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTag(Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_tag");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("tag_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("tag_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchTag(String playerID,
											 Vector<Vector<Object>> tableData,
											 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_tag_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> tagMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("tag_name"));

				tableData.add(vector);
				tagMap.put(row, rs.getString("tag_id"));
				++row;
			}

			tableMap.put(1, tagMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

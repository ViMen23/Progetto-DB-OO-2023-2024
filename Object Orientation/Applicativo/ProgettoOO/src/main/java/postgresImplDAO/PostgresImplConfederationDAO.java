package postgresImplDAO;

import dao.ConfederationDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Country;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

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
	public int countConfederationDB()
	{
		int count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_confederation()}");
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


	@Override
	public void fetchConfederationDB(String countryType,
																	 String superConfederationID,
																	 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_confederation(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superConfederationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("conf_long_name"));
				vector.add(rs.getString("conf_short_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("country_type")));
				vector.add(rs.getString("country_name"));
				vector.add(rs.getString("super_conf_short_name"));

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
	public void fetchConfederationDB(String countryType,
																	 String superConfederationID,
																	 Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_confederation(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superConfederationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("conf_short_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("conf_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	@Override
	public void fetchConfederationDB(String teamID,
																	 Map<String, String> confederationMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call team_confederation(?)}");
			cs.setString(1, teamID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				confederationMap.put(Country.COUNTRY_TYPE.WORLD.toString(), rs.getString("super_super_conf_id"));
				confederationMap.put(Country.COUNTRY_TYPE.CONTINENT.toString(), rs.getString("super_conf_id"));
				confederationMap.put(Country.COUNTRY_TYPE.NATION.toString(), rs.getString("conf_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

}

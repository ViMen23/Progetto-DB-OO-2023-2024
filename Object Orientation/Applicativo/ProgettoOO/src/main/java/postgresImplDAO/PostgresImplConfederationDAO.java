package postgresImplDAO;

import dao.ConfederationDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Country;
import model.Team;

import java.sql.*;
import java.util.List;
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
	public void fetchConfederationDB(String countryType,
																	 String superConfederationID,
																	 List<String> listConfederationID,
																	 List<String> listConfederationShortName,
																	 List<String> listConfederationLongName,
																	 List<String> listCountryID,
																	 List<String> listCountryName,
																	 List<String> listCountryType,
																	 List<String> listSuperConfederationID,
																	 List<String> listSuperConfederationShortName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_confederations(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superConfederationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listConfederationID.add(rs.getString("conf_id"));
				listConfederationShortName.add(rs.getString("conf_short_name"));
				listConfederationLongName.add(rs.getString("conf_long_name"));
				listCountryID.add(rs.getString("country_id"));
				listCountryName.add(rs.getString("country_name"));
				listCountryType.add(rs.getString("country_type"));
				listSuperConfederationID.add(rs.getString("super_conf_id"));
				listSuperConfederationShortName.add(rs.getString("super_conf_short_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchConfederation(String countryType,
																 String superConfederationID,
																 Vector<Vector<String>> confederationTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_confederations(?, ?)}");
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

				confederationTableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchConfederation(String countryType,
																 String superConfederationID,
																 Vector<String> confederationShortNameVector,
																 Map<String, String> confederationShortNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_confederations(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superConfederationID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				confederationShortNameVector.add(rs.getString("conf_short_name"));
				confederationShortNameMap.put(confederationShortNameVector.getLast(), rs.getString("conf_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countConfederationDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_confederations()}");
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
	public void fetchConfederation(String teamID,
																 Map<String, String> confederationMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_team_confederation(?)}");
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

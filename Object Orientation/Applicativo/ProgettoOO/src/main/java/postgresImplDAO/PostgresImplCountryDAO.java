package postgresImplDAO;

import controller.Controller;
import dao.CountryDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class PostgresImplCountryDAO
				implements CountryDAO
{
	private Connection conn;

	public PostgresImplCountryDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void fetchCountryDB(String countryType,
														 String superCountryID,
														 List<String> listCountryID,
														 List<String> listCountryType,
														 List<String> listCountryCode,
														 List<String> listCountryName,
														 List<String> listSuperCountryID,
														 List<String> listSuperCountryName)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_countries(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				listCountryID.add(rs.getString("country_id"));
				listCountryType.add(rs.getString("country_type"));
				listCountryCode.add(rs.getString("country_code"));
				listCountryName.add(rs.getString("country_name"));
				listSuperCountryID.add(rs.getString("super_country_id"));
				listSuperCountryName.add(rs.getString("super_country_name"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCountry(String countryType,
													 String superCountryID,
													 Vector<String> countryNameVector,
													 Map<String, String> countryNameMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_countries(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				countryNameVector.add(rs.getString("country_name"));
				countryNameMap.put(countryNameVector.getLast(), rs.getString("country_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public void fetchCountry(String countryType,
													 String superCountryID,
													 Vector<Vector<String>> countryTableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_countries(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("country_name"));
				vector.add(rs.getString("country_code"));
				vector.add(GuiConfiguration.getMessage(rs.getString("country_type")));
				vector.add(rs.getString("super_country_name"));

				countryTableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	@Override
	public Integer countCountryDB()
	{
		Integer count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_countries()}");
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
}

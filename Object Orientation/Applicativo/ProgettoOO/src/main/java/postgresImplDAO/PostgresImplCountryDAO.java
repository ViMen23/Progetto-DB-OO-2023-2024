package postgresImplDAO;

import dao.CountryDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia CountryDAO.
 */
public class PostgresImplCountryDAO
				implements CountryDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplCountryDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Conta il numero di paesi nel database.
	 * <p>
	 * @return Il numero di paesi.
	 */
	@Override
	public int countCountryDB()
	{
		int count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_country()}");
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


	/**
	 * Recupera informazioni sui paesi dal database per popolare una combo box.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superCountryID L'ID del super paese.
	 * @param comboBoxData Un vettore di stringhe per popolare la combo box con i nomi dei paesi.
	 * @param comboBoxMap Una mappa per associare i nomi dei paesi agli ID nel database.
	 */
	@Override
	public void fetchCountryDB(String countryType,
														 String superCountryID,
														 Vector<String> comboBoxData,
														 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_country(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				comboBoxData.add(rs.getString("country_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("country_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera informazioni sui paesi dal database per la visualizzazione in una tabella.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superCountryID L'ID del super paese.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati recuperati.
	 */
	@Override
	public void fetchCountryDB(String countryType,
														 String superCountryID,
														 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_country(?, ?)}");
			cs.setString(1, countryType);
			cs.setString(2, superCountryID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("country_name"));
				vector.add(rs.getString("country_code"));
				vector.add(GuiConfiguration.getMessage(rs.getString("country_type")));
				vector.add(rs.getString("super_country_name"));

				tableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

}

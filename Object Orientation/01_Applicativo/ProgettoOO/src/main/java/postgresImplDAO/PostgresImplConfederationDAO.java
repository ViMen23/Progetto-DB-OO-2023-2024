package postgresImplDAO;

import dao.ConfederationDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Country;

import java.sql.*;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia ConfederationDAO.
 */
public class PostgresImplConfederationDAO
				implements ConfederationDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplConfederationDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Conta il numero di confederazioni nel database.
	 * <p>
	 * @return Il numero di confederazioni.
	 */
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


	/**
	 * Recupera informazioni sulle confederazioni dal database per la visualizzazione in una tabella.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superConfederationID L'ID della super confederazione.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati recuperati.
	 */
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


	/**
	 * Recupera informazioni sulle confederazioni dal database per popolare una combo box.
	 * <p>
	 * @param countryType Il tipo di paese.
	 * @param superConfederationID L'ID della super confederazione.
	 * @param comboBoxData Un vettore di stringhe per popolare la combo box con i nomi delle confederazioni.
	 * @param comboBoxMap Una mappa per associare i nomi delle confederazioni agli ID nel database.
	 */
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


	/**
	 * Recupera informazioni sulla confederazione a cui appartiene una squadra.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param confederationMap Una mappa per memorizzare le informazioni sulla confederazione recuperata.
	 */
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

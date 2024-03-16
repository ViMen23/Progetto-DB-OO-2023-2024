package postgresImplDAO;

import dao.NationalityDAO;
import database.DatabaseConnection;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia NationalityDAO.
 */
public class PostgresImplNationalityDAO
				implements NationalityDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplNationalityDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Recupera informazioni sulla nazionalità di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di stringhe per popolare una tabella con i dati recuperati.
	 */
	@Override
	public void fetchNationalityDB(String playerID,
																 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call nationality_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(rs.getString("country_name"));

				tableData.add(vector);
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera informazioni dettagliate sulla nazionalità di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchNationalityDB(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call nationality_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> countryMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("country_name"));

				tableData.add(vector);
				countryMap.put(row, rs.getString("country_id"));
				++row;
			}

			tableMap.put(1, countryMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Aggiunge una nazionalità a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param countryID L'ID della nazionalità da aggiungere.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newNationalityDB(String playerID,
																 String countryID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_nationality(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, countryID);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Elimina una nazionalità di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param countryID L'ID della nazionalità da eliminare.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deleteNationalityDB(String playerID,
																		String countryID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_nationality(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, countryID);

			cs.execute();

			message = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}
}

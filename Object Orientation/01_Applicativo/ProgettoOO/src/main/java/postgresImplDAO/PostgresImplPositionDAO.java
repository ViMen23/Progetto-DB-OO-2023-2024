package postgresImplDAO;

import dao.PositionDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia PositionDAO.
 */
public class PostgresImplPositionDAO
				implements PositionDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplPositionDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Recupera le posizioni di gioco associate a un giocatore specifico e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le posizioni.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i dati delle posizioni recuperate.
	 */
	@Override
	public void fetchPositionDB(String playerID,
															Vector<Vector<String>> tableData)
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
	 * Recupera le posizioni di gioco disponibili nel database e popola una combobox.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con le posizioni recuperate.
	 * @param comboBoxMap Una mappa per associare i valori della combobox agli ID delle posizioni nel database.
	 */
	@Override
	public void fetchPositionDB(Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
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

				comboBoxData.add(positionInfo);
				comboBoxMap.put(positionInfo, rs.getString("position_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera informazioni dettagliate sulle posizioni di gioco associate a un giocatore specifico e popola una tabella.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare le posizioni.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i dati delle posizioni recuperate e i dati aggiuntivi.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchPositionDB(String playerID,
															Vector<Vector<Object>> tableData,
															Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call position_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> positionMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_role")));
				vector.add(rs.getString("position_code"));
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));

				tableData.add(vector);
				positionMap.put(row, rs.getString("position_id"));
				++row;
			}

			tableMap.put(3, positionMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Aggiunge una nuova posizione di gioco a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui aggiungere la posizione.
	 * @param positionID L'ID della posizione da aggiungere al giocatore.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newPlayerPositionDB(String playerID,
																		String positionID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_player_position(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, positionID);

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
	 * Rimuove una posizione di gioco da un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere la posizione.
	 * @param positionID L'ID della posizione da rimuovere dal giocatore.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deletePlayerPositionDB(String playerID,
																			 String positionID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_player_position(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, positionID);

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

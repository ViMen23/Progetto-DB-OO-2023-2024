package postgresImplDAO;

import dao.TagDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia TagDAO.
 */
public class PostgresImplTagDAO
				implements TagDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplTagDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Recupera i tag associati a un giocatore specifico e popola una tabella con i risultati.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i tag.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i tag recuperati.
	 */
	@Override
	public void fetchTagDB(String playerID,
												 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_tag_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<String> vector = new Vector<>();

				vector.add(GuiConfiguration.getMessage(rs.getString("tag_name")));

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
	 * Recupera tutti i tag disponibili nel database e popola una combobox per la selezione dei tag.
	 * <p>
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con i tag recuperati.
	 * @param comboBoxMap Una mappa per associare i valori visualizzati nella combobox agli ID dei tag nel database.
	 */
	@Override
	public void fetchTagDB(Vector<String> comboBoxData,
												 Map<String, String> comboBoxMap)
	{
		try {
			PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM vi_all_tag");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				comboBoxData.add(GuiConfiguration.getMessage(rs.getString("tag_name")));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("tag_id"));
			}

			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera i tag associati a un giocatore specifico, fornendo dati aggiuntivi in formato tabella nidificata.
	 * <p>
	 * @param playerID L'ID del giocatore di cui recuperare i tag.
	 * @param tableData Un vettore di vettori di oggetti per popolare la tabella con i tag recuperati e i dati aggiuntivi.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchTagDB(String playerID,
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
				vector.add(GuiConfiguration.getMessage(rs.getString("tag_name")));

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


	/**
	 * Assegna un tag a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore a cui assegnare il tag.
	 * @param tagID L'ID del tag da assegnare.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newPlayerTagDB(String playerID,
															 String tagID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_player_tag(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, tagID);

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
	 * Rimuove un tag assegnato a un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da cui rimuovere il tag.
	 * @param tagID L'ID del tag da rimuovere.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deletePlayerTagDB(String playerID,
																	String tagID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_player_tag(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, tagID);

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

package postgresImplDAO;

import dao.AdminDAO;
import database.DatabaseConnection;

import java.sql.*;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia AdminDAO.
 */
public class PostgresImplAdminDAO
				implements AdminDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplAdminDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Verifica se un utente è un amministratore nel database.
	 * <p>
	 * @param username Il nome utente da verificare.
	 * @param password La password dell'utente.
	 * @return True se l'utente è un amministratore, false altrimenti.
	 */
	@Override
	public boolean isAdminDB(String username,
													 String password)
	{
		boolean valid = false;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call is_admin(?, ?)}");
			cs.registerOutParameter(1, Types.BOOLEAN);
			cs.setString(2, username);
			cs.setString(3, password);

			cs.execute();

			valid = cs.getBoolean(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return valid;
	}
}

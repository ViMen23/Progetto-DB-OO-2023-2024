package implementazionePostgresDao;

import dao.AggiungiUtenteDAO;
import database.ConnessioneDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImplementazioneAggiungiUtenteDAO implements AggiungiUtenteDAO
{
	private Connection connection;

	public ImplementazioneAggiungiUtenteDAO() {
		try {
			connection = ConnessioneDatabase.getInstance().connection;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void addUserDB(String username, String password)
	{
		try {
			String query = "";
			query += "insert into utente";
			query += " values";
			query += " ('" + username + "', '" + password + "', 3)";

			PreparedStatement addUserPS = connection.prepareStatement(query);
			Integer ctrl = addUserPS.executeUpdate();
			addUserPS.close();
			connection.close();

		}
		catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

	}

}

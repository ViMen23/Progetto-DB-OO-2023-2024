package implementazionePostgresDao;

import dao.LoginPasswordDAO;
import database.ConnessioneDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImplementazioneControlloPasswordDAO implements LoginPasswordDAO
{
	private Connection connection;

	public ImplementazioneControlloPasswordDAO() {
		try {
			connection = ConnessioneDatabase.getInstance().connection;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Integer controlloPasswordDB(String username, String password)
	{
		Integer value = -1;
		try {
			String query = "";

			query += "SELECT privilegio";
			query += " FROM utente";
			query += " WHERE username = '" + username + "' AND password = '" + password + "'";

			PreparedStatement controlloUsernamePS = connection.prepareStatement(query);

			ResultSet rs = controlloUsernamePS.executeQuery();

			rs.next();

			if (rs.next()) {
				value = rs.getInt("privilegio");
			}

			rs.close();
			controlloUsernamePS.close();
			connection.close();
		}
		catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return value;
	}
}

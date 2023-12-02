package implementazionePostgresDao;

import dao.LoginUsernameDAO;
import dao.RegistrationUsernameDAO;
import database.ConnessioneDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImplementazioneControlloUsernameDAO implements LoginUsernameDAO, RegistrationUsernameDAO
{
	private Connection connection;

	public ImplementazioneControlloUsernameDAO() {
		try {
			connection = ConnessioneDatabase.getInstance().connection;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Boolean controlloUsernameDB(String username)
	{
		Integer value = 0;
		try {
			String query = "";
			query += "SELECT COUNT(*) AS result";
			query += " FROM utente";
			query += " WHERE username = '" + username + "'";
			PreparedStatement controlloUsernamePS = connection.prepareStatement(query);
			ResultSet rs = controlloUsernamePS.executeQuery();
			rs.next();
			value = rs.getInt("result");
			rs.close();
			controlloUsernamePS.close();
			connection.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		if(value == 1){
			return true;
		}
		else{
			return false;
		}
	}

	@Override
	public Boolean usernameDisponibileDB(String username)
	{
		Integer value = 0;
		try {
			String query = "";
			query += "SELECT COUNT(*) AS result";
			query += " FROM utente";
			query += " WHERE username = '" + username + "'";

			PreparedStatement usernameDisponibilePS = connection.prepareStatement(query);

			ResultSet rs = usernameDisponibilePS.executeQuery();
			rs.next();
			value = rs.getInt("result");
			rs.close();
			usernameDisponibilePS.close();
			connection.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		if(value == 0){
			return true;
		}
		else{
			return false;
		}
	}
}

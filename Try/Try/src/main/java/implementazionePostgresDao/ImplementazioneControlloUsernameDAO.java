package implementazionePostgresDao;

import dao.LoginUsernameDAO;
import database.ConnessioneDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImplementazioneControlloUsernameDAO implements LoginUsernameDAO
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
			PreparedStatement controlloUsernamePS = connection.prepareStatement(
					"SELECT COUNT(*) AS result FROM utente WHERE username ='"+username+"'");
			ResultSet rs = controlloUsernamePS.executeQuery();
			rs.next();
			value = rs.getInt("result");
			rs.close();
			controlloUsernamePS.close();
			connection.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
		if( value == 1){
			return true;
		}
		else{
			return false;
		}
	}
}

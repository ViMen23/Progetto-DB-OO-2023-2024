package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * TYPE : class - database package
 * NAME : DatabaseConnection
 *
 * DESC: Classe che gestisce la connessione con il Database e il DBMS mediante il DriverManager appropriato
 */
public class DatabaseConnection
{
	private static DatabaseConnection instance;
	public Connection conn = null;

	private String url = "jdbc:postgresql://localhost:5432/fpdb";
	private String user = "postgres";
	private String password = "qwerty1234!";

	private String driver = "org.postgresql.Driver";

	// COSTRUTTORE
	private DatabaseConnection() throws SQLException
	{
		try
		{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		}
		catch (ClassNotFoundException ex)
		{
			System.out.println("Database Connection Creation Failed : " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public static DatabaseConnection getInstance() throws SQLException
	{
		if (instance == null)
		{
			instance = new DatabaseConnection();
		}
		else if (instance.conn.isClosed())
		{
			instance = new DatabaseConnection();
		}

		return instance;
	}

}

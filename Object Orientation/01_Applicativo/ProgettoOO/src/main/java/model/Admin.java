package model;

/**
 * Questa classe rappresenta un utente amministratore del sistema.
 */
public class Admin
{
	private final String username;
	private final String password;


	/**
	 * Costruttore della classe `Admin`.
	 * <p>
	 * Crea un nuovo oggetto `Admin` con lo username e la password specificati.
	 * <p>
	 * @param username Nome utente dell'amministratore.
	 * @param password Password dell'amministratore.
	 */
	public Admin(String username,
							 String password)
	{
		this.username = username;
		this.password = password;
	}


	/**
	 * Restituisce lo username dell'amministratore.
	 * <p>
	 * @return Lo username dell'amministratore.
	 */
	public String getUsername()
	{
		return username;
	}

	/**
	 * Restituisce la password dell'amministratore.
	 * <p>
	 * @return La password dell'amministratore.
	 */
	public String getPassword()
	{
		return password;
	}

}

package model;

/**
 * TYPE : class - model package
 * <p>
 * NAME : Admin
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di amministratore dell'applicativo
 */
public class Admin
{
	private final String username;
	private final String password;


	public Admin(String username,
							 String password)
	{
		this.username = username;
		this.password = password;
	}


	public String getUsername()
	{
		return username;
	}

	public String getPassword()
	{
		return password;
	}

}

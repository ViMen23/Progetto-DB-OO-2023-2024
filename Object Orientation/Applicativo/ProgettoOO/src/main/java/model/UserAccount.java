package model;

/**
 * TYPE : class
 * NAME : UserAccount
 *
 * DESC: Classe che rappresenta il concetto astratto di utente dell'applicativo
 */
public class UserAccount
{
	private String username;
	private String password;
	private final Boolean admin;


	public UserAccount(String username, String password, Boolean admin)
	{
		this.username = username;
		this.password = password;
		this.admin = admin;
	}


	public String getUsername()
	{
		return username;
	}

	public String getPassword()
	{
		return password;
	}

	public Boolean getAdmin()
	{
		return admin;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

}

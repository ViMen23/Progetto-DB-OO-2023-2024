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
	private EnPrivilege privilege;


	public UserAccount(String username, String password, EnPrivilege privilege)
	{
		this.username = username;
		this.password = password;
		this.privilege = privilege;
	}


	public String getUsername()
	{
		return username;
	}

	public String getPassword()
	{
		return password;
	}

	public EnPrivilege getPrivilege()
	{
		return privilege;
	}


	public void setUsername(String username)
	{
		this.username = username;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public void setPrivilege(EnPrivilege privilege)
	{
		this.privilege = privilege;
	}

}

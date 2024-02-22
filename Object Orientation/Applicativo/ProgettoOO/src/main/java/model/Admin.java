package model;

/**
 * TYPE : class - model package
 * NAME : Admin
 *
 * DESC: Classe che rappresenta il concetto astratto di amministratore dell'applicativo
 */
public class Admin
{
	private static Admin adminConnected = null; // amministratore connesso attualmente
	private final String username;
	private final String password;


	public Admin(String username, String password)
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


	public Admin getAdminConnected()
	{
		return adminConnected;
	}

	public void setAdminConnected(Admin adminConnected)
	{
		Admin.adminConnected = adminConnected;
	}
}

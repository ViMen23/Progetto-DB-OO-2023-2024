package model;

/**
 * TYPE : class
 * NAME : Prize
 *
 * DESC: Classe che rappresenta il concetto astratto di premio calcistico
 */
public class Prize
{
	private EnAward type;
	private EnRole role;
	private String name;
	private String given;	// ente che assegna il premio calcistico


	public Prize(EnAward type, EnRole role, String name, String given)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.given = given;
	}


	public EnAward getType()
	{
		return type;
	}

	public EnRole getRole()
	{
		return role;
	}

	public String getName()
	{
		return name;
	}

	public String getGiven()
	{
		return given;
	}

}

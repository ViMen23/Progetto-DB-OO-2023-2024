package model;

/**
 * TYPE : class
 * NAME : Trophy
 *
 * DESC: Classe che rappresenta il concetto astratto di trofeo calcistico
 */
public class Trophy
{
	private EnAward type;
	private EnRole role;
	private String name;


	public Trophy(EnAward type, EnRole role, String name)
	{
		this.type = type;
		this.role = role;
		this.name = name;
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

}

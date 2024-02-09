package model;

/**
 * TYPE : class
 * NAME : Position
 *
 * DESC: Classe che rappresenta il concetto astratto di posizione nel campo di gioco
 */
public class Position
{
	private EnRole role;
	private String code;
	private String name;


	public Position(EnRole role, String code, String name)
	{
		this.role = role;
		this.code = code;
		this.name = name;
	}


	public EnRole getRole()
	{
		return role;
	}

	public String getCode()
	{
		return code;
	}

	public String getName()
	{
		return name;
	}

}

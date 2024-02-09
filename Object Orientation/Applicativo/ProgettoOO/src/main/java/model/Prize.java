package model;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * TYPE : class
 * NAME : Prize
 *
 * DESC: Classe che rappresenta il concetto astratto di premio calcistico
 */
public class Prize
{
	private final EnAward type;
	private final EnRole role;
	private final String name;
	private final String given;	// ente che assegna il premio calcistico

	// lista dei premi calcistici
	private static Set<Prize> prizeSet = new LinkedHashSet<Prize>();


	public Prize(EnAward type, EnRole role, String name, String given)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.given = given;

		prizeSet.add(this);
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

	public static Set<Prize> getPrizeSet()
	{
		return prizeSet;
	}

}

package model;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * TYPE : class
 * NAME : Trophy
 *
 * DESC: Classe che rappresenta il concetto astratto di trofeo calcistico
 */
public class Trophy
{
	private final EnAward type;
	private final EnRole role;
	private final String name;

	// lista dei premi calcistici
	private static Set<Trophy> trophySet = new LinkedHashSet<Trophy>();

	public Trophy(EnAward type, EnRole role, String name)
	{
		this.type = type;
		this.role = role;
		this.name = name;

		trophySet.add(this);
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

	public static Set<Trophy> getTrophySet()
	{
		return trophySet;
	}

}

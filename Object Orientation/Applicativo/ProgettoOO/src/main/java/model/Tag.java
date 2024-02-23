package model;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * TYPE : class
 * <p>
 * NAME : Tag
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di tag associabile ad un calciatore
 */
public class Tag
{
	private static final Map<String, Tag> TAG_MAP = new LinkedHashMap<>();
	private final Boolean goalkeeper;	// se e' un tag per un portiere o per un giocatore di movimento
	private final Boolean positive;		// se e' un tag positivo o negativo
	private final String name;


	public Tag(Boolean goalkeeper,
						 Boolean positive,
						 String name)
	{
		this.goalkeeper = goalkeeper;
		this.positive = positive;
		this.name = name;
	}


	public Boolean isGoalkeeper()
	{
		return goalkeeper;
	}

	public Boolean isPositive()
	{
		return positive;
	}

	public String getName()
	{
		return name;
	}

	public static Map<String, Tag> getTagMap()
	{
		return TAG_MAP;
	}
}

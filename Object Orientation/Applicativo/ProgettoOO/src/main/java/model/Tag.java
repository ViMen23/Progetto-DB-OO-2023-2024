package model;

import javax.xml.namespace.QName;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * TYPE : class
 * NAME : Tag
 *
 * DESC: Classe che rappresenta il concetto astratto di tag associabile ad un calciatore
 */
public class Tag
{
	private final Boolean goalkeeper;	// se e' un tag per un portiere o per un giocatore di movimento
	private final Boolean positive;		// se e' un tag positivo o negativo
	private final String name;

	// lista di tag
	private static Set<Tag> tagSet = new LinkedHashSet<Tag>();


	public Tag(Boolean goalkeeper, Boolean positive, String name)
	{
		this.goalkeeper = goalkeeper;
		this.positive = positive;
		this.name = name;

		tagSet.add(this);
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

	public static Set<Tag> getTagSet()
	{
		return tagSet;
	}

}

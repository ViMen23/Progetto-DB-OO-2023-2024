package model;

import javax.xml.namespace.QName;

/**
 * TYPE : class
 * NAME : Tag
 *
 * DESC: Classe che rappresenta il concetto astratto di tag associabile ad un calciatore
 */
public class Tag
{
	private Boolean goalkeeper;	// se e' un tag per un portiere o per un giocatore di movimento
	private Boolean positive;		// se e' un tag positivo o negativo
	private String name;


	public Tag(Boolean goalkeeper, Boolean positive, String name)
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

}

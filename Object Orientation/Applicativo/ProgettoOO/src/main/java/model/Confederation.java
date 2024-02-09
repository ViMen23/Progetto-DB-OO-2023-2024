package model;

/**
 * TYPE : class
 * NAME : Confederation
 *
 * DESC: Classe che rappresenta il concetto astratto di confederazione calcistica
 */
public class Confederation
{
	private final Country country;
	private final String shortName;
	private final String longName;
	private final Confederation superConfederation;


	public Confederation(Country country, String shortName, String longName, Confederation superConfederation)
	{
		this.country = country;
		this.shortName = shortName;
		this.longName = longName;
		this.superConfederation = superConfederation;
	}


	public Country getCountry()
	{
		return country;
	}

	public String getShortName()
	{
		return shortName;
	}

	public String getLongName()
	{
		return longName;
	}

	public Confederation getSuperConfederation()
	{
		return superConfederation;
	}

}

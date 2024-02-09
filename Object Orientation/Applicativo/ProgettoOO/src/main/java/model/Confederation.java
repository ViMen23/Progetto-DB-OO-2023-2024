package model;

/**
 * TYPE : class
 * NAME : Confederation
 *
 * DESC: Classe che rappresenta il concetto astratto di confederazione calcistica
 */
public class Confederation
{
	private Country country;
	private String shortName;
	private String longName;
	private Confederation superConfederation;


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

package model;

/**
 * TYPE : class
 * NAME : Team
 *
 * DESC: Classe che rappresenta il concetto astratto di squadra di calcio
 */
public class Team
{
	private EnTeam type;
	private Country country;
	private String longName;
	private String shortName;


	public Team(EnTeam type, Country country, String longName, String shortName)
	{
		this.type = type;
		this.country = country;
		this.longName = longName;
		this.shortName = shortName;
	}


	public EnTeam getType()
	{
		return type;
	}

	public Country getCountry()
	{
		return country;
	}

	public String getLongName()
	{
		return longName;
	}

	public String getShortName()
	{
		return shortName;
	}


	public void setLongName(String longName)
	{
		this.longName = longName;
	}

	public void setShortName(String shortName)
	{
		this.shortName = shortName;
	}

}

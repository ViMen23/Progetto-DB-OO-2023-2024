package model;

/**
 * TYPE : class
 * NAME : Country
 *
 * DESC: Classe che rappresenta il concetto astratto di paese
 */
// TODO: per tutte le classi con oggetti immutabili considerare di convertirle in classi record
public class Country
{
	private final EnCountry type;
	private final String code;
	private final String name;
	private final Country superCountry;


	public Country(EnCountry type, String code, String name, Country superCountry)
	{
		this.type = type;
		this.code = code;
		this.name = name;
		this.superCountry = superCountry;
	}


	public EnCountry getType()
	{
		return type;
	}

	public String getCode()
	{
		return code;
	}

	public String getName()
	{
		return name;
	}

	public Country getSuperCountry()
	{
		return superCountry;
	}

}

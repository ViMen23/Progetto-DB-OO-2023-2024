package model;

import java.util.LinkedHashMap;
import java.util.Map;

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

	// mappa delle nazioni per continente
	private static Map<Country, Country> nationMap = new LinkedHashMap<Country, Country>();


	public Country(EnCountry type, String code, String name, Country superCountry)
	{
		this.type = type;
		this.code = code;
		this.name = name;
		this.superCountry = superCountry;

		if (EnCountry.NATION == type)
		{
			nationMap.put(superCountry, this);
		}
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

	public static Map<Country, Country> getNationMap()
	{
		return nationMap;
	}

}

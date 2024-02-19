package model;

import java.util.ArrayList;
import java.util.List;
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
	private static List<Country> countryList = new ArrayList<Country>();

	private final String type;
	private final String code;
	private final String name;
	private final String superCountryCode;


	public Country(String type, String code, String name, String superCountryCode)
	{
		this.type = type;
		this.code = code;
		this.name = name;
		this.superCountryCode = superCountryCode;

		countryList.add(this);
	}


	public String getType()
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

	public String getSuperCountryCode()
	{
		return superCountryCode;
	}

	public static List<Country> getCountryList()
	{
		return countryList;
	}

}

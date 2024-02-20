package model;

import java.util.ArrayList;
import java.util.HashMap;
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


	private final Integer ID;
	private final String type;
	private final String code;
	private final String name;
	private final String superCountryCode;


	public Country(Integer ID, String type, String code, String name, String superCountryCode)
	{
		this.ID = ID;
		this.type = type;
		this.code = code;
		this.name = name;
		this.superCountryCode = superCountryCode;
	}


	public Integer getID()
	{
		return ID;
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

	public List<Country> getCountryList()
	{
		return countryList;
	}


	public void newCountry(Integer countryID, String type, String code, String name, String superCountryCode)
	{
		Country country = new Country(countryID, type, code, name, superCountryCode);
		countryList.add(country);
	}

	public void newCountry(Integer countryID, String name)
	{
		newCountry(countryID, null, null, name, null);
	}

}

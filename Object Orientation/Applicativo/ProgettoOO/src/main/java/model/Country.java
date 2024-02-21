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
	public enum COUNTRY_TYPE {NATION, CONTINENT, WORLD};
	private static List<Country> countryList = new ArrayList<Country>();
	private static Integer totalCountries = 0;


	private final String ID;
	private final String type;
	private final String code;
	private final String name;
	private final Country superCountry;


	public Country(String ID, String type, String code, String name, Country superCountry)
	{
		this.ID = ID;
		this.type = type;
		this.code = code;
		this.name = name;
		this.superCountry = superCountry;
	}

	public Integer getTotalCountries()
	{
		return totalCountries;
	}

	public void setTotalCountries(Integer totalCountries)
	{
		Country.totalCountries = totalCountries;
	}

	public String getID()
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

	public Country getSuperCountry()
	{
		return superCountry;
	}

	public List<Country> getCountryList()
	{
		return countryList;
	}

	public Country getCountryFromID(String countryID)
	{
		for (Country country : countryList) {
			if (country.getID().equalsIgnoreCase(countryID)) {
				return country;
			}
		}

		return null;
	}


}

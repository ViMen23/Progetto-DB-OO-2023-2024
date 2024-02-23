package model;

import java.util.*;

/**
 * TYPE : class
 * <p>
 * NAME : Country
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di paese
 */
public class Country
{
	public enum COUNTRY_TYPE {NATION, CONTINENT, WORLD}
	private static final Map<String, Country> COUNTRY_MAP = new LinkedHashMap<>();
	private static Integer totalCountries = 0;

	private final String type;
	private final String code;
	private final String name;
	private final Country superCountry;


	public Country(String type, String code, String name, Country superCountry)
	{
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

	public Map<String, Country> getCountryMap()
	{
		return COUNTRY_MAP;
	}

}

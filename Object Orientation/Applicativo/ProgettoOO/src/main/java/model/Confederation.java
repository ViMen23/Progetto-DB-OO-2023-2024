package model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * TYPE : class
 * NAME : Confederation
 *
 * DESC: Classe che rappresenta il concetto astratto di confederazione calcistica
 */
public class Confederation
{
	private static final Map<String, Confederation> CONFEDERATION_MAP = new LinkedHashMap<String, Confederation>();
	private static Integer totalConfederations = 0;


	private final String shortName;
	private final String longName;
	private final Country country;
	private final Confederation superConfederation;


	public Confederation(String shortName, String longName,
											 Country country, Confederation superConfederation)
	{
		this.shortName = shortName;
		this.longName = longName;
		this.country = country;
		this.superConfederation = superConfederation;
	}


	public String getShortName()
	{
		return shortName;
	}
	public String getLongName()
	{
		return longName;
	}
	public Country getCountry()
	{
		return country;
	}
	public Confederation getSuperConfederation()
	{
		return superConfederation;
	}
	public static Map<String, Confederation> getConfederationMap()
	{
		return CONFEDERATION_MAP;
	}

}

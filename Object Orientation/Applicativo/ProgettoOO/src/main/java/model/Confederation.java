package model;

import java.util.ArrayList;
import java.util.List;

/**
 * TYPE : class
 * NAME : Confederation
 *
 * DESC: Classe che rappresenta il concetto astratto di confederazione calcistica
 */
public class Confederation
{
	private static List<Confederation> confederationList = new ArrayList<Confederation>();

	private final String shortName;
	private final String longName;
	private final String countryName;
	private final String superShortName;


	public Confederation(String shortName, String longName, String countryName, String superShortName)
	{
		this.shortName = shortName;
		this.longName = longName;
		this.countryName = countryName;
		this.superShortName = superShortName;

		confederationList.add(this);
	}


	public String getShortName()
	{
		return shortName;
	}

	public String getLongName()
	{
		return longName;
	}
	public String getCountryName()
	{
		return countryName;
	}
	public String getSuperShortName()
	{
		return superShortName;
	}

	public static List<Confederation> getConfederationList()
	{
		return confederationList;
	}

}

package model;

import java.util.*;

/**
 * TYPE : class
 * NAME : Competition
 *
 * DESC: Classe che rappresenta il concetto astratto di competizione calcistica
 */
public class Competition
{
	private final String type;
	private final String teamType;
	private final String name;
	private final String confederationShortName;
	private final String countryName;



	private static List<Competition> competitionList = new ArrayList<Competition>();


	public Competition(String type, String teamType, String name,
										 String confederationShortName, String countryName)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.confederationShortName = confederationShortName;
		this.countryName = countryName;

		competitionList.add(this);
	}


	public String getType()
	{
		return type;
	}

	public String getTeamType()
	{
		return teamType;
	}

	public String getName()
	{
		return name;
	}

	public String getConfederationShortName()
	{
		return confederationShortName;
	}

	public String getCountryName()
	{
		return countryName;
	}

	public static List<Competition> getCompetitionList()
	{
		return competitionList;
	}

}

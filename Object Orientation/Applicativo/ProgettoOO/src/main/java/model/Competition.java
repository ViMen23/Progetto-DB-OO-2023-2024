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
	private final Confederation confederation;
	private final Country country;



	private static List<Competition> competitionList = new ArrayList<Competition>();


	public Competition(String type, String teamType, String name,
										 Confederation confederation, Country country)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.confederation = confederation;
		this.country = country;
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

	public Confederation getConfederation()
	{
		return confederation;
	}

	public Country getCountry()
	{
		return country;
	}

	public static List<Competition> getCompetitionList()
	{
		return competitionList;
	}

}

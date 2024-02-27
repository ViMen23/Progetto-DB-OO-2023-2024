package model;

import java.util.*;

/**
 * TYPE : class
 * <p>
 * NAME : Competition
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di competizione calcistica
 */
public class Competition
{
	public enum COMPETITION_TYPE {CUP, LEAGUE, SUPER_CUP}
	private static final Map<String, Competition> COMPETITION_MAP = new LinkedHashMap<>();
	private static Integer totalCompetitions = 0;

	private final String type;
	private final String teamType;
	private final String name;
	private final Confederation confederation;
	private final Set<String> editionSet;


	private final Map<String, Team> teamMap;


	public Competition(String type,
										 String teamType,
										 String name,
										 Confederation confederation)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.confederation = confederation;

		this.editionSet = new LinkedHashSet<>();
		this.teamMap = new LinkedHashMap<>();
	}


	public Integer getTotalCompetitions()
	{
		return totalCompetitions;
	}

	public void setTotalCompetitions(Integer totalCompetitions)
	{
		Competition.totalCompetitions = totalCompetitions;
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

	public Set<String> getEditionSet()
	{
		return editionSet;
	}

	public Map<String, Competition> getCompetitionMap()
	{
		return COMPETITION_MAP;
	}

	public Map<String, Team> getTeamMap()
	{
		return teamMap;
	}
}

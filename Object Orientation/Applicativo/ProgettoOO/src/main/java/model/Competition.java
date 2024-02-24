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


	private List<String> editionList;
	private String edition; // edizione della competizione che si sta mostrando
	private List<Team> editionTeamList;
	private List<AssignedTrophy> editionAssignedTrophyList;


	public Competition(String type,
										 String teamType,
										 String name,
										 Confederation confederation)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.confederation = confederation;

		this.editionList = new ArrayList<>();
		this.editionTeamList = new ArrayList<>();
		this.editionAssignedTrophyList = new ArrayList<>();
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


	public Map<String, Competition> getCompetitionMap()
	{
		return COMPETITION_MAP;
	}


	public void setEdition(String edition)
	{
		this.edition = edition;
	}

	public String getEdition()
	{
		return edition;
	}

	public List<String> getEditionList()
	{
		return editionList;
	}

	public List<Team> getEditionTeamList()
	{
		return editionTeamList;
	}

	public List<AssignedTrophy> getEditionAssignedTrophyList()
	{
		return editionAssignedTrophyList;
	}
}

package model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * TYPE : class
 * NAME : Competition
 *
 * DESC: Classe che rappresenta il concetto astratto di competizione calcistica
 */
public class Competition
{
	private final EnCompetition type;
	private final EnTeam teamType;
	private final String name;
	private final Integer frequency;
	private final Confederation confederation;
	private Set<Integer> editions; // anno di inizio delle edizioni della competizione calcistica

	// mappa delle competizioni per confederazione calcistica
	private static Map<Confederation, Competition> competitionMap = new LinkedHashMap<Confederation, Competition>();


	public Competition(EnCompetition type, EnTeam teamType, String name, Integer frequency, Confederation confederation)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.frequency = frequency;
		this.confederation = confederation;

		this.editions = new TreeSet<Integer>();

		competitionMap.put(confederation, this);
	}


	public EnCompetition getType()
	{
		return type;
	}

	public EnTeam getTeamType()
	{
		return teamType;
	}

	public String getName()
	{
		return name;
	}

	public Integer getFrequency()
	{
		return frequency;
	}

	public Confederation getConfederation()
	{
		return confederation;
	}

	public static Map<Confederation, Competition> getCompetitionMap()
	{
		return competitionMap;
	}

	public Set<Integer> getEditions()
	{
		return editions;
	}


	public void addEdition(Integer startYear)
	{
		editions.add(startYear);
	}

}

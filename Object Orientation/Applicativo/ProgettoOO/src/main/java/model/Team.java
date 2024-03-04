package model;

import java.util.*;

/**
 * TYPE : class
 * <p>
 * NAME : Team
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di squadra di calcio
 */
public class Team
{
	public enum TEAM_TYPE {CLUB, NATIONAL}
	private static final Map<String, Team> TEAM_MAP = new LinkedHashMap<>();
	private static Integer totalTeam = 0;


	private final String type;
	private String shortName;
	private String longName;
	private final Country country;
	private final Confederation confederation;


	private final Map<String, Player> playerMap;
	private final Set<Competition> competitionSet;
	private final Set<Trophy> trophySet;
	private final Set<Prize> prizeSet;
	private final Set<String> yearSet;

	public Team(String type,
							String shortName,
							String longName,
							Country country,
							Confederation confederation)
	{
		this.type = type;
		this.shortName = shortName;
		this.longName = longName;
		this.country = country;
		this.confederation = confederation;

		this.playerMap = new LinkedHashMap<>();
		this.competitionSet = new HashSet<>();
		this.trophySet = new LinkedHashSet<>();
		this.prizeSet = new LinkedHashSet<>();
		this.yearSet = new LinkedHashSet<>();
	}


	public void setTotalTeam(Integer totalTeam)
	{
		Team.totalTeam = totalTeam;
	}

	public Integer getTotalTeam()
	{
		return totalTeam;
	}

	public String getType()
	{
		return type;
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

	public Confederation getConfederation()
	{
		return confederation;
	}

	public Map<String, Team> getTeamMap()
	{
		return TEAM_MAP;
	}

	public void setShortName(String shortName)
	{
		this.shortName = shortName;
	}

	public void setLongName(String longName)
	{
		this.longName = longName;
	}

	public Map<String, Player> getPlayerMap()
	{
		return playerMap;
	}

	public Set<Competition> getCompetitionSet()
	{
		return competitionSet;
	}

	public Set<Trophy> getTrophySet()
	{
		return trophySet;
	}

	public Set<Prize> getPrizeSet()
	{
		return prizeSet;
	}

	public Set<String> getYearSet()
	{
		return yearSet;
	}
}

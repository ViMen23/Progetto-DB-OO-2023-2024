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


	private final Map<String, Player> playerMap;
	private final Set<Trophy> trophySet;
	private final Set<Prize> prizeSet;

	public Team(String type,
							String shortName,
							String longName,
							Country country)
	{
		this.type = type;
		this.shortName = shortName;
		this.longName = longName;
		this.country = country;

		this.playerMap = new LinkedHashMap<>();
		this.trophySet = new HashSet<>();
		this.prizeSet = new HashSet<>();
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

	public Set<Prize> getPrizeSet()
	{
		return prizeSet;
	}

	public Set<Trophy> getTrophySet()
	{
		return trophySet;
	}
}

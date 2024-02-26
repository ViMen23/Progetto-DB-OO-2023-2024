package model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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


	public Team(String type,
							String shortName,
							String longName,
							Country country)
	{
		this.type = type;
		this.shortName = shortName;
		this.longName = longName;
		this.country = country;
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
}

package model;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * TYPE : class
 * <p>
 * NAME : Trophy
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di trofeo calcistico
 */
public class Trophy
{
	public enum AWARD_TYPE {PLAYER, TEAM}
	private static final Map<String, Trophy> TROPHY_MAP = new LinkedHashMap<>();

	private final String type;
	private final String role;
	private final String name;
	private final Player player;
	private final Team team;
	private final Competition competition;
	private final String assignedYear;


	public Trophy(String type,
								String role,
								String name,
								Player player,
								Team team,
								Competition competition,
								String assignedYear)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.player = player;
		this.team = team;
		this.competition = competition;
		this.assignedYear = assignedYear;
	}


	public String getType()
	{
		return type;
	}

	public String getRole()
	{
		return role;
	}

	public String getName()
	{
		return name;
	}

	public Player getPlayer()
	{
		return player;
	}

	public Team getTeam()
	{
		return team;
	}

	public Competition getCompetition()
	{
		return competition;
	}

	public String getAssignedYear()
	{
		return assignedYear;
	}

	public Map<String, Trophy> getTrophyMap()
	{
		return TROPHY_MAP;
	}
}

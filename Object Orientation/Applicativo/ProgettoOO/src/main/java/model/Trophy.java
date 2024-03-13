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
	private final String type;
	private final String role;
	private final String name;
	private final Player player;
	private final Team team;
	private final Competition competition;
	private final String competitionStartYear;


	public Trophy(String type,
								String role,
								String name,
								Player player,
								Team team,
								Competition competition,
								String competitionStartYear)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.player = player;
		this.team = team;
		this.competition = competition;
		this.competitionStartYear = competitionStartYear;
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

	public String getCompetitionStartYear()
	{
		return competitionStartYear;
	}
}

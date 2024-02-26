package model;

import java.util.ArrayList;
import java.util.List;

public class AssignedTrophy
{
	private static final List<AssignedTrophy> ASSIGNED_TROPHY_LIST = new ArrayList<>();

	private final Trophy trophy;
	private final Competition competition;
	private final String year;
	private final Team team;
	private final Player player;

	public AssignedTrophy(Trophy trophy,
												Competition competition,
												String year,
												Team team,
												Player player)
	{
		this.trophy = trophy;
		this.competition = competition;
		this.year = year;
		this.team = team;
		this.player = player;
	}


	public Trophy getTrophy()
	{
		return trophy;
	}

	public Competition getCompetition()
	{
		return competition;
	}

	public String getYear()
	{
		return year;
	}

	public Team getTeam()
	{
		return team;
	}

	public Player getPlayer()
	{
		return player;
	}

	public List<AssignedTrophy> getAssignedTrophyList()
	{
		return ASSIGNED_TROPHY_LIST;
	}
}

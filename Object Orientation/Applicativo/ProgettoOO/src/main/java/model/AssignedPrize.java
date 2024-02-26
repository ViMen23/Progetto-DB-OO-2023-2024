package model;

import java.util.ArrayList;
import java.util.List;

public class AssignedPrize
{
	private static final List<AssignedPrize> ASSIGNED_PRIZE_LIST = new ArrayList<>();

	private final Prize prize;
	private final String year;
	private final Team team;
	private final Player player;

	public AssignedPrize(Prize prize,
											 String year,
											 Team team,
											 Player player)
	{
		this.prize = prize;
		this.year = year;
		this.team = team;
		this.player = player;
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

	public List<AssignedPrize> getAssignedPrizeList()
	{
		return ASSIGNED_PRIZE_LIST;
	}
}

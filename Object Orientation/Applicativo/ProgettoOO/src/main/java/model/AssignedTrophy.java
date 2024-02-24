package model;

public class AssignedTrophy
{
	private final Competition competition;
	private final String year;
	private final Team team;
	private final Player player;

	public AssignedTrophy(Competition competition,
												String year,
												Team team,
												Player player)
	{
		this.competition = competition;
		this.year = year;
		this.team = team;
		this.player = player;
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
}

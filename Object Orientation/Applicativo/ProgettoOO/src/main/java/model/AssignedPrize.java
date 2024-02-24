package model;

public class AssignedPrize
{
	private final String year;
	private final Team team;
	private final Player player;

	public AssignedPrize(String year,
											 Team team,
											 Player player)
	{
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
}

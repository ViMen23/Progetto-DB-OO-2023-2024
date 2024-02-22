package model;

/**
 * TYPE : class
 * NAME : Statistic
 *
 * DESC: Classe che rappresenta il concetto astratto di statistiche calcistiche
 */
public class Statistic
{
	private final Player player;
	private final Team team;
	private final Competition competition;
	private final String competitionYear;
	private final String goalScored;
	private final String assist;
	private final String yellowCard;
	private final String redCard;
	private final String penaltyScored;
	private final String goalConceded;
	private final String penaltySaved;

	public Statistic(Player player,
									 Team team,
									 Competition competition,
									 String competitionYear,
									 String goalScored,
									 String assist,
									 String yellowCard,
									 String redCard,
									 String penaltyScored,
									 String goalConceded,
									 String penaltySaved)
	{
		this.player = player;
		this.team = team;
		this.competition = competition;
		this.competitionYear = competitionYear;
		this.goalScored = goalScored;
		this.assist = assist;
		this.yellowCard = yellowCard;
		this.redCard = redCard;
		this.penaltyScored = penaltyScored;
		this.goalConceded = goalConceded;
		this.penaltySaved = penaltySaved;
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

	public String getCompetitionYear()
	{
		return competitionYear;
	}

	public String getGoalScored()
	{
		return goalScored;
	}

	public String getAssist()
	{
		return assist;
	}

	public String getYellowCard()
	{
		return yellowCard;
	}

	public String getRedCard()
	{
		return redCard;
	}

	public String getPenaltyScored()
	{
		return penaltyScored;
	}

	public String getGoalConceded()
	{
		return goalConceded;
	}

	public String getPenaltySaved()
	{
		return penaltySaved;
	}

}

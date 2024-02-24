package model;

import java.util.ArrayList;
import java.util.List;

/**
 * TYPE : class
 * <p>
 * NAME : Statistic
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di statistiche calcistiche
 */
public class Statistic
{
	private final Team team;
	private final Competition competition;
	private final String competitionYear;
	private final String match;
	private final String goalScored;
	private final String penaltyScored;
	private final String assist;
	private final String yellowCard;
	private final String redCard;
	private final String goalConceded;
	private final String penaltySaved;

	public Statistic(Team team,
									 Competition competition,
									 String competitionYear,
									 String match,
									 String goalScored,
									 String penaltyScored,
									 String assist,
									 String yellowCard,
									 String redCard,
									 String goalConceded,
									 String penaltySaved)
	{
		this.team = team;
		this.competition = competition;
		this.competitionYear = competitionYear;
		this.match = match;
		this.goalScored = goalScored;
		this.penaltyScored = penaltyScored;
		this.assist = assist;
		this.yellowCard = yellowCard;
		this.redCard = redCard;
		this.goalConceded = goalConceded;
		this.penaltySaved = penaltySaved;
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

	public String getMatch()
	{
		return match;
	}

	public String getGoalScored()
	{
		return goalScored;
	}

	public String getPenaltyScored()
	{
		return penaltyScored;
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

	public String getGoalConceded()
	{
		return goalConceded;
	}

	public String getPenaltySaved()
	{
		return penaltySaved;
	}

}

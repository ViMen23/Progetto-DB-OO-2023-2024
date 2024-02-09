package model;

/**
 * TYPE : class
 * NAME : Competition
 *
 * DESC: Classe che rappresenta il concetto astratto di competizione calcistica
 */
public class Competition
{
	private EnCompetition type;
	private EnTeam teamType;
	private String name;
	private Integer frequency;
	private Confederation confederation;


	public Competition(EnCompetition type, EnTeam teamType, String name, Integer frequency, Confederation confederation)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.frequency = frequency;
		this.confederation = confederation;
	}


	public EnCompetition getType()
	{
		return type;
	}

	public EnTeam getTeamType()
	{
		return teamType;
	}

	public String getName()
	{
		return name;
	}

	public Integer getFrequency()
	{
		return frequency;
	}

	public Confederation getConfederation()
	{
		return confederation;
	}

}

package model;

public class Competition
{
	private String name;
	private Boolean club;
	private Boolean national;
	private Boolean championship;
	private Boolean tournament;
	private Byte level; // 1 first level competition, 2 middle level...
	private Country country;
	private Integer sYear;
	private Integer eYear;
	public Integer nTeams;

	// TODO
	// trophy

	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private Competition(String name, Boolean club, Boolean national, Boolean championship, Boolean tournament,
											Byte level, Country country, Integer sYear, Integer eYear, Integer nTeams)
	{
		this.name         = name;
		this.club         = club;
		this.national     = national;
		this.championship = championship;
		this.tournament   = tournament;
		this.level        = level;
		this.country      = country;
		this.sYear        = sYear;
		this.eYear        = eYear;
		this.nTeams       = nTeams;

		// add to competitions list
		Static.competitionL.add(this);
	}

	//----------------------------------------------------------
	// GET METHODS
	//----------------------------------------------------------

	public String getName() { return name; }
	public Boolean isClub() { return club; }
	public Boolean isNational() { return national; }
	public Boolean isChampionship() { return championship; }
	public Boolean isTournament() { return tournament; }
	public Byte getLevel() { return level; }
	public Country getCountry() { return country; }
	public Integer getSYear() {return sYear;}
	public Integer getEYear() {return eYear;}
	public Integer getNTeams() {return nTeams;}

	// TODO createCompetition

	//----------------------------------------------------------
	// PRINT METHODS
	//----------------------------------------------------------

	// method to print season
	public String printSeason()
	{
		String toPrint = "";

		if (this.getSYear().equals(this.getEYear())) { toPrint += this.getSYear(); }
		else { toPrint += this.getSYear() + "-" + getEYear(); }

		return toPrint;
	}

	// method to print if is a club or nation competition
	public String printTeamType()
	{
		String toPrint = "";

		if (this.isClub()) { toPrint += "Club"; }
		else if (this.isNational()) { toPrint += "National"; }

		return toPrint;
	}

	// method to print if is a championship or tournament competition
	public String printCompetitionType()
	{
		String toPrint = "";

		if (this.isChampionship()) { toPrint += "Championship"; }
		else if (this.isTournament()) { toPrint += "Tournament"; }

		return toPrint;
	}

	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nCOMPETITION";
		toPrint += "\n\tSeason          : " + printSeason();
		toPrint += "\n\tName            : " + getName();
		toPrint += "\n\tTeams type      : " + printTeamType();
		toPrint += "\n\tType            : " + printCompetitionType();
		toPrint += "\n\tLevel           : " + getLevel();
		toPrint += "\n\tCountry         : " + getCountry().getNation();
		toPrint += "\n\tNumber of teams : " + getNTeams();

		return toPrint;
	}

}

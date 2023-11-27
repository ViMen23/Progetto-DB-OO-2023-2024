package model;

public class Competition
{
	private String name;
	private boolean club; // false national competition, true club competition
	private boolean championship; // false tournament competition, true championship competition
	private byte level; // 1 first level competition, 2 middle level...
	private Country country;
	private int sYear;
	private int eYear;
	public int nTeams;
	public int nMaxMatchesForTeam;


	// TODO
	// trophy

	// constructor
	private Competition(String name, boolean club, boolean championship, byte level, Country country,
											int sYear, int eYear, int nTeams, int nMaxMatchesForTeam )
	{
		this.name               = name;
		this.club               = club;
		this.championship       = championship;
		this.level              = level;
		this.country            = country;
		this.sYear              = sYear;
		this.eYear              = eYear;
		this.nTeams             = nTeams;
		this.nMaxMatchesForTeam = nMaxMatchesForTeam;

		// add to competitions list
		Static.competitionL.add(this);
	}

	// get methods
	public String getName() {return name;}
	public boolean isClub() {return club;}
	public boolean isChampionship() {return championship;}
	public byte getLevel() {return level;}
	public Country getCountry() {return country;}
	public int getSYear() {return sYear;}
	public int getEYear() {return eYear;}
	public int getNTeams() {return nTeams;}
	public int getNMaxMatchesForTeam() {return nMaxMatchesForTeam;}

	// TODO createCompetition

	// method to print if is a club or nation competition
	public String printTeamType()
	{
		String toPrint;

		if (this.isClub()) {toPrint = "Club";}
		else {toPrint = "Nation";}

		return toPrint;
	}

	// method to print if is a championship or tournament competition
	public String printCompetitionType()
	{
		String toPrint;

		if (this.isChampionship()) {toPrint = "Championship";}
		else {toPrint = "Tournament";}

		return toPrint;
	}

	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nCOMPETITION";
		toPrint += "\n\tName                           : " + getName();
		toPrint += "\n\tTeams type                     : " + printTeamType();
		toPrint += "\n\tType                           : " + printCompetitionType();
		toPrint += "\n\tLevel                          : " + getLevel();
		toPrint += "\n\tCountry                        : " + getCountry().getNation();
		toPrint += "\n\tStart year                     : " + getSYear();
		toPrint += "\n\tEnd year                       : " + getEYear();
		toPrint += "\n\tNumber of teams                : " + getNTeams();
		toPrint += "\n\tMax number of matches for team : " + getNMaxMatchesForTeam();

		return toPrint;
	}

}

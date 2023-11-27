package model;

import java.util.ArrayList;

public class Team {
	private String name;
	private final boolean club; // true Club team, false National team
	private Country country;
	private ArrayList<Competition> competitionL = new ArrayList<>();
	private ArrayList<Trophy> trophyL             = new ArrayList<>();
	private ArrayList<Career> careerL = new ArrayList<>();

	// constructor
	private Team(String name, boolean club, Country country)
	{
		this.name    = name;
		this.club    = club;
		this.country = country;
	}

	// get methods
	public String getName() {return name;}
	public boolean isClub() {return club;}
	public Country getCountry() {return country;}

	// method to add a career to team career list
	public void addCareer(Career career) {this.careerL.add(career);}

	// method to create a team
	public static Team createTeam(String name, boolean club, Country country)
	{
		try {
			if (club) {
				Check.checkClubTeam(name, country);

				Team team = new Team(name.toUpperCase(), true, country);
				Static.clubTeamL.add(team);

				return team;
			}
			else {
				Check.checkNationalTeam(country);

				Team team = new Team(name.toUpperCase(), false, country);
				Static.nationalTeamL.add(team);
				// add national team to country
				country.addNationalTeam(team);

				return team;
			}
		}
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// set methods
	public void setName(String name)
	{
		try {
			if (this.isClub()) {Check.checkClubTeamName(name, this.getCountry());}
			else { Check.checkNationalTeamName(name, this.getCountry());}

			this.name = name;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setCountry(Country country)
	{
		if (this.isClub()) {
			try {
				Check.checkClubTeamCountry(this.getName(), country);

				this.country = country;
			}
			catch (Exception e) {System.out.println(e);}
		}
		else {System.out.println("It is not possible to change the country of a national team.");}
	}


	// method to print team type
	public String printTeamType()
	{
		String toPrint;
		if (this.isClub()) { toPrint = "Club"; }
		else { toPrint = "National"; }

		return toPrint;
	}

	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nTEAM";
		toPrint += "\n\tName    : " + getName();
		toPrint += "\n\tType    : " + printTeamType();
		toPrint += "\n\tCountry : " + getCountry().getNation();

		return toPrint;
	}
}

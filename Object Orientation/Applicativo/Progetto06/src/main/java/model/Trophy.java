package model;

import java.util.ArrayList;

public class Trophy
{
	private String name;
	private boolean individual; // false team trophy, true individual trophy
	private int year;
	private ArrayList<Competition> competitionL = new ArrayList<Competition>();

	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private Trophy(String name, boolean individual, int year, Competition competition)
	{
		this(name, individual, year);
		this.competitionL.add(competition);
	}

	private Trophy(String name, boolean individual, int year)
	{
		this.name       = name;
		this.individual = individual;
		this.year       = year;

		Static.trophyL.add(this);
	}

	//----------------------------------------------------------
	// GET METHODS
	//----------------------------------------------------------

	public String getName() { return name; }
	public boolean isIndividual() { return individual; }
	public int getYear() { return year; }
	public ArrayList<Competition> getCompetitionL() { return competitionL; }

	//----------------------------------------------------------
	// PRINT METHODS
	//----------------------------------------------------------

	// method to print trophy type
	public String printTrophyType()
	{
		String toPrint;

		if (this.isIndividual()) { toPrint = "Individual"; }
		else { toPrint = "Team"; }

		return toPrint;
	}

	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nTROPHY";
		toPrint += "\n\tName : " + getName();
		toPrint += "\n\tType : " + printTrophyType();
		toPrint += "\n\tYear : " + getYear();

		return toPrint;
	}

}

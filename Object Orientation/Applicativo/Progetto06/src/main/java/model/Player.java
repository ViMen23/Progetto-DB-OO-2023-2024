package model;

import java.time.LocalDate;
import java.util.ArrayList;

public class Player
{
	private String name;
	private String surname;
	private LocalDate bDate; // birthdate
	private LocalDate sDate; // start date
	private LocalDate rDate; // retirement date
	private Country country;
	private ArrayList<Career> careerL = new ArrayList<>();

	// constructor
	private Player(String name, String surname, LocalDate bDate,
								 LocalDate sDate, LocalDate rDate, Country country)
	{
		this.name    = name;
		this.surname = surname;
		this.bDate   = bDate;
		this.sDate   = sDate;
		this.rDate   = rDate;
		this.country = country;
	}

	// get methods
	public String getName() {return name;}
	public String getSurname() {return surname;}
	public LocalDate getBDate() {return bDate;}
	public LocalDate getSDate() {return sDate;}
	public LocalDate getRDate() {return rDate;}
	public Country getCountry() {return country;}

	// method to add a career to a player career list
	public void addCareer(Career career) {this.careerL.add(career);}

	// method to create a player
	public static Player createPlayer(String name, String surname, LocalDate bDate,
																			LocalDate sDate, LocalDate rDate, Country country)
	{
		try {
			Check.checkPlayer(name, surname, bDate, sDate, rDate, country);

			Player player = new Player(name.toUpperCase(), surname.toUpperCase(), bDate, sDate, rDate, country);
			Static.playerL.add(player);

			return player;
		}
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// set methods

/*
	public void setName(String name) {
		try {

		}
		catch () {}
	}
*/
	// print method
	// TODO locale
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nPLAYER";
		toPrint += "\n\tName            : " + getName();
		toPrint += "\n\tSurname         : " + getSurname();
		toPrint += "\n\tBirthdate       : " + getBDate();
		toPrint += "\n\tStart date      : " + getSDate();
		toPrint += "\n\tRetirement date : " + getRDate();
		toPrint += "\n\tCountry         : " + getCountry().getNation();

		return toPrint;
	}

}

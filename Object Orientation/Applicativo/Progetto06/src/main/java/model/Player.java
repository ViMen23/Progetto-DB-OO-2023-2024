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
	public void setName(String name)
	{
		try {
			Check.checkPlayerName(name, getSurname(), getBDate(), getSDate(), getCountry());

			this.name = name;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setSurname(String surname)
	{
		try {
			Check.checkPlayerSurname(getName(), surname, getBDate(), getSDate(), getCountry());

			this.surname = surname;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setBDate(LocalDate bDate)
	{
		try {
			Check.checkPlayerBDate(getName(), getSurname(), bDate, getSDate(), getRDate(), getCountry());

			this.bDate = bDate;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setSDate(LocalDate sDate)
	{
		try {
			Check.checkPlayerSDate(getName(), getSurname(), getBDate(), sDate, getRDate(), getCountry());

			this.sDate = sDate;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setRDate(LocalDate rDate)
	{
		try {
			Check.checkPlayerRDate(getBDate(), getSDate(), rDate);

			this.rDate = rDate;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setCountry(Country country)
	{
		try {
			Check.checkPlayerCountry(getName(), getSurname(), getBDate(), getSDate(), country);

			this.country = country;
		}
		catch (Exception e) {System.out.println(e);}
	}

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

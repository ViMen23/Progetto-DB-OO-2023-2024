package model;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;

public class Player
{
	private String name;
	private String surname;
	private LocalDate bDate; // birthdate
	private Integer age; // derived from bDate
	private Country country;
	private ArrayList<Role> roleL = new ArrayList<Role>();
	private Boolean rightFoot;
	private Boolean leftFoot;
	private LocalDate sDate; // start date
	private LocalDate rDate; // retirement date

	private ArrayList<Attribute> characteristicL = new ArrayList<Attribute>();
	private ArrayList<Trophy> trophyL = new ArrayList<Trophy>();
	private ArrayList<Career> careerL = new ArrayList<Career>();

	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private Player(String name, String surname, LocalDate bDate, Country country,
								 ArrayList<Role> roleL, boolean rightFoot, boolean leftFoot,
								 LocalDate sDate, LocalDate rDate)
	{
		this.name      = name;
		this.surname   = surname;
		this.bDate     = bDate;
		this.age       = Period.between(this.bDate, LocalDate.now()).getYears();
		this.country   = country;
		this.roleL     = roleL;
		this.rightFoot = rightFoot;
		this.leftFoot  = leftFoot;
		this.sDate     = sDate;
		this.rDate     = rDate;

		this.createCharacteristicL(this);
	}

	//----------------------------------------------------------
	// GET METHODS
	//----------------------------------------------------------

	public String getName() { return name; }
	public String getSurname() { return surname; }
	public LocalDate getBDate() { return bDate; }
	public Integer getAge() { return age; }
	public Country getCountry() { return country; }
	public ArrayList<Role> getRoleL() { return roleL; }
	public boolean isRightFoot() { return rightFoot; }
	public boolean isLeftFoot() { return leftFoot; }
	public LocalDate getSDate() { return sDate; }
	public LocalDate getRDate() { return rDate; }

	//----------------------------------------------------------
	// METHOD TO ADD A NEW CAREER
	//----------------------------------------------------------

	// method to add a career to a player career list
	public void addCareer(Career career) { this.careerL.add(career); }

	//----------------------------------------------------------
	// METHOD CREATE A NEW PLAYER
	//----------------------------------------------------------
	// TODO update check methods - 28 november

	public static Player createPlayer(String name, String surname, LocalDate bDate, Country country,
																		ArrayList<Role> role, Boolean rightFoot, Boolean leftFoot,
																		LocalDate sDate, LocalDate rDate)
	{
		try {
			Check.checkPlayer(name, surname, bDate, sDate, rDate, country);

			Player player = new Player(name.toUpperCase(), surname.toUpperCase(), bDate, country,
																	role, rightFoot, leftFoot, sDate, rDate);

			Static.playerL.add(player);

			return player;
		}
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	//----------------------------------------------------------
	// SET METHODS
	//----------------------------------------------------------


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

	public void setCountry(Country country)
	{
		try {
			Check.checkPlayerCountry(getName(), getSurname(), getBDate(), getSDate(), country);

			this.country = country;
		}
		catch (Exception e) {System.out.println(e);}
	}

	public void setSDate(LocalDate sDate)
	{
		try {
			Check.checkPlayerSDate(getName(), getSurname(), getBDate(), sDate, getRDate(), getCountry());

			this.sDate = sDate;
		}
		catch (Exception e) { System.out.println(e); }
	}

	public void setRDate(LocalDate rDate)
	{
		try {
			Check.checkPlayerRDate(getBDate(), getSDate(), rDate);

			this.rDate = rDate;
		}
		catch (Exception e) { System.out.println(e); }
	}

	//----------------------------------------------------------
	// CREATE NEW CHARACTERISTIC METHOD
	//----------------------------------------------------------

	// method to create player season characteristic
	private void createCharacteristicL(Player player)
	{
		// create general statistics
		for (Attribute statistic : Static.characteristicL) {
			if (statistic.getRole() == null) {
				this.characteristicL.add(
								Attribute.createAttribute(false, true, statistic.getRole(), statistic.getName())
				);
			}
		}

		// create role specific characteristic

		// create a list of distinct role type code for player
		ArrayList<String> distinctRoleTypeCode = new ArrayList<String>();

		for (Role role : player.getRoleL()) {
			if (!distinctRoleTypeCode.contains(role.getCodeType())) { distinctRoleTypeCode.add(role.getCodeType()); }
		}

		for (String roleTypeCode : distinctRoleTypeCode) {
			for (Attribute statistic : Static.characteristicL) {
				if (roleTypeCode.equalsIgnoreCase(statistic.getRole().getCodeType())) {
					this.characteristicL.add(
									Attribute.createAttribute(false, true, statistic.getRole(), statistic.getName())
					);
				}
			}
		}

	}

	//----------------------------------------------------------
	// PRINT METHODS
	//----------------------------------------------------------

	// method to print preferred foot
	private String printPreferredFoot()
	{
		String toPrint;

		if (this.rightFoot && this.leftFoot) {
			toPrint = "ambidextrous";
		} else if (this.rightFoot) {
			toPrint = "right";
		}
		else {
			toPrint = "left";
		}

		return toPrint;
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
		toPrint += "\n\tBirthdate       : " + getBDate() + "(" + getAge() + ")";
		toPrint += "\n\tCountry         : " + getCountry().getNation();

		toPrint += "\n\tRole            : ";
		for (Role role : this.roleL) {toPrint += role.toString();}

		toPrint += "\n\tFoot            : " + printPreferredFoot();
		toPrint += "\n\tStart date      : " + getSDate();
		toPrint += "\n\tRetirement date : " + getRDate();

		return toPrint;
	}

}

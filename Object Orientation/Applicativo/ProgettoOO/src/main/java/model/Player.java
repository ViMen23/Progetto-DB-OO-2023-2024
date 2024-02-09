package model;


import java.util.Date;

/**
 * TYPE : class
 * NAME : Player
 *
 * DESC: Classe che rappresenta il concetto astratto di calciatore
 */
public class Player {
	private String name;
	private String surname;
	private Date dob;
	private Country birthCountry;
	private EnFoot foot;
	private Position mainPosition;
	private EnRoleMix role;
	private Date retiredDate;


	public Player(String name, String surname, Date dob, Country birthCountry,
								EnFoot foot, Position mainPosition, EnRoleMix role, Date retiredDate) {
		this.name = name;
		this.surname = surname;
		this.dob = dob;
		this.birthCountry = birthCountry;
		this.foot = foot;
		this.mainPosition = mainPosition;
		this.role = role;
		this.retiredDate = retiredDate;
	}


	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}

	public Date getDob() {
		return dob;
	}

	public Country getBirthCountry() {
		return birthCountry;
	}

	public EnFoot getFoot() {
		return foot;
	}

	public Position getMainPosition() {
		return mainPosition;
	}

	public EnRoleMix getRole() {
		return role;
	}

	public Date getRetiredDate() {
		return retiredDate;
	}


	public void setName(String name) {
		this.name = name;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public void setBirthCountry(Country birthCountry) {
		this.birthCountry = birthCountry;
	}

	public void setFoot(EnFoot foot) {
		this.foot = foot;
	}

	public void setMainPosition(Position mainPosition) {
		this.mainPosition = mainPosition;
	}

	public void setRole(EnRoleMix role) {
		this.role = role;
	}

	public void setRetiredDate(Date retiredDate) {
		this.retiredDate = retiredDate;
	}
}

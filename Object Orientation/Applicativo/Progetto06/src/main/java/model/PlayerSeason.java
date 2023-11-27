package model;

import java.util.ArrayList;

public class PlayerSeason
{
	private int sYear;
	private int eYear;
	private Team team;
	private Player player;
	private char foot;
	private String role;
	private ArrayList<Attribute> statisticL      = new ArrayList<>();
	private ArrayList<Attribute> characteristicL = new ArrayList<>();
	private ArrayList<Trophy>    trophyL         = new ArrayList<>();

	// constructor
	private PlayerSeason(int sYear, Team team, Player player, char foot, String role )
	{
		this.sYear  = sYear;
		this.eYear  = this.sYear + 1;
		this.team   = team;
		this.player = player;
		this.foot   = foot;
		this.role   = role;

		createStatisticL(this.role);
		createCharacteristicL(this.role);
	}

	// method to create player season statistic
	private void createStatisticL(String role)
	{
		String allRole = "PDCA";
		// create general statistics
		for (Attribute statistic : Static.statisticL) {
			if (statistic.getRole().equalsIgnoreCase(allRole) ) {
				this.statisticL.add(
								Attribute.createAttribute(true, statistic.getRole(), statistic.getName())
				);
			}
		}

		// create role specific statistic
		for (Attribute statistic : Static.statisticL) {
			if (statistic.getRole().contains(role)) {
				this.statisticL.add(
								Attribute.createAttribute(true, statistic.getRole(), statistic.getName())
				);
			}
		}
	}

	// method to create player season characteristic
	private void createCharacteristicL(String role)
	{
		String allRole = "PDCA";
		// create general characteristic
		for (Attribute characteristic : Static.characteristicL) {
			if (characteristic.getRole().equalsIgnoreCase(allRole)) {
				this.characteristicL.add(
								Attribute.createAttribute( false, characteristic.getRole(), characteristic.getName())
				);
			}
		}

		// create role specific characteristic
		for (Attribute characteristic: Static.characteristicL) {
			if (characteristic.getRole().contains(role)) {
				this.characteristicL.add(
								Attribute.createAttribute(false, characteristic.getRole(), characteristic.getName())
				);
			}
		}
	}

	// get methods
	public int getSYear() {return sYear;}
	public int getEYear() {return eYear;}
	public Team getTeam() {return team;}
	public Player getPlayer() {return player;}
	public char getFoot() {return foot;}
	public String getRole() {return role;}
	public ArrayList<Attribute> getStatisticL() {return statisticL;}
	public ArrayList<Attribute> getCharacteristicL() {return characteristicL;}
	public ArrayList<Trophy> getTrophyL() {return trophyL;}


	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nPLAYER SEASON";
		toPrint += "\n\tStart year : " + getSYear();
		toPrint += "\n\tEnd year   : " + getEYear();
		toPrint += "\n\tTeam       : " + getTeam().getName();
		toPrint += "\n\tPlayer     : "  + getPlayer().getSurname();
		toPrint += "\n\tFoot       : " + getFoot();
		toPrint += "\n\tRole       : " + getRole();

		toPrint += "\n\tSTATISTIC";
		for (Attribute statistic : getStatisticL()) {
			toPrint += "\n\t\t" + statistic.getName() + ": " + statistic.getValue();
		}

		toPrint += "\n\tCHARACTERISTIC";
		for (Attribute characteristic : getCharacteristicL()) {
			toPrint += "\n\t\t" + characteristic.getName() + ": " + characteristic.getValue();
		}

		toPrint += "\n\tTROPHY";
		for (Trophy trophy : getTrophyL()) {
			toPrint += "\n\t\t" + trophy.getName();
		}

		return toPrint;
	}

}

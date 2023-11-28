package model;

import java.util.ArrayList;

public class PlayerSeason
{
	private Integer sYear;
	private Integer eYear;
	private Competition competition;
	private Team team;
	private Player player;
	private ArrayList<Attribute> statisticL = new ArrayList<Attribute>();


	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private PlayerSeason(Integer sYear, Competition competition, Team team, Player player)
	{
		this.sYear       = sYear;
		this.eYear       = this.sYear + 1;
		this.competition = competition;
		this.team        = team;
		this.player      = player;

		this.createStatisticL(this.getPlayer());
	}


	//----------------------------------------------------------
	// CREATE NEW STATISTIC METHOD
	//----------------------------------------------------------

	private void createStatisticL(Player player)
	{
		// create general statistics
		for (Attribute statistic : Static.statisticL) {
			if (statistic.getRole() == null) {
				this.statisticL.add(
								Attribute.createAttribute(true, false, statistic.getRole(), statistic.getName())
				);
			}
		}

		// create role specific statistic

		// create a list of distinct role type code for player
		ArrayList<String> distinctRoleTypeCode = new ArrayList<String>();

		for (Role role : player.getRoleL()) {
			if (!distinctRoleTypeCode.contains(role.getCodeType())) { distinctRoleTypeCode.add(role.getCodeType()); }
		}

		for (String roleTypeCode : distinctRoleTypeCode) {
			for (Attribute statistic : Static.statisticL) {
				if (roleTypeCode.equalsIgnoreCase(statistic.getRole().getCodeType())) {
					this.statisticL.add(
									Attribute.createAttribute(true, false, statistic.getRole(), statistic.getName())
					);
				}
			}
		}

	}

	//----------------------------------------------------------
	// GET METHODS
	//----------------------------------------------------------

	public Integer getSYear() { return sYear; }
	public Integer getEYear() { return eYear; }
	public Competition getCompetition() { return competition; }
	public Team getTeam() { return team; }
	public Player getPlayer() { return player; }
	public ArrayList<Attribute> getStatisticL() { return statisticL; }

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

	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nPLAYER SEASON";
		toPrint += "\n\tSeason      : " + getSYear() + "-" + getEYear();
		toPrint += "\n\tCompetition : " + getCompetition();
		toPrint += "\n\tTeam        : " + getTeam().getName();
		toPrint += "\n\tPlayer      : "  + getPlayer().getSurname();

		toPrint += "\n\tSTATISTIC";
		for (Attribute statistic : getStatisticL()) {
			toPrint += "\n\t\t" + statistic.getName() + ": " + statistic.getValue();
		}

		return toPrint;
	}

}

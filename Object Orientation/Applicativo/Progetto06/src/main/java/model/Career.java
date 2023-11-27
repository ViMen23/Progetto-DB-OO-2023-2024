package model;

import java.time.LocalDate;

public class Career {
	private Team team;
	private Player player;
	private LocalDate sDate;
	private LocalDate eDate;

	// constructor
	private Career(Team team, Player player, LocalDate sDate, LocalDate eDate)
	{
		this.team   = team;
		this.player = player;
		this.sDate  = sDate;
		this.eDate  = eDate;

		this.team.addCareer(this);
		this.player.addCareer(this);
	}

	// get methods
	public Team getTeam() {return team;}
	public Player getPlayer() {return player;}
	public LocalDate getSDate() {return sDate;}
	public LocalDate getEDate() {return eDate;}

	// print method
	@Override
	public String toString() {
		String toPrint;
		toPrint  = "\nCAREER";
		toPrint += "\n\tTeam       : " + getTeam().getName();
		toPrint += "\n\tPlayer     : " + getPlayer().getSurname();
		toPrint += "\n\tStart date : " + getSDate();
		toPrint += "\n\tEnd date   : " + getEDate();

		return toPrint;
	}


}


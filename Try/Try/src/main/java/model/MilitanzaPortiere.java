package model;

public class MilitanzaPortiere
{
	public Militanza militanza;
	public Integer goalSubiti;

	public MilitanzaPortiere(Militanza militanza, Integer goalSubiti)
	{
		this.militanza = militanza;
		this.goalSubiti = goalSubiti;
	}

	public MilitanzaPortiere(Militanza militanza)
	{
		this(militanza, 0);
	}

	@Override
	public String toString() {
		String toPrint = militanza.toString();
		toPrint += "\n\tGoal subiti: " + goalSubiti;

		return toPrint;
	}
}

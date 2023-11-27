package model;

public class Attribute
{
	private boolean stat; // false characteristic, true statistic
	private String role;
	private String name;
	private int value;

	// constructor
	private Attribute(boolean stat, String role, String name)
	{
		this.stat = stat;
		this.name  = name;
		this.role  = role;
		this.value = 0; // set value initially to zero
	}

	// get methods
	public boolean isStat() {return stat;}
	public String getName() {return name;}
	public String getRole() {return role;}
	public int getValue() {return value;}

	// method to create a new attribute
	public static Attribute createAttribute(boolean stat, String role, String name)
	{
		// TODO input control
		Attribute attribute = new Attribute(stat, role, name);
		if (stat) {
			Static.statisticL.add(attribute);}
		else { Static.characteristicL.add(attribute);}
		return attribute;
		// TODO set triggers for all players
	}

	// method to print attribute type
	public String printAttributeType()
	{
		String toPrint;

		if (this.isStat()) {toPrint = "Statistic";}
		else {toPrint = "Characteristic";}

		return toPrint;
	}

	// print method
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nATTRIBUTE";
		toPrint += "\n\tType : " + printAttributeType();
		toPrint += "\n\tName : " + getName();

		return toPrint;
	}

}

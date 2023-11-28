package model;

public class Attribute
{
	private Boolean statistic;
	private Boolean characteristic;
	private Role role;
	private String name;
	private Integer value;

	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private Attribute(Boolean statistic, Boolean characteristic, Role role, String name)
	{
		this.statistic      = statistic;
		this.characteristic = characteristic;
		this.name           = name;
		this.role           = role;
		this.value          = -1; // set value initially to an illegal value
	}

	// get methods

	public Boolean isStatistic() { return statistic; }
	public Boolean isCharacteristic() { return characteristic; }
	public String getName() { return name; }
	public Role getRole() { return role; }
	public Integer getValue() { return value; }

	// method to create a new attribute
	public static Attribute createAttribute(Boolean statistic, Boolean characteristic, Role role, String name)
	{
		// TODO input control
		Attribute attribute = new Attribute(statistic, characteristic, role, name);

		if (statistic) { Static.statisticL.add(attribute); }
		else if (characteristic) { Static.characteristicL.add(attribute); }

		return attribute;
		// TODO set triggers for all players
	}

	// method to print attribute type
	public String printAttributeType()
	{
		String toPrint = "";

		if (this.isStatistic()) { toPrint += "Statistic"; }
		else if (this.isCharacteristic()) { toPrint += "Characteristic"; }

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
		toPrint += "\n\tRole : " + getRole().getCodeType();

		return toPrint;
	}

}

package model;

public class Role
{
	private String codeType;
	private String codeSubType;
	private String type;
	private String subType;

	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private Role(String codeType, String codeSubType, String type, String subType)
	{
		this.codeType    = codeType;
		this.codeSubType = codeSubType;
		this.type        = type;
		this.subType     = subType;

		Static.roleL.add(this);
	}

	//----------------------------------------------------------
	// GET METHODS
	//----------------------------------------------------------

	public String getCodeType() { return codeType; }
	public String getCodeSubType() { return codeSubType; }
	public String getType() { return type; }
	public String getSubType() { return subType; }

	//----------------------------------------------------------
	// PRINT METHODS
	//----------------------------------------------------------

	@Override
	public String toString()
	{
		String toPrint;

		toPrint  = "\nROLE";
		toPrint += "\n\tType    : " + getType()    + "[" + getCodeType()    + "]";
		toPrint += "\n\tSubtype : " + getSubType() + "[" + getCodeSubType() + "]";

		return toPrint;
	}

}

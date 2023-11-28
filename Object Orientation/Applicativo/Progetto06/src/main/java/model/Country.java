package model;

public class Country
{
	private String code;
	private String nation;
	private String continent;
	private Team team;

	//----------------------------------------------------------
	// CONSTRUCTOR
	//----------------------------------------------------------

	private Country(String code, String nation, String continent)
	{
		this.code      = code;
		this.nation    = nation;
		this.continent = continent;
	}

	//----------------------------------------------------------
	// GET METHODS
	//----------------------------------------------------------

	public String getCode() {return code;}
	public String getNation() {return nation;}
	public String getContinent() {return continent;}
	public Team getTeam() {return team;}

	//----------------------------------------------------------
	// SET METHODS
	//----------------------------------------------------------

	public void setCode(String code)
	{
		try {
			Check.checkCountryCode(code);

			this.code = code.toUpperCase();
		}
		catch (Exception e) {System.out.println(e);}
	}
	public void setNation(String nation)
	{
		try {
			Check.checkCountryNation(nation);

			this.nation = nation.toUpperCase();
			// change name of associated team
			this.getTeam().setName(this.nation);
		}
		catch (Exception e) {System.out.println(e);}
	}
	public void setContinent(String continent)
	{
		try {
			Check.checkCountryContinent(continent);

			this.continent = continent.toUpperCase();
		}
		catch (Exception e) {System.out.println(e);}
	}

	//----------------------------------------------------------
	// METHOD TO CREATE A NEW COUNTRY
	//----------------------------------------------------------

	public static Country createCountry(String code, String nation, String continent)
	{
		try {
			Check.checkCountry(code, nation, continent);

			Country country = new Country(code.toUpperCase(), nation.toUpperCase(), continent.toUpperCase());
			Static.countryL.add(country);

			// create national team
			Team.createTeam(nation, false, country);

			return country
							;
		}
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	//----------------------------------------------------------
	// METHOD TO ADD A NATIONAL TEAM TO A COUNTRY
	//----------------------------------------------------------

	public void addNationalTeam(Team team) {
		this.team = team;
	}

	//----------------------------------------------------------
	// PRINT METHODS
	//----------------------------------------------------------

	// TODO locale
	@Override
	public String toString()
	{
		String toPrint;
		toPrint  = "\nCOUNTRY";
		toPrint  += "\n\t" + getCode() + " - " + getNation() + " [" + getContinent() + "]";

		return toPrint;
	}

}
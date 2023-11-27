package model;

public class Country
{
	private String code;
	private String nation;
	private String continent;
	private Team team;

	// constructor
	private Country(String code, String nation, String continent)
	{
		this.code      = code;
		this.nation    = nation;
		this.continent = continent;
	}

	// get methods
	public String getCode() {return code;}
	public String getNation() {return nation;}
	public String getContinent() {return continent;}
	public Team getTeam() {return team;}


	// set methods
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

	// method to create a new Country
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

	// method to add a national team to a country
	public void addNationalTeam(Team team) {
		this.team = team;
	}

	// print method
	// TODO locale
	@Override
	public String toString() {
		String toPrint;
		toPrint  = "\nCOUNTRY";
		toPrint  += "\n\t" + getCode() + " - " + getNation() + " [" + getContinent() + "]";

		return toPrint;
	}

}
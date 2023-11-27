package model;

import javax.management.InstanceAlreadyExistsException;
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Check {

	// TODO locale for all messages

	// ------------------------------------------------------------------------
	// GENERAL CHECKS
	// ------------------------------------------------------------------------

	// Checks if the object reference is null
	public static void checkNull(Object object) throws NullPointerException
	{
		if (object == null) {throw new NullPointerException("ERROR. Object reference is null.");}
	}

	// Checks if a string is accepted by a regex
	public static void checkStringRegex( String string ) throws IllegalArgumentException
	{
		// the string must begin with a letter of the alphabet
		String regex = "^[A-Za-z]";
		// does not accept repeated ' '
		// does not accept repeated '-'
		// does not accept repeated '''
		// does not accept repeated '.'
		// ... or combinations
		regex += "(?!.*(''|--|'-|-'|\\s\\s|\\s-|-\\s|'\\s'|\\s'\\s|\\s[A-Za-z]\\s|'[A-Za-z]+'|-[A-Za-z]-))";
		// does accept repeated letter, ' ', '-', '''
		regex += "[A-Za-z\\s'-]+";
		// the string must end with a letter of the alphabet
		regex += "[A-Za-z]$";

		Pattern pattern = Pattern.compile( regex, Pattern.CASE_INSENSITIVE );
		Matcher matcher = pattern.matcher( string );

		if (!(matcher.matches()))  {throw new IllegalArgumentException("ERROR. Invalid string.");}
	}

	// general check of a string
	// using a regex
	public static void checkString(String string) throws Exception
	{
		checkNull(string);
		checkStringRegex(string);
	}

	// ----------------------------------------------------------------
	// CHECK COUNTRY CLASS
	// ----------------------------------------------------------------

	// code uniqueness check
	public static void checkCountryCodeUnique(String code) throws InstanceAlreadyExistsException
	{
		for (Country country : Static.countryL) {
			if (country.getCode().equalsIgnoreCase(code)) {
				throw new InstanceAlreadyExistsException("ERROR. Country already exists.");
			}
		}
	}

	// checks that the code is three characters long
	public static void checkCountryCodeLength(String code) throws IllegalArgumentException
	{
		if (code.length() != 3 ) {
			throw new IllegalArgumentException("ERROR. Country code must be three characters long.");
		}
	}

	// checks that the code is made up of letters of the alphabet
	public static void checkCountryCodeRegex(String code) throws IllegalArgumentException
	{
		String regex = "^[A-Za-z][A-Za-z][A-Za-z]$";

		Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(code);

		if (!(matcher.matches()))  {
			throw new IllegalArgumentException("ERROR. Country code must be made up of alphabet letters.");
		}
	}

	// general check of a country code
	public static void checkCountryCode(String code) throws Exception
	{
		checkString(code);
		checkCountryCodeLength(code);
		checkCountryCodeUnique(code);
	}

	// nation uniqueness check
	public static void checkCountryNationUnique(String nation) throws InstanceAlreadyExistsException {
		for (Country country : Static.countryL) {
			if ( country.getNation().equalsIgnoreCase(nation) ) {
				throw new InstanceAlreadyExistsException("ERROR. Nation already exists.");
			}
		}
	}

	// general check of a country nation
	public static void checkCountryNation(String nation) throws Exception
	{
		checkString(nation);
		checkCountryNationUnique(nation);
	}

	// general check of a country continent
	public static void checkCountryContinent(String continent) throws Exception
	{
		checkString(continent);
	}

	// checks that the country exists
	// throws exception if country does not exist
	public static void checkCountryExist(Country countryToCheck) throws InstanceAlreadyExistsException
	{
		for (Country country : Static.countryL) {
			if (country == countryToCheck) {return;}
		}
		throw new InstanceAlreadyExistsException("ERROR. Country does not exist.");
	}

	// general check of a country
	public static void checkCountry(String code, String nation, String continent) throws Exception
	{
		checkCountryCode(code);
		checkCountryNation(nation);
		checkCountryContinent(continent);
	}

	// ----------------------------------------------------------------
	// CHECK TEAM CLASS
	// ----------------------------------------------------------------

	// check that the club team has a unique name and country
	public static void checkClubTeamNameCountryUnique(String name, Country country) throws InstanceAlreadyExistsException
	{
		for (Team team : Static.clubTeamL) {
			if (team.getName().equalsIgnoreCase(name) && team.getCountry() == country) {
				throw new InstanceAlreadyExistsException("ERROR. Team with name and country already exist.");
			}
		}
	}

	// check that the national team exists
	public static void checkNationalTeamExist(Country country) throws IllegalArgumentException
	{
		if (country.getTeam() != null) {
			throw new IllegalArgumentException("ERROR. National team for country already exist.");
		}
	}

	// general check of a national team
	public static void checkNationalTeam(Country country) throws Exception
	{
		checkNull(country);
		checkNationalTeamExist(country);
	}

	// general check of a club team
	public static void checkClubTeam(String name, Country country) throws Exception
	{
		checkString(name);
		checkNull(country);
		checkCountryExist(country);
		checkClubTeamNameCountryUnique(name, country);
	}

	// check club team name
	public static void checkClubTeamName(String name, Country country) throws Exception
	{
		checkString(name);
		checkClubTeamNameCountryUnique(name, country);
	}

	// check national team name
	public static void checkNationalTeamName(String name, Country country) throws Exception
	{
		if (!(name.equalsIgnoreCase(country.getNation()))) {
			throw new Exception("ERROR. National team name must be equal to nation name.");
		}
	}

	// check club team country
	public static void checkClubTeamCountry(String name, Country country) throws Exception
	{
		checkNull(country);
		checkCountryExist(country);
		checkClubTeamNameCountryUnique(name, country);
	}

	// ----------------------------------------------------------------
	// CHECK PLAYER CLASS
	// ----------------------------------------------------------------

	// check that birthdate and start date are valid
	public static void checkPlayerBDateSDate(LocalDate bDate, LocalDate sDate) throws IllegalArgumentException
	{
		Period period = Period.between(bDate, sDate);

		int years = period.getYears();
		if (years < 0) {throw new IllegalArgumentException("ERROR\n.Start date must be after the birthdate.");}

		int limit = 15; // arbitrary limit

		if (years < limit) {
			throw new IllegalArgumentException
							("ERROR. A player must be at least" + years + " years old to be a professional.");
		}

		limit = 35; // arbitrary limit

		if (years > limit) {
			throw new IllegalArgumentException("ERROR.A player cannot make his debut after the age of " + limit + ".");
		}
	}

	// check that birthdate and retirement date are valid
	public static void checkPlayerBDateRDate(LocalDate bDate, LocalDate rDate) throws IllegalArgumentException
	{
		Period period = Period.between(bDate, rDate);

		int years = period.getYears();
		if (years < 0) {throw new IllegalArgumentException("ERROR\n.Retirement date must be after the birthdate.");}

		int limit = 50; // arbitrary limit

		if (years > limit) {
			throw new IllegalArgumentException("ERROR.A player cannot make his retirement after the age of " + limit + ".");
		}
	}

	// check that start date and retirement date are valid
	public static void checkPlayerSDateRDate(LocalDate sDate, LocalDate rDate) throws IllegalArgumentException
	{
		Period period = Period.between(sDate, rDate);

		int years = period.getYears();
		if (years < 0) {throw new IllegalArgumentException("ERROR\n.Retirement date must be after the start date.");}

		int months = period.getMonths();
		if (months < 0) {throw new IllegalArgumentException("ERROR\n.Retirement date must be after the start date.");}

		int days = period.getDays();
		if (days < 0) {throw new IllegalArgumentException("ERROR\n.Retirement date must be after the start date.");}
	}

	// check that a player is unique
	public static void checkPlayerUnique(String name, String surname, LocalDate bDate,
																			 LocalDate sDate, Country country) throws InstanceAlreadyExistsException
	{
		for (Player player : Static.playerL) {
			if (player.getName().equalsIgnoreCase(name)       &&
			    player.getSurname().equalsIgnoreCase(surname) &&
		      player.getBDate().isEqual(bDate)              &&
		      player.getSDate().isEqual(sDate)              &&
		      player.getCountry() == country) {
				throw new InstanceAlreadyExistsException("ERROR. Player already exists.");
			}
		}
	}

	// general check player
	public static void checkPlayer(String name, String surname, LocalDate bDate,
																 LocalDate sDate, LocalDate rDate, Country country) throws Exception
	{
		checkString(name);
		checkString(surname);
		checkNull(bDate);
		checkNull(sDate);
		checkPlayerBDateSDate(bDate, sDate);
		if (rDate != null) {
			checkPlayerBDateRDate(bDate, rDate);
			checkPlayerSDateRDate(sDate, rDate);
		}
		checkNull(country);
		checkCountryExist(country);
		checkPlayerUnique(name, surname, bDate, sDate, country);
	}
}

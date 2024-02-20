package controller;

import dao.*;
import model.Competition;
import model.Confederation;
import model.Country;
import postgresDaoImplementation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.regex.Pattern;

/**
 * TYPE : class - controller package
 * NAME : Controller
 *
 * DESC: TODO
 */
public class Controller
{
	private final Country ctrlCountry = new Country(0, null, null, "Control", null);
	private static Controller controllerInstance = null;

	private Controller()
	{
	}

	public static Controller getControllerInstance()
	{
		if (null == controllerInstance) {
			controllerInstance = new Controller();
		}

		return controllerInstance;
	}

	public Boolean isAdmin(String username, String password)
	{
		String separator = "@";

		while (Pattern.compile(separator).matcher(password).find()) {
			separator += separator;
		}

		String string = "";
		string += "fp_admin";
		string += separator;
		string += "username";
		string += separator;
		string += username;
		string += separator;
		string += "password";
		string += separator;
		string += password;

		RowExistsDao rowExists = new RowExistsPostgresDaoImpl();

		return rowExists.rowExistsDB(separator, string);
	}

	public void subCountries(String superCountryName)
	{

		ctrlCountry.getCountryList().clear();

		List<Integer> countryID = new ArrayList<Integer>();
		List<String> countryType = new ArrayList<String>();
		List<String> countryCode = new ArrayList<String>();
		List<String> countryName = new ArrayList<String>();
		List<String> superCountryCode = new ArrayList<String>();

		SubCountriesDao allContinent = new SubCountriesPostgresDaoImpl();
		allContinent.subCountriesDB(superCountryName, countryID, countryType, countryCode, countryName, superCountryCode);

		while (!(countryName.isEmpty())) {
			ctrlCountry.newCountry
							(
											countryID.removeFirst(),
											countryType.removeFirst(),
											countryCode.removeFirst(),
											countryName.removeFirst(),
											superCountryCode.removeFirst()
							);
		}

		for (Country country : ctrlCountry.getCountryList()) {
			System.out.println
							(
											"PAESE: " +
															" [" + country.getType() + " - " +
															country.getCode() + " - " +
															country.getSuperCountryCode() + "] " +
															country.getName() +
															" [" + country.getID() + "]"
							);
		}

	}

	public void subConfederations(String superConfederationsName)
	{
		Confederation.getConfederationList().clear();

		SubConfederationsDao allConfederation = new SubConfederationsPostgresDaoImpl();
		allConfederation.subConfederationsDB(superConfederationsName);
	}

	public void searchCompetitions(String subNameCompetition,
																 String typeCompetition, String typeTeamCompetition,
																 String countryName)
	{
		Competition.getCompetitionList().clear();

		SearchCompetitionsDao searchCompetitions = new SearchCompetitionsPostgresDaoImpl();
		searchCompetitions.searchCompetitionsDB(subNameCompetition, typeCompetition, typeTeamCompetition, countryName);

		for (Competition competition : Competition.getCompetitionList()) {
			System.out.println
							(
											"COMPETIZIONE: " +
															" [" + competition.getType() + " - " +
															competition.getTeamType() + " - " +
															competition.getConfederationShortName() + " - " +
															competition.getCountryName() + "] " +
															competition.getName()
							);
		}
	}

	public Integer countCountries()
	{
		CountTablesDao countTablesDao = new CountTablesPostgresDaoImpl();
		return countTablesDao.countCountriesDB();
	}

	public ArrayList<ArrayList<String>> getStringCountryComboBox(String superCountryName)
	{
		subCountries(superCountryName);
		ArrayList<ArrayList<String>> listCountry = new ArrayList<ArrayList<String>>();

		for (Country country : ctrlCountry.getCountryList()) {
			ArrayList<String> innerCountry = new ArrayList<String>();

			innerCountry.add(country.getName());
			innerCountry.add(country.getID().toString());

			listCountry.add(innerCountry);
		}

		return listCountry;
	}

	public List<List<String>> getCountryDataTable()
	{
		List<List<String>> data = new ArrayList<List<String>>();

		for(Country country: ctrlCountry.getCountryList()){
			List<String> tmp = new ArrayList<String>();

			tmp.add(country.getName());
			tmp.add(country.getCode());
			tmp.add(country.getType());
			tmp.add(country.getSuperCountryCode());

			data.add(tmp);
		}

		return data;
	}

	public Integer countConfederations()
	{
		CountTablesDao countTablesDao = new CountTablesPostgresDaoImpl();
		return countTablesDao.countConfederationsDB();
	}

}

package controller;

import dao.*;
import model.Competition;
//import model.Confederation;
import model.Country;
import postgresDaoImplementation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * TYPE : class - controller package
 * NAME : Controller
 *
 * DESC: TODO
 */
public class Controller
{
	private final Country ctrlCountry;
	//private final Confederation ctrlConfederation;
	private static Controller controllerInstance = null;

	private Controller()
	{
		this.ctrlCountry = new Country(null, null, null, null);
		//this.ctrlConfederation = new Confederation(null, null, null, null);
	}

	public static Controller getInstance()
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

	public void getCountries(String type, String superCountryID)
	{
		List<String> countryID = new ArrayList<String>();
		List<String> countryType = new ArrayList<String>();
		List<String> countryCode = new ArrayList<String>();
		List<String> countryName = new ArrayList<String>();

		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.countriesDB(type, superCountryID, countryID, countryType, countryCode, countryName);

		ctrlCountry.getCountryMap().clear();

		Country superCountry;
		if (type.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
			superCountry = null;
		} else {
			superCountry = newCountry
							(
											countryID.removeFirst(),
											countryType.removeFirst(),
											countryCode.removeFirst(),
											countryName.removeFirst(),
											null
							);
		}

		while (!(countryID.isEmpty())) {
			String ID = countryID.removeFirst();
			Country country = newCountry
							(
											ID,
											countryType.removeFirst(),
											countryCode.removeFirst(),
											countryName.removeFirst(),
											superCountry
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}

	}


	/*
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

	 */

	public Integer countCountries()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();

		ctrlCountry.setTotalCountries(countryDAO.countAllCountriesDB());

		return ctrlCountry.getTotalCountries();
	}

	public List<List<String>> getCountryList(String type, String superCountryID, Boolean full)
	{
		getCountries(type, superCountryID);

		List<List<String>> outerCountryList = new ArrayList<List<String>>();

		for (String key : ctrlCountry.getCountryMap().keySet()) {
			List<String> innerCountryList = new ArrayList<String>();
			Country country = ctrlCountry.getCountryMap().get(key);

			innerCountryList.add(country.getName());

			if (full) {
				innerCountryList.add(country.getCode());
				innerCountryList.add(country.getType());
				innerCountryList.add(country.getSuperCountry().getName()); // TODO: try catch?
			}

			innerCountryList.add(key);

			outerCountryList.add(innerCountryList);
		}

		return outerCountryList;
	}




	public Integer countConfederations()
	{
		CountTablesDao countTablesDao = new CountTablesPostgresDaoImpl();

		return countTablesDao.countConfederationsDB();
	}

	public Country newCountry(String countryID, String countryType, String countryCode, String countryName,
														Country superCountry)
	{
		Country country = ctrlCountry.getCountryMap().get(countryID);

		if (null == country) {
			country = new Country(countryType, countryCode, countryName, superCountry);
		}

		return country;
	}

	public Country newCountry(String countryID, String countryName)
	{
		return newCountry(countryID, null, null, countryName, null);
	}

}

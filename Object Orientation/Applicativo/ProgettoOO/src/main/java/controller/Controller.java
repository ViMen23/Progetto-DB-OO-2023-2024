package controller;

import dao.*;
import model.Competition;
import model.Confederation;
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
	private final Confederation ctrlConfederation;
	private final Competition ctrlCompetition;
	private static Controller controllerInstance = null;

	private Controller()
	{
		this.ctrlCountry = new Country(null, null, null, null);
		this.ctrlConfederation = new Confederation(null, null, null, null);
		this.ctrlCompetition = new Competition(null, null, null, null, null);
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

	public void getCountries(String countryType, String superCountryID)
	{
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryType = new ArrayList<String>();
		List<String> listCountryCode = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.countriesDB
						(
										countryType, superCountryID,
										listCountryID, listCountryType, listCountryCode, listCountryName
						);

		ctrlCountry.getCountryMap().clear();

		Country superCountry;
		if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
			superCountry = null;
		} else {
			superCountry = newCountry
							(
											listCountryID.removeFirst(),
											listCountryType.removeFirst(),
											listCountryCode.removeFirst(),
											listCountryName.removeFirst(),
											null
							);
		}

		while (!(listCountryID.isEmpty())) {
			String ID = listCountryID.removeFirst();
			Country country = newCountry
							(
											ID,
											listCountryType.removeFirst(),
											listCountryCode.removeFirst(),
											listCountryName.removeFirst(),
											superCountry
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}

	}



	public void getConfederations(String countryType, String superConfederationsID)
	{
		List<String> listConfederationID = new ArrayList<String>();
		List<String> listConfederationShortName = new ArrayList<String>();
		List<String> listConfederationLongName = new ArrayList<String>();
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.confederationsDB
						(
										countryType, superConfederationsID,
										listConfederationID, listConfederationShortName, listConfederationLongName,
										listCountryID, listCountryName
						);

		ctrlCountry.getCountryMap().clear();


		for (String ID : listCountryID) {
			Country country = newCountry(ID, listCountryName.removeFirst());
			ctrlCountry.getCountryMap().put(ID, country);
		}

		ctrlConfederation.getConfederationMap().clear();

		Confederation superConfederation;
		if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
			superConfederation = null;
		} else {
			superConfederation = newConfederation
							(
											listConfederationID.removeFirst(),
											listConfederationShortName.removeFirst(),
											listConfederationLongName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											null
							);
		}

		while (!(listConfederationID.isEmpty())) {
			String ID = listConfederationID.removeFirst();
			Confederation confederation = newConfederation
							(
											ID,
											listConfederationShortName.removeFirst(),
											listConfederationLongName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											superConfederation
							);

			ctrlConfederation.getConfederationMap().put(ID, confederation);
		}

	}

	public void searchCompetitions(String subNameCompetition,
																 String typeCompetition, String typeTeamCompetition,
																 String countryName)
	{
		Competition.getCompetitionList().clear();

		CompetitionsDAO searchCompetitions = new PostgresImplCompetitionDAO();
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
		CountryDAO countryDAO = new PostgresImplCountryDAO();

		ctrlCountry.setTotalCountries(countryDAO.countAllCountriesDB());

		return ctrlCountry.getTotalCountries();
	}

	public List<List<String>> getCountryList(String countryType, String superCountryID, Boolean full)
	{
		getCountries(countryType, superCountryID);

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

	public List<List<String>> getConfederationList(String typeCountry, String superConfederationID, Boolean full)
	{
		getConfederations(typeCountry, superConfederationID);

		List<List<String>> outerConfederationList = new ArrayList<List<String>>();

		for (String key : ctrlConfederation.getConfederationMap().keySet()) {
			List<String> innerConfederationList = new ArrayList<String>();
			Confederation confederation = ctrlConfederation.getConfederationMap().get(key);

			innerConfederationList.add(confederation.getShortName());

			if (full) {
				innerConfederationList.add(confederation.getLongName());
				if (typeCountry.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
					innerConfederationList.add("-");
				} else {
					innerConfederationList.add(confederation.getSuperConfederation().getShortName());
				}
				innerConfederationList.add(confederation.getCountry().getName()); // TODO: try catch?
			}

			innerConfederationList.add(key);

			outerConfederationList.add(innerConfederationList);
		}

		return outerConfederationList;
	}



	public Integer countConfederations()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();

		ctrlConfederation.setTotalConfederations(confederationDAO.countAllConfederationsDB());

		return ctrlConfederation.getTotalConfederations();
	}

	public Country newCountry(String ID, String type, String code, String name, Country superCountry)
	{
		Country country = ctrlCountry.getCountryMap().get(ID);

		if (null == country) {
			country = new Country(type, code, name, superCountry);
		}

		return country;
	}

	public Country newCountry(String ID, String name)
	{
		return newCountry(ID, null, null, name, null);
	}

	public Confederation newConfederation(String ID, String shortName, String longName,
																	Country country, Confederation superConfederation)
	{
		Confederation confederation = ctrlConfederation.getConfederationMap().get(ID);

		if (null == confederation) {
			confederation = new Confederation(shortName, longName, country, superConfederation);
		}

		return confederation;
	}

	public Confederation newConfederation(String ID, String shortName)
	{
		return newConfederation(ID, shortName, null, null, null);
	}

}

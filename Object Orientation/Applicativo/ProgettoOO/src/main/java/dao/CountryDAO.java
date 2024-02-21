package dao;

import java.util.List;

public interface CountryDAO
{
	void countriesDB(String type, String superCountryID,
									 List<String> countryID, List<String> countryType,
									 List<String> countryCode, List<String> countryName);

	Integer countAllCountriesDB();
}

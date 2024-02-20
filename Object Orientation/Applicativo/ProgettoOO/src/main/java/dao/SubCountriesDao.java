package dao;

import java.util.ArrayList;
import java.util.List;

public interface SubCountriesDao
{
	void subCountriesDB(String superCountryName,
											List<Integer> countryID, List<String> countryType, List<String> countryCode,
											List<String> countryName, List<String> superCountryCode);
}

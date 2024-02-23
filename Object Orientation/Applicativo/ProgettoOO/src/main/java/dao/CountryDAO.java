package dao;

import java.util.List;

public interface CountryDAO
{
	void fetchCountryDB(String countryType,
											String superCountryID,
											List<String> listCountryID,
											List<String> listCountryType,
											List<String> listCountryCode,
											List<String> listCountryName,
											List<String> listSuperCountryID,
											List<String> listSuperCountryName);

	Integer countCountryDB();
}

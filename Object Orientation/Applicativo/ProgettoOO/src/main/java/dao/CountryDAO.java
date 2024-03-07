package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

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

	void fetchCountry(String countryType,
										String superCountryID,
										Vector<String> countryNameVector,
										Map<String, String> countryNameMap);

	void fetchCountry(String countryType,
										String superCountryID,
										Vector<Vector<String>> countryTableData);

	Integer countCountryDB();
}

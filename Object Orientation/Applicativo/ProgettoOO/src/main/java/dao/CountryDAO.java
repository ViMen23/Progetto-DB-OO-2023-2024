package dao;

import java.util.Map;
import java.util.Vector;

public interface CountryDAO
{
	int countCountryDB();

	void fetchCountryDB(String countryType,
											String superCountryID,
											Vector<String> comboBoxData,
											Map<String, String> comboBoxMap);

	void fetchCountryDB(String countryType,
											Integer superCountryID,
											Vector<Vector<Object>> tableData);
}

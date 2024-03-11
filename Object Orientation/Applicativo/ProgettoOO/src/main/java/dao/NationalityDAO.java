package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface NationalityDAO
{
	void fetchNationalityDB(String playerID,
													List<String> listCountryName);

	void fetchNationality(String playerID,
												Vector<Vector<String>> tableData);

	void fetchNationality(String playerID,
												Vector<Vector<Object>> tableData,
												Map<Integer, Map<Integer, String>> tableMap);

	void fetchNationalityComboBox(String playerID,
																Vector<String> comboBoxData,
																Map<String, String> comboBoxMap);

	String newNationality(String playerID,
												String countryID);

	String deleteNationality(String playerID,
													 String countryID);
}

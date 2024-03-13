package dao;

import java.util.Map;
import java.util.Vector;

public interface NationalityDAO
{
	void fetchNationalityDB(String playerID,
													Vector<Vector<String>> tableData);

	void fetchNationalityDB(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap);

	void fetchNationalityComboBoxDB(String playerID,
																	Vector<String> comboBoxData,
																	Map<String, String> comboBoxMap);

	String newNationalityDB(String playerID,
													String countryID);

	String deleteNationalityDB(String playerID,
														 String countryID);
}

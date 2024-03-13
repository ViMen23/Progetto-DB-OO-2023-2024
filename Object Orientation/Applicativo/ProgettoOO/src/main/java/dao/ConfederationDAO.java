package dao;

import java.util.Map;
import java.util.Vector;

public interface ConfederationDAO
{
	int countConfederationDB();

	void fetchConfederationDB(String countryType,
														String superConfederationID,
														Vector<Vector<String>> tableData);

	void fetchConfederationDB(String typeCountry,
														String superConfederationID,
														Vector<String> comboBoxData,
														Map<String, String> comboBoxMap);


	void fetchConfederationDB(String teamID,
														Map<String, String> confederationMap);
}

package dao;

import java.util.List;

public interface ConfederationDAO
{
	void confederationsDB(String type, String superConfederationID,
												List<String> confederationID,
												List<String> confederationShortName, List<String> confederationLongName,
												List<String> countryID, List<String> countryName);

	Integer countAllConfederationsDB();
}

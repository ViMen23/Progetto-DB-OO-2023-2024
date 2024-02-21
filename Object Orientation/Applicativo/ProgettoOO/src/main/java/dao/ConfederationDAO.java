package dao;

import java.util.List;

public interface ConfederationDAO
{
	void confederationsDB(String countryType, String superConfederationID,
												List<String> listConfederationID,
												List<String> listConfederationShortName, List<String> listConfederationLongName,
												List<String> listCountryID, List<String> listCountryName);

	Integer countAllConfederationsDB();
}

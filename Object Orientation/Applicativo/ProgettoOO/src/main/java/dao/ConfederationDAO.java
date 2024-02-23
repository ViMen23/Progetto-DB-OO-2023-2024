package dao;

import java.util.List;

public interface ConfederationDAO
{
	void fetchConfederationDB(String countryType,
														String superConfederationID,
														List<String> listConfederationID,
														List<String> listConfederationShortName,
														List<String> listConfederationLongName,
														List<String> listCountryID,
														List<String> listCountryName,
														List<String> listCountryType,
														List<String> listSuperConfederationID,
														List<String> listSuperConfederationShortName);

	Integer countConfederationDB();
}

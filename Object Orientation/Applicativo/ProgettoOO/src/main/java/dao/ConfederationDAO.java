package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

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

	void fetchConfederation(String countryType,
													String superConfederationID,
													Vector<Vector<String>> confederationTableData);

	void fetchConfederation(String typeCountry,
													String superConfederationID,
													Vector<String> confederationShortNameVector,
													Map<String, String> confederationShortNameMap);

	Integer countConfederationDB();

	void fetchConfederation(String teamID,
													Map<String, String> confederationMap);
}

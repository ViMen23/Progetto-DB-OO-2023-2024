package dao;

import java.util.Map;
import java.util.Vector;

public interface MilitancyDAO
{
	void fetchMilitancyDB(String teamID,
												String startYear,
												Vector<Vector<String>> tableData,
												Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyNationalDB(String playerID,
																Vector<Vector<String>> tableData,
																Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyClubDB(String playerID,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyNationalAdminDB(String playerID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyClubAdminDB(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap);

	String newMilitancyDB(String playerID,
												String teamID,
												String teamType,
												String startYear,
												String seasonType);

	String deleteMilitancyDB(String playerID,
													 String teamID,
													 String startYear);
}

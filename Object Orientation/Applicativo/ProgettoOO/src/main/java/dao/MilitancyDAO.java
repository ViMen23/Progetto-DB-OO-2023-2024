package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface MilitancyDAO
{
	void fetchMilitancyDB(String teamID,
												String startYear,
												List<String> listPlayerID,
												List<String> listPlayerName,
												List<String> listPlayerSurname,
												List<String> listPlayerRole);

	void fetchMilitancyDB(String playerID,
												List<String> listMilitancyYear,
												List<String> listMilitancyType,
												List<String> listTeamID,
												List<String> listTeamLongName,
												List<String> listCountryID,
												List<String> listCountryName);

	void fetchMilitancyDB(String playerID,
												List<String> listMilitancyYear,
												List<String> listTeamID,
												List<String> listTeamLongName);

	void fetchMilitancy(String teamID,
											String startYear,
											Vector<Vector<String>> teamSquadTableData,
											Map<Integer, Map<Integer, String>> teamSquadTableMap);

	void fetchMilitancyNational(String playerID,
															Vector<Vector<String>> tableData,
															Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyClub(String playerID,
													Vector<Vector<String>> tableData,
													Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyNationalAdmin(String playerID,
																	 Vector<Vector<Object>> tableData,
																	 Map<Integer, Map<Integer, String>> tableMap);

	void fetchMilitancyClubAdmin(String playerID,
															 Vector<Vector<Object>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap);

	String newMilitancy(String playerID,
											String teamID,
											String teamType,
											String startYear,
											String seasonType);

	String deleteMilitancy(String playerID,
												 String teamID,
												 String startYear);
}

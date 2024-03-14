package dao;

import java.util.Map;
import java.util.Vector;

public interface TrophyDAO
{
	String newTrophyTeamDB(String teamID,
												 String trophyID,
												 String competitionID,
												 String competitionStartYear);

	String deleteTrophyTeamDB(String teamID,
														String trophyID,
														String competitionID,
														String competitionStartYear);

	void fetchTrophyDB(String teamID,
										 String teamType,
										 Vector<Vector<String>> tableData);

	void fetchTrophyDB(String playerID,
										 String teamType,
										 Vector<Vector<String>> tableData,
										 Map<Integer, Map<Integer, String>> tableMap);

	void fetchTeamTrophyAdminDB(String teamID,
															String teamType,
															Vector<Vector<Object>> tableData,
															Map<Integer, Map<Integer, String>> tableMap);

	void fetchTeamTrophyDB(Vector<String> comboBoxData,
												 Map<String, String> comboBoxMap);

	void fetchPlayerTrophyDB(Vector<String> comboBoxData,
													 Map<String, String> comboBoxMap);

	String newTrophyPlayerDB(String playerID,
													 String teamID,
													 String trophyID,
													 String competitionID,
													 String competitionStartYear);

	String deleteTrophyPlayerDB(String playerID,
															String teamID,
															String trophyID,
															String competitionID,
															String competitionStartYear);

	void fetchTrophyPlayerAdminDB(String playerID,
																String teamType,
																Vector<Vector<Object>> tableData,
																Map<Integer, Map<Integer, String>> tableMap);
}

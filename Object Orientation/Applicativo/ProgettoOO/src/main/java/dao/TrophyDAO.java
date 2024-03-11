package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface TrophyDAO
{
	void fetchTrophyDB(String teamID,
										 List<String> listTrophyID,
										 List<String> listTrophyName,
										 List<String> listCompetitionID,
										 List<String> listCompetitionStartYear,
										 List<String> listCompetitionName);

	void fetchTrophyDB(String playerID,
										 String teamType,
										 List<String> listCompetitionStartYear,
										 List<String> listCompetitionID,
										 List<String> listCompetitionName,
										 List<String> listTeamID,
										 List<String> listTeamLongName,
										 List<String> listTrophyName);

	String newTrophyTeam(String teamID,
											 String trophyID,
											 String competitionID,
											 String competitionStartYear);

	String deleteTrophyTeam(String teamID,
													String trophyID,
													String competitionID,
													String competitionStartYear);

	void fetchTrophy(String teamID,
									 String teamType,
									 Vector<Vector<String>> tableData);

	void fetchTrophy(String playerID,
									 String teamType,
									 Vector<Vector<String>> tableData,
									 Map<Integer, Map<Integer, String>> TableMap);

	void fetchTeamTrophyAdmin(String teamID,
														String teamType,
														Vector<Vector<Object>> tableData,
														Map<Integer, Map<Integer, String>> tableMap);

	void fetchTeamTrophy(Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap);

	void fetchPlayerTrophy(Vector<String> comboBoxData,
												 Map<String, String> comboBoxMap);

	String newTrophyPlayer(String playerID,
												 String teamID,
												 String trophyID,
												 String competitionID,
												 String competitionStartYear);

	String deleteTrophyPlayer(String playerID,
														String teamID,
														String trophyID,
														String competitionID,
														String competitionStartYear);

	void fetchTrophyPlayerAdmin(String playerID,
															String teamType,
															Vector<Vector<Object>> tableData,
															Map<Integer, Map<Integer, String>> tableMap);
}

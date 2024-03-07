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

	void newTrophyTeam(String teamID,
										 String trophyID,
										 String competitionID,
										 String competitionStartYear,
										 String message);

	void deleteTrophyTeam(String teamID,
												String trophyID,
												String competitionID,
												String competitionStartYear,
												String message);

	void fetchTrophy(String teamID,
									 String teamType,
									 Vector<Vector<String>> tableData);

	void fetchTrophy(String playerID,
									 String teamType,
									 Vector<Vector<String>> tableData,
									 Map<Integer, Map<Integer, String>> TableMap);
}

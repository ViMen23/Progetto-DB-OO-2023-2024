package dao;

import java.util.List;

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
}

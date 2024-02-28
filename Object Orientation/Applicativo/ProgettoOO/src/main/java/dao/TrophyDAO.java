package dao;

import java.util.List;

public interface TrophyDAO
{
	void fetchTrophyDB(String teamID,
										 String competitionStartYear,
										 List<String> listTrophyID,
										 List<String> listTrophyName,
										 List<String> listCompetitionID,
										 List<String> listCompetitionName);

	void fetchTrophyDB(String playerID,
										 String teamType,
										 List<String> listCompetitionStartYear,
										 List<String> listCompetitionID,
										 List<String> listCompetitionName,
										 List<String> listTeamID,
										 List<String> listTeamName,
										 List<String> listTrophyName);
}

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
}

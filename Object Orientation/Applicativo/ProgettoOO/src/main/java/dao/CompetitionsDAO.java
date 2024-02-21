package dao;

import java.util.List;

public interface CompetitionsDAO
{
	void competitionsDB(String subNameCompetition,
											String typeCompetition, String typeTeamCompetition,
											String countryCompetitionID,
											List<String> competitionID,
											List<String> competitionType, List<String> competitionTeamType, List<String> competitionName,
											List<String> confederationID, List<String> confederationShortName,
											List<String> countryID, List<String> countryName);

	Integer countAllCompetitionsDB();
}

package dao;

import java.util.List;

public interface CompetitionDAO
{
	void competitionsDB(String competitionSubName,
											String competitionType,
											String competitionTeamType,
											String competitionCountryID,
											List<String> listCompetitionID,
											List<String> listCompetitionType,
											List<String> listCompetitionTeamType,
											List<String> listCompetitionName,
											List<String> listConfederationID,
											List<String> listConfederationShortName,
											List<String> listCountryID,
											List<String> listCountryName);

	Integer countAllCompetitionsDB();
}

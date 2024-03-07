package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface CompetitionDAO
{
	void fetchCompetitionDB(String competitionSubName,
													String competitionType,
													String competitionTeamType,
													String competitionCountryType,
													String competitionContinentID,
													String competitionNationID,
													List<String> listCompetitionID,
													List<String> listCompetitionType,
													List<String> listCompetitionTeamType,
													List<String> listCompetitionName,
													List<String> listConfederationID,
													List<String> listConfederationShortName,
													List<String> listCountryID,
													List<String> listCountryName);

	Integer countCompetitionDB();

	void fetchCompetitionDB(String competitionID,
													List<String> listCompetitionEdition);

	void fetchCompetitionDB(String playerID,
													String teamType,
													List<String> listCompetitionID,
													List<String> listCompetitionName);

	void fetchCompetitionEdition(String teamType,
															 String competitionID,
															 Vector<String> competitionEditionVector,
															 Map<String, String> competitionEditionMap);

	void fetchCompetition(String competitionSubName,
												String competitionType,
												String competitionTeamType,
												String competitionCountryType,
												String competitionContinentID,
												String competitionNationID,
												Vector<Vector<String>> competitionTableData);

	void fetchCompetition(String competitionSubName,
												String competitionType,
												String competitionTeamType,
												String competitionCountryType,
												String competitionContinentID,
												String competitionNationID,
												Vector<String> competitionNameVector,
												Map<String, String> competitionNameMap);

	void fetchCompetition(String playerID,
												String teamType,
												Vector<String> competitionNameVector,
												Map<String, String> competitionNameMap);

}

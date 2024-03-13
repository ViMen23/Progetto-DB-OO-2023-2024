package dao;

import java.util.Map;
import java.util.Vector;

public interface CompetitionDAO
{
	int countCompetitionDB();

	void fetchCompetitionEditionDB(String teamType,
																 String competitionID,
																 Vector<String> comboBoxData,
																 Map<String, String> comboBoxMap);

	void fetchCompetitionDB(String competitionSubName,
													String competitionType,
													String competitionTeamType,
													String competitionCountryType,
													String competitionContinentID,
													String competitionNationID,
													Vector<Vector<String>> tableData);

	void fetchCompetitionDB(String competitionSubName,
													String competitionType,
													String competitionTeamType,
													String competitionCountryType,
													String competitionContinentID,
													String competitionNationID,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap);

	void fetchCompetitionDB(String playerID,
													String teamType,
													Vector<String> comboBoxData,
													Map<String, String> comboBoxMap);

	void fetchCompetitionConfederationDB(String confederationID,
																			 String teamType,
																			 Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap);

	void fetchCompetitionAdminDB(String competitionSubName,
															 String competitionType,
															 String competitionTeamType,
															 String competitionCountryType,
															 String competitionContinentID,
															 String competitionNationID,
															 Vector<Vector<String>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap);

	void fetchCompetitionEditionAdminDB(String competitionID,
																			String teamType,
																			Vector<Vector<Object>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap);


	String newCompetitionEditionDB(String competitionID,
																 String competitionStartYear);

	String deleteCompetitionEditionDB(String competitionID,
																		String competitionStartYear);

	void fetchCompetitionDB(String competitionID,
													Map<String, String> infoMap);

	void fetchCompetitionPlayDB(String playerID,
															String teamType,
															String startYear,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap);

}

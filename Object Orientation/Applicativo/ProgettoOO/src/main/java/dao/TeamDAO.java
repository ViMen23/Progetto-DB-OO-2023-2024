package dao;

import java.util.Map;
import java.util.Vector;

public interface TeamDAO
{
	int countTeamDB();

	String newNationalTeamDB(String countryID);

	String newClubTeamDB(String countryID,
											 String teamLongName,
											 String teamShortName);

	String updateClubTeamDB(String teamID,
													String teamLongName,
													String teamShortName);

	String deleteTeamDB(String teamID);

	void fetchTeamDB(String teamSubLongName,
									 String teamSubShortName,
									 String teamType,
									 String teamContinentID,
									 String teamNationID,
									 Vector<Vector<String>> tableData,
									 Map<Integer, Map<Integer, String>> tableMap);

	void fetchTeamDB(String playerID,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);

	void fetchTeamDB(String teamID,
									 String teamType,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);

	void fetchTeamComboDB(String teamSubLongName,
												String teamSubShortName,
												String teamType,
												String teamContinentID,
												String teamNationID,
												Vector<String> comboBoxData,
												Map<String, String> comboBoxMap);

	void fetchTeamDB(String teamID,
									 Map<String, String> infoTeamMap);

	void fetchTeamCompetitionDB(String competitionStartYear,
															String competitionID,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap);

	void fetchTeamComboBoxDB(String playerID,
													 Vector<String> comboBoxData,
													 Map<String, String> comboBoxMap);


	void fetchTeamDB(String playerID,
									 String teamType,
									 String startYear,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);


	void fetchTeamPlayDB(String playerID,
											 String competitionStartYear,
											 String competitionID,
											 Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap);
}

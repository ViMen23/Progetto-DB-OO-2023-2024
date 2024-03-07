package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface TeamDAO
{
	void fetchTeamDB(String teamSubLongName,
									 String teamSubShortName,
									 String teamType,
									 String teamContinentID,
									 String teamNationID,
									 List<String> listTeamID,
									 List<String> listTeamType,
									 List<String> listTeamShortName,
									 List<String> listTeamLongName,
									 List<String> listCountryID,
									 List<String> listCountryName);

	Integer countTeamDB();

	void fetchTeamDB(String competitionStartYear,
									 String competitionID,
									 List<String> listTeamID,
									 List<String> listTeamLongName);

	void fetchTeamDB(String teamID,
									 Map<String, String> mapTeamInfo);

	void fetchTeamDB(String playerID,
									 List<String> listTeamID,
									 List<String> listTeamLongName);

	void fetchTeamDB(String teamID,
									 List<String> listTeamYear);

	String newNationalTeamDB(String countryID);

	String newClubTeamDB(String countryID,
											 String teamLongName,
											 String teamShortName);

	String updateClubTeamDB(String teamID,
													String teamLongName,
													String teamShortName);

	String deleteTeamDB(String teamID);

	void fetchTeam(String teamSubLongName,
								 String teamSubShortName,
								 String teamType,
								 String teamContinentID,
								 String teamNationID,
								 Vector<Vector<String>> teamTableData,
								 Map<Integer, Map<Integer, String>> teamTableMap);
}

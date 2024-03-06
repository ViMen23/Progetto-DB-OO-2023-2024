package dao;

import java.util.List;
import java.util.Map;

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

	void newNationalTeamDB(String countryID,
												 String message);

	void newClubTeamDB(String countryID,
										 String teamLongName,
										 String teamShortName,
										 String message);

	void updateClubTeamDB(String teamID,
												String teamLongName,
												String teamShortName,
												String message);

	void deleteTeamDB(String teamID,
										String message);
}

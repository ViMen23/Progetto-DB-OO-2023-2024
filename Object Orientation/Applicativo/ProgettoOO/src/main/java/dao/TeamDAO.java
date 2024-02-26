package dao;

import java.util.List;

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
									 String teamType,
									 String teamShortName,
									 String teamLongName,
									 String countryID,
									 String countryName,
									 String confederationID,
									 String confederationShortName);
}

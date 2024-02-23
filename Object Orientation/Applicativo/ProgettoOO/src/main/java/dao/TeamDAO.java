package dao;

import java.util.List;

public interface TeamDAO
{
	void teamsDB(String teamSubLongName,
							 String teamSubShortName,
							 String teamType,
							 String teamCountryType,
							 String teamContinentID,
							 String teamNationID,
							 List<String> listTeamID,
							 List<String> listTeamType,
							 List<String> listTeamShortName,
							 List<String> listTeamLongName,
							 List<String> listCountryID,
							 List<String> listCountryName);

	Integer countAllTeamsDB();
}

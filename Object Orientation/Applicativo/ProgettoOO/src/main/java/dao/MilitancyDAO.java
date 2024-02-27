package dao;

import java.util.List;

public interface MilitancyDAO
{
	void fetchMilitancyDB(String teamID,
												String startYear,
												List<String> listPlayerID,
												List<String> listPlayerName,
												List<String> listPlayerSurname,
												List<String> listPlayerRole);

	void fetchMilitancyDB(String playerID,
												List<String> listMilitancyYear,
												List<String> listMilitancyType,
												List<String> listTeamID,
												List<String> listTeamLongName,
												List<String> listCountryID,
												List<String> listCountryName);

	void fetchMilitancyDB(String playerID,
												List<String> listMilitancyYear,
												List<String> listTeamID,
												List<String> listTeamLongName);
}

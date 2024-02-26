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
}

package dao;

import java.util.List;
import java.util.Map;

public interface PlayerDAO
{
	void fetchPlayerDB(String playerSubName,
										 String playerSubSurname,
										 String playerReferringYear,
										 String playerMinAge,
										 String playerMaxAge,
										 String playerContinentID,
										 String playerNationID,
										 String playerRole,
										 String playerPositionID,
										 String playerFoot,
										 List<String> listPlayerID,
										 List<String> listPlayerName,
										 List<String> listPlayerSurname,
										 List<String> listPlayerDob,
										 List<String> listPlayerFoot,
										 List<String> listPlayerRole,
										 List<String> listPlayerRetiredDate,
										 List<String> listPositionID,
										 List<String> listPositionName,
										 List<String> listCountryID,
										 List<String> listCountryName);

	Integer countPlayerDB();

	void fetchPlayerDB(String militancyPlayerTeamID,
										 String militancyPlayerStartYear,
										 String militancyPlayerEndYear,
										 List<String> listPlayerID,
										 List<String> listPlayerName,
										 List<String> listPlayerSurname,
										 List<String> listPlayerDob,
										 List<String> listPlayerFoot,
										 List<String> listPlayerRole,
										 List<String> listPlayerRetiredDate,
										 List<String> listPositionID,
										 List<String> listPositionName,
										 List<String> listCountryID,
										 List<String> listCountryName);

	void fetchPlayerDB(String startYear,
							String teamID,
							List<String> listPlayerID,
							List<String> listPlayerName,
							List<String> listPlayerSurname,
							List<String> listPlayerRole);

	void fetchPlayerDB(String playerID,
										 Map<String, String> mapPlayerInfo);
}

package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

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

	void fetchPlayerDB(String playerID,
										 List<String> startYearSeason);

	void fetchPlayer(String playerID,
									 Map<String, String> infoPlayerMap);

	void fetchPlayer(String startYear,
									 String teamID,
									 Vector<String> playerInfoVector,
									 Map<String, String> playerInfoMap);

	void fetchPlayer(String playerSubName,
									 String playerSubSurname,
									 String playerReferringYear,
									 String playerMinAge,
									 String playerMaxAge,
									 String playerContinentID,
									 String playerNationID,
									 String playerRole,
									 String playerPositionID,
									 String playerFoot,
									 Vector<Vector<String>> playerTableData,
									 Map<Integer, Map<Integer, String>> playerTableMap);

	void fetchPlayer(String militancyPlayerTeamID,
									 String militancyPlayerStartYear,
									 String militancyPlayerEndYear,
									 Vector<Vector<String>> playerTableData,
									 Map<Integer, Map<Integer, String>> playerTableMap);

	void fetchPlayerYear(String playerID,
											 String teamType,
											 Vector<String> seasonVector,
											 Map<String, String> seasonMap);

	String fetchPlayerYear(String playerID);

	String newPlayer(String name,
									 String surname,
									 String dob,
									 String countryID,
									 String foot,
									 String positionID,
									 String role);

	String deletePlayer(String playerID);

	String updatePlayer(String playerID,
											String name,
											String surname,
											String dob,
											String countryID,
											String foot,
											String positionID);
}

package dao;

import java.util.Map;
import java.util.Vector;

public interface PlayerDAO
{
	int countPlayerDB();

	void fetchPlayerDB(String playerID,
										 Map<String, String> infoMap);

	void fetchPlayerDB(String startYear,
										 String teamID,
										 Vector<String> comboBoxData,
										 Map<String, String> comboBoxMap);

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
										 Vector<Vector<String>> tableData,
										 Map<Integer, Map<Integer, String>> tableMap);

	void fetchPlayerDB(String militancyPlayerTeamID,
										 String militancyPlayerStartYear,
										 String militancyPlayerEndYear,
										 Vector<Vector<String>> tableData,
										 Map<Integer, Map<Integer, String>> tableMap);

	void fetchPlayerYearDB(String playerID,
												 String teamType,
												 Vector<String> comboBoxData,
												 Map<String, String> comboBoxMap);

	String fetchPlayerYearDB(String playerID);

	String newPlayerDB(String name,
										 String surname,
										 String dob,
										 String countryID,
										 String foot,
										 String positionID);

	String deletePlayerDB(String playerID);

	String updatePlayerDB(String playerID,
												String name,
												String surname,
												String dob,
												String countryID,
												String foot,
												String positionID);


	String setRetiredDateDB(String playerID,
													String retiredDate);

	String randomPlayerDB();

}

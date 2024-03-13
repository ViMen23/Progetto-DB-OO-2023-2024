package dao;

import java.util.Map;
import java.util.Vector;

public interface PlayerDAO
{
	int countPlayerDB();

	void fetchPlayer(String playerID,
									 Map<String, String> infoMap);

	void fetchPlayer(String startYear,
									 String teamID,
									 Vector<String> comboBoxData,
									 Map<String, String> comboBoxMap);

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
									 Vector<Vector<String>> tableData,
									 Map<Integer, Map<Integer, String>> tableMap);

	void fetchPlayer(String militancyPlayerTeamID,
									 String militancyPlayerStartYear,
									 String militancyPlayerEndYear,
									 Vector<Vector<String>> tableData,
									 Map<Integer, Map<Integer, String>> tableMap);

	void fetchPlayerYear(String playerID,
											 String teamType,
											 Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap);

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


	String newRetiredDate(String playerID,
												String retiredDate);

	String deleteRetiredDate(String playerID);

	String updateRetiredDate(String playerID,
													 String retiredDate);
}

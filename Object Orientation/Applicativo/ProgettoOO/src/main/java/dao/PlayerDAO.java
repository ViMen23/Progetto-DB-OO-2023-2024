package dao;

import java.util.List;

public interface PlayerDAO
{
	void playersDB(String playerSubName,
								 String playerSubSurname,
								 String playerReferringYear,
								 String playerMinAge,
								 String playerMaxAge,
								 String playerCountryID,
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

	Integer countAllPlayersDB();
}

package dao;

import java.util.List;

public interface PrizeDAO
{
	void fetchTeamPrizeDB(String teamID,
												List<String> listPrizeID,
												List<String> listPrizeAssignYear,
												List<String> listPrizeName,
												List<String> listPrizeGiven);

	void fetchPlayerPrizeDB(String playerID,
													List<String> listPrizeAssignYear,
													List<String> listPrizeName,
													List<String> listPrizeGiven);

	void newPrizeTeam(String teamID,
										String prizeID,
										String assignedYear,
										String message);

	void deletePrizeTeam(String teamID,
											 String prizeID,
											 String assignedYear,
											 String message);
}

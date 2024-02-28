package dao;

import java.util.List;

public interface PrizeDAO
{
	void fetchPrizeDB(String teamID,
										String startYear,
										List<String> listPrizeID,
										List<String> listPrizeName,
										List<String> listPrizeGiven);

	void fetchPrizeDB(String playerID,
										List<String> listPrizeAssignYear,
										List<String> listPrizeName,
										List<String> listPrizeGiven);
}

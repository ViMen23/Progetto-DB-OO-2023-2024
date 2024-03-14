package dao;

import java.util.Map;
import java.util.Vector;

public interface PrizeDAO
{
	String newPrizeTeamDB(String teamID,
												String prizeID,
												String assignedYear);

	String deletePrizeTeamDB(String teamID,
													 String prizeID,
													 String assignedYear);

	void fetchPrizeDB(String teamID,
										Vector<Vector<String>> tableData);

	void fetchPrizePlayerDB(String playerID,
													Vector<Vector<String>> tableData);

	void fetchTeamPrizeAdminDB(String teamID,
														 Vector<Vector<Object>> tableData,
														 Map<Integer, Map<Integer, String>> tableMap);

	void fetchTeamPrizeDB(Vector<String> comboBoxData,
												Map<String, String> comboBoxMap);

	void fetchPlayerPrizeDB(Vector<String> comboBoxData,
													Map<String, String> comboBoxMap);

	void fetchPlayerPrizeDB(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap);

	String newPlayerPrizeDB(String playerID,
													String prizeID,
													String assignedYear);

	String deletePlayerPrizeDB(String playerID,
														 String prizeID,
														 String assignedYear);
}

package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

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

	String newPrizeTeam(String teamID,
											String prizeID,
											String assignedYear);

	String deletePrizeTeam(String teamID,
												 String prizeID,
												 String assignedYear);

	void fetchPrize(String teamID,
									Vector<Vector<String>> tableData);

	void fetchPrizePlayer(String playerID,
												Vector<Vector<String>> tableData);

	void fetchTeamPrizeAdmin(String teamID,
													 Vector<Vector<Object>> tableData,
													 Map<Integer, Map<Integer, String>> tableMap);

	void fetchTeamPrize(Vector<String> comboBoxData,
											Map<String, String> comboBoxMap);

	void fetchPlayerPrize(Vector<String> comboBoxData,
												Map<String, String> comboBoxMap);

	void fetchPlayerPrize(String playerID,
												Vector<Vector<Object>> tableData,
												Map<Integer, Map<Integer, String>> tableMap);

	String newPlayerPrize(String playerID,
												String prizeID,
												String assignedYear);

	String deletePlayerPrize(String playerID,
													 String prizeID,
													 String assignedYear);
}

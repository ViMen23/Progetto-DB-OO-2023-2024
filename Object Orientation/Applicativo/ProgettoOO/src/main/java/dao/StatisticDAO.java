package dao;

import java.util.Map;
import java.util.Vector;

public interface StatisticDAO
{
	void fetchStatisticPlayer(String playerID,
														String teamType,
														String teamID,
														String competitionID,
														String startYear,
														String endYear,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap);

	void fetchStatisticEdition(String competitionStartYear,
														 String competitionID,
														 Vector<Vector<String>> tableData,
														 Map<Integer, Map<Integer, String>> tableMap);

	void fetchStatisticTotal(String teamType,
													 String playerRole,
													 Vector<Vector<String>> tableData,
													 Map<Integer, Map<Integer, String>> tableMap);

	void fetchStatisticAdmin(String playerID,
													 String teamID,
													 String competitionID,
													 String competitionStartYear,
													 Vector<Vector<String>> tableData,
													 Map<Integer, Map<Integer, String>> tableMap);

	String updateStatistic(String playID,
												 String match,
												 String goalScored,
												 String assist,
												 String yellowCard,
												 String redCard,
												 String penaltyScored,
												 String goalConceded,
												 String penaltySaved);
}

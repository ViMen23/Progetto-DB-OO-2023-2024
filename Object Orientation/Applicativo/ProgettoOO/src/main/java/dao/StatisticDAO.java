package dao;

import java.util.Map;
import java.util.Vector;

public interface StatisticDAO
{
	void fetchStatisticPlayerDB(String playerID,
															String teamType,
															String teamID,
															String competitionID,
															String startYear,
															String endYear,
															Vector<Vector<Object>> tableData,
															Map<Integer, Map<Integer, String>> tableMap);

	void fetchStatisticEditionDB(String competitionStartYear,
															 String competitionID,
															 Vector<Vector<Object>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap);

	void fetchStatisticTotalDB(String teamType,
														 String playerRole,
														 Vector<Vector<Object>> tableData,
														 Map<Integer, Map<Integer, String>> tableMap);

	String fetchStatisticAdminDB(String playerID,
															 String teamID,
															 String competitionID,
															 String competitionStartYear,
															 Map<String, String> dataMap);

	String updateStatisticDB(String playID,
													 String match,
													 String goalScored,
													 String assist,
													 String yellowCard,
													 String redCard,
													 String penaltyScored,
													 String goalConceded,
													 String penaltySaved);
}

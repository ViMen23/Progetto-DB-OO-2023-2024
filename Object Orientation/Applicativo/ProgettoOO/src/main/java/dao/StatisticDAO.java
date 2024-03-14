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

	void fetchStatisticAdminDB(String playerID,
														 String teamID,
														 String competitionID,
														 String competitionStartYear,
														 Vector<Vector<String>> tableData,
														 Map<Integer, Map<Integer, String>> tableMap);

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

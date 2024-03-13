package dao;


import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface StatisticDAO
{
	void fetchStatisticDB(String teamType,
												String playerRole,
												List<String> listPlayerID,
												List<String> listPlayerRole,
												List<String> listPlayerName,
												List<String> listPlayerSurname,
												List<String> listStatisticMatch,
												List<String> listStatisticGoalScored,
												List<String> listStatisticPenaltyScored,
												List<String> listStatisticAssist,
												List<String> listStatisticYellowCard,
												List<String> listStatisticRedCard,
												List<String> listStatisticGoalConceded,
												List<String> listStatisticPenaltySaved);

	void fetchStatisticDB(String competitionStartYear,
												String competitionID,
												List<String> listTeamID,
												List<String> listTeamLongName,
												List<String> listPlayerID,
												List<String> listPlayerRole,
												List<String> listPlayerName,
												List<String> listPlayerSurname,
												List<String> listStatisticMatch,
												List<String> listStatisticGoalScored,
												List<String> listStatisticPenaltyScored,
												List<String> listStatisticAssist,
												List<String> listStatisticYellowCard,
												List<String> listStatisticRedCard,
												List<String> listStatisticGoalConceded,
												List<String> listStatisticPenaltySaved);

	void fetchStatisticDB(String playerID,
												String teamType,
												String teamID,
												String competitionID,
												String startYear,
												String endYear,
												List<String> listCompetitionStartYear,
												List<String> listCompetitionID,
												List<String> listCompetitionName,
												List<String> listTeamID,
												List<String> listTeamLongName,
												List<String> listStatisticMatch,
												List<String> listStatisticGoalScored,
												List<String> listStatisticPenaltyScored,
												List<String> listStatisticAssist,
												List<String> listStatisticYellowCard,
												List<String> listStatisticRedCard,
												List<String> listStatisticGoalConceded,
												List<String> listStatisticPenaltySaved);

	void fetchStatisticPlayer(String playerID,
														String teamType,
														String teamID,
														String competitionID,
														String startYear,
														String endYear,
														Vector<Vector<String>> playerStatisticTableData,
														Map<Integer, Map<Integer, String>> playerStatisticTableMap);

	void fetchStatisticEdition(String competitionStartYear,
														 String competitionID,
														 Vector<Vector<String>> statisticTableData,
														 Map<Integer, Map<Integer, String>> statisticTableMap);

	void fetchStatisticTotal(String teamType,
													 String playerRole,
													 Vector<Vector<String>> statisticTableData,
													 Map<Integer, Map<Integer, String>> statisticTableDataMap);

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

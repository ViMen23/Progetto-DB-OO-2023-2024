package dao;


import java.util.List;

public interface StatisticDAO
{
	void statisticsDB(String teamType,
										String playerRole,
										List<String> listPlayerID,
										List<String> listPlayerRole,
										List<String> listPlayerName,
										List<String> listPlayerSurname,
										List<String> listStatisticMatch,
										List<String> listStatisticGoalScored,
										List<String> listStatisticAssist,
										List<String> listStatisticYellowCard,
										List<String> listStatisticRedCard,
										List<String> listStatisticPenaltyScored,
										List<String> listStatisticGoalConceded,
										List<String> listStatisticPenaltySaved);
}

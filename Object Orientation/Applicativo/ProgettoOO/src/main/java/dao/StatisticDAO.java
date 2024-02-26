package dao;


import java.util.List;

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
}

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
}

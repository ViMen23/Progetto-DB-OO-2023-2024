package dao;

import java.util.List;

public interface PartecipationDAO
{
	void fetchPartecipationDB(String teamID,
														String competitionStartYear,
														List<String> listCompetitionID,
														List<String> listCompetitionType,
														List<String> listCompetitionName,
														List<String> listConfederationID,
														List<String> listConfederationShortName);
}

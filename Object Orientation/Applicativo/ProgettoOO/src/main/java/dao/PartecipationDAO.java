package dao;

import java.util.List;
import java.util.Vector;

public interface PartecipationDAO
{
	void fetchPartecipationDB(String teamID,
														String competitionStartYear,
														List<String> listCompetitionID,
														List<String> listCompetitionType,
														List<String> listCompetitionName,
														List<String> listConfederationID,
														List<String> listConfederationShortName);

	void newPartecipationDB(String teamID,
													String competitionID,
													String competitionStartYear,
													String message);

	void deletePartecipationDB(String teamID,
														 String competitionID,
														 String competitionStartYear,
														 String message);

	void fetchPartecipation(String teamID,
													String competitionStartYear,
													Vector<Vector<String>> teamPartecipationTableData);
}

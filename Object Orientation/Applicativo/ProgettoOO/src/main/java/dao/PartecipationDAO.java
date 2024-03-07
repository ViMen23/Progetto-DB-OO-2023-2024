package dao;

import java.util.List;
import java.util.Map;
import java.util.Objects;
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

	String newPartecipationDB(String teamID,
														String competitionID,
														String competitionStartYear);

	String deletePartecipationDB(String teamID,
															 String competitionID,
															 String competitionStartYear);

	void fetchPartecipation(String teamID,
													String competitionStartYear,
													Vector<Vector<Object>> teamPartecipationTableData);

	void fetchPartecipationYear(String teamID,
															String teamType,
															Vector<String> partecipationYearVector,
															Map<String, String> partecipationYearMap);

	void fetchPartecipation(String teamID,
													String competitionStartYear,
													Vector<String> partecipationNameVector,
													Map<String, String> partecipationNameMap);

	void fetchPartecipationAdmin(String teamID,
															 String competitionStartYear,
															 Vector<Vector<Object>> teamPartecipationTableData,
															 Map<Integer, Map<Integer, String>> tableMap);
}

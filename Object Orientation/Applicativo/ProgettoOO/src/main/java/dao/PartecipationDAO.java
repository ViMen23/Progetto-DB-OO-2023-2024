package dao;

import java.util.Map;
import java.util.Vector;

public interface PartecipationDAO
{
	String newPartecipationDB(String teamID,
														String competitionID,
														String competitionStartYear);

	String deletePartecipationDB(String teamID,
															 String competitionID,
															 String competitionStartYear);

	void fetchPartecipationDB(String teamID,
														String competitionStartYear,
														Vector<Vector<Object>> tableData);

	void fetchPartecipationYearDB(String teamID,
																String teamType,
																Vector<String> comboBoxData,
																Map<String, String> comboBoxMap);

	void fetchPartecipationDB(String teamID,
														String competitionStartYear,
														Vector<String> comboBoxData,
														Map<String, String> comboBoxMap);

	void fetchPartecipationAdminDB(String teamID,
																 String competitionStartYear,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap);
}

package dao;

import java.util.Map;
import java.util.Vector;

public interface TagDAO
{
	void fetchTagDB(String playerID,
									Vector<Vector<String>> tableData);

	void fetchTagDB(Vector<String> comboBoxData,
									Map<String, String> comboBoxMap);

	void fetchTagDB(String playerID,
									Vector<Vector<Object>> tableData,
									Map<Integer, Map<Integer, String>> tableMap);

	String newPlayerTagDB(String playerID,
												String tagID);

	String deletePlayerTagDB(String playerID,
													 String tagID);
}

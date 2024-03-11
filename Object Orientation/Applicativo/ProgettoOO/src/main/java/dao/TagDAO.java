package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface TagDAO
{
	void fetchTagDB(String playerID,
									List<String> listTagName);

	void fetchTag(String playerID,
								Vector<Vector<String>> tableData);

	void fetchTag(Vector<String> comboBoxData,
								Map<String, String> comboBoxMap);

	void fetchTag(String playerID,
								Vector<Vector<Object>> tableData,
								Map<Integer, Map<Integer, String>> tableMap);

	String newPlayerTag(String playerID,
											String tagID);

	String deletePlayerTag(String playerID,
												 String tagID);
}

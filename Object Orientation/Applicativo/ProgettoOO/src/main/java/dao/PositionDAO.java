package dao;

import java.util.Map;
import java.util.Vector;

public interface PositionDAO
{
	void fetchPositionDB(String playerID,
											 Vector<Vector<String>> tableData);

	void fetchPositionDB(Vector<String> comboBoxData,
											 Map<String, String> comboBoxMap);

	void fetchPositionDB(String playerID,
											 Vector<Vector<Object>> tableData,
											 Map<Integer, Map<Integer, String>> tableMap);

	String newPlayerPositionDB(String playerID,
														 String positionID);

	String deletePlayerPositionDB(String playerID,
																String positionID);
}

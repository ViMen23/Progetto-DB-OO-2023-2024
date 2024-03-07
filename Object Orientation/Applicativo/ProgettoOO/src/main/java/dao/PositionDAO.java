package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public interface PositionDAO
{
	void fetchPositionDB(List<String> listPositionID,
											 List<String> listPositionRole,
											 List<String> listPositionCode,
											 List<String> listPositionName);

	void fetchPositionDB(String playerID,
											 List<String> listPositionRole,
											 List<String> listPositionCode,
											 List<String> listPositionName);

	void fetchPosition(String playerID,
										 Vector<Vector<String>> playerPositionTableData);

	void fetchPosition(Vector<String> positionNameVector,
										 Map<String, String> positionNameMap);
}

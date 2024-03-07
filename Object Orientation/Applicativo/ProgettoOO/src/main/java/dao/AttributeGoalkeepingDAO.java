package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributeGoalkeepingDAO
{
	void fetchAttributeGoalkeepingDB(String playerID,
																	 Map<String, String> mapAttributeGoalkeeping);

	void fetchAttributeGoalkeeping(String playerID,
																 Vector<Vector<String>> playerAttributeGoalkeepingTableData);
}

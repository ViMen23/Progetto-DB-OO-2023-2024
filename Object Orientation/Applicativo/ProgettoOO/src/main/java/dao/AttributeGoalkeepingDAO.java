package dao;

import java.util.Map;

public interface AttributeGoalkeepingDAO
{
	void fetchAttributeGoalkeepingDB(String playerID,
																	 Map<String, String> mapAttributeGoalkeeping);
}

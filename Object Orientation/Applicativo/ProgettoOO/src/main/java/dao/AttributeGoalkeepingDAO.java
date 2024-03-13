package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributeGoalkeepingDAO
{
	void fetchAttributeGoalkeepingDB(String playerID,
																	 Map<String, String> mapAttributeGoalkeeping);

	void fetchAttributeGoalkeeping(String playerID,
																 Vector<Vector<String>> playerAttributeGoalkeepingTableData);

	String updateAttributeGoalkeeping(String playerID,
																		String aerialReach,
																		String commandOfArea,
																		String communication,
																		String eccentricity,
																		String firstTouchGk,
																		String handling,
																		String kicking,
																		String oneOnOnes,
																		String passingGk,
																		String punchingTendency,
																		String reflexes,
																		String rushingOutTendency,
																		String throwing);
}

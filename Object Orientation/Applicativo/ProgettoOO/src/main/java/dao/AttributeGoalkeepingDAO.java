package dao;

import java.util.Vector;

public interface AttributeGoalkeepingDAO
{
	void fetchAttributeGoalkeepingDB(String playerID,
																	 Vector<Vector<String>> tableData);

	String updateAttributeGoalkeepingDB(String playerID,
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

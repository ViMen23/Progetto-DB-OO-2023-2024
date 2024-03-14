package dao;

import java.util.Vector;

public interface AttributePhysicalDAO
{
	void fetchAttributePhysicalDB(String playerID,
																Vector<Vector<String>> tableData);

	String updateAttributePhysicalDB(String playerID,
																	 String acceleration,
																	 String agility,
																	 String balance,
																	 String jumpingReach,
																	 String naturalFitness,
																	 String pace,
																	 String stamina,
																	 String strength);
}

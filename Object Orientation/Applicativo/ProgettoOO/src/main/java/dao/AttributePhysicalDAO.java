package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributePhysicalDAO
{
	void fetchAttributePhysicalDB(String playerID,
															Map<String, String> mapAttributePhysical);

	void fetchAttributePhysical(String playerID,
															Vector<Vector<String>> playerAttributePhysicalTableData);

	String updateAttributePhysical(String playerID,
																 String acceleration,
																 String agility,
																 String balance,
																 String jumpingReach,
																 String naturalFitness,
																 String pace,
																 String stamina,
																 String strength);
}

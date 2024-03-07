package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributePhysicalDAO
{
	void fetchAttributePhysicalDB(String playerID,
															Map<String, String> mapAttributePhysical);

	void fetchAttributePhysical(String playerID,
															Vector<Vector<String>> playerAttributePhysicalTableData);
}

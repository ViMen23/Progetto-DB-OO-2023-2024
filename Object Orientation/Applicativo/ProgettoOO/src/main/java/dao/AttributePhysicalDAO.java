package dao;

import java.util.Map;

public interface AttributePhysicalDAO
{
	void fetchAttributePhysicalDB(String playerID,
															Map<String, String> mapAttributePhysical);
}

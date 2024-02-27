package dao;

import java.util.Map;

public interface AttributeTechnicalDAO
{
	void fetchAttributeTechnicalDB(String playerID,
																Map<String, String> mapAttributeTechnical);
}

package dao;

import java.util.Map;

public interface AttributeMentalDAO
{
	void fetchAttributeMentalDB(String playerID,
															Map<String, String> mapAttributeMental);
}

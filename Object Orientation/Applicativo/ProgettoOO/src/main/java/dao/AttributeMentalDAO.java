package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributeMentalDAO
{
	void fetchAttributeMentalDB(String playerID,
															Map<String, String> mapAttributeMental);

	void fetchAttributeMental(String playerID,
														Vector<Vector<String>> playerAttributeMentalTableData);
}

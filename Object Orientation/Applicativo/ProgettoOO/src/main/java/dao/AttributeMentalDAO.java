package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributeMentalDAO
{
	void fetchAttributeMentalDB(String playerID,
															Map<String, String> mapAttributeMental);

	void fetchAttributeMental(String playerID,
														Vector<Vector<String>> playerAttributeMentalTableData);

	String updateAttributeMental(String playerID,
															 String aggression,
															 String anticipation,
															 String bravery,
															 String composure,
															 String concentration,
															 String decision,
															 String determination,
															 String flair,
															 String leadership,
															 String offTheBall,
															 String positioning,
															 String teamwork,
															 String vision,
															 String workRate);
}

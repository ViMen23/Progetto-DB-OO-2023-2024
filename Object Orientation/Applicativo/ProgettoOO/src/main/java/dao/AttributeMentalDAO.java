package dao;

import java.util.Vector;

public interface AttributeMentalDAO
{
	void fetchAttributeMentalDB(String playerID,
															Vector<Vector<String>> tableData);

	String updateAttributeMentalDB(String playerID,
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

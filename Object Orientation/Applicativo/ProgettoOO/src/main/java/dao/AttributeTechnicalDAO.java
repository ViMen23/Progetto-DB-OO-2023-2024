package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributeTechnicalDAO
{
	void fetchAttributeTechnicalDB(String playerID,
																Map<String, String> mapAttributeTechnical);

	void fetchAttributeTechnical(String playerID,
															 Vector<Vector<String>> playerAttributeTechnicalTableData);

	String updateAttributeTechnical(String playerID,
																	String corners,
																	String crossing,
																	String dribbling,
																	String finishing,
																	String firstTouch,
																	String freeKickTaking,
																	String heading,
																	String longShots,
																	String longThrows,
																	String marking,
																	String passing,
																	String penaltyTaking,
																	String tackling,
																	String technique);
}

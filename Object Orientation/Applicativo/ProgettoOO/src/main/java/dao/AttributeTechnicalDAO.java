package dao;

import java.util.Vector;

public interface AttributeTechnicalDAO
{
	void fetchAttributeTechnicalDB(String playerID,
																 Vector<Vector<String>> tableData);

	String updateAttributeTechnicalDB(String playerID,
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

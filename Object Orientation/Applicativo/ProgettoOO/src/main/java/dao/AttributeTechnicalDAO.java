package dao;

import java.util.Map;
import java.util.Vector;

public interface AttributeTechnicalDAO
{
	void fetchAttributeTechnicalDB(String playerID,
																Map<String, String> mapAttributeTechnical);

	void fetchAttributeTechnical(String playerID,
															 Vector<Vector<String>> playerAttributeTechnicalTableData);
}

package dao;

import java.util.List;
import java.util.Vector;

public interface NationalityDAO
{
	void fetchNationalityDB(String playerID,
													List<String> listCountryName);

	void fetchNationality(String playerID,
												Vector<Vector<String>> tableData);
}

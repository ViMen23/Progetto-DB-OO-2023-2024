package dao;

import java.util.List;

public interface NationalityDAO
{
	void fetchNationalityDB(String playerID,
													List<String> listCountryName);
}

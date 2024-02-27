package dao;

import java.util.List;

public interface TagDAO
{
	void fetchTagDB(String playerID,
									List<String> listTagName);
}

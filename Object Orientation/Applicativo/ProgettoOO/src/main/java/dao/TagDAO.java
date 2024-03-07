package dao;

import java.util.List;
import java.util.Vector;

public interface TagDAO
{
	void fetchTagDB(String playerID,
									List<String> listTagName);

	void fetchTag(String playerID,
								Vector<Vector<String>> tableData);
}

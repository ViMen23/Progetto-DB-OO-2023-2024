package dao;

import java.util.List;

public interface PositionDAO
{
	void fetchPositionDB(List<String> listPositionID,
											 List<String> listPositionRole,
											 List<String> listPositionCode,
											 List<String> listPositionName);
}

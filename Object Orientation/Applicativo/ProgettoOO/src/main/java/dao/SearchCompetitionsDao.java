package dao;

public interface SearchCompetitionsDao
{
	void searchCompetitionsDB(String subNameCompetition,
														String typeCompetition, String typeTeamCompetition,
														String countryName);
}

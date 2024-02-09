package model;

/**
 * TYPE : class
 * NAME : CompetitionEdition
 *
 * DESC: Classe che rappresenta il concetto astratto di edizione di una competizione calcistica
 */

// TODO: discutere. Potrebbe essere gestita con una lista di anni inserita nella classe Competition
public class CompetitionEdition
{
	private Integer startYear;
	private Integer endYear;
	private Competition competition;


	public CompetitionEdition(Integer startYear, Integer endYear, Competition competition)
	{
		this.startYear = startYear;
		this.endYear = endYear;
		this.competition = competition;
	}


	public Integer getStartYear()
	{
		return startYear;
	}

	public Integer getEndYear()
	{
		return endYear;
	}

	public Competition getCompetition()
	{
		return competition;
	}

}

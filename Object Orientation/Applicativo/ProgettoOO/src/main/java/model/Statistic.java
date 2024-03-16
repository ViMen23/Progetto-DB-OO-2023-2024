package model;

/**
 * Questa classe rappresenta le statistiche di una partita di calcio.
 * <p>
 * Le statistiche sono associate a:
 *  <li> `team`: Squadra.
 *  <li> `competition`: Competizione.
 *  <li> `competitionYear`: Anno della competizione.
 *  <li> `match`: Numero di partite giocate.
 *  <li> `goalScored`: Gol segnati.
 *  <li> `penaltyScored`: Rigori segnati.
 *  <li> `assist`: Assist effettuati.
 *  <li> `yellowCard`: Cartellini gialli ricevuti.
 *  <li> `redCard`: Cartellini rossi ricevuti.
 *  <li> `goalConceded`: Gol subiti.
 *  <li> `penaltySaved`: Rigori parati.
 */
public class Statistic
{
	private final Team team;
	private final Competition competition;
	private final String competitionYear;
	private final String match;
	private final String goalScored;
	private final String penaltyScored;
	private final String assist;
	private final String yellowCard;
	private final String redCard;
	private final String goalConceded;
	private final String penaltySaved;


	/**
	 * Costruttore della classe `Statistic`.
	 * <p>
	 * Crea una nuova istanza di statistiche di una partita.
	 * <p>
	 * @param team Squadra.
	 * @param competition Competizione.
	 * @param competitionYear Anno della competizione.
	 * @param match Numero di partite giocate.
	 * @param goalScored Gol segnati.
	 * @param penaltyScored Rigori segnati.
	 * @param assist Assist effettuati.
	 * @param yellowCard Cartellini gialli ricevuti.
	 * @param redCard Cartellini rossi ricevuti.
	 * @param goalConceded Gol subiti.
	 * @param penaltySaved Rigori parati.
	 */
	public Statistic(Team team,
									 Competition competition,
									 String competitionYear,
									 String match,
									 String goalScored,
									 String penaltyScored,
									 String assist,
									 String yellowCard,
									 String redCard,
									 String goalConceded,
									 String penaltySaved)
	{
		this.team = team;
		this.competition = competition;
		this.competitionYear = competitionYear;
		this.match = match;
		this.goalScored = goalScored;
		this.penaltyScored = penaltyScored;
		this.assist = assist;
		this.yellowCard = yellowCard;
		this.redCard = redCard;
		this.goalConceded = goalConceded;
		this.penaltySaved = penaltySaved;
	}


	/**
	 * Restituisce la squadra a cui sono associate le statistiche.
	 * <p>
	 * @return La squadra.
	 */
	public Team getTeam()
	{
		return team;
	}

	/**
	 * Restituisce la competizione a cui sono associate le statistiche.
	 * <p>
	 * @return La competizione.
	 */
	public Competition getCompetition()
	{
		return competition;
	}

	/**
	 * Restituisce l'anno della competizione a cui sono associate le statistiche.
	 * <p>
	 * @return L'anno della competizione.
	 */
	public String getCompetitionYear()
	{
		return competitionYear;
	}

	/**
	 * Restituisce il numero di partite giocate.
	 * <p>
	 * @return Il numero di partite giocate.
	 */
	public String getMatch()
	{
		return match;
	}

	/**
	 * Restituisce il numero di gol segnati.
	 * <p>
	 * @return Il numero di gol segnati.
	 */
	public String getGoalScored()
	{
		return goalScored;
	}

	/**
	 * Restituisce il numero di rigori segnati.
	 * <p>
	 * @return Il numero di rigori segnati.
	 */
	public String getPenaltyScored()
	{
		return penaltyScored;
	}

	/**
	 * Restituisce il numero di assist effettuati.
	 * <p>
	 * @return Il numero di assist effettuati.
	 */
	public String getAssist()
	{
		return assist;
	}

	/**
	 * Restituisce il numero di cartellini gialli ricevuti.
	 * <p>
	 * @return Il numero di cartellini gialli ricevuti.
	 */
	public String getYellowCard()
	{
		return yellowCard;
	}

	/**
	 * Restituisce il numero di cartellini rossi ricevuti.
	 * <p>
	 * @return Il numero di cartellini rossi ricevuti.
	 */
	public String getRedCard()
	{
		return redCard;
	}

	/**
	 * Restituisce il numero di gol subiti.
	 * <p>
	 * @return Il numero di gol subiti.
	 */
	public String getGoalConceded()
	{
		return goalConceded;
	}

	/**
	 * Restituisce il numero di rigori parati.
	 * <p>
	 * @return Il numero di rigori parati.
	 */
	public String getPenaltySaved()
	{
		return penaltySaved;
	}

}

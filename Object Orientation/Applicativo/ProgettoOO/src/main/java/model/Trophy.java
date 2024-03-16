package model;


/**
 * Questa classe rappresenta un trofeo calcistico.
 */
public class Trophy
{
	/**
	 * Enumerazione che rappresenta i possibili tipi di trofeo.
	 */
	public enum AWARD_TYPE {PLAYER, TEAM}


	private final String type;
	private final String role;
	private final String name;
	private final Player player;
	private final Team team;
	private final Competition competition;
	private final String competitionStartYear;


	/**
	 * Costruttore della classe `Trophy`.
	 * <p>
	 * Crea una nuova istanza di trofeo.
	 * <p>
	 * @param type Tipo di trofeo.
	 * @param role Ruolo del vincitore.
	 * @param name Nome del trofeo.
	 * @param player Giocatore vincitore.
	 * @param team Squadra vincitrice.
	 * @param competition Competizione in cui è stato vinto il trofeo.
	 * @param competitionStartYear Anno di inizio della competizione.
	 */
	public Trophy(String type,
								String role,
								String name,
								Player player,
								Team team,
								Competition competition,
								String competitionStartYear)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.player = player;
		this.team = team;
		this.competition = competition;
		this.competitionStartYear = competitionStartYear;
	}


	/**
	 * Restituisce il tipo di trofeo.
	 * <p>
	 * @return Il tipo di trofeo.
	 */
	public String getType()
	{
		return type;
	}

	/**
	 * Restituisce il ruolo del vincitore del trofeo.
	 * <p>
	 * @return Il ruolo del vincitore.
	 */
	public String getRole()
	{
		return role;
	}

	/**
	 * Restituisce il nome del trofeo.
	 * <p>
	 * @return Il nome del trofeo.
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Restituisce il giocatore vincitore del trofeo.
	 * <p>
	 * @return Il giocatore vincitore.
	 */
	public Player getPlayer()
	{
		return player;
	}

	/**
	 * Restituisce la squadra vincitrice del trofeo.
	 * <p>
	 * @return La squadra vincitrice.
	 */
	public Team getTeam()
	{
		return team;
	}

	/**
	 * Restituisce la competizione in cui è stato vinto il trofeo.
	 * <p>
	 * @return La competizione.
	 */
	public Competition getCompetition()
	{
		return competition;
	}

	/**
	 * Restituisce l'anno di inizio della competizione in cui è stato vinto il trofeo.
	 * <p>
	 * @return L'anno di inizio della competizione.
	 */
	public String getCompetitionStartYear()
	{
		return competitionStartYear;
	}
}

package model;

/**
 * Questa classe rappresenta un premio calcistico.
 */
public class Prize
{
	/**
	 * Enumerazione che rappresenta i possibili tipi di premio.
	 */
	public enum AWARD_TYPE {PLAYER, TEAM}

	private final String type;
	private final String role;
	private final String name;
	private final String given;
	private final Player player;
	private final Team team;
	private final String assignedYear;


	/**
	 * Costruttore della classe `Prize`.
	 * <p>
	 * Crea una nuova istanza di premio con i parametri specificati.
	 * <p>
	 * @param type Tipo di premio.
	 * @param role Ruolo a cui è associato il premio.
	 * @param name Nome del premio.
	 * @param given Ente che assegna il premio.
	 * @param player Giocatore a cui è assegnato il premio.
	 * @param team Squadra a cui è assegnato il premio.
	 * @param assignedYear Anno di assegnazione del premio.
	 */
	public Prize(String type,
							 String role,
							 String name,
							 String given,
							 Player player,
							 Team team,
							 String assignedYear)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.given = given;
		this.player = player;
		this.team = team;
		this.assignedYear = assignedYear;
	}


	/**
	 * Restituisce il tipo di premio.
	 * <p>
	 * @return Il tipo di premio.
	 */
	public String getType()
	{
		return type;
	}

	/**
	 * Restituisce il ruolo a cui è associato il premio.
	 * <p>
	 * @return Il ruolo a cui è associato il premio.
	 */
	public String getRole()
	{
		return role;
	}

	/**
	 * Restituisce il nome del premio.
	 * <p>
	 * @return Il nome del premio.
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Restituisce l'ente che assegna il premio.
	 * <p>
	 * @return L'ente che assegna il premio.
	 */
	public String getGiven()
	{
		return given;
	}

	/**
	 * Restituisce il giocatore a cui è assegnato il premio.
	 * <p>
	 * @return Il giocatore a cui è assegnato il premio.
	 */
	public Player getPlayer()
	{
		return player;
	}

	/**
	 * Restituisce la squadra a cui è assegnato il premio.
	 * <p>
	 * @return La squadra a cui è assegnato il premio.
	 */
	public Team getTeam()
	{
		return team;
	}

	/**
	 * Restituisce l'anno di assegnazione del premio.
	 * <p>
	 * @return L'anno di assegnazione del premio.
	 */
	public String getAssignedYear()
	{
		return assignedYear;
	}

}

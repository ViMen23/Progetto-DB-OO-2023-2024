package model;

/**
 * Questa classe rappresenta una posizione di gioco.
 */
public class Position
{
	/**
	 * Enumerazione che rappresenta i possibili ruoli di gioco.
	 */
	public enum ROLE_TYPE {GK, DF, MF, FW}


	private final String role;
	private final String code;
	private final String name;


	/**
	 * Costruttore della classe `Position`.
	 * <p>
	 * Crea una nuova istanza di posizione con i parametri specificati.
	 * <p>
	 * @param role Il ruolo principale associato alla posizione.
	 * @param code Il codice identificativo della posizione.
	 * @param name Il nome descrittivo della posizione.
	 */
	public Position(String role,
									String code,
									String name)
	{
		this.role = role;
		this.code = code;
		this.name = name;
	}


	/**
	 * Restituisce il ruolo principale associato alla posizione.
	 * <p>
	 * @return Il ruolo principale associato alla posizione.
	 */
	public String getRole()
	{
		return role;
	}

	/**
	 * Restituisce il codice identificativo della posizione.
	 * <p>
	 * @return Il codice identificativo della posizione.
	 */
	public String getCode()
	{
		return code;
	}

	/**
	 * Restituisce il nome descrittivo della posizione.
	 * <p>
	 * @return Il nome descrittivo della posizione.
	 */
	public String getName()
	{
		return name;
	}

}

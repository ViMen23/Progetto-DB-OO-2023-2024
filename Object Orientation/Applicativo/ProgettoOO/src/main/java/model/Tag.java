package model;

/**
 * Questa classe rappresenta un tag da associare ad un calciatore.
 * <p>
 * Un tag è caratterizzato da:
 *  <li> `goalkeeper`: Indica se il tag è specifico per i portieri (vero) o per i giocatori di movimento (falso).
 *  <li> `positive`: Indica se il tag è positivo (vero) o negativo (falso).
 *  <li> `name`: Nome del tag.
 */
public class Tag
{

	private final Boolean goalkeeper;
	private final Boolean positive;
	private final String name;


	/**
	 * Costruttore della classe `Tag`.
	 * <p>
	 * Crea una nuova istanza di tag.
	 * <p>
	 * @param goalkeeper Indica se il tag è specifico per i portieri (vero) o per i giocatori di movimento (falso).
	 * @param positive Indica se il tag è positivo (vero) o negativo (falso).
	 * @param name Nome del tag.
	 */
	public Tag(Boolean goalkeeper,
						 Boolean positive,
						 String name)
	{
		this.goalkeeper = goalkeeper;
		this.positive = positive;
		this.name = name;
	}


	/**
	 * Restituisce `true` se il tag è specifico per i portieri, `false` altrimenti.
	 * <p>
	 * @return `true` se il tag è per i portieri, `false` altrimenti.
	 */
	public Boolean isGoalkeeper()
	{
		return goalkeeper;
	}

	/**
	 * Restituisce `true` se il tag è positivo, `false` altrimenti.
	 * <p>
	 * @return `true` se il tag è positivo, `false` altrimenti.
	 */
	public Boolean isPositive()
	{
		return positive;
	}

	/**
	 * Restituisce il nome del tag.
	 * <p>
	 * @return Il nome del tag.
	 */
	public String getName()
	{
		return name;
	}

}

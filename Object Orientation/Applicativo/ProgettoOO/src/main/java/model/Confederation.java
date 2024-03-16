package model;


/**
 * Questa classe rappresenta una confederazione sportiva.
 * <p>
 * Una confederazione è caratterizzata da:
 *  <li> `shortName`: Nome abbreviato della confederazione.
 *  <li> `longName`: Nome completo della confederazione.
 *  <li> `country`: Paese in cui ha sede la confederazione.
 *  <li> `superConfederation`: Confederazione superiore di cui fa parte.
 */
public class Confederation
{
	private final String shortName;
	private final String longName;
	private final Country country;
	private final Confederation superConfederation;


	/**
	 * Costruttore della classe `Confederation`.
	 * <p>
	 * Crea una nuova istanza di confederazione con i parametri specificati.
	 * <p>
	 * @param shortName Nome abbreviato della confederazione.
	 * @param longName Nome completo della confederazione.
	 * @param country Paese in cui ha sede la confederazione.
	 * @param superConfederation Confederazione superiore di cui fa parte.
	 */
	public Confederation(String shortName,
											 String longName,
											 Country country,
											 Confederation superConfederation)
	{
		this.shortName = shortName;
		this.longName = longName;
		this.country = country;
		this.superConfederation = superConfederation;
	}


	/**
	 * Restituisce il nome abbreviato della confederazione.
	 * <p>
	 * @return Il nome abbreviato della confederazione.
	 */
	public String getShortName()
	{
		return shortName;
	}

	/**
	 * Restituisce il nome completo della confederazione.
	 * <p>
	 * @return Il nome completo della confederazione.
	 */
	public String getLongName()
	{
		return longName;
	}

	/**
	 * Restituisce il paese in cui ha sede la confederazione.
	 * <p>
	 * @return Il paese in cui ha sede la confederazione.
	 */
	public Country getCountry()
	{
		return country;
	}

	/**
	 * Restituisce la confederazione superiore di cui fa parte, se presente.
	 * <p>
	 * @return La confederazione superiore di cui fa parte, o null se non ha una confederazione superiore.
	 */
	public Confederation getSuperConfederation()
	{
		return superConfederation;
	}

}

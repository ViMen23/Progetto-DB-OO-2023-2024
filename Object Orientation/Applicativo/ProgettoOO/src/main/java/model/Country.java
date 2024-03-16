package model;


/**
 * Questa classe rappresenta un paese.
 * <p>
 * Un paese è caratterizzato da:
 *  <li> `type`: Tipo di entità geografica.
 *  <li> `code`: Codice identificativo del paese.
 *  <li> `name`: Nome del paese.
 *  <li> `superCountry`: Paese o continente di appartenenza.
 */
public class Country
{
	/**
	 * Enumerazione che rappresenta i possibili tipi di entità geografiche.
	 */
	public enum COUNTRY_TYPE {WORLD, CONTINENT, NATION}

	private final String type;
	private final String code;
	private final String name;
	private final Country superCountry;


	/**
	 * Costruttore della classe `Country`.
	 * <p>
	 * Crea una nuova istanza di paese con i parametri specificati.
	 * <p>
	 * @param type Tipo di entità geografica.
	 * @param code Codice identificativo del paese.
	 * @param name Nome del paese.
	 * @param superCountry Paese o continente di appartenenza.
	 */
	public Country(String type, String code, String name, Country superCountry)
	{
		this.type = type;
		this.code = code;
		this.name = name;
		this.superCountry = superCountry;
	}


	/**
	 * Restituisce il tipo di entità geografica.
	 * <p>
	 * @return Il tipo di entità geografica.
	 */
	public String getType()
	{
		return type;
	}

	/**
	 * Restituisce il codice identificativo del paese.
	 * <p>
	 * @return Il codice identificativo del paese.
	 */
	public String getCode()
	{
		return code;
	}

	/**
	 * Restituisce il nome del paese.
	 * <p>
	 * @return Il nome del paese.
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Restituisce il paese di appartenenza, se presente.
	 * <p>
	 * @return Il paese di appartenenza (può essere null).
	 */
	public Country getSuperCountry()
	{
		return superCountry;
	}

}

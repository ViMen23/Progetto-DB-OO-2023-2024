package model;

import java.util.*;


/**
 * Questa classe rappresenta un calciatore.
 * <p>
 * Un calciatore è caratterizzato da:
 *  <li> `name`: Nome del calciatore.
 *  <li> `surname`: Cognome del calciatore.
 *  <li> `dob`: Data di nascita.
 *  <li> `country`: Nazione di nascita.
 *  <li> `foot`: Piede preferito.
 *  <li> `position`: Posizione principale in campo.
 *  <li> `role`: Ruolo in campo.
 *  <li> `retiredDate`: Data di ritiro dall'attività agonistica.
 *  <li> `statisticMap`: Mappa che associa un oggetto `Statistic` al relativo valore.
 *  <li> `positionSet`: Insieme di posizioni che il calciatore può ricoprire in campo.
 *  <li> `countrySet`: Insieme di nazionalita'.
 *  <li> `attributeGoalkeepingMap`: Mappa che associa un attributo del portiere al relativo valore.
 *  <li> `attributeMentalMap`: Mappa che associa un attributo mentale al relativo valore.
 *  <li> `attributePhysicalMap`: Mappa che associa un attributo fisico al relativo valore.
 *  <li> `attributeTechnicalMap`: Mappa che associa un attributo tecnico al relativo valore.
 *  <li> `tagSet`: Insieme di tag che descrivono il calciatore.
 *  <li> `nationalCareer`: Mappa che associa la stagione alla squadra di club in cui ha giocato per la nazionale.
 *  <li> `clubCareer`: Mappa che associa la stagione alla squadra di club in cui ha giocato.
 *  <li> `trophyMap`: Mappa che associa un trofeo vinto dal calciatore al relativo anno di vittoria.
 *  <li> `prizeSet`: Insieme di premi individuali ottenuti dal calciatore.
 *  <li> `playSeason`: Insieme di stagioni in cui il calciatore ha giocato a livello professionistico.
 * <p>
 *  <li> `MIN_AGE`: Età minima per poter creare un calciatore.
 *  <li> `MAX_AGE`: Età massima per poter creare un calciatore.
 */
public class Player
{
	/**
	 * Enumerazione che rappresenta i possibili tipi di piede preferito.
	 */
	public enum FOOT_TYPE {EITHER, LEFT, RIGHT}

	/**
	 * Enumerazione che rappresenta i possibili tipi di militanza stagionale.
	 */
	public enum MILITANCY_TYPE {I_PART, II_PART, FULL}
	public static final int MIN_AGE = 15;
	public static final int MAX_AGE = 50;

	private String name;
	private String surname;
	private String dob;
	private Country country;
	private String foot;
	private Position position;
	private String role;
	private String retiredDate;

	private Map<String, String> attributeGoalkeepingMap;
	private Map<String, String> attributeMentalMap;
	private Map<String, String> attributePhysicalMap;
	private Map<String, String> attributeTechnicalMap;

	private final Set<Tag> tagSet;

	private final Set<Position> positionSet;
	private final Set<Country> countrySet;

	private final Map<String, Team> nationalCareer;
	private final Map<String, Team> clubCareer;

	private final Map<Statistic, String> statisticMap;

	private final Map<Trophy, String> trophyMap;
	private final Set<Prize> prizeSet;

	private final Set<String> playSeason;


/**
 * Costruttore della classe `Player`.
 * <p>
 * Crea una nuova istanza di calciatore.
 * <p>
 * @param name Nome del calciatore.
 * @param surname Cognome del calciatore.
 * @param dob Data di nascita.
 * @param country Nazione di appartenenza.
 * @param foot Piede preferito.
 * @param position Posizione principale in campo.
 * @param role Ruolo in campo.
 * @param retiredDate Data di ritiro dall'attività agonistica.
 */
	public Player(String name,
								String surname,
								String dob,
								Country country,
								String foot,
								Position position,
								String role,
								String retiredDate)
	{
		this.name = name;
		this.surname = surname;
		this.dob = dob;
		this.country = country;
		this.foot = foot;
		this.position = position;
		this.role = role;
		this.retiredDate = retiredDate;

		this.statisticMap = new LinkedHashMap<>();
		this.positionSet = new LinkedHashSet<>();
		this.countrySet = new LinkedHashSet<>();

		this.attributeGoalkeepingMap = new LinkedHashMap<>();
		this.attributeMentalMap = new LinkedHashMap<>();
		this.attributePhysicalMap = new LinkedHashMap<>();
		this.attributeTechnicalMap = new LinkedHashMap<>();

		this.tagSet = new LinkedHashSet<>();

		this.nationalCareer = new LinkedHashMap<>();
		this.clubCareer = new LinkedHashMap<>();

		this.trophyMap = new LinkedHashMap<>();
		this.prizeSet = new LinkedHashSet<>();

		this.playSeason = new LinkedHashSet<>();
	}


	/**
	 * Restituisce il nome del calciatore.
	 * <p>
	 * @return Il nome del calciatore.
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Restituisce il cognome del calciatore.
	 * <p>
	 * @return Il cognome del calciatore.
	 */
	public String getSurname()
	{
		return surname;
	}

	/**
	 * Restituisce la data di nascita del calciatore.
	 * <p>
	 * @return La data di nascita del calciatore.
	 */
	public String getDob()
	{
		return dob;
	}

	/**
	 * Restituisce la nazione di appartenenza del calciatore.
	 * <p>
	 * @return La nazione di appartenenza.
	 */
	public Country getCountry()
	{
		return country;
	}

	/**
	 * Restituisce il piede preferito del calciatore.
	 * <p>
	 * @return Il piede preferito.
	 */
	public String getFoot()
	{
		return foot;
	}

	/**
	 * Restituisce la posizione principale del calciatore.
	 * <p>
	 * @return La posizione principale.
	 */
	public Position getPosition()
	{
		return position;
	}

	/**
	 * Restituisce il ruolo del calciatore.
	 * <p>
	 * @return Il ruolo.
	 */
	public String getRole()
	{
		return role;
	}

	/**
	 * Restituisce la data di ritiro del calciatore.
	 * <p>
	 * @return La data di ritiro.
	 */
	public String getRetiredDate()
	{
		return retiredDate;
	}


	/**
	 * Imposta il nome del calciatore.
	 * <p>
	 * @param name Il nuovo nome del calciatore.
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/**
	 * Imposta il cognome del calciatore.
	 * <p>
	 * @param surname Il nuovo cognome del calciatore.
	 */
	public void setSurname(String surname)
	{
		this.surname = surname;
	}

	/**
	 * Imposta la data di nascita del calciatore.
	 * <p>
	 * @param dob La nuova data di nascita.
	 */
	public void setDob(String dob)
	{
		this.dob = dob;
	}

	/**
	 * Imposta la nazione di nascita del calciatore.
	 * <p>
	 * @param country La nuova nazione di nascita.
	 */
	public void setCountry(Country country)
	{
		this.country = country;
	}

	/**
	 * Imposta il piede preferito del calciatore.
	 * <p>
	 * @param foot Il nuovo piede preferito.
	 */
	public void setFoot(String foot)
	{
		this.foot = foot;
	}

	/**
	 * Imposta la posizione principale del calciatore.
	 * <p>
	 * @param position La nuova posizione principale.
	 */
	public void setPosition(Position position)
	{
		this.position = position;
	}

	/**
	 * Imposta il ruolo del calciatore.
	 * <p>
	 * @param role Il nuovo ruolo.
	 */
	public void setRole(String role)
	{
		this.role = role;
	}

	/**
	 * Imposta la data di ritiro del calciatore.
	 * <p>
	 * @param retiredDate La nuova data di ritiro.
	 */
	public void setRetiredDate(String retiredDate)
	{
		this.retiredDate = retiredDate;
	}


	/**
	 * Restituisce la mappa che associa un oggetto `Statistic` al relativo valore.
	 * <p>
	 * @return La mappa che associa le statistiche al loro valore.
	 */
	public Map<Statistic, String> getStatisticMap()
	{
		return statisticMap;
	}

	/**
	 * Restituisce l'insieme di posizioni che il calciatore può ricoprire in campo.
	 * <p>
	 * @return L'insieme di posizioni.
	 */
	public Set<Position> getPositionSet()
	{
		return positionSet;
	}

	/**
	 * Restituisce l'insieme di nazionalita' del calciatore.
	 * <p>
	 * @return L'insieme di nazionalita'.
	 */
	public Set<Country> getCountrySet()
	{
		return countrySet;
	}

	/**
	 * Restituisce la mappa che associa un attributo del portiere al relativo valore.
	 * <p>
	 * @return La mappa che associa gli attributi del portiere al loro valore.
	 */
	public Map<String, String> getAttributeGoalkeepingMap()
	{
		return attributeGoalkeepingMap;
	}

	/**
	 * Imposta la mappa che associa un attributo del portiere al relativo valore.
	 * <p>
	 * @param attributeGoalkeepingMap La nuova mappa che associa gli attributi del portiere al loro valore.
	 */
	public void setAttributeGoalkeepingMap(Map<String, String> attributeGoalkeepingMap)
	{
		this.attributeGoalkeepingMap = attributeGoalkeepingMap;
	}

	/**
	 * Restituisce la mappa che associa un attributo mentale al relativo valore.
	 * <p>
	 * @return La mappa che associa gli attributi mentali al loro valore.
	 */
	public Map<String, String> getAttributeMentalMap()
	{
		return attributeMentalMap;
	}

	/**
	 * Imposta la mappa che associa un attributo mentale al relativo valore.
	 * <p>
	 * @param attributeMentalMap La nuova mappa che associa gli attributi mentali al loro valore.
	 */
	public void setAttributeMentalMap(Map<String, String> attributeMentalMap)
	{
		this.attributeMentalMap = attributeMentalMap;
	}

	/**
	 * Restituisce la mappa che associa un attributo fisico al relativo valore.
	 * <p>
	 * @return La mappa che associa gli attributi fisici al loro valore.
	 */
	public Map<String, String> getAttributePhysicalMap()
	{
		return attributePhysicalMap;
	}

	/**
	 * Imposta la mappa che associa un attributo fisico al relativo valore.
	 * <p>
	 * @param attributePhysicalMap La nuova mappa che associa gli attributi fisici al loro valore.
	 */
	public void setAttributePhysicalMap(Map<String, String> attributePhysicalMap)
	{
		this.attributePhysicalMap = attributePhysicalMap;
	}

	/**
	 * Restituisce la mappa che associa un attributo tecnico al relativo valore.
	 * <p>
	 * @return La mappa che associa gli attributi tecnici al loro valore.
	 */
	public Map<String, String> getAttributeTechnicalMap()
	{
		return attributeTechnicalMap;
	}

	/**
	 * Imposta la mappa che associa un attributo tecnico al relativo valore.
	 * <p>
	 * @param attributeTechnicalMap La nuova mappa che associa gli attributi tecnici al loro valore.
	 */
	public void setAttributeTechnicalMap(Map<String, String> attributeTechnicalMap)
	{
		this.attributeTechnicalMap = attributeTechnicalMap;
	}

	/**
	 * Restituisce l'insieme di tag che descrivono il calciatore.
	 * <p>
	 * @return L'insieme di tag.
	 */
	public Set<Tag> getTagSet()
	{
		return tagSet;
	}

	/**
	 * Restituisce la mappa che associa la stagione alla squadra di club in cui ha giocato per la nazionale.
	 * <p>
	 * @return La mappa che associa le stagioni alle squadre di club in nazionale.
	 */
	public Map<String, Team> getNationalCareer()
	{
		return nationalCareer;
	}

	/**
	 * Restituisce la mappa che associa la stagione alla squadra di club in cui ha giocato.
	 * <p>
	 * @return La mappa che associa le stagioni alle squadre di club.
	 */
	public Map<String, Team> getClubCareer()
	{
		return clubCareer;
	}

	/**
	 * Restituisce la mappa dei trofei vinti dal calciatore.
	 * <p>
	 * @return La mappa dei trofei.
	 */
	public Map<Trophy, String> getTrophyMap()
	{
		return trophyMap;
	}

	/**
	 * Restituisce l'insieme di premi individuali ottenuti dal calciatore.
	 * <p>
	 * @return L'insieme di premi individual.
	 */
	public Set<Prize> getPrizeSet()
	{
		return prizeSet;
	}

	/**
	 * Restituisce l'insieme di stagioni in cui il calciatore ha giocato.
	 * <p>
	 * @return L'insieme di stagioni.
	 */
	public Set<String> getPlaySeason()
	{
		return playSeason;
	}
}

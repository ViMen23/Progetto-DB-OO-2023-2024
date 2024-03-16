package model;

import java.util.*;


/**
 * Questa classe rappresenta una squadra di calcio.
 * <p>
 * Una squadra è caratterizzata da:
 *  <li> `type`: Tipo di squadra.
 *  <li> `shortName`: Nome breve della squadra.
 *  <li> `longName`: Nome completo della squadra.
 *  <li> `country`: Nazione di appartenenza.
 *  <li> `confederation`: Confederazione di appartenenza.
 *  <li> `playerMap`: Una rosa di calciatori per una determinata stagione.
 *  <li> `competitionSet`: Insieme di competizioni a cui la squadra ha partecipato.
 *  <li> `trophySet`: Insieme di trofei vinti dalla squadra.
 *  <li> `prizeSet`: Insieme di riconoscimenti individuali ottenuti da giocatori della squadra.
 *  <li> `yearSet`: Insieme di anni in cui la squadra ha partecipato a competizioni.
 */
public class Team
{
	/**
	 * Enumerazione che rappresenta i possibili tipi di squadra.
	 */
	public enum TEAM_TYPE {CLUB, NATIONAL}


	private final String type;
	private String shortName;
	private String longName;
	private final Country country;
	private final Confederation confederation;


	private final Map<String, Player> playerMap;
	private final Set<Competition> competitionSet;
	private final Set<Trophy> trophySet;
	private final Set<Prize> prizeSet;
	private final Set<String> yearSet;


	/**
	 * Costruttore della classe `Team`.
	 * <p>
	 * Crea una nuova istanza di squadra.
	 * <p>
	 * @param type Tipo della squadra.
	 * @param shortName Nome breve della squadra.
	 * @param longName Nome completo della squadra.
	 * @param country Nazione di appartenenza.
	 * @param confederation Confederazione di appartenenza.
	 */
	public Team(String type,
							String shortName,
							String longName,
							Country country,
							Confederation confederation)
	{
		this.type = type;
		this.shortName = shortName;
		this.longName = longName;
		this.country = country;
		this.confederation = confederation;

		this.playerMap = new LinkedHashMap<>();
		this.competitionSet = new HashSet<>();
		this.trophySet = new LinkedHashSet<>();
		this.prizeSet = new LinkedHashSet<>();
		this.yearSet = new LinkedHashSet<>();
	}



	/**
	 * Restituisce il tipo della squadra.
	 * <p>
	 * @return Il tipo della squadra.
	 */
	public String getType()
	{
		return type;
	}

	/**
	 * Restituisce il nome breve della squadra.
	 * <p>
	 * @return Il nome breve della squadra.
	 */
	public String getShortName()
	{
		return shortName;
	}

	/**
	 * Restituisce il nome completo della squadra.
	 * <p>
	 * @return Il nome completo della squadra.
	 */
	public String getLongName()
	{
		return longName;
	}

	/**
	 * Restituisce la nazione di appartenenza della squadra.
	 * <p>
	 * @return La nazione di appartenenza.
	 */
	public Country getCountry()
	{
		return country;
	}

	/**
	 * Restituisce la confederazione di appartenenza della squadra.
	 * <p>
	 * @return La confederazione di appartenenza.
	 */
	public Confederation getConfederation()
	{
		return confederation;
	}


	/**
	 * Imposta il nome breve della squadra.
	 * <p>
	 * @param shortName Il nuovo nome breve della squadra.
	 */
	public void setShortName(String shortName)
	{
		this.shortName = shortName;
	}

	/**
	 * Imposta il nome completo della squadra.
	 * <p>
	 * @param longName Il nuovo nome completo della squadra.
	 */
	public void setLongName(String longName)
	{
		this.longName = longName;
	}

	/**
	 * Restituisce la rosa di calciatori della suqadra in una stagione.
	 * <p>
	 * @return La rosa di calciatori.
	 */
	public Map<String, Player> getPlayerMap()
	{
		return playerMap;
	}

	/**
	 * Restituisce l'insieme di competizioni a cui la squadra ha partecipato.
	 * <p>
	 * @return L'insieme di competizioni.
	 */
	public Set<Competition> getCompetitionSet()
	{
		return competitionSet;
	}

	/**
	 * Restituisce l'insieme di trofei vinti dalla squadra.
	 * <p>
	 * @return L'insieme di trofei.
	 */
	public Set<Trophy> getTrophySet()
	{
		return trophySet;
	}

	/**
	 * Restituisce l'insieme di premi ottenuti dalla squadra.
	 * <p>
	 * @return L'insieme di premi.
	 */
	public Set<Prize> getPrizeSet()
	{
		return prizeSet;
	}

	/**
	 * Restituisce l'insieme di anni in cui la squadra ha partecipato a competizioni.
	 * <p>
	 * @return L'insieme di anni.
	 */
	public Set<String> getYearSet()
	{
		return yearSet;
	}
}

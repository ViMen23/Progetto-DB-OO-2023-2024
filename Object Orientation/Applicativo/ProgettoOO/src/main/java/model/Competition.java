package model;

import java.util.*;

/**
 * Questa classe rappresenta una competizione calcistica.
 */
public class Competition
{
	/**
	 * Enumerazione che rappresenta i possibili tipi di competizione.
	 */
	public enum COMPETITION_TYPE {CUP, LEAGUE, SUPER_CUP}


	private final String type;
	private final String teamType;
	private final String name;
	private final Confederation confederation;
	private final Set<String> editionSet;


	/**
	 * Costruttore della classe `Competition`.
	 * <p>
	 * Crea una nuova competizione con i parametri specificati.
	 * <p>
	 * @param type Tipo di competizione.
	 * @param teamType Tipo di squadra che partecipa alla competizione.
	 * @param name Nome della competizione.
	 * @param confederation Confederazione sportiva di riferimento.
	 */
	public Competition(String type,
										 String teamType,
										 String name,
										 Confederation confederation)
	{
		this.type = type;
		this.teamType = teamType;
		this.name = name;
		this.confederation = confederation;

		this.editionSet = new LinkedHashSet<>();
	}


	/**
	 * Restituisce il tipo di competizione.
	 * <p>
	 * @return Il tipo di competizione.
	 */
	public String getType()
	{
		return type;
	}

	/**
	 * Restituisce il tipo di squadra che partecipa alla competizione.
	 * <p>
	 * @return Il tipo di squadra.
	 */
	public String getTeamType()
	{
		return teamType;
	}

	/**
	 * Restituisce il nome della competizione.
	 * <p>
	 * @return Il nome della competizione.
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Restituisce la confederazione sportiva di riferimento.
	 * <p>
	 * @return La confederazione sportiva di riferimento.
	 */
	public Confederation getConfederation()
	{
		return confederation;
	}

	/**
	 * Restituisce l'insieme delle edizioni della competizione.
	 * <p>
	 * @return Un insieme contenente le edizioni della competizione.
	 */
	public Set<String> getEditionSet()
	{
		return editionSet;
	}
}

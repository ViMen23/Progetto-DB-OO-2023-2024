package model;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * TYPE : class
 * <p>
 * NAME : Prize
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di premio calcistico
 */
public class Prize
{
	public enum AWARD_TYPE {PLAYER, TEAM}
	private static final Map<String, Prize> PRIZE_MAP = new LinkedHashMap<>();
	private final String type;
	private final String role;
	private final String name;
	private final String given;	// ente che assegna il premio calcistico


	public Prize(String type,
							 String role,
							 String name,
							 String given)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.given = given;
	}


	public String getType()
	{
		return type;
	}

	public String getRole()
	{
		return role;
	}

	public String getName()
	{
		return name;
	}

	public String getGiven()
	{
		return given;
	}

	public static Map<String, Prize> getPrizeMap()
	{
		return PRIZE_MAP;
	}
}

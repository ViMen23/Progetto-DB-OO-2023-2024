package model;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * TYPE : class
 * <p>
 * NAME : Trophy
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di trofeo calcistico
 */
public class Trophy
{
	public enum AWARD_TYPE {PLAYER, TEAM}
	private static final Map<String, Trophy> TROPHY_MAP = new LinkedHashMap<>();

	private final String type;
	private final String role;
	private final String name;


	public Trophy(String type,
								String role,
								String name)
	{
		this.type = type;
		this.role = role;
		this.name = name;
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

	public Map<String, Trophy> getTrophyMap()
	{
		return TROPHY_MAP;
	}
}

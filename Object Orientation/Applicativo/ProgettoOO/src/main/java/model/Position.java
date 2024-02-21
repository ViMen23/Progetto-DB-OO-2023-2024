package model;

import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

/**
 * TYPE : class
 * NAME : Position
 *
 * DESC: Classe che rappresenta il concetto astratto di posizione nel campo di gioco
 */
public class Position
{
	public enum ROLE_TYPE {GK, DF, MF, FW};
	private static final Map<String, Position> POSITION_MAP = new LinkedHashMap<String, Position>();

	private final String role;
	private final String code;
	private final String name;

	public Position(String role, String code, String name)
	{
		this.role = role;
		this.code = code;
		this.name = name;
	}


	public String getRole()
	{
		return role;
	}

	public String getCode()
	{
		return code;
	}

	public String getName()
	{
		return name;
	}

	public Map<String, Position> getPositionMap()
	{
		return POSITION_MAP;
	}
}

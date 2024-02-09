package model;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * TYPE : class
 * NAME : Position
 *
 * DESC: Classe che rappresenta il concetto astratto di posizione nel campo di gioco
 */
public class Position
{
	private final EnRole role;
	private final String code;
	private final String name;

	private static Set<Position> positionSet = new LinkedHashSet<Position>();


	public Position(EnRole role, String code, String name)
	{
		this.role = role;
		this.code = code;
		this.name = name;

		// add to set of position
		positionSet.add(this);
	}


	public EnRole getRole()
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

	public Set<Position> getPositionSet()
	{
		return positionSet;
	}

}

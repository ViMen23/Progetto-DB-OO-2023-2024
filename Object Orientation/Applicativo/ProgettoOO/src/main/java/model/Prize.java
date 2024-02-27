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
	private final Player player;
	private final Team team;
	private final String assignedYear;


	public Prize(String type,
							 String role,
							 String name,
							 String given,
							 Player player,
							 Team team,
							 String assignedYear)
	{
		this.type = type;
		this.role = role;
		this.name = name;
		this.given = given;
		this.player = player;
		this.team = team;
		this.assignedYear = assignedYear;
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

	public Player getPlayer()
	{
		return player;
	}

	public Team getTeam()
	{
		return team;
	}

	public String getAssignedYear()
	{
		return assignedYear;
	}

	public Map<String, Prize> getPrizeMap()
	{
		return PRIZE_MAP;
	}
}

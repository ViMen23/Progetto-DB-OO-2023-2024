package model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * TYPE : class
 * <p>
 * NAME : Player
 * <p>
 * DESC: Classe che rappresenta il concetto astratto di calciatore
 */
public class Player
{
	public enum FOOT_TYPE {EITHER, LEFT, RIGHT}
	private static final Map<String, Player> PLAYER_MAP = new LinkedHashMap<>();
	private static Integer totalPlayers = 0;

	private String name;
	private String surname;
	private String dob;
	private Country country;
	private String foot;
	private Position position;
	private String role;
	private String retiredDate;

	private List<Statistic> statisticList;


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

		this.statisticList = new ArrayList<>();
	}

	public Integer getTotalPlayers()
	{
		return totalPlayers;
	}

	public void setTotalPlayers(Integer totalPlayers)
	{
		Player.totalPlayers = totalPlayers;
	}

	public String getName()
	{
		return name;
	}

	public String getSurname()
	{
		return surname;
	}

	public String getDob()
	{
		return dob;
	}

	public Country getCountry()
	{
		return country;
	}

	public String getFoot()
	{
		return foot;
	}

	public Position getPosition()
	{
		return position;
	}

	public String getRole()
	{
		return role;
	}

	public String getRetiredDate()
	{
		return retiredDate;
	}

	public Map<String, Player> getPlayerMap()
	{
		return PLAYER_MAP;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public void setSurname(String surname)
	{
		this.surname = surname;
	}

	public void setDob(String dob)
	{
		this.dob = dob;
	}

	public void setCountry(Country country)
	{
		this.country = country;
	}

	public void setFoot(String foot)
	{
		this.foot = foot;
	}

	public void setPosition(Position position)
	{
		this.position = position;
	}

	public void setRole(String role)
	{
		this.role = role;
	}

	public void setRetiredDate(String retiredDate)
	{
		this.retiredDate = retiredDate;
	}

	public List<Statistic> getStatisticList()
	{
		return statisticList;
	}
}

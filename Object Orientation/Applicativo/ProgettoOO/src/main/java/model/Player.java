package model;

import java.util.*;

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

	private Map<String, String> attributeGoalkeepingMap;
	private Map<String, String> attributeMentalMap;
	private Map<String, String> attributePhysicalMap;
	private Map<String, String> attributeTechnicalMap;

	private Set<Tag> tagSet;

	private final Set<Position> positionSet;
	private final Set<Country> countrySet;

	private final List<Statistic> statisticList;


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
		this.positionSet = new LinkedHashSet<>();
		this.countrySet = new LinkedHashSet<>();

		this.attributeGoalkeepingMap = new LinkedHashMap<>();
		this.attributeMentalMap = new LinkedHashMap<>();
		this.attributePhysicalMap = new LinkedHashMap<>();
		this.attributeTechnicalMap = new LinkedHashMap<>();

		this.tagSet = new LinkedHashSet<>();
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

	public Set<Position> getPositionSet()
	{
		return positionSet;
	}

	public Set<Country> getCountrySet()
	{
		return countrySet;
	}

	public Map<String, String> getAttributeGoalkeepingMap()
	{
		return attributeGoalkeepingMap;
	}

	public void setAttributeGoalkeepingMap(Map<String, String> attributeGoalkeepingMap)
	{
		this.attributeGoalkeepingMap = attributeGoalkeepingMap;
	}

	public Map<String, String> getAttributeMentalMap()
	{
		return attributeMentalMap;
	}

	public void setAttributeMentalMap(Map<String, String> attributeMentalMap)
	{
		this.attributeMentalMap = attributeMentalMap;
	}

	public Map<String, String> getAttributePhysicalMap()
	{
		return attributePhysicalMap;
	}

	public void setAttributePhysicalMap(Map<String, String> attributePhysicalMap)
	{
		this.attributePhysicalMap = attributePhysicalMap;
	}

	public Map<String, String> getAttributeTechnicalMap()
	{
		return attributeTechnicalMap;
	}

	public void setAttributeTechnicalMap(Map<String, String> attributeTechnicalMap)
	{
		this.attributeTechnicalMap = attributeTechnicalMap;
	}

	public Set<Tag> getTagSet()
	{
		return tagSet;
	}
}

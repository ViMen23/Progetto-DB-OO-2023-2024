package controller;

import dao.*;
import gui.GuiConfiguration;
import gui.Regex;
import model.*;
import postgresImplDAO.*;

import java.util.*;

/**
 * TYPE : class - controller package
 * NAME : Controller
 *
 * DESC: TODO
 */
public class Controller
{
	private final Admin ctrlAdmin;
	private final Country ctrlCountry;
	private final Confederation ctrlConfederation;
	private final Competition ctrlCompetition;
	private final Team ctrlTeam;
	private final Position ctrlPosition;
	private final Player ctrlPlayer;
	private static Controller controllerInstance = null;

	private Controller()
	{
		this.ctrlAdmin = new Admin(null, null);
		this.ctrlCountry = new Country(null, null, null, null);
		this.ctrlConfederation = new Confederation(null, null, null, null);
		this.ctrlCompetition = new Competition(null, null, null, null);
		this.ctrlTeam = new Team(null, null, null, null);
		this.ctrlPosition = new Position(null, null, null);
		this.ctrlPlayer = new Player(null, null, null, null, null, null, null, null);
	}

	/**
	 * Restiruisce una istanza del controller.
	 * Visto il design pattern scelto il controller e' unico.
	 * Nel caso non fosse presente un'istanza ne crea una.
	 * @return un'istanza della classe Controller
	 */
	public static Controller getInstance()
	{
		if (null == controllerInstance) {
			controllerInstance = new Controller();
		}

		return controllerInstance;
	}


	/*--------------------------------------------------------------------------------------------------------
	 * ADMIN
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * Controlla che l'username e la password inseriti
	 * appartengano ad un admin con privilegio di login nell'applicativo
	 * confrontando i valori in input con dati contenuti del DataBase.
	 * <p>
	 * Controlla che sia username che password rispettino dei pattern dettati da regex.
	 * <p>
	 * Controlla che non ci siano altri admin connessi sulla stessa istanza dell'applicativo.
	 * <p>
	 * @param username	username dell'utente che prova ad accedere
	 * @param password	password dell'utente che prova ad accedere
	 * <p>
	 * @return					true in caso di login positivo, false altrimenti
	 */
	public Boolean isAdmin(String username,
												 String password)
	{
		if (null == username || !(Regex.patternUsername.matcher(username).find())) {
			return false;
		}

		if (null == password || !(Regex.patternPassword.matcher(password).find())) {
			return false;
		}

		if (ctrlAdmin.getAdminConnected() != null) {
			return false;
		}

		Admin admin = newAdmin(username, password);

		AdminDAO adminDAO = new PostgresImplAdminDAO();
		if (adminDAO.adminDB(admin.getUsername(), admin.getPassword())) {
			ctrlAdmin.setAdminConnected(admin);
			System.out.println("Connesso");
			return true;
		}

		return false;
	}


	/**
	 * Crea una nuova istanza della classe Admin
	 * chiamando il costruttore della classe.
	 * Restituisce l'istanza creata.
	 * @param username
	 * @param password
	 * @return un'istanza della classe Admin
	 */
	public Admin newAdmin(String username, String password)
	{
		return new Admin(username, password);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COUNTRY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param ID
	 * @param type
	 * @param code
	 * @param name
	 * @param superCountry
	 * @return
	 */
	public Country newCountry(String ID, String type, String code, String name, Country superCountry)
	{
		Country country = ctrlCountry.getCountryMap().get(ID);

		if (null == country) {
			country = new Country(type, code, name, superCountry);
		}

		return country;
	}

	/**
	 * TODO
	 * @param ID
	 * @param name
	 * @return
	 */
	public Country newCountry(String ID, String name)
	{
		return newCountry(ID, null, null, name, null);
	}



	/**
	 * TODO
	 * @return
	 */
	public Integer countCountries()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();

		ctrlCountry.setTotalCountries(countryDAO.countAllCountriesDB());

		return ctrlCountry.getTotalCountries();
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superCountryID
	 */
	public void getCountries(String countryType,
													 String superCountryID)
	{
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryType = new ArrayList<>();
		List<String> listCountryCode = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();
		List<String> listSuperCountryID = new ArrayList<>();
		List<String> listSuperCountryName = new ArrayList<>();

		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.countriesDB
						(
										countryType,
										superCountryID,
										listCountryID,
										listCountryType,
										listCountryCode,
										listCountryName,
										listSuperCountryID,
										listSuperCountryName
						);

		ctrlCountry.getCountryMap().clear();

		Map<String, Country> superCountryMap = new LinkedHashMap<>();

		for (String ID : listSuperCountryID) {
			Country country = newCountry
							(
											ID,
											listSuperCountryName.removeFirst()
							);

			superCountryMap.put(ID, country);
		}


		while (!(listCountryID.isEmpty())) {
			String ID = listCountryID.removeFirst();
			Country country = newCountry
							(
											ID,
											listCountryType.removeFirst(),
											listCountryCode.removeFirst(),
											listCountryName.removeFirst(),
											superCountryMap.get(listSuperCountryID.removeFirst())
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}

	}


	/**
	 * TODO
	 * @param countryNameVector
	 * @param countryNameMap
	 * @param countryType
	 * @param superCountryID
	 */
	public void getCountryList(Vector<String> countryNameVector,
														 Map<String, String> countryNameMap,
														 String countryType,
														 String superCountryID)
	{
		getCountries(countryType, superCountryID);

		for (String key : ctrlCountry.getCountryMap().keySet()) {

			String countryName = ctrlCountry.getCountryMap().get(key).getName();

			countryNameVector.add(countryName);
			countryNameMap.put(countryName, key);
		}
	}


	/**
	 * TODO
	 * @param countryTableColumnName
	 * @param countryTableData
	 * @param countryType
	 * @param superCountryID
	 */
	public void getCountryList(Vector<String> countryTableColumnName,
														 Vector<Vector<String>> countryTableData,
														 String countryType,
														 String superCountryID)
	{
		getCountries(countryType, superCountryID);

		String string;

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		countryTableColumnName.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		countryTableColumnName.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		countryTableColumnName.add(string);

		string = GuiConfiguration.getMessage("superCountry");
		string = string.toUpperCase();
		countryTableColumnName.add(string);

		for (String key : ctrlCountry.getCountryMap().keySet()) {
			Vector<String> countryVector = new Vector<>();

			Country country = ctrlCountry.getCountryMap().get(key);

			countryVector.add(country.getName());
			countryVector.add(country.getCode());
			countryVector.add(country.getType());

			if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
				countryVector.add("");
			} else {
				countryVector.add(country.getSuperCountry().getName());
			}

			countryTableData.add(countryVector);
		}
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * CONFEDERATION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param ID
	 * @param shortName
	 * @param longName
	 * @param country
	 * @param superConfederation
	 * @return
	 */
	public Confederation newConfederation(String ID,
																				String shortName,
																				String longName,
																				Country country,
																				Confederation superConfederation)
	{
		Confederation confederation = ctrlConfederation.getConfederationMap().get(ID);

		if (null == confederation) {
			confederation = new Confederation(shortName, longName, country, superConfederation);
		}

		return confederation;
	}

	/**
	 * TODO
	 * @param ID
	 * @param shortName
	 * @return
	 */
	public Confederation newConfederation(String ID,
																				String shortName)
	{
		return newConfederation
						(
										ID,
										shortName,
										null,
										null,
										null
						);
	}

	/**
	 * TODO
	 * @param ID
	 * @param shortName
	 * @param country
	 * @return
	 */
	public Confederation newConfederation(String ID,
																				String shortName,
																				Country country)
	{
		return newConfederation
						(
										ID,
										shortName,
										null,
										country,
										null
						);
	}


	/**
	 * TODO
	 * @return
	 */
	public Integer countConfederations()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();

		ctrlConfederation.setTotalConfederations(confederationDAO.countAllConfederationsDB());

		return ctrlConfederation.getTotalConfederations();
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superConfederationsID
	 */
	public void getConfederations(String countryType,
																String superConfederationsID)
	{
		List<String> listConfederationID = new ArrayList<>();
		List<String> listConfederationShortName = new ArrayList<>();
		List<String> listConfederationLongName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();
		List<String> listSuperConfederationID = new ArrayList<>();
		List<String> listSuperConfederationShortName = new ArrayList<>();

		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.confederationsDB
						(
										countryType,
										superConfederationsID,
										listConfederationID,
										listConfederationShortName,
										listConfederationLongName,
										listCountryID,
										listCountryName,
										listSuperConfederationID,
										listSuperConfederationShortName
						);


		ctrlCountry.getCountryMap().clear();

		for (String ID : listCountryID) {
			Country country = newCountry
							(
											ID,
											listCountryName.removeFirst()
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}


		ctrlConfederation.getConfederationMap().clear();

		Map<String, Confederation> superConfederationMap = new LinkedHashMap<>();

		for (String ID : listSuperConfederationID) {
			Confederation confederation = newConfederation
							(
											ID,
											listSuperConfederationShortName.removeFirst()
							);

			superConfederationMap.put(ID, confederation);
		}



		while (!(listConfederationID.isEmpty())) {
			String ID = listConfederationID.removeFirst();
			Confederation confederation = newConfederation
							(
											ID,
											listConfederationShortName.removeFirst(),
											listConfederationLongName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											superConfederationMap.get(listSuperConfederationID.removeFirst())
							);

			ctrlConfederation.getConfederationMap().put(ID, confederation);
		}

	}


	/**
	 * TODO
	 * @param confederationShortNameVector
	 * @param confederationShortNameMap
	 * @param typeCountry
	 * @param superConfederationID
	 */
	public void getConfederationList(Vector<String> confederationShortNameVector,
																	 Map<String, String> confederationShortNameMap,
																	 String typeCountry,
																	 String superConfederationID)
	{
		getConfederations(typeCountry, superConfederationID);

		for (String key : ctrlConfederation.getConfederationMap().keySet()) {

			String confederationShortName = ctrlConfederation.getConfederationMap().get(key).getShortName();

			confederationShortNameVector.add(confederationShortName);
			confederationShortNameMap.put(confederationShortName, key);
		}
	}


	public void getConfederationList(Vector<String> confederationTableColumnName,
																	 Vector<Vector<String>> confederationTableData,
																	 String countryType,
																	 String superConfederationID)
	{
		getConfederations(countryType, superConfederationID);

		String string;

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		confederationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		confederationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		confederationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("superConfederation");
		string = string.toUpperCase();
		confederationTableColumnName.add(string);

		for (String key : ctrlConfederation.getConfederationMap().keySet()) {
			Vector<String> confederationVector = new Vector<>();

			Confederation confederation = ctrlConfederation.getConfederationMap().get(key);

			confederationVector.add(confederation.getLongName());
			confederationVector.add(confederation.getShortName());
			confederationVector.add(confederation.getCountry().getName());

			if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
				confederationVector.add("");
			} else {
				confederationVector.add(confederation.getSuperConfederation().getShortName());
			}

			confederationTableData.add(confederationVector);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COMPETITION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param ID
	 * @param type
	 * @param teamType
	 * @param name
	 * @param confederation
	 * @return
	 */
	public Competition newCompetition(String ID,
																		String type,
																		String teamType,
																		String name,
																		Confederation confederation)
	{
		Competition competition = ctrlCompetition.getCompetitionMap().get(ID);

		if (null == competition) {
			competition = new Competition(type, teamType, name, confederation);
		}

		return competition;
	}


	/**
	 * TODO
	 * @return
	 */
	public Integer countCompetitions()
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();

		ctrlCompetition.setTotalCompetitions(competitionDAO.countAllCompetitionsDB());

		return ctrlCompetition.getTotalCompetitions();
	}


	/**
	 * TODO
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryType
	 * @param competitionContinentID
	 * @param competitionNationID
	 */
	public void searchCompetitions(String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID)
	{
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionType = new ArrayList<>();
		List<String> listCompetitionTeamType = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();
		List<String> listConfederationID = new ArrayList<>();
		List<String> listConfederationShortName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.competitionsDB
						(
										competitionSubName,
										competitionType,
										competitionTeamType,
										competitionCountryType,
										competitionContinentID,
										competitionNationID,
										listCompetitionID,
										listCompetitionType,
										listCompetitionTeamType,
										listCompetitionName,
										listConfederationID,
										listConfederationShortName,
										listCountryID,
										listCountryName
						);


		ctrlCountry.getCountryMap().clear();

		for (String ID : listCountryID) {
			Country country = newCountry
							(
											ID,
											listCountryName.removeFirst()
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}

		ctrlConfederation.getConfederationMap().clear();

		for (String ID : listConfederationID) {
			Confederation confederation = newConfederation
							(
											ID,
											listConfederationShortName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst())
							);

			ctrlConfederation.getConfederationMap().put(ID, confederation);
		}

		ctrlCompetition.getCompetitionMap().clear();

		while (!(listCompetitionID.isEmpty())) {
			String ID = listCompetitionID.removeFirst();
			Competition competition = newCompetition
							(
											ID,
											listCompetitionType.removeFirst(),
											listCompetitionTeamType.removeFirst(),
											listCompetitionName.removeFirst(),
											ctrlConfederation.getConfederationMap().get(listConfederationID.removeFirst())
							);

			ctrlCompetition.getCompetitionMap().put(ID, competition);
		}

	}


	/**
	 * TODO
	 * @param competitionNameVector
	 * @param competitionNameMap
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryType
	 */
	public void getCompetitionList(Vector<String> competitionNameVector,
																 Map<String, String> competitionNameMap,
																 String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID)
	{
		searchCompetitions
						(
										competitionSubName,
										competitionType,
										competitionTeamType,
										competitionCountryType,
										competitionContinentID,
										competitionNationID
						);

		for (String key : ctrlCompetition.getCompetitionMap().keySet()) {

			String competitionName = ctrlCompetition.getCompetitionMap().get(key).getName();

			competitionNameVector.add(competitionName);
			competitionNameMap.put(competitionName, key);
		}
	}


	/**
	 * TODO
	 * @param competitionTableColumnName
	 * @param competitionTableData
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryType
	 * @param competitionContinentID
	 * @param competitionNationID
	 */
	public void getCompetitionList(Vector<String> competitionTableColumnName,
																 Vector<Vector<String>> competitionTableData,
																 String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryType,
																 String competitionContinentID,
																 String competitionNationID)
	{
		searchCompetitions
						(
										competitionSubName,
										competitionType,
										competitionTeamType,
										competitionCountryType,
										competitionContinentID,
										competitionNationID
						);

		String string;

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		competitionTableColumnName.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		competitionTableColumnName.add(string);

		string = GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();
		competitionTableColumnName.add(string);

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		competitionTableColumnName.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		competitionTableColumnName.add(string);


		for (String key : ctrlCompetition.getCompetitionMap().keySet()) {
			Vector<String> competitionVector = new Vector<>();

			Competition competition = ctrlCompetition.getCompetitionMap().get(key);

			competitionVector.add(competition.getName());
			competitionVector.add(competition.getType());
			competitionVector.add(competition.getTeamType());
			competitionVector.add(competition.getConfederation().getShortName());
			competitionVector.add(competition.getConfederation().getCountry().getName());

			competitionTableData.add(competitionVector);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TEAM
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param ID
	 * @param type
	 * @param shortName
	 * @param longName
	 * @param country
	 * @return
	 */
	public Team newTeam(String ID, String type, String shortName, String longName, Country country)
	{
		Team team = ctrlTeam.getTeamMap().get(ID);

		if (null == team) {
			team = new Team(type, shortName, longName, country);
		}

		return team;
	}


	/**
	 * TODO
	 * @return
	 */
	public Integer countTeams()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();

		ctrlTeam.setTotalTeam(teamDAO.countAllTeamsDB());

		return ctrlTeam.getTotalTeam();
	}


	/**
	 * TODO
	 * @param teamSubLongName
	 * @param teamSubShortName
	 * @param teamType
	 * @param teamCountryType
	 * @param teamContinentID
	 * @param teamNationID
	 */
	public void searchTeams(String teamSubLongName,
													String teamSubShortName,
													String teamType,
													String teamContinentID,
													String teamNationID)
	{
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamType = new ArrayList<>();
		List<String> listTeamShortName = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.teamsDB
						(
										teamSubLongName,
										teamSubShortName,
										teamType,
										teamContinentID,
										teamNationID,
										listTeamID,
										listTeamType,
										listTeamShortName,
										listTeamLongName,
										listCountryID,
										listCountryName
						);

		ctrlCountry.getCountryMap().clear();

		for (String ID : listCountryID) {
			Country country = newCountry
							(
											ID,
											listCountryName.removeFirst()
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}

		ctrlTeam.getTeamMap().clear();

		while (!(listTeamID.isEmpty())) {
			String ID = listTeamID.removeFirst();
			Team team = newTeam
							(
											ID,
											listTeamType.removeFirst(),
											listTeamShortName.removeFirst(),
											listTeamLongName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst())
							);

			ctrlTeam.getTeamMap().put(ID, team);
		}

	}


	/**
	 * TODO
	 * @param teamLongNameVector
	 * @param teamLongNameMap
	 * @param teamSubLongName
	 * @param teamSubShortName
	 * @param teamType
	 * @param teamContinentID
	 * @param teamNationID
	 */
	public void getTeamList(Vector<String> teamLongNameVector,
													Map<String, String> teamLongNameMap,
													String teamSubLongName,
													String teamSubShortName,
													String teamType,
													String teamContinentID,
													String teamNationID)
	{
		searchTeams
						(
										teamSubLongName,
										teamSubShortName,
										teamType,
										teamContinentID,
										teamNationID
						);

		for (String key : ctrlTeam.getTeamMap().keySet()) {

			String teamLongName = ctrlTeam.getTeamMap().get(key).getLongName();

			teamLongNameVector.add(teamLongName);
			teamLongNameMap.put(teamLongName, key);
		}
	}


	/**
	 * TODO
	 * @param teamTableColumnName
	 * @param teamTableData
	 * @param teamSubLongName
	 * @param teamSubShortName
	 * @param teamType
	 * @param teamContinentID
	 * @param teamNationID
	 */
	public void getTeamList(Vector<String> teamTableColumnName,
													Vector<Vector<String>> teamTableData,
													String teamSubLongName,
													String teamSubShortName,
													String teamType,
													String teamContinentID,
													String teamNationID)
	{
		searchTeams
						(
										teamSubLongName,
										teamSubShortName,
										teamType,
										teamContinentID,
										teamNationID
						);

		String string;

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		teamTableColumnName.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		teamTableColumnName.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		teamTableColumnName.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		teamTableColumnName.add(string);


		for (String key : ctrlTeam.getTeamMap().keySet()) {
			Vector<String> teamVector = new Vector<>();

			Team team = ctrlTeam.getTeamMap().get(key);

			teamVector.add(team.getLongName());
			teamVector.add(team.getShortName());
			teamVector.add(team.getType());
			teamVector.add(team.getCountry().getName());

			teamTableData.add(teamVector);
		}
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PLAYER
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param ID
	 * @param name
	 * @param surname
	 * @param dob
	 * @param country
	 * @param foot
	 * @param position
	 * @param role
	 * @param retiredDate
	 * @return
	 */
	public Player newPlayer(String ID,
													String name,
													String surname,
													String dob,
													Country country,
													String foot,
													Position position,
													String role,
													String retiredDate)
	{
		Player player = ctrlPlayer.getPlayerMap().get(ID);

		if (null == player) {
			player = new Player(name, surname, dob, country, foot, position, role, retiredDate);
		}

		return player;
	}


	/**
	 * TODO
	 * @return
	 */
	public Integer countPlayers()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();

		ctrlPlayer.setTotalPlayers(playerDAO.countAllPlayersDB());

		return ctrlPlayer.getTotalPlayers();
	}


	/**
	 * TODO
	 * @param playerSubName
	 * @param playerSubSurname
	 * @param playerReferringYear
	 * @param playerMinAge
	 * @param playerMaxAge
	 * @param playerContinentID
	 * @param playerNationID
	 * @param playerRole
	 * @param playerPositionID
	 * @param playerFoot
	 */
	public void searchPlayers(String playerSubName,
														String playerSubSurname,
														String playerReferringYear,
														String playerMinAge,
														String playerMaxAge,
														String playerContinentID,
														String playerNationID,
														String playerRole,
														String playerPositionID,
														String playerFoot)
	{
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listPlayerDob = new ArrayList<>();
		List<String> listPlayerFoot = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();
		List<String> listPlayerRetiredDate = new ArrayList<>();
		List<String> listPositionID = new ArrayList<>();
		List<String> listPositionName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.playersDB
						(
										playerSubName,
										playerSubSurname,
										playerReferringYear,
										playerMinAge,
										playerMaxAge,
										playerContinentID,
										playerNationID,
										playerRole,
										playerPositionID,
										playerFoot,
										listPlayerID,
										listPlayerName,
										listPlayerSurname,
										listPlayerDob,
										listPlayerFoot,
										listPlayerRole,
										listPlayerRetiredDate,
										listPositionID,
										listPositionName,
										listCountryID,
										listCountryName
						);

		ctrlCountry.getCountryMap().clear();

		for (String ID : listCountryID) {
			Country country = newCountry
							(
											ID,
											listCountryName.removeFirst()
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}


		ctrlPosition.getPositionMap().clear();

		for (String ID : listPositionID) {
			Position position = newPosition
							(
											ID,
											listPositionName.removeFirst()
							);

			ctrlPosition.getPositionMap().put(ID, position);
		}

		ctrlPlayer.getPlayerMap().clear();

		while (!(listPlayerID.isEmpty())) {
			String ID = listPlayerID.removeFirst();
			Player player = newPlayer
							(
											ID,
											listPlayerName.removeFirst(),
											listPlayerSurname.removeFirst(),
											listPlayerDob.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											listPlayerFoot.removeFirst(),
											ctrlPosition.getPositionMap().get(listPositionID.removeFirst()),
											listPlayerRole.removeFirst(),
											listPlayerRetiredDate.removeFirst()
							);

			ctrlPlayer.getPlayerMap().put(ID, player);
		}

	}


	/**
	 * TODO
	 * @param militancyPlayerTeamID
	 * @param militancyPlayerStartYear
	 * @param militancyPlayerEndYear
	 */
	public void searchMilitancyPlayers(String militancyPlayerTeamID,
																		 String militancyPlayerStartYear,
																		 String militancyPlayerEndYear)
	{
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listPlayerDob = new ArrayList<>();
		List<String> listPlayerFoot = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();
		List<String> listPlayerRetiredDate = new ArrayList<>();
		List<String> listPositionID = new ArrayList<>();
		List<String> listPositionName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.militancyPlayersDB
						(
										militancyPlayerTeamID,
										militancyPlayerStartYear,
										militancyPlayerEndYear,
										listPlayerID,
										listPlayerName,
										listPlayerSurname,
										listPlayerDob,
										listPlayerFoot,
										listPlayerRole,
										listPlayerRetiredDate,
										listPositionID,
										listPositionName,
										listCountryID,
										listCountryName
						);

		ctrlCountry.getCountryMap().clear();

		for (String ID : listCountryID) {
			Country country = newCountry
							(
											ID,
											listCountryName.removeFirst()
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}


		ctrlPosition.getPositionMap().clear();

		for (String ID : listPositionID) {
			Position position = newPosition
							(
											ID,
											listPositionName.removeFirst()
							);

			ctrlPosition.getPositionMap().put(ID, position);
		}

		ctrlPlayer.getPlayerMap().clear();

		while (!(listPlayerID.isEmpty())) {
			String ID = listPlayerID.removeFirst();
			Player player = newPlayer
							(
											ID,
											listPlayerName.removeFirst(),
											listPlayerSurname.removeFirst(),
											listPlayerDob.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											listPlayerFoot.removeFirst(),
											ctrlPosition.getPositionMap().get(listPositionID.removeFirst()),
											listPlayerRole.removeFirst(),
											listPlayerRetiredDate.removeFirst()
							);

			ctrlPlayer.getPlayerMap().put(ID, player);
		}

	}


	/**
	 * TODO
	 * @param playerInfoVector
	 * @param playerInfoMap
	 * @param playerSubName
	 * @param playerSubSurname
	 * @param playerReferringYear
	 * @param playerMinAge
	 * @param playerMaxAge
	 * @param playerContinentID
	 * @param playerNationID
	 * @param playerRole
	 * @param playerPositionID
	 * @param playerFoot
	 */
	public void getPlayerList(Vector<String> playerInfoVector,
														Map<String, String> playerInfoMap,
														String playerSubName,
														String playerSubSurname,
														String playerReferringYear,
														String playerMinAge,
														String playerMaxAge,
														String playerContinentID,
														String playerNationID,
														String playerRole,
														String playerPositionID,
														String playerFoot)
	{
		searchPlayers
						(
										playerSubName,
										playerSubSurname,
										playerReferringYear,
										playerMinAge,
										playerMaxAge,
										playerContinentID,
										playerNationID,
										playerRole,
										playerPositionID,
										playerFoot
						);


		for (String key : ctrlPlayer.getPlayerMap().keySet()) {

			String playerInfo = ctrlPlayer.getPlayerMap().get(key).getName();
			playerInfo += " ";
			playerInfo += ctrlPlayer.getPlayerMap().get(key).getSurname();

			playerInfoVector.add(playerInfo);
			playerInfoMap.put(playerInfo, key);
		}
	}


	public void getPlayerList(Vector<String> playerTableColumnName,
														Vector<Vector<String>> playerTableData,
														String playerSubName,
														String playerSubSurname,
														String playerReferringYear,
														String playerMinAge,
														String playerMaxAge,
														String playerContinentID,
														String playerNationID,
														String playerRole,
														String playerPositionID,
														String playerFoot)
	{
		searchPlayers
						(
										playerSubName,
										playerSubSurname,
										playerReferringYear,
										playerMinAge,
										playerMaxAge,
										playerContinentID,
										playerNationID,
										playerRole,
										playerPositionID,
										playerFoot
						);


		String string;

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("dob");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("foot");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("position");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("retiredDate");
		string = string.toUpperCase();
		playerTableColumnName.add(string);


		for (String key : ctrlPlayer.getPlayerMap().keySet()) {
			Vector<String> playerVector = new Vector<>();

			Player player = ctrlPlayer.getPlayerMap().get(key);

			playerVector.add(player.getSurname());
			playerVector.add(player.getName());
			playerVector.add(player.getDob());
			playerVector.add(player.getCountry().getName());
			playerVector.add(player.getFoot());
			playerVector.add(player.getRole());
			playerVector.add(player.getPosition().getName());

			if (null == player.getRetiredDate()) {
				playerVector.add("");
			} else {
				playerVector.add(player.getRetiredDate());
			}

			playerTableData.add(playerVector);
		}
	}


	/**
	 * TODO
	 * @param playerTableColumnName
	 * @param playerTableData
	 * @param militancyPlayerTeamID
	 * @param militancyPlayerStartYear
	 * @param militancyPlayerEndYear
	 */
	public void getPlayerList(Vector<String> playerTableColumnName,
														Vector<Vector<String>> playerTableData,
														String militancyPlayerTeamID,
														String militancyPlayerStartYear,
														String militancyPlayerEndYear)
	{
		searchMilitancyPlayers
						(
										militancyPlayerTeamID,
										militancyPlayerStartYear,
										militancyPlayerEndYear
						);

		String string;

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("dob");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("foot");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("position");
		string = string.toUpperCase();
		playerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("retiredDate");
		string = string.toUpperCase();
		playerTableColumnName.add(string);


		for (String key : ctrlPlayer.getPlayerMap().keySet()) {
			Vector<String> playerVector = new Vector<>();

			Player player = ctrlPlayer.getPlayerMap().get(key);

			playerVector.add(player.getSurname());
			playerVector.add(player.getName());
			playerVector.add(player.getDob());
			playerVector.add(player.getCountry().getName());
			playerVector.add(player.getFoot());
			playerVector.add(player.getRole());
			playerVector.add(player.getPosition().getName());

			if (null == player.getRetiredDate()) {
				playerVector.add("");
			} else {
				playerVector.add(player.getRetiredDate());
			}

			playerTableData.add(playerVector);
		}
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * POSITION
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param ID
	 * @param role
	 * @param code
	 * @param name
	 * @return
	 */
	public Position newPosition(String ID, String role, String code, String name)
	{
		Position position = ctrlPosition.getPositionMap().get(ID);

		if (null == position) {
			position = new Position(role, code, name);
		}

		return position;
	}

	/**
	 * TODO
	 * @param ID
	 * @param name
	 * @return
	 */
	public Position newPosition(String ID, String name)
	{
		return newPosition(ID, null, null, name);
	}

	/**
	 * TODO
	 */
	public void allPositions()
	{
		List<String> listPositionID = new ArrayList<>();
		List<String> listPositionRole = new ArrayList<>();
		List<String> listPositionCode = new ArrayList<>();
		List<String> listPositionName = new ArrayList<>();

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.positionsDB
						(
										listPositionID,
										listPositionRole,
										listPositionCode,
										listPositionName
						);

		ctrlPosition.getPositionMap().clear();

		while (!(listPositionID.isEmpty())) {
			String ID = listPositionID.removeFirst();
			Position position = newPosition
							(
											ID,
											listPositionRole.removeFirst(),
											listPositionCode.removeFirst(),
											listPositionName.removeFirst()
							);

			ctrlPosition.getPositionMap().put(ID, position);
		}

	}


	/**
	 * TODO
	 * @param positionNameVector
	 * @param positionNameMap
	 */
	public void getPositionList(Vector<String> positionNameVector,
															Map<String, String> positionNameMap)
	{
		allPositions();

		for (String key : ctrlPosition.getPositionMap().keySet()) {

			String positionName = ctrlPosition.getPositionMap().get(key).getName();

			positionNameVector.add(positionName);
			positionNameMap.put(positionName, key);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


}

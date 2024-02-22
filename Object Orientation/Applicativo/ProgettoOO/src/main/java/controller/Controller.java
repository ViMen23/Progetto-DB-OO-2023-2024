package controller;

import dao.*;
import gui.Regex;
import model.*;
import postgresImplDAO.*;

import java.util.ArrayList;
import java.util.List;

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
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryType = new ArrayList<String>();
		List<String> listCountryCode = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.countriesDB
						(
										countryType, superCountryID,
										listCountryID, listCountryType, listCountryCode, listCountryName
						);

		ctrlCountry.getCountryMap().clear();

		Country superCountry;
		if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
			superCountry = null;
		} else {
			superCountry = newCountry
							(
											listCountryID.removeFirst(),
											listCountryType.removeFirst(),
											listCountryCode.removeFirst(),
											listCountryName.removeFirst(),
											null
							);
		}

		while (!(listCountryID.isEmpty())) {
			String ID = listCountryID.removeFirst();
			Country country = newCountry
							(
											ID,
											listCountryType.removeFirst(),
											listCountryCode.removeFirst(),
											listCountryName.removeFirst(),
											superCountry
							);

			ctrlCountry.getCountryMap().put(ID, country);
		}

	}


	/**
	 * TODO
	 * @param countryType
	 * @param superCountryID
	 * @param full
	 * @return
	 */
	public List<List<String>> getCountryList(String countryType, String superCountryID, Boolean full)
	{
		getCountries(countryType, superCountryID);

		List<List<String>> outerCountryList = new ArrayList<List<String>>();

		for (String key : ctrlCountry.getCountryMap().keySet()) {
			List<String> innerCountryList = new ArrayList<String>();
			Country country = ctrlCountry.getCountryMap().get(key);

			innerCountryList.add(country.getName());

			if (full) {
				innerCountryList.add(country.getCode());
				innerCountryList.add(country.getType());
				innerCountryList.add(country.getSuperCountry().getName()); // TODO: try catch?
			}

			innerCountryList.add(key);

			outerCountryList.add(innerCountryList);
		}

		return outerCountryList;
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
	public Confederation newConfederation(String ID, String shortName, String longName,
																				Country country, Confederation superConfederation)
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
	public Confederation newConfederation(String ID, String shortName)
	{
		return newConfederation(ID, shortName, null, null, null);
	}

	/**
	 * TODO
	 * @param ID
	 * @param shortName
	 * @param country
	 * @return
	 */
	public Confederation newConfederation(String ID, String shortName, Country country)
	{
		return newConfederation(ID, shortName, null, country, null);
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
		List<String> listConfederationID = new ArrayList<String>();
		List<String> listConfederationShortName = new ArrayList<String>();
		List<String> listConfederationLongName = new ArrayList<String>();
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.confederationsDB
						(
										countryType, superConfederationsID,
										listConfederationID, listConfederationShortName, listConfederationLongName,
										listCountryID, listCountryName
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

		Confederation superConfederation;
		if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
			superConfederation = null;
		} else {
			superConfederation = newConfederation
							(
											listConfederationID.removeFirst(),
											listConfederationShortName.removeFirst(),
											listConfederationLongName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											null
							);
		}

		while (!(listConfederationID.isEmpty())) {
			String ID = listConfederationID.removeFirst();
			Confederation confederation = newConfederation
							(
											ID,
											listConfederationShortName.removeFirst(),
											listConfederationLongName.removeFirst(),
											ctrlCountry.getCountryMap().get(listCountryID.removeFirst()),
											superConfederation
							);

			ctrlConfederation.getConfederationMap().put(ID, confederation);
		}

	}


	/**
	 * TODO
	 * @param typeCountry
	 * @param superConfederationID
	 * @param full
	 * @return
	 */
	public List<List<String>> getConfederationList(String typeCountry, String superConfederationID, Boolean full)
	{
		getConfederations(typeCountry, superConfederationID);

		List<List<String>> outerConfederationList = new ArrayList<List<String>>();

		for (String key : ctrlConfederation.getConfederationMap().keySet()) {
			List<String> innerConfederationList = new ArrayList<String>();
			Confederation confederation = ctrlConfederation.getConfederationMap().get(key);

			innerConfederationList.add(confederation.getShortName());

			if (full) {
				innerConfederationList.add(confederation.getLongName());
				if (typeCountry.equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
					innerConfederationList.add("-");
				} else {
					innerConfederationList.add(confederation.getSuperConfederation().getShortName());
				}
				innerConfederationList.add(confederation.getCountry().getName()); // TODO: try catch?
			}

			innerConfederationList.add(key);

			outerConfederationList.add(innerConfederationList);
		}

		return outerConfederationList;
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
	public Competition newCompetition(String ID, String type, String teamType, String name,
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
	 * @param competitionCountryID
	 */
	public void searchCompetitions(String competitionSubName,
																 String competitionType,
																 String competitionTeamType,
																 String competitionCountryID)
	{
		List<String> listCompetitionID = new ArrayList<String>();
		List<String> listCompetitionType = new ArrayList<String>();
		List<String> listCompetitionTeamType = new ArrayList<String>();
		List<String> listCompetitionName = new ArrayList<String>();
		List<String> listConfederationID = new ArrayList<String>();
		List<String> listConfederationShortName = new ArrayList<String>();
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.competitionsDB
						(
										competitionSubName, competitionType, competitionTeamType, competitionCountryID,
										listCompetitionID, listCompetitionType, listCompetitionTeamType, listCompetitionName,
										listConfederationID, listConfederationShortName,
										listCountryID, listCountryName
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
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryID
	 * @param full
	 * @return
	 */
	public List<List<String>> getCompetitionList(String competitionSubName,
																							 String competitionType,
																							 String competitionTeamType,
																							 String competitionCountryID,
																							 Boolean full)
	{
		searchCompetitions(competitionSubName, competitionType, competitionTeamType, competitionCountryID);

		List<List<String>> outerCompetitionList = new ArrayList<List<String>>();

		for (String key : ctrlCompetition.getCompetitionMap().keySet()) {
			List<String> innerCompetitionList = new ArrayList<String>();
			Competition competition = ctrlCompetition.getCompetitionMap().get(key);

			innerCompetitionList.add(competition.getName());

			if (full) {
				innerCompetitionList.add(competition.getType());
				innerCompetitionList.add(competition.getTeamType());
				innerCompetitionList.add(competition.getConfederation().getCountry().getName());
				innerCompetitionList.add(competition.getConfederation().getShortName());
			}

			innerCompetitionList.add(key);

			outerCompetitionList.add(innerCompetitionList);
		}

		for (List<String> s : outerCompetitionList) {
			System.out.println(s);
		}

		return outerCompetitionList;
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
	 * @param teamCountryID
	 */
	public void searchTeams(String teamSubLongName,
													String teamSubShortName,
													String teamType,
													String teamCountryID)
	{
		List<String> listTeamID = new ArrayList<String>();
		List<String> listTeamType = new ArrayList<String>();
		List<String> listTeamShortName = new ArrayList<String>();
		List<String> listTeamLongName = new ArrayList<String>();
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.teamsDB
						(
										teamSubLongName, teamSubShortName, teamType, teamCountryID,
										listTeamID, listTeamType, listTeamShortName, listTeamLongName,
										listCountryID, listCountryName
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
	 * @param teamSubLongName
	 * @param teamSubShortName
	 * @param teamType
	 * @param teamCountryID
	 * @param full
	 * @return
	 */
	public List<List<String>> getTeamList(String teamSubLongName,
																				String teamSubShortName,
																				String teamType,
																				String teamCountryID,
																				Boolean full)
	{
		searchTeams(teamSubLongName, teamSubShortName, teamType, teamCountryID);

		List<List<String>> outerTeamList = new ArrayList<List<String>>();

		for (String key : ctrlTeam.getTeamMap().keySet()) {
			List<String> innerTeamList = new ArrayList<String>();
			Team team = ctrlTeam.getTeamMap().get(key);

			innerTeamList.add(team.getLongName());

			if (full) {
				innerTeamList.add(team.getShortName());
				innerTeamList.add(team.getType());
				innerTeamList.add(team.getCountry().getName());
			}

			innerTeamList.add(key);

			outerTeamList.add(innerTeamList);
		}

		for (List<String> s : outerTeamList) {
			System.out.println(s);
		}

		return outerTeamList;
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
	public Player newPlayer(String ID, String name, String surname, String dob, Country country,
													String foot, Position position, String role,
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
	 * @param playerCountryID
	 * @param playerRole
	 * @param playerPositionID
	 * @param playerFoot
	 */
	public void searchPlayers(String playerSubName,
														String playerSubSurname,
														String playerReferringYear,
														String playerMinAge,
														String playerMaxAge,
														String playerCountryID,
														String playerRole,
														String playerPositionID,
														String playerFoot)
	{
		List<String> listPlayerID = new ArrayList<String>();
		List<String> listPlayerName = new ArrayList<String>();
		List<String> listPlayerSurname = new ArrayList<String>();
		List<String> listPlayerDob = new ArrayList<String>();
		List<String> listPlayerFoot = new ArrayList<String>();
		List<String> listPlayerRole = new ArrayList<String>();
		List<String> listPlayerRetiredDate = new ArrayList<String>();
		List<String> listPositionID = new ArrayList<String>();
		List<String> listPositionName = new ArrayList<String>();
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.playersDB
						(
										playerSubName, playerSubSurname,
										playerReferringYear, playerMinAge, playerMaxAge,
										playerCountryID,
										playerRole, playerPositionID,
										playerFoot,
										listPlayerID,
										listPlayerName, listPlayerSurname,
										listPlayerDob,
										listPlayerFoot,
										listPlayerRole,
										listPlayerRetiredDate,
										listPositionID, listPositionName,
										listCountryID, listCountryName
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
		List<String> listPlayerID = new ArrayList<String>();
		List<String> listPlayerName = new ArrayList<String>();
		List<String> listPlayerSurname = new ArrayList<String>();
		List<String> listPlayerDob = new ArrayList<String>();
		List<String> listPlayerFoot = new ArrayList<String>();
		List<String> listPlayerRole = new ArrayList<String>();
		List<String> listPlayerRetiredDate = new ArrayList<String>();
		List<String> listPositionID = new ArrayList<String>();
		List<String> listPositionName = new ArrayList<String>();
		List<String> listCountryID = new ArrayList<String>();
		List<String> listCountryName = new ArrayList<String>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.militancyPlayersDB
						(
										militancyPlayerTeamID,
										militancyPlayerStartYear, militancyPlayerEndYear,
										listPlayerID,
										listPlayerName, listPlayerSurname,
										listPlayerDob,
										listPlayerFoot,
										listPlayerRole,
										listPlayerRetiredDate,
										listPositionID, listPositionName,
										listCountryID, listCountryName
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
	 * @param playerSubName
	 * @param playerSubSurname
	 * @param playerReferringYear
	 * @param playerMinAge
	 * @param playerMaxAge
	 * @param playerCountryID
	 * @param playerRole
	 * @param playerPositionID
	 * @param playerFoot
	 * @param full
	 * @return
	 */
	public List<List<String>> getPlayerList(String playerSubName,
																					String playerSubSurname,
																					String playerReferringYear,
																					String playerMinAge,
																					String playerMaxAge,
																					String playerCountryID,
																					String playerRole,
																					String playerPositionID,
																					String playerFoot,
																					Boolean full)
	{
		searchPlayers
						(
										playerSubName, playerSubSurname,
										playerReferringYear, playerMinAge, playerMaxAge,
										playerCountryID,
										playerRole, playerPositionID,
										playerFoot
						);

		List<List<String>> outerPlayerList = new ArrayList<List<String>>();

		for (String key : ctrlPlayer.getPlayerMap().keySet()) {
			List<String> innerPlayerList = new ArrayList<String>();
			Player player = ctrlPlayer.getPlayerMap().get(key);

			innerPlayerList.add(player.getSurname());

			if (full) {
				innerPlayerList.add(player.getName());
				innerPlayerList.add(player.getDob());
				innerPlayerList.add(player.getCountry().getName());
				innerPlayerList.add(player.getFoot());
				innerPlayerList.add(player.getRole());
				innerPlayerList.add(player.getPosition().getName());
				innerPlayerList.add(player.getRetiredDate());
			}

			innerPlayerList.add(key);

			outerPlayerList.add(innerPlayerList);
		}

		for (List<String> s : outerPlayerList) {
			System.out.println(s);
		}

		return outerPlayerList;
	}


	/**
	 * TODO
	 * @param militancyPlayerTeamID
	 * @param militancyPlayerStartYear
	 * @param militancyPlayerEndYear
	 * @param full
	 * @return
	 */
	public List<List<String>> getPlayerList(String militancyPlayerTeamID,
																					String militancyPlayerStartYear,
																					String militancyPlayerEndYear,
																					Boolean full)
	{
		searchMilitancyPlayers
						(
										militancyPlayerTeamID,
										militancyPlayerStartYear, militancyPlayerEndYear
						);

		List<List<String>> outerPlayerList = new ArrayList<List<String>>();

		for (String key : ctrlPlayer.getPlayerMap().keySet()) {
			List<String> innerPlayerList = new ArrayList<String>();
			Player player = ctrlPlayer.getPlayerMap().get(key);

			innerPlayerList.add(player.getSurname());

			if (full) {
				innerPlayerList.add(player.getName());
				innerPlayerList.add(player.getDob());
				innerPlayerList.add(player.getCountry().getName());
				innerPlayerList.add(player.getFoot());
				innerPlayerList.add(player.getRole());
				innerPlayerList.add(player.getPosition().getName());
				innerPlayerList.add(player.getRetiredDate());
			}

			innerPlayerList.add(key);

			outerPlayerList.add(innerPlayerList);
		}

		for (List<String> s : outerPlayerList) {
			System.out.println(s);
		}

		return outerPlayerList;
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
		List<String> listPositionID = new ArrayList<String>();
		List<String> listPositionRole = new ArrayList<String>();
		List<String> listPositionCode = new ArrayList<String>();
		List<String> listPositionName = new ArrayList<String>();

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.positionsDB(listPositionID, listPositionRole, listPositionCode, listPositionName);

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
	 * @param full
	 * @return
	 */
	public List<List<String>> getPositionList(Boolean full)
	{
		allPositions();

		List<List<String>> outerPositionList = new ArrayList<List<String>>();

		for (String key : ctrlPosition.getPositionMap().keySet()) {
			List<String> innerPositionList = new ArrayList<String>();
			Position position = ctrlPosition.getPositionMap().get(key);

			innerPositionList.add(position.getName());

			if (full) {
				innerPositionList.add(position.getRole());
				innerPositionList.add(position.getCode());
			}

			innerPositionList.add(key);

			outerPositionList.add(innerPositionList);
		}

		for (List<String> s : outerPositionList) {
			System.out.println(s);
		}

		return outerPositionList;
	}

	/*------------------------------------------------------------------------------------------------------*/


}

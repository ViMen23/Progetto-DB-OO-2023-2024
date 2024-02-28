package controller;

import dao.*;
import gui.GuiConfiguration;
import gui.Regex;
import model.*;
import org.apache.commons.lang3.StringUtils;
import postgresImplDAO.*;

import java.util.*;

/**
 * TYPE : class - controller package
 * <p>
 * NAME : Controller
 * <p>
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
	private final Trophy ctrlTrophy;
	private final Prize ctrlPrize;
	private final Tag ctrlTag;
	private static Controller controllerInstance = null;

	private Controller()
	{
		this.ctrlAdmin = newAdmin();
		this.ctrlCountry = newCountry();
		this.ctrlConfederation = newConfederation();
		this.ctrlCompetition = newCompetition();
		this.ctrlTeam = newTeam();
		this.ctrlPosition = newPosition();
		this.ctrlPlayer = newPlayer();
		this.ctrlTrophy = newTrophy();
		this.ctrlPrize = newPrize();
		this.ctrlTag = newTag();
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
		if (adminDAO.isAdminDB(admin.getUsername(), admin.getPassword())) {
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
	private Admin newAdmin(String username, String password)
	{
		return new Admin(username, password);
	}

	/**
	 * TODO
	 * @return
	 */
	private Admin newAdmin()
	{
		return newAdmin(null, null);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COUNTRY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param type
	 * @param code
	 * @param name
	 * @param superCountry
	 * @return
	 */
	private Country newCountry(String type,
														 String code,
														 String name,
														 Country superCountry)
	{
		return new Country(type, code, name, superCountry);
	}


	/**
	 * TODO
	 * @return
	 */
	private Country newCountry()
	{
		return newCountry(null, null, null, null);
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countCountries()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();

		ctrlCountry.setTotalCountries(countryDAO.countCountryDB());

		return ctrlCountry.getTotalCountries();
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superCountryID
	 */
	private void fetchCountry(String countryType,
														String superCountryID)
	{
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryType = new ArrayList<>();
		List<String> listCountryCode = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();
		List<String> listSuperCountryID = new ArrayList<>();
		List<String> listSuperCountryName = new ArrayList<>();

		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.fetchCountryDB(
						countryType,
						superCountryID,
						listCountryID,
						listCountryType,
						listCountryCode,
						listCountryName,
						listSuperCountryID,
						listSuperCountryName
		);


		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Country> superCountryMap = new LinkedHashMap<>();

		for (int i = 0; i < listCountryID.size(); ++i) {
			String superID = listSuperCountryID.get(i);
			superCountryMap.putIfAbsent(
							superID,
							newCountry(
											null,
											null,
											listSuperCountryName.get(i),
											null
							)
			);

			String ID = listCountryID.get(i);
			countryMap.putIfAbsent(
							ID,
							newCountry(
											listCountryType.get(i),
											listCountryCode.get(i),
											listCountryName.get(i),
											superCountryMap.get(superID)
							)
			);
		}
	}


	/**
	 * TODO
	 * @param countryNameVector
	 * @param countryNameMap
	 * @param countryType
	 * @param superCountryID
	 */
	public void setCountryComboBox(Vector<String> countryNameVector,
																 Map<String, String> countryNameMap,
																 String countryType,
																 String superCountryID)
	{
		fetchCountry(countryType, superCountryID);

		Map<String, Country> countryMap = ctrlCountry.getCountryMap();

		for (String key : countryMap.keySet()) {
			String countryName = countryMap.get(key).getName();
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
	public void setCountryTable(Vector<String> countryTableColumnName,
															Vector<Vector<String>> countryTableData,
															String countryType,
															String superCountryID)
	{
		fetchCountry(countryType, superCountryID);

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

			if (country.getType().equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
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
	 * @param shortName
	 * @param longName
	 * @param country
	 * @param superConfederation
	 * @return
	 */
	private Confederation newConfederation(String shortName,
																				 String longName,
																				 Country country,
																				 Confederation superConfederation)
	{
		return new Confederation(shortName, longName, country, superConfederation);
	}

	private Confederation newConfederation()
	{
		return newConfederation(null, null, null, null);
	}


	/**
	 * TODO
	 * @return
	 */
	public Integer countConfederations()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();

		ctrlConfederation.setTotalConfederations(confederationDAO.countConfederationDB());

		return ctrlConfederation.getTotalConfederations();
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superConfederationsID
	 */
	private void fetchConfederation(String countryType,
																	String superConfederationsID)
	{
		List<String> listConfederationID = new ArrayList<>();
		List<String> listConfederationShortName = new ArrayList<>();
		List<String> listConfederationLongName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();
		List<String> listCountryType = new ArrayList<>();
		List<String> listSuperConfederationID = new ArrayList<>();
		List<String> listSuperConfederationShortName = new ArrayList<>();

		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						countryType,
						superConfederationsID,
						listConfederationID,
						listConfederationShortName,
						listConfederationLongName,
						listCountryID,
						listCountryName,
						listCountryType,
						listSuperConfederationID,
						listSuperConfederationShortName
		);


		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Confederation> superConfederationMap = new LinkedHashMap<>();

		Map<String, Confederation> confederationMap = ctrlConfederation.getConfederationMap();
		confederationMap.clear();

		for (int i = 0; i < listConfederationID.size(); ++i) {
			String countryID = listCountryID.get(i);
			countryMap.putIfAbsent(
							countryID,
							newCountry(
											listCountryType.get(i),
											null,
											listCountryName.get(i),
											null
							)
			);

			String superConfederationID = listSuperConfederationID.get(i);
			superConfederationMap.putIfAbsent(
							superConfederationID,
							newConfederation(
											listConfederationShortName.get(i),
											null,
											null,
											null
							)
			);

			String confederationID = listConfederationID.get(i);
			confederationMap.putIfAbsent(
							confederationID,
							newConfederation(
											listConfederationShortName.get(i),
											listConfederationLongName.get(i),
											countryMap.get(countryID),
											superConfederationMap.get(superConfederationID)
							)
			);
		}
	}


	/**
	 * TODO
	 * @param confederationShortNameVector
	 * @param confederationShortNameMap
	 * @param typeCountry
	 * @param superConfederationID
	 */
	public void setConfederationComboBox(Vector<String> confederationShortNameVector,
																			 Map<String, String> confederationShortNameMap,
																			 String typeCountry,
																			 String superConfederationID)
	{
		fetchConfederation(typeCountry, superConfederationID);

		for (String key : ctrlConfederation.getConfederationMap().keySet()) {

			String confederationShortName = ctrlConfederation.getConfederationMap().get(key).getShortName();

			confederationShortNameVector.add(confederationShortName);
			confederationShortNameMap.put(confederationShortName, key);
		}
	}


	public void setConfederationTable(Vector<String> confederationTableColumnName,
																		Vector<Vector<String>> confederationTableData,
																		String countryType,
																		String superConfederationID)
	{
		fetchConfederation(countryType, superConfederationID);

		String string;

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		confederationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		confederationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("type");
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
			confederationVector.add(confederation.getCountry().getType());
			confederationVector.add(confederation.getCountry().getName());

			if (confederation.getCountry().getType().equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
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
	 * @param type
	 * @param teamType
	 * @param name
	 * @param confederation
	 * @return
	 */
	private Competition newCompetition(String type,
																		 String teamType,
																		 String name,
																		 Confederation confederation)
	{
		return new Competition(type, teamType, name, confederation);
	}


	/**
	 * TODO
	 * @return
	 */
	private Competition newCompetition()
	{
		return newCompetition(null, null, null, null);
	}





	/**
	 * TODO
	 * @return
	 */
	public Integer countCompetitions()
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();

		ctrlCompetition.setTotalCompetitions(competitionDAO.countCompetitionDB());

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
	private void fetchCompetition(String competitionSubName,
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
		competitionDAO.fetchCompetitionDB(
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


		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Confederation> confederationMap = ctrlConfederation.getConfederationMap();
		confederationMap.clear();

		Map<String, Competition> competitionMap = ctrlCompetition.getCompetitionMap();
		competitionMap.clear();


		for (int i = 0; i < listCompetitionID.size(); ++i) {
			String countryID = listCountryID.get(i);
			countryMap.putIfAbsent(
							countryID,
							newCountry(
											null,
											null,
											listCountryName.get(i),
											null
							)
			);

			String confederationID = listConfederationID.get(i);
			confederationMap.putIfAbsent(
							confederationID,
							newConfederation(
											listConfederationShortName.get(i),
											null,
											countryMap.get(countryID),
											null
							)
			);

			String competitionID = listCompetitionID.get(i);
			competitionMap.putIfAbsent(
							competitionID,
							newCompetition(
											listCompetitionType.get(i),
											listCompetitionTeamType.get(i),
											listCompetitionName.get(i),
											confederationMap.get(confederationID)
							)
			);
		}
	}


	private void fetchCompetition(String playerID,
																String teamType)
	{
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						playerID,
						teamType,
						listCompetitionID,
						listCompetitionName
		);


		Map<String, Competition> competitionMap = ctrlCompetition.getCompetitionMap();
		competitionMap.clear();


		for (int i = 0; i < listCompetitionID.size(); ++i) {
			String competitionID = listCompetitionID.get(i);
			competitionMap.putIfAbsent(
							competitionID,
							newCompetition(
											null,
											null,
											listCompetitionName.get(i),
											null
							)
			);
		}
	}


	private void fetchCompetitionEdition(String competitionID)
	{
		List<String> listCompetitionEdition = new ArrayList<>();

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionEditionDB(
						competitionID,
						listCompetitionEdition
		);

		Set<String> competitionEditionSet = ctrlCompetition.getCompetitionMap().get(competitionID).getEditionSet();
		competitionEditionSet.clear();

		competitionEditionSet.addAll(listCompetitionEdition);
	}



	public void setCompetitionComboBox(Vector<String> competitionNameVector,
																		 Map<String, String> competitionNameMap,
																		 String playerID,
																		 String teamType)
	{
		fetchCompetition(playerID, teamType);

		Map<String, Competition> competitionMap = ctrlCompetition.getCompetitionMap();

		for (String key : competitionMap.keySet()) {

			String competitionName = competitionMap.get(key).getName();

			competitionNameVector.add(competitionName);
			competitionNameMap.put(competitionName, key);
		}
	}


	public void setCompetitionComboBox(Vector<String> competitionNameVector,
																		 Map<String, String> competitionNameMap,
																		 String competitionSubName,
																		 String competitionType,
																		 String competitionTeamType,
																		 String competitionCountryType,
																		 String competitionContinentID,
																		 String competitionNationID)
	{
		fetchCompetition(
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

	public void setCompetitionEditionComboBox(Vector<String> competitionEditionVector,
																						String competitionID)
	{
		fetchCompetitionEdition(competitionID);

		competitionEditionVector.addAll(ctrlCompetition.getCompetitionMap().get(competitionID).getEditionSet());
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
	public void setCompetitionTable(Vector<String> competitionTableColumnName,
																	Vector<Vector<String>> competitionTableData,
																	String competitionSubName,
																	String competitionType,
																	String competitionTeamType,
																	String competitionCountryType,
																	String competitionContinentID,
																	String competitionNationID)
	{
		fetchCompetition(
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
	 * @param type
	 * @param shortName
	 * @param longName
	 * @param country
	 * @return
	 */
	private Team newTeam(String type,
											 String shortName,
											 String longName,
											 Country country,
											 Confederation confederation)
	{
		return new Team(type, shortName, longName, country, confederation);
	}



	/**
	 * TODO
	 * @return
	 */
	private Team newTeam()
	{
		return newTeam(null, null, null, null, null);
	}



	/**
	 * TODO
	 * @return
	 */
	public Integer countTeams()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();

		ctrlTeam.setTotalTeam(teamDAO.countTeamDB());

		return ctrlTeam.getTotalTeam();
	}


	/**
	 *
	 * @param teamSubLongName
	 * @param teamSubShortName
	 * @param teamType
	 * @param teamContinentID
	 * @param teamNationID
	 */
	private void fetchTeam(String teamSubLongName,
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
		teamDAO.fetchTeamDB(
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

		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		for (int i = 0; i < listTeamID.size(); ++i) {
			String countryID = listCountryID.get(i);
			countryMap.putIfAbsent(
							countryID,
							newCountry(
											null,
											null,
											listCountryName.get(i),
											null
							)
			);

			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											listTeamType.get(i),
											listTeamShortName.get(i),
											listTeamLongName.get(i),
											countryMap.get(countryID),
											null
							)
			);
		}
	}

	/**
	 * TODO
	 * @param competitionStartYear
	 * @param competitionID
	 */
	private void fetchTeam(String competitionStartYear,
												 String competitionID)
	{
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						competitionStartYear,
						competitionID,
						listTeamID,
						listTeamLongName
		);


		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		for (int i = 0; i < listTeamID.size(); ++i) {
			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											null,
											null
							)
			);
		}
	}


	/**
	 * TODO
	 * @param teamID
	 */
	private void fetchTeam(String teamID)
	{
		Map<String, String> mapTeamInfo = new LinkedHashMap<>();


		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(teamID, mapTeamInfo);

		if (!(teamID.equalsIgnoreCase(mapTeamInfo.get("teamID")))) {
			System.out.println("ERRORE");
			return;
		}

		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();


		teamMap.putIfAbsent(
						teamID,
						newTeam(
										mapTeamInfo.get("teamType"),
										mapTeamInfo.get("teamShortName"),
										mapTeamInfo.get("teamLongName"),
										newCountry(
														null,
														null,
														mapTeamInfo.get("countryName"),
														null
										),
										newConfederation(
														mapTeamInfo.get("confederationShortName"),
														null,
														null,
														null
										)
						)
		);
	}


	private void fetchTeamPlayer(String playerID)
	{
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						playerID,
						listTeamID,
						listTeamLongName
		);


		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		for (int i = 0; i < listTeamID.size(); ++i) {
			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											null,
											null
							)
			);
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
	public void setTeamComboBox(Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap,
															String teamSubLongName,
															String teamSubShortName,
															String teamType,
															String teamContinentID,
															String teamNationID)
	{
		fetchTeam(
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


	public void setTeamComboBox(Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap,
															String playerID)
	{
		fetchTeam(playerID);

		Map<String, Team> teamMap = ctrlTeam.getTeamMap();

		for (String key : teamMap.keySet()) {

			String teamLongName = teamMap.get(key).getLongName();

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
	public void setTeamTable(Vector<String> teamTableColumnName,
													 Vector<Vector<String>> teamTableData,
													 String teamSubLongName,
													 String teamSubShortName,
													 String teamType,
													 String teamContinentID,
													 String teamNationID)
	{
		fetchTeam(
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

	/**
	 * TODO
	 * @param teamLongNameVector
	 * @param teamLongNameMap
	 * @param competitionStartYear
	 * @param competitionID
	 */
	public void setTeamComboBox(Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap,
															String competitionStartYear,
															String competitionID)
	{
		fetchTeam(competitionStartYear, competitionID);

		for (String key : ctrlTeam.getTeamMap().keySet()) {

			String teamLongName = ctrlTeam.getTeamMap().get(key).getLongName();

			teamLongNameVector.add(teamLongName);
			teamLongNameMap.put(teamLongName, key);
		}
	}

	public void setTeamView(Map<String, String> infoTeamMap,
													Vector<String> teamSquadTableColumnName,
													Vector<Vector<String>> teamSquadTableData,
													Vector<String> teamPartecipationTableColumnName,
													Vector<Vector<String>> teamPartecipationTableData,
													Vector<String> teamTrophyTableColumnName,
													Vector<Vector<String>> teamTrophyTableData,
													Vector<String> teamPrizeTableColumnName,
													Vector<Vector<String>> teamPrizeTableData,
													String teamID,
													String startYear)
	{
		fetchTeam(teamID);
		fetchMilitancy(teamID, startYear);
		fetchPartecipation(teamID, startYear);
		fetchTrophy(teamID, startYear);
		fetchPrize(teamID, startYear);

		Team team = ctrlTeam.getTeamMap().get(teamID);

		String string;

		// informazioni squadra
		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		infoTeamMap.put(string, team.getLongName());

		string = GuiConfiguration.getMessage("code");
		string = StringUtils.capitalize(string);
		infoTeamMap.put(string, team.getShortName());

		string = GuiConfiguration.getMessage("type");
		string = StringUtils.capitalize(string);
		infoTeamMap.put(string, team.getType());

		string = GuiConfiguration.getMessage("country");
		string = StringUtils.capitalize(string);
		infoTeamMap.put(string, team.getCountry().getName());

		string = GuiConfiguration.getMessage("confederation");
		string = StringUtils.capitalize(string);
		infoTeamMap.put(string, team.getConfederation().getShortName());

		// tabella rosa
		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		teamSquadTableColumnName.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		teamSquadTableColumnName.add(string);

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		teamSquadTableColumnName.add(string);

		for (String key : team.getPlayerMap().keySet()) {
			Vector<String> playerVector = new Vector<>();

			Player player = team.getPlayerMap().get(key);

			playerVector.add(player.getRole());
			playerVector.add(player.getName());
			playerVector.add(player.getSurname());

			teamSquadTableData.add(playerVector);
		}


		// tabella partecipazioni
		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		teamPartecipationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		teamPartecipationTableColumnName.add(string);

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		teamPartecipationTableColumnName.add(string);

		for (Competition competition : team.getCompetitionSet()) {
			Vector<String> partecipationVector = new Vector<>();

			partecipationVector.add(competition.getName());
			partecipationVector.add(competition.getType());
			partecipationVector.add(competition.getConfederation().getShortName());

			teamPartecipationTableData.add(partecipationVector);
		}


		// tabella trofei
		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		teamTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();
		teamTrophyTableColumnName.add(string);


		for (Trophy trophy : team.getTrophySet()) {
			Vector<String> trophyVector = new Vector<>();

			trophyVector.add(trophy.getCompetition().getName());
			trophyVector.add(trophy.getName());

			teamTrophyTableData.add(trophyVector);
		}


		// tabella premi
		string = GuiConfiguration.getMessage("prize");
		string = string.toUpperCase();
		teamPrizeTableColumnName.add(string);

		string = GuiConfiguration.getMessage("given");
		string = string.toUpperCase();
		teamPrizeTableColumnName.add(string);


		for (Prize prize : team.getPrizeSet()) {
			Vector<String> prizeVector = new Vector<>();

			prizeVector.add(prize.getName());
			prizeVector.add(prize.getGiven());

			teamPrizeTableData.add(prizeVector);
		}

	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PLAYER
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
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
	private Player newPlayer(String name,
													 String surname,
													 String dob,
													 Country country,
													 String foot,
													 Position position,
													 String role,
													 String retiredDate)
	{
		return new Player(name, surname, dob, country, foot, position, role, retiredDate);
	}


	/**
	 * TODO
	 * @return
	 */
	private Player newPlayer()
	{
		return newPlayer(null, null, null, null, null, null, null, null);
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countPlayers()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();

		ctrlPlayer.setTotalPlayers(playerDAO.countPlayerDB());

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
	private void fetchPlayer(String playerSubName,
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
		playerDAO.fetchPlayerDB(
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

		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Position> positionMap = ctrlPosition.getPositionMap();
		positionMap.clear();

		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();
		playerMap.clear();


		for (int i = 0; i < listPlayerID.size(); ++i) {
			String countryID = listCountryID.get(i);
			countryMap.putIfAbsent(
							countryID,
							newCountry(
											null,
											null,
											listCountryName.get(i),
											null
							)
			);

			String positionID = listPositionID.get(i);
			positionMap.putIfAbsent(
							positionID,
							newPosition(
											null,
											null,
											listPositionName.get(i)
							)
			);

			String playerID = listPlayerID.get(i);
			playerMap.putIfAbsent(
							playerID,
							newPlayer(
											listPlayerName.get(i),
											listPlayerSurname.get(i),
											listPlayerDob.get(i),
											countryMap.get(countryID),
											listPlayerFoot.get(i),
											positionMap.get(positionID),
											listPlayerRole.get(i),
											listPlayerRetiredDate.get(i)
							)
			);
		}
	}


	/**
	 * TODO
	 * @param militancyPlayerTeamID
	 * @param militancyPlayerStartYear
	 * @param militancyPlayerEndYear
	 */
	private void fetchPlayer(String militancyPlayerTeamID,
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
		playerDAO.fetchPlayerDB(
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


		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Position> positionMap = ctrlPosition.getPositionMap();
		positionMap.clear();

		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();
		playerMap.clear();


		for (int i = 0; i < listPlayerID.size(); ++i) {
			String countryID = listCountryID.get(i);
			countryMap.putIfAbsent(
							countryID,
							newCountry(
											null,
											null,
											listCountryName.get(i),
											null
							)
			);

			String positionID = listPositionID.get(i);
			positionMap.putIfAbsent(
							positionID,
							newPosition(
											null,
											null,
											listPositionName.get(i)
							)
			);

			String playerID = listPlayerID.get(i);
			playerMap.putIfAbsent(
							playerID,
							newPlayer(
											listPlayerName.get(i),
											listPlayerSurname.get(i),
											listPlayerDob.get(i),
											countryMap.get(countryID),
											listPlayerFoot.get(i),
											positionMap.get(positionID),
											listPlayerRole.get(i),
											listPlayerRetiredDate.get(i)
							)
			);
		}
	}

	/**
	 * TODO
	 * @param startYear
	 * @param teamID
	 */
	private void fetchPlayer(String startYear,
													 String teamID)
	{
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						startYear,
						teamID,
						listPlayerID,
						listPlayerName,
						listPlayerSurname,
						listPlayerRole
		);


		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();
		playerMap.clear();


		for (int i = 0; i < listPlayerID.size(); ++i) {
			String playerID = listPlayerID.get(i);
			playerMap.putIfAbsent(
							playerID,
							newPlayer(
											listPlayerName.get(i),
											listPlayerSurname.get(i),
											null,
											null,
											null,
											null,
											listPlayerRole.get(i),
											null
							)
			);
		}
	}


	private void fetchPlayerSeason(String playerID)
	{
		List<String> startYearSeason = new ArrayList<>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(playerID, startYearSeason);

		Set<String> playerPlaySeason = ctrlPlayer.getPlayerMap().get(playerID).getPlaySeason();
		playerPlaySeason.clear();
		playerPlaySeason.addAll(startYearSeason);
	}


	private void fetchPlayer(String playerID)
	{
		Map<String, String> mapPlayerInfo = new LinkedHashMap<>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(playerID, mapPlayerInfo);


		if (!(playerID.equalsIgnoreCase(mapPlayerInfo.get("playerID")))) {
			System.out.println("ERRORE");
			return;
		}


		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();
		playerMap.clear();

		playerMap.putIfAbsent(
						playerID,
						newPlayer(
										mapPlayerInfo.get("playerName"),
										mapPlayerInfo.get("playerSurname"),
										mapPlayerInfo.get("playerDob"),
										newCountry(
														null,
														null,
														mapPlayerInfo.get("countryName"),
														null
										),
										mapPlayerInfo.get("playerFoot"),
										newPosition(
														null,
														null,
														mapPlayerInfo.get("positionName")
										),
										mapPlayerInfo.get("playerRole"),
										mapPlayerInfo.get("playerRetiredDate")
						)
		);
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
	public void setPlayerComboBox(Vector<String> playerInfoVector,
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
		fetchPlayer(
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

	public void setPlayerComboBox(Vector<String> playerInfoVector,
																Map<String, String> playerInfoMap,
																String startYear,
																String teamID)
	{
		fetchPlayer(startYear, teamID);

		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();

		for (String key : playerMap.keySet()) {

			Player player = playerMap.get(key);

			String playerInfo = player.getName();
			playerInfo += " ";
			playerInfo += player.getSurname();

			playerInfoVector.add(playerInfo);
			playerInfoMap.put(playerInfo, key);
		}
	}

	public void setPlayerComboBox(Vector<String> seasonVector,
																Map<String, String> seasonMap,
																String playerID)
	{
		fetchPlayerSeason(playerID);

		Set<String> playerPlaySeason = ctrlPlayer.getPlayerMap().get(playerID).getPlaySeason();

		for (String startYearSeason : playerPlaySeason) {
			seasonVector.add(startYearSeason);
			seasonMap.put(startYearSeason, startYearSeason);
		}
	}

	public void setPlayerTable(Vector<String> playerTableColumnName,
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
		fetchPlayer(
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
	public void setPlayerTable(Vector<String> playerTableColumnName,
														 Vector<Vector<String>> playerTableData,
														 String militancyPlayerTeamID,
														 String militancyPlayerStartYear,
														 String militancyPlayerEndYear)
	{
		fetchPlayer(
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


	public void setPlayerGeneralView(Map<String, String> infoPlayerMap,
																	 Vector<String> playerPositionTableColumnName,
																	 Vector<Vector<String>> playerPositionTableData,
																	 Vector<String> playerNationalityTableColumnName,
																	 Vector<Vector<String>> playerNationalityTableData,
																	 String playerID)
	{
		fetchPlayer(playerID);
		fetchPosition(playerID);
		fetchNationality(playerID);

		Player player = ctrlPlayer.getPlayerMap().get(playerID);

		String string;

		// informazioni calciatori
		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		infoPlayerMap.put(string, player.getName());

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		infoPlayerMap.put(string, player.getSurname());

		string = GuiConfiguration.getMessage("dob");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getDob());

		string = GuiConfiguration.getMessage("bornCountry");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getCountry().getName());

		string = GuiConfiguration.getMessage("preferredFoot");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getFoot());

		string = GuiConfiguration.getMessage("mainPosition");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getPosition().getName());

		string = GuiConfiguration.getMessage("role");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getRole());

		string = GuiConfiguration.getMessage("retiredDate");
		string = StringUtils.capitalize(string);
		if (null == player.getRetiredDate()) {
			infoPlayerMap.put(string, "");
		} else {
			infoPlayerMap.put(string, player.getRetiredDate());
		}


		// tabella posizioni
		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		playerPositionTableColumnName.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		playerPositionTableColumnName.add(string);

		string = GuiConfiguration.getMessage("position");
		string = string.toUpperCase();
		playerPositionTableColumnName.add(string);

		for (Position position : player.getPositionSet()) {
			Vector<String> positionVector = new Vector<>();

			positionVector.add(position.getRole());
			positionVector.add(position.getCode());
			positionVector.add(position.getName());

			playerPositionTableData.add(positionVector);
		}


		// tabella nazionalita
		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		playerNationalityTableColumnName.add(string);

		for (Country country : player.getCountrySet()) {
			Vector<String> countryVector = new Vector<>();

			countryVector.add(country.getName());

			playerNationalityTableData.add(countryVector);
		}
	}


	public void setPlayerDetailedView(Map<String, String> infoPlayerMap,
																		Vector<String> playerAttributeGoalkeepingTableColumnName,
																		Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																		Vector<String> playerAttributeMentalTableColumnName,
																		Vector<Vector<String>> playerAttributeMentalTableData,
																		Vector<String> playerAttributePhysicalTableColumnName,
																		Vector<Vector<String>> playerAttributePhysicalTableData,
																		Vector<String> playerAttributeTechnicalTableColumnName,
																		Vector<Vector<String>> playerAttributeTechnicalTableData,
																		Vector<String> playerTagTableColumnName,
																		Vector<Vector<String>> playerTagTableData,
																		String playerID)
	{
		fetchPlayer(playerID);
		fetchAttribute(playerID);
		fetchTag(playerID);

		Player player = ctrlPlayer.getPlayerMap().get(playerID);

		String string;

		// informazioni calciatori
		string = GuiConfiguration.getMessage("player");
		string = string.toUpperCase();
		infoPlayerMap.put(string, player.getName() + " " + player.getSurname());

		string = GuiConfiguration.getMessage("dob");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getDob());

		string = GuiConfiguration.getMessage("bornCountry");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getCountry().getName());

		string = GuiConfiguration.getMessage("preferredFoot");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getFoot());

		string = GuiConfiguration.getMessage("mainPosition");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getPosition().getName());

		string = GuiConfiguration.getMessage("role");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getRole());

		string = GuiConfiguration.getMessage("retiredDate");
		string = StringUtils.capitalize(string);
		if (null == player.getRetiredDate()) {
			infoPlayerMap.put(string, "");
		} else {
			infoPlayerMap.put(string, player.getRetiredDate());
		}


		// tabelle attributi
		string = GuiConfiguration.getMessage("attribute");
		string = string.toUpperCase();
		playerAttributeGoalkeepingTableColumnName.add(string);
		playerAttributeMentalTableColumnName.add(string);
		playerAttributePhysicalTableColumnName.add(string);
		playerAttributeTechnicalTableColumnName.add(string);

		string = GuiConfiguration.getMessage("value");
		string = string.toUpperCase();
		playerAttributeGoalkeepingTableColumnName.add(string);
		playerAttributeMentalTableColumnName.add(string);
		playerAttributePhysicalTableColumnName.add(string);
		playerAttributeTechnicalTableColumnName.add(string);


		// TODO
		for (String key : player.getAttributeGoalkeepingMap().keySet()) {
			Vector<String> attributeGoalkeepingVector = new Vector<>();

			attributeGoalkeepingVector.add(key);
			if (null == player.getAttributeGoalkeepingMap().get(key)) {
				break;
			} else {
				attributeGoalkeepingVector.add(player.getAttributeGoalkeepingMap().get(key));
			}
			
			playerAttributeGoalkeepingTableData.add(attributeGoalkeepingVector);
		}

		for (String key : player.getAttributeMentalMap().keySet()) {
			Vector<String> attributeMentalVector = new Vector<>();

			attributeMentalVector.add(key);
			attributeMentalVector.add(player.getAttributeMentalMap().get(key));

			playerAttributeMentalTableData.add(attributeMentalVector);
		}

		for (String key : player.getAttributePhysicalMap().keySet()) {
			Vector<String> attributePhysicalVector = new Vector<>();

			attributePhysicalVector.add(key);
			attributePhysicalVector.add(player.getAttributePhysicalMap().get(key));

			playerAttributePhysicalTableData.add(attributePhysicalVector);
		}

		for (String key : player.getAttributeTechnicalMap().keySet()) {
			Vector<String> attributeTechnicalVector = new Vector<>();

			attributeTechnicalVector.add(key);
			attributeTechnicalVector.add(player.getAttributeTechnicalMap().get(key));

			playerAttributeTechnicalTableData.add(attributeTechnicalVector);
		}




		// tabella tag
		string = GuiConfiguration.getMessage("tag");
		string = string.toUpperCase();
		playerTagTableColumnName.add(string);

		for (Tag tag : player.getTagSet()) {
			Vector<String> tagVector = new Vector<>();

			tagVector.add(tag.getName());

			playerTagTableData.add(tagVector);
		}
	}


	public void setPlayerCareerView(Map<String, String> infoPlayerMap,
																	Vector<String> playerClubCareerTableColumnName,
																	Vector<Vector<String>> playerClubCareerTableData,
																	Vector<String> playerNationalCareerTableColumnName,
																	Vector<Vector<String>> playerNationalCareerTableData,
																	String playerID)
	{
		fetchPlayer(playerID);
		fetchClubMilitancy(playerID);
		fetchNationality(playerID);

		Player player = ctrlPlayer.getPlayerMap().get(playerID);

		String string;

		// informazioni calciatori
		string = GuiConfiguration.getMessage("player");
		string = string.toUpperCase();
		infoPlayerMap.put(string, player.getName() + " " + player.getSurname());

		string = GuiConfiguration.getMessage("dob");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getDob());

		string = GuiConfiguration.getMessage("bornCountry");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getCountry().getName());

		string = GuiConfiguration.getMessage("preferredFoot");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getFoot());

		string = GuiConfiguration.getMessage("mainPosition");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getPosition().getName());

		string = GuiConfiguration.getMessage("role");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getRole());

		string = GuiConfiguration.getMessage("retiredDate");
		string = StringUtils.capitalize(string);
		if (null == player.getRetiredDate()) {
			infoPlayerMap.put(string, "");
		} else {
			infoPlayerMap.put(string, player.getRetiredDate());
		}


		// tabella carriera club
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		playerClubCareerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		playerClubCareerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		playerClubCareerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		playerClubCareerTableColumnName.add(string);

		for (String key : player.getClubCareer().keySet()) {
			Vector<String> clubCareerVector = new Vector<>();

			String[] keyPart = key.split("_");

			String season = keyPart[0];
			season += "/";
			season += ((Integer) (Integer.parseInt(keyPart[0]) + 1)).toString();

			clubCareerVector.add(season);

			String type = keyPart[1];

			clubCareerVector.add(type);

			clubCareerVector.add(player.getClubCareer().get(key).getLongName());
			clubCareerVector.add(player.getClubCareer().get(key).getCountry().getName());

			playerClubCareerTableData.add(clubCareerVector);
		}

		// tabella carriera nazionale
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		playerNationalCareerTableColumnName.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		playerNationalCareerTableColumnName.add(string);


		for (String key : player.getNationalCareer().keySet()) {
			Vector<String> nationalCareerVector = new Vector<>();

			nationalCareerVector.add(key);
			nationalCareerVector.add(player.getNationalCareer().get(key).getLongName());

			playerNationalCareerTableData.add(nationalCareerVector);
		}
	}


	public void setPlayerStatisticView(Map<String, String> infoPlayerMap,
																		 Vector<String> playerStatisticTableColumnName,
																		 Vector<Vector<String>> playerStatisticTableData,
																		 String playerID,
																		 String teamType,
																		 String teamID,
																		 String competitionID,
																		 String startYear,
																		 String endYear)
	{
		fetchPlayer(playerID);
		fetchStatisticPlayer(playerID, teamType, teamID, competitionID, startYear, endYear);

		Player player = ctrlPlayer.getPlayerMap().get(playerID);

		String string;

		// informazioni calciatori
		string = GuiConfiguration.getMessage("player");
		string = string.toUpperCase();
		infoPlayerMap.put(string, player.getName() + " " + player.getSurname());

		string = GuiConfiguration.getMessage("dob");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getDob());

		string = GuiConfiguration.getMessage("bornCountry");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getCountry().getName());

		string = GuiConfiguration.getMessage("preferredFoot");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getFoot());

		string = GuiConfiguration.getMessage("mainPosition");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getPosition().getName());

		string = GuiConfiguration.getMessage("role");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getRole());

		string = GuiConfiguration.getMessage("retiredDate");
		string = StringUtils.capitalize(string);
		if (null == player.getRetiredDate()) {
			infoPlayerMap.put(string, "");
		} else {
			infoPlayerMap.put(string, player.getRetiredDate());
		}


		// tabella statistiche
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		playerStatisticTableColumnName.add(string);

		Set<Statistic> playerStatisticSet = player.getStatisticSet();

		for (Statistic playerStatistic : playerStatisticSet) {
			Vector<String> statisticVector = new Vector<>();

			statisticVector.add(playerStatistic.getCompetitionYear());
			statisticVector.add(playerStatistic.getCompetition().getName());
			statisticVector.add(playerStatistic.getTeam().getLongName());
			statisticVector.add(playerStatistic.getMatch());
			statisticVector.add(playerStatistic.getGoalScored());
			statisticVector.add(playerStatistic.getPenaltyScored());
			statisticVector.add(playerStatistic.getAssist());
			statisticVector.add(playerStatistic.getYellowCard());
			statisticVector.add(playerStatistic.getRedCard());
			statisticVector.add(playerStatistic.getGoalConceded());
			statisticVector.add(playerStatistic.getPenaltySaved());

			playerStatisticTableData.add(statisticVector);
		}
	}


	public void setPlayerCaseView(Map<String, String> infoPlayerMap,
																Vector<String> playerClubTrophyTableColumnName,
																Vector<Vector<String>> playerClubTrophyTableData,
																Vector<String> playerNationalTrophyTableColumnName,
																Vector<Vector<String>> playerNationalTrophyTableData,
																Vector<String> playerPrizeTableColumnName,
																Vector<Vector<String>> playerPrizeTableData,
																String playerID)
	{
		fetchPlayer(playerID);

		Player player = ctrlPlayer.getPlayerMap().get(playerID);

		String string;

		// informazioni calciatori
		string = GuiConfiguration.getMessage("player");
		string = string.toUpperCase();
		infoPlayerMap.put(string, player.getName() + " " + player.getSurname());

		string = GuiConfiguration.getMessage("dob");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getDob());

		string = GuiConfiguration.getMessage("bornCountry");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getCountry().getName());

		string = GuiConfiguration.getMessage("preferredFoot");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getFoot());

		string = GuiConfiguration.getMessage("mainPosition");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getPosition().getName());

		string = GuiConfiguration.getMessage("role");
		string = StringUtils.capitalize(string);
		infoPlayerMap.put(string, player.getRole());

		string = GuiConfiguration.getMessage("retiredDate");
		string = StringUtils.capitalize(string);
		if (null == player.getRetiredDate()) {
			infoPlayerMap.put(string, "");
		} else {
			infoPlayerMap.put(string, player.getRetiredDate());
		}


		fetchPlayerTrophy(playerID, "CLUB");

		// tabella trofei club
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		playerClubTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		playerClubTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		playerClubTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();
		playerClubTrophyTableColumnName.add(string);

		Set<Trophy> playerTrophySet = player.getTrophySet();

		for (Trophy playerTrophy : playerTrophySet) {
			Vector<String> trophyVector = new Vector<>();

			trophyVector.add(playerTrophy.getAssignedYear());
			trophyVector.add(playerTrophy.getCompetition().getName());
			trophyVector.add(playerTrophy.getTeam().getLongName());
			trophyVector.add(playerTrophy.getName());

			playerClubTrophyTableData.add(trophyVector);
		}


		fetchPlayerTrophy(playerID, "NATIONAL");

		// tabella trofei nazionale
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		playerNationalTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		playerNationalTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		playerNationalTrophyTableColumnName.add(string);

		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();
		playerNationalTrophyTableColumnName.add(string);

		playerTrophySet = player.getTrophySet();

		for (Trophy playerTrophy : playerTrophySet) {
			Vector<String> trophyVector = new Vector<>();

			trophyVector.add(playerTrophy.getAssignedYear());
			trophyVector.add(playerTrophy.getCompetition().getName());
			trophyVector.add(playerTrophy.getTeam().getLongName());
			trophyVector.add(playerTrophy.getName());

			playerNationalTrophyTableData.add(trophyVector);
		}

		fetchPrize(playerID);

		// tabella premi
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		playerPrizeTableColumnName.add(string);

		string = GuiConfiguration.getMessage("prize");
		string = string.toUpperCase();
		playerPrizeTableColumnName.add(string);

		string = GuiConfiguration.getMessage("given");
		string = string.toUpperCase();
		playerPrizeTableColumnName.add(string);

		Set<Prize> playerPrizeSet = player.getPrizeSet();

		for (Prize playerPrize : playerPrizeSet) {
			Vector<String> prizeVector = new Vector<>();

			prizeVector.add(playerPrize.getAssignedYear());
			prizeVector.add(playerPrize.getName());
			prizeVector.add(playerPrize.getGiven());

			playerPrizeTableData.add(prizeVector);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * POSITION
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param role
	 * @param code
	 * @param name
	 * @return
	 */
	private Position newPosition(String role,
															 String code,
															 String name)
	{
		return new Position(role, code, name);
	}


	/**
	 * TODO
	 * @return
	 */
	private Position newPosition()
	{
		return newPosition(null, null, null);
	}

	/**
	 * TODO
	 */
	private void fetchPosition()
	{
		List<String> listPositionID = new ArrayList<>();
		List<String> listPositionRole = new ArrayList<>();
		List<String> listPositionCode = new ArrayList<>();
		List<String> listPositionName = new ArrayList<>();

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						listPositionID,
						listPositionRole,
						listPositionCode,
						listPositionName
		);

		Map<String, Position> positionMap = ctrlPosition.getPositionMap();
		positionMap.clear();


		for (int i = 0; i < listPositionID.size(); ++i) {
			String positionID = listPositionID.get(i);
			positionMap.putIfAbsent(
							positionID,
							newPosition(
											listPositionRole.get(i),
											listPositionCode.get(i),
											listPositionName.get(i)
							)
			);
		}
	}


	private void fetchPosition(String playerID)
	{
		List<String> listPositionRole = new ArrayList<>();
		List<String> listPositionCode = new ArrayList<>();
		List<String> listPositionName = new ArrayList<>();

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						playerID,
						listPositionRole,
						listPositionCode,
						listPositionName
		);


		Set<Position> playerPositionSet = ctrlPlayer.getPlayerMap().get(playerID).getPositionSet();
		playerPositionSet.clear();


		for (int i = 0; i < listPositionName.size(); ++i) {
			playerPositionSet.add(
							newPosition(
											listPositionRole.get(i),
											listPositionCode.get(i),
											listPositionName.get(i)
							)
			);
		}
	}


	/**
	 * TODO
	 * @param positionNameVector
	 * @param positionNameMap
	 */
	public void setPositionComboBox(Vector<String> positionNameVector,
																	Map<String, String> positionNameMap)
	{
		fetchPosition();

		for (String key : ctrlPosition.getPositionMap().keySet()) {

			String positionName = ctrlPosition.getPositionMap().get(key).getName();

			positionNameVector.add(positionName);
			positionNameMap.put(positionName, key);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * STATISTIC
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param team
	 * @param competition
	 * @param competitionYear
	 * @param match
	 * @param goalScored
	 * @param penaltyScored
	 * @param assist
	 * @param yellowCard
	 * @param redCard
	 * @param goalConceded
	 * @param penaltySaved
	 * @return
	 */
	private Statistic newStatistic(Team team,
																 Competition competition,
																 String competitionYear,
																 String match,
																 String goalScored,
																 String penaltyScored,
																 String assist,
																 String yellowCard,
																 String redCard,
																 String goalConceded,
																 String penaltySaved)
	{
		return new Statistic(
						team,
						competition,
						competitionYear,
						match,
						goalScored,
						penaltyScored,
						assist,
						yellowCard,
						redCard,
						goalConceded,
						penaltySaved
		);
	}



	/**
	 * TODO
	 * @param teamType
	 * @param playerRole
	 */
	private void fetchStatisticTotal(String teamType,
																	String playerRole)
	{
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listStatisticMatch = new ArrayList<>();
		List<String> listStatisticGoalScored = new ArrayList<>();
		List<String> listStatisticPenaltyScored = new ArrayList<>();
		List<String> listStatisticAssist = new ArrayList<>();
		List<String> listStatisticYellowCard = new ArrayList<>();
		List<String> listStatisticRedCard = new ArrayList<>();
		List<String> listStatisticGoalConceded = new ArrayList<>();
		List<String> listStatisticPenaltySaved = new ArrayList<>();

		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticDB(
						teamType,
						playerRole,
						listPlayerID,
						listPlayerRole,
						listPlayerName,
						listPlayerSurname,
						listStatisticMatch,
						listStatisticGoalScored,
						listStatisticPenaltyScored,
						listStatisticAssist,
						listStatisticYellowCard,
						listStatisticRedCard,
						listStatisticGoalConceded,
						listStatisticPenaltySaved
		);


		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();
		playerMap.clear();


		for (int i = 0; i < listPlayerID.size(); ++i) {
			String playerID = listPlayerID.get(i);
			playerMap.putIfAbsent(
							playerID,
							newPlayer(
											listPlayerName.get(i),
											listPlayerSurname.get(i),
											null,
											null,
											null,
											null,
											listPlayerRole.get(i),
											null
							)
			);

			playerMap.get(playerID).getStatisticSet().add(
							newStatistic(
											null,
											null,
											null,
											listStatisticMatch.get(i),
											listStatisticGoalScored.get(i),
											listStatisticPenaltyScored.get(i),
											listStatisticAssist.get(i),
											listStatisticYellowCard.get(i),
											listStatisticRedCard.get(i),
											listStatisticGoalConceded.get(i),
											listStatisticPenaltySaved.get(i)
							)
			);
		}

	}


	private void fetchStatisticCompetitionEdition(String competitionStartYear,
																								String competitionID)
	{
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listStatisticMatch = new ArrayList<>();
		List<String> listStatisticGoalScored = new ArrayList<>();
		List<String> listStatisticPenaltyScored = new ArrayList<>();
		List<String> listStatisticAssist = new ArrayList<>();
		List<String> listStatisticYellowCard = new ArrayList<>();
		List<String> listStatisticRedCard = new ArrayList<>();
		List<String> listStatisticGoalConceded = new ArrayList<>();
		List<String> listStatisticPenaltySaved = new ArrayList<>();

		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticDB(
						competitionStartYear,
						competitionID,
						listTeamID,
						listTeamLongName,
						listPlayerID,
						listPlayerRole,
						listPlayerName,
						listPlayerSurname,
						listStatisticMatch,
						listStatisticGoalScored,
						listStatisticPenaltyScored,
						listStatisticAssist,
						listStatisticYellowCard,
						listStatisticRedCard,
						listStatisticGoalConceded,
						listStatisticPenaltySaved
		);


		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		Map<String, Player> playerMap = ctrlPlayer.getPlayerMap();
		playerMap.clear();


		for (int i = 0; i < listPlayerID.size(); ++i) {
			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											null,
											null
							)
			);

			String playerID = listPlayerID.get(i);
			playerMap.putIfAbsent(
							playerID,
							newPlayer(
											listPlayerName.get(i),
											listPlayerSurname.get(i),
											null,
											null,
											null,
											null,
											listPlayerRole.get(i),
											null
							)
			);

			playerMap.get(playerID).getStatisticSet().add(
							newStatistic(
											teamMap.get(teamID),
											null,
											null,
											listStatisticMatch.get(i),
											listStatisticGoalScored.get(i),
											listStatisticPenaltyScored.get(i),
											listStatisticAssist.get(i),
											listStatisticYellowCard.get(i),
											listStatisticRedCard.get(i),
											listStatisticGoalConceded.get(i),
											listStatisticPenaltySaved.get(i)
							)
			);
		}
	}


	private void fetchStatisticPlayer(String playerID,
																		String teamType,
																		String teamID,
																		String competitionID,
																		String startYear,
																		String endYear)
	{
		List<String> listCompetitionStartYear = new ArrayList<>();
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();
		List<String> listStatisticMatch = new ArrayList<>();
		List<String> listStatisticGoalScored = new ArrayList<>();
		List<String> listStatisticPenaltyScored = new ArrayList<>();
		List<String> listStatisticAssist = new ArrayList<>();
		List<String> listStatisticYellowCard = new ArrayList<>();
		List<String> listStatisticRedCard = new ArrayList<>();
		List<String> listStatisticGoalConceded = new ArrayList<>();
		List<String> listStatisticPenaltySaved = new ArrayList<>();

		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticDB(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear,
						listCompetitionStartYear,
						listCompetitionID,
						listCompetitionName,
						listTeamID,
						listTeamLongName,
						listStatisticMatch,
						listStatisticGoalScored,
						listStatisticPenaltyScored,
						listStatisticAssist,
						listStatisticYellowCard,
						listStatisticRedCard,
						listStatisticGoalConceded,
						listStatisticPenaltySaved
		);


		Map<String, Competition> competitionMap = ctrlCompetition.getCompetitionMap();
		competitionMap.clear();

		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		Set<Statistic> playerStatisticSet = ctrlPlayer.getPlayerMap().get(playerID).getStatisticSet();
		playerStatisticSet.clear();


		for (int i = 0; i < listCompetitionStartYear.size(); ++i) {
			String competition_ID = listCompetitionID.get(i);
			competitionMap.putIfAbsent(
							competition_ID,
							newCompetition(
											null,
											null,
											listCompetitionName.get(i),
											null
							)
			);

			String team_ID = listTeamID.get(i);
			teamMap.putIfAbsent(
							team_ID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											null,
											null
							)
			);

			playerStatisticSet.add(
							newStatistic(
											teamMap.get(team_ID),
											competitionMap.get(competition_ID),
											listCompetitionStartYear.get(i),
											listStatisticMatch.get(i),
											listStatisticGoalScored.get(i),
											listStatisticPenaltyScored.get(i),
											listStatisticAssist.get(i),
											listStatisticYellowCard.get(i),
											listStatisticRedCard.get(i),
											listStatisticGoalConceded.get(i),
											listStatisticPenaltySaved.get(i)
							)
			);
		}
	}


	public void setStatisticTable(Vector<String> statisticTableColumnName,
																Vector<Vector<String>> statisticTableData,
																String teamType,
																String playerRole)
	{
		fetchStatisticTotal(teamType, playerRole);

		String string;

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);


		for (String key : ctrlPlayer.getPlayerMap().keySet()) {
			Vector<String> statisticVector = new Vector<>();

			Player player = ctrlPlayer.getPlayerMap().get(key);
			Statistic playerStatistic = player.getStatisticSet().iterator().next();


			statisticVector.add(player.getRole());
			statisticVector.add(player.getName());
			statisticVector.add(player.getSurname());
			statisticVector.add(playerStatistic.getMatch());
			statisticVector.add(playerStatistic.getGoalScored());
			statisticVector.add(playerStatistic.getPenaltyScored());
			statisticVector.add(playerStatistic.getAssist());
			statisticVector.add(playerStatistic.getYellowCard());
			statisticVector.add(playerStatistic.getRedCard());
			statisticVector.add(playerStatistic.getGoalConceded());
			statisticVector.add(playerStatistic.getPenaltySaved());

			statisticTableData.add(statisticVector);
		}
	}


	public void setStatisticCompetitionEditionTable(Vector<String> statisticTableColumnName,
																									Vector<Vector<String>> statisticTableData,
																									String competitionStartYear,
																									String competitionID)
	{
		fetchStatisticCompetitionEdition(competitionStartYear, competitionID);

		String string;

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);


		for (String key : ctrlPlayer.getPlayerMap().keySet()) {
			Vector<String> statisticVector = new Vector<>();

			Player player = ctrlPlayer.getPlayerMap().get(key);
			Statistic playerStatistic = player.getStatisticSet().iterator().next();

			statisticVector.add(playerStatistic.getTeam().getLongName());
			statisticVector.add(player.getRole());
			statisticVector.add(player.getName());
			statisticVector.add(player.getSurname());
			statisticVector.add(playerStatistic.getMatch());
			statisticVector.add(playerStatistic.getGoalScored());
			statisticVector.add(playerStatistic.getPenaltyScored());
			statisticVector.add(playerStatistic.getAssist());
			statisticVector.add(playerStatistic.getYellowCard());
			statisticVector.add(playerStatistic.getRedCard());
			statisticVector.add(playerStatistic.getGoalConceded());
			statisticVector.add(playerStatistic.getPenaltySaved());

			statisticTableData.add(statisticVector);
		}
	}


	public void setStatisticPlayerTable(Vector<String> statisticTableColumnName,
																			Vector<Vector<String>> statisticTableData,
																			String playerID,
																			String teamType,
																			String teamID,
																			String competitionID,
																			String startYear,
																			String endYear)
	{
		fetchStatisticPlayer(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear
		);

		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		statisticTableColumnName.add(string);

		Set<Statistic> playerStatisticSet = ctrlPlayer.getPlayerMap().get(playerID).getStatisticSet();

		for (Statistic playerStatistic : playerStatisticSet) {
			Vector<String> statisticVector = new Vector<>();

			statisticVector.add(playerStatistic.getCompetitionYear());
			statisticVector.add(playerStatistic.getCompetition().getName());
			statisticVector.add(playerStatistic.getTeam().getLongName());
			statisticVector.add(playerStatistic.getMatch());
			statisticVector.add(playerStatistic.getGoalScored());
			statisticVector.add(playerStatistic.getPenaltyScored());
			statisticVector.add(playerStatistic.getAssist());
			statisticVector.add(playerStatistic.getYellowCard());
			statisticVector.add(playerStatistic.getRedCard());
			statisticVector.add(playerStatistic.getGoalConceded());
			statisticVector.add(playerStatistic.getPenaltySaved());

			statisticTableData.add(statisticVector);
		}
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PARTECIPATION
	 *------------------------------------------------------------------------------------------------------*/

	private void fetchPartecipation(String teamID,
																	String competitionStartYear)
	{
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionType = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();
		List<String> listConfederationID = new ArrayList<>();
		List<String> listConfederationShortName = new ArrayList<>();

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationDB(
						teamID,
						competitionStartYear,
						listCompetitionID,
						listCompetitionType,
						listCompetitionName,
						listConfederationID,
						listConfederationShortName
		);


		Map<String, Confederation> confederationMap = ctrlConfederation.getConfederationMap();
		confederationMap.clear();

		Set<Competition> teamCompetitionSet = ctrlTeam.getTeamMap().get(teamID).getCompetitionSet();
		teamCompetitionSet.clear();


		for (int i = 0; i < listCompetitionID.size(); ++i) {
			String confederationID = listConfederationID.get(i);
			confederationMap.putIfAbsent(
							confederationID,
							newConfederation(
											listConfederationShortName.get(i),
											null,
											null,
											null
							)
			);

			teamCompetitionSet.add(
							newCompetition(
											listCompetitionType.get(i),
											null,
											listCompetitionName.get(i),
											confederationMap.get(confederationID)
							)
			);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * MILITANCY
	 *------------------------------------------------------------------------------------------------------*/
	private void fetchMilitancy(String teamID,
															String competitionStartYear)
	{
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(
						teamID,
						competitionStartYear,
						listPlayerID,
						listPlayerName,
						listPlayerSurname,
						listPlayerRole
		);


		Map<String, Player> teamPlayerMap = ctrlTeam.getTeamMap().get(teamID).getPlayerMap();
		teamPlayerMap.clear();


		for (int i = 0; i < listPlayerID.size(); ++i) {
			teamPlayerMap.putIfAbsent(
							listPlayerID.get(i),
							newPlayer(
											listPlayerName.get(i),
											listPlayerSurname.get(i),
											null,
											null,
											null,
											null,
											listPlayerRole.get(i),
											null
							)
			);
		}
	}


	private void fetchClubMilitancy(String playerID)
	{
		List<String> listMilitancyYear = new ArrayList<>();
		List<String> listMilitancyType = new ArrayList<>();
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();
		List<String> listCountryID = new ArrayList<>();
		List<String> listCountryName = new ArrayList<>();

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(
						playerID,
						listMilitancyYear,
						listMilitancyType,
						listTeamID,
						listTeamLongName,
						listCountryID,
						listCountryName
		);


		Map<String, Country> countryMap = ctrlCountry.getCountryMap();
		countryMap.clear();

		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		Map<String, Team> playerClubCareer = ctrlPlayer.getPlayerMap().get(playerID).getClubCareer();
		playerClubCareer.clear();


		for (int i = 0; i < listMilitancyYear.size(); ++i) {
			String countryID = listCountryID.get(i);
			countryMap.putIfAbsent(
							countryID,
							newCountry(
											null,
											null,
											listCountryName.get(i),
											null
							)
			);

			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											countryMap.get(countryID),
											null
							)
			);

			playerClubCareer.putIfAbsent(
							listMilitancyYear.get(i) + "_" + listMilitancyType.get(i),
							teamMap.get(teamID)
			);
		}
	}


	private void fetchNationalMilitancy(String playerID)
	{
		List<String> listMilitancyYear = new ArrayList<>();
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(
						playerID,
						listMilitancyYear,
						listTeamID,
						listTeamLongName
		);


		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		Map<String, Team> playerNationalCareer = ctrlPlayer.getPlayerMap().get(playerID).getNationalCareer();
		playerNationalCareer.clear();


		for (int i = 0; i < listMilitancyYear.size(); ++i) {
			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											null,
											null
							)
			);

			playerNationalCareer.putIfAbsent(
							listMilitancyYear.get(i),
							teamMap.get(teamID)
			);
		}
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TROPHY
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param type
	 * @param role
	 * @param name
	 * @return
	 */
	private Trophy newTrophy(String type,
													 String role,
													 String name,
													 Player player,
													 Team team,
													 Competition competition,
													 String assignedYear)
	{
		return new Trophy(type, role, name, player, team, competition, assignedYear);
	}


	/**
	 * TODO
	 * @return
	 */
	private Trophy newTrophy()
	{
		return newTrophy(null, null, null, null, null, null, null);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param competitionStartYear
	 */
	private void fetchTrophy(String teamID,
													 String competitionStartYear)
	{
		List<String> listTrophyID = new ArrayList<>();
		List<String> listTrophyName = new ArrayList<>();
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						teamID,
						competitionStartYear,
						listTrophyID,
						listTrophyName,
						listCompetitionID,
						listCompetitionName
		);

		Map<String, Competition> competitionMap = ctrlCompetition.getCompetitionMap();
		competitionMap.clear();

		Set<Trophy> teamTrophySet = ctrlTeam.getTeamMap().get(teamID).getTrophySet();
		teamTrophySet.clear();


		for (int i = 0; i < listTrophyID.size(); ++i) {
			String competitionID = listCompetitionID.get(i);
			competitionMap.putIfAbsent(
							competitionID,
							newCompetition(
											null,
											null,
											listCompetitionName.get(i),
											null
							)
			);

			teamTrophySet.add(
							newTrophy(
											null,
											null,
											listTrophyName.get(i),
											null,
											null,
											competitionMap.get(competitionID),
											null
							)
			);
		}
	}


	private void fetchPlayerTrophy(String playerID,
																 String teamType)
	{
		List<String> listCompetitionStartYear = new ArrayList<>();
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();
		List<String> listTeamID = new ArrayList<>();
		List<String> listTeamLongName = new ArrayList<>();
		List<String> listTrophyName = new ArrayList<>();

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						playerID,
						teamType,
						listCompetitionStartYear,
						listCompetitionID,
						listCompetitionName,
						listTeamID,
						listTeamLongName,
						listTrophyName
		);

		Map<String, Competition> competitionMap = ctrlCompetition.getCompetitionMap();
		competitionMap.clear();

		Map<String, Team> teamMap = ctrlTeam.getTeamMap();
		teamMap.clear();

		Set<Trophy> playerTrophySet = ctrlPlayer.getPlayerMap().get(playerID).getTrophySet();
		playerTrophySet.clear();


		for (int i = 0; i < listCompetitionStartYear.size(); ++i) {
			String competitionID = listCompetitionID.get(i);
			competitionMap.putIfAbsent(
							competitionID,
							newCompetition(
											null,
											null,
											listCompetitionName.get(i),
											null
							)
			);

			String teamID = listTeamID.get(i);
			teamMap.putIfAbsent(
							teamID,
							newTeam(
											null,
											null,
											listTeamLongName.get(i),
											null,
											null
							)
			);

			playerTrophySet.add(
							newTrophy(
											null,
											null,
											listTrophyName.get(i),
											null,
											teamMap.get(teamID),
											competitionMap.get(competitionID),
											listCompetitionStartYear.get(i)
							)
			);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PRIZE
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param type
	 * @param role
	 * @param name
	 * @param given
	 * @return
	 */
	private Prize newPrize(String type,
												 String role,
												 String name,
												 String given,
												 Player player,
												 Team team,
												 String assignedYear)
	{
		return new Prize(type, role, name, given, player, team, assignedYear);
	}



	private Prize newPrize()
	{
		return newPrize(null, null, null, null, null, null, null);
	}




	private void fetchPrize(String teamID,
													String startYear)
	{
		List<String> listPrizeID = new ArrayList<>();
		List<String> listPrizeName = new ArrayList<>();
		List<String> listPrizeGiven = new ArrayList<>();

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizeDB(
						teamID,
						startYear,
						listPrizeID,
						listPrizeName,
						listPrizeGiven
		);


		Set<Prize> teamPrizeSet = ctrlTeam.getTeamMap().get(teamID).getPrizeSet();
		teamPrizeSet.clear();


		for (int i = 0; i < listPrizeID.size(); ++i) {
			teamPrizeSet.add(
							newPrize(
											null,
											null,
											listPrizeName.get(i),
											listPrizeGiven.get(i),
											null,
											null,
											null
							)
			);
		}
	}


	private void fetchPrize(String playerID)
	{
		List<String> listPrizeAssignYear = new ArrayList<>();
		List<String> listPrizeName = new ArrayList<>();
		List<String> listPrizeGiven = new ArrayList<>();

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizeDB(
						playerID,
						listPrizeAssignYear,
						listPrizeName,
						listPrizeGiven
		);


		Set<Prize> playerPrizeSet = ctrlPlayer.getPlayerMap().get(playerID).getPrizeSet();
		playerPrizeSet.clear();


		for (int i = 0; i < listPrizeAssignYear.size(); ++i) {
			playerPrizeSet.add(
							newPrize(
											null,
											null,
											listPrizeName.get(i),
											listPrizeGiven.get(i),
											null,
											null,
											listPrizeAssignYear.get(i)
							)
			);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * NATIONALITY
	 *------------------------------------------------------------------------------------------------------*/

	private void fetchNationality(String playerID)
	{
		List<String> listCountryName = new ArrayList<>();

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(playerID, listCountryName);

		Set<Country> playerCountrySet = ctrlPlayer.getPlayerMap().get(playerID).getCountrySet();
		playerCountrySet.clear();


		for (int i = 0; i < listCountryName.size(); ++i) {
			playerCountrySet.add(
							newCountry(
											null,
											null,
											listCountryName.get(i),
											null
							)
			);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * ATTRIBUTE
	 *------------------------------------------------------------------------------------------------------*/


	private void fetchAttribute(String playerID)
	{
		Map<String, String> attributeGoalkeepingMap = new LinkedHashMap<>();
		Map<String, String> attributeMentalMap = new LinkedHashMap<>();
		Map<String, String> attributePhysicalMap = new LinkedHashMap<>();
		Map<String, String> attributeTechnicalMap = new LinkedHashMap<>();

		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		attributeGoalkeepingDAO.fetchAttributeGoalkeepingDB(playerID, attributeGoalkeepingMap);

		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		attributeMentalDAO.fetchAttributeMentalDB(playerID, attributeMentalMap);

		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		attributePhysicalDAO.fetchAttributePhysicalDB(playerID, attributePhysicalMap);

		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		attributeTechnicalDAO.fetchAttributeTechnicalDB(playerID, attributeTechnicalMap);

		Player player = ctrlPlayer.getPlayerMap().get(playerID);

		player.setAttributeGoalkeepingMap(attributeGoalkeepingMap);
		player.setAttributeMentalMap(attributeMentalMap);
		player.setAttributePhysicalMap(attributePhysicalMap);
		player.setAttributeTechnicalMap(attributeTechnicalMap);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TAG
	 *------------------------------------------------------------------------------------------------------*/

	private Tag newTag(Boolean goalkeeper,
										 Boolean positive,
										 String name)
	{
		return new Tag(goalkeeper, positive, name);
	}


	private Tag newTag()
	{
		return newTag(null, null, null);
	}

	private void fetchTag(String playerID)
	{
		List<String> listTagName = new ArrayList<>();

		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(playerID, listTagName);

		Set<Tag> playerTagSet = ctrlPlayer.getPlayerMap().get(playerID).getTagSet();
		playerTagSet.clear();


		for (int i = 0; i < listTagName.size(); ++i) {
			playerTagSet.add(
							newTag(
											null,
											null,
											listTagName.get(i)
							)
			);
		}
	}
	/*------------------------------------------------------------------------------------------------------*/
}

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
	 */
	private void setTotalCountry()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		newCountry().setTotalCountries(countryDAO.countCountryDB());
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countCountries()
	{
		setTotalCountry();
		return newCountry().getTotalCountries();
	}

	/**
	 * TODO
	 * @param listCountryID
	 * @param listCountryType
	 * @param listCountryCode
	 * @param listCountryName
	 * @param listSuperCountryID
	 * @param listSuperCountryName
	 */
	private void mapCountry(List<String> listCountryID,
													List<String> listCountryType,
													List<String> listCountryCode,
													List<String> listCountryName,
													List<String> listSuperCountryID,
													List<String> listSuperCountryName)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();
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

		mapCountry(
						listCountryID,
						listCountryType,
						listCountryCode,
						listCountryName,
						listSuperCountryID,
						listSuperCountryName
		);
	}


	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	private void setCountryComboBoxDataMap(Vector<String> comboBoxData,
																				 Map<String, String> comboBoxMap)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();

		for (String key : countryMap.keySet()) {
			String countryName = countryMap.get(key).getName();

			comboBoxData.add(countryName);
			comboBoxMap.put(countryName, key);
		}
	}


	/**
	 * TODO
	 * @param tableData
	 */
	private void setCountryTableData(Vector<Vector<String>> tableData)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();

		for (String key : countryMap.keySet()) {
			Vector<String> vector = new Vector<>();
			Country country = countryMap.get(key);

			vector.add(country.getName());
			vector.add(country.getCode());
			vector.add(StringUtils.capitalize(GuiConfiguration.getMessage(country.getType().toLowerCase())));

			if (country.getType().equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
				vector.add("");
			} else {
				vector.add(country.getSuperCountry().getName());
			}

			tableData.add(vector);
		}
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superCountryID
	 * @param countryNameVector
	 * @param countryNameMap
	 */
	public void setCountryComboBox(String countryType,
																 String superCountryID,
																 Vector<String> countryNameVector,
																 Map<String, String> countryNameMap)
	{
		fetchCountry(countryType, superCountryID);
		setCountryComboBoxDataMap(countryNameVector, countryNameMap);
	}

	/**
	 * TODO
	 * @param countryType
	 * @param superCountryID
	 * @param countryTableData
	 */
	public void setCountryTable(String countryType,
															String superCountryID,
															Vector<Vector<String>> countryTableData)
	{
		fetchCountry(countryType, superCountryID);
		setCountryTableData(countryTableData);
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


	private void setTotalConfederation()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		newConfederation().setTotalConfederations(confederationDAO.countConfederationDB());
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countConfederations()
	{
		setTotalConfederation();
		return newConfederation().getTotalConfederations();
	}


	private void mapConfederation(List<String> listConfederationID,
																List<String> listConfederationShortName,
																List<String> listConfederationLongName,
																List<String> listCountryID,
																List<String> listCountryName,
																List<String> listCountryType,
																List<String> listSuperConfederationID,
																List<String> listSuperConfederationShortName)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();
		countryMap.clear();

		Map<String, Confederation> superConfederationMap = new LinkedHashMap<>();

		Map<String, Confederation> confederationMap = newConfederation().getConfederationMap();
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
											listSuperConfederationShortName.get(i),
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

		mapConfederation(
						listConfederationID,
						listConfederationShortName,
						listConfederationLongName,
						listCountryID,
						listCountryName,
						listCountryType,
						listSuperConfederationID,
						listSuperConfederationShortName
		);

	}



	private void setConfederationComboBoxDataMap(Vector<String> comboBoxData,
																							 Map<String, String> comboBoxMap)
	{
		Map<String, Confederation> confederationMap = newConfederation().getConfederationMap();

		for (String key : confederationMap.keySet()) {

			String confederationShortName = confederationMap.get(key).getShortName();

			comboBoxData.add(confederationShortName);
			comboBoxMap.put(confederationShortName, key);
		}
	}


	private void setConfederationTableData(Vector<Vector<String>> tableData)
	{
		Map<String, Confederation> confederationMap = newConfederation().getConfederationMap();

		for (String key : confederationMap.keySet()) {
			Vector<String> vector = new Vector<>();
			Confederation confederation = confederationMap.get(key);

			vector.add(confederation.getLongName());
			vector.add(confederation.getShortName());
			vector.add(StringUtils.capitalize(GuiConfiguration.getMessage(confederation.getCountry().getType().toLowerCase())));

			vector.add(confederation.getCountry().getName());

			if (confederation.getCountry().getType().equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
				vector.add("");
			} else {
				vector.add(confederation.getSuperConfederation().getShortName());
			}

			tableData.add(vector);
		}
	}


	public void setConfederationComboBox(String typeCountry,
																			 String superConfederationID,
																			 Vector<String> confederationShortNameVector,
																			 Map<String, String> confederationShortNameMap)
	{
		fetchConfederation(typeCountry, superConfederationID);
		setConfederationComboBoxDataMap(confederationShortNameVector, confederationShortNameMap);
	}


	public void setConfederationTable(String countryType,
																		String superConfederationID,
																		Vector<Vector<String>> confederationTableData)
	{
		fetchConfederation(countryType, superConfederationID);
		setConfederationTableData(confederationTableData);
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




	private void setTotalCompetition()
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		newCompetition().setTotalCompetitions(competitionDAO.countCompetitionDB());
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countCompetitions()
	{
		setTotalCompetition();
		return newCompetition().getTotalCompetitions();
	}


	private void mapCompetition(List<String> listCompetitionID,
															List<String> listCompetitionType,
															List<String> listCompetitionTeamType,
															List<String> listCompetitionName,
															List<String> listConfederationID,
															List<String> listConfederationShortName,
															List<String> listCountryID,
															List<String> listCountryName)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();
		countryMap.clear();

		Map<String, Confederation> confederationMap = newConfederation().getConfederationMap();
		confederationMap.clear();

		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();
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


	private void mapCompetition(List<String> listCompetitionID,
															List<String> listCompetitionName)
	{
		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();
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

		mapCompetition(
						listCompetitionID,
						listCompetitionType,
						listCompetitionTeamType,
						listCompetitionName,
						listConfederationID,
						listConfederationShortName,
						listCountryID,
						listCountryName
		);
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

		mapCompetition(
						listCompetitionID,
						listCompetitionName
		);
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


	private void setCompetitionComboBoxDataMap(Vector<String> comboBoxData,
																						 Map<String, String> comboBoxMap)
	{
		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();

		for (String key : competitionMap.keySet()) {

			String competitionName = competitionMap.get(key).getName();

			comboBoxData.add(competitionName);
			comboBoxMap.put(competitionName, key);
		}
	}


	private void setCompetitionTableData(Vector<Vector<String>> tableData)
	{
		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();

		for (String key : competitionMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Competition competition = competitionMap.get(key);

			vector.add(competition.getName());
			vector.add(StringUtils.capitalize(GuiConfiguration.getMessage(competition.getType().toLowerCase())));
			vector.add(StringUtils.capitalize(GuiConfiguration.getMessage(competition.getTeamType().toLowerCase())));
			vector.add(competition.getConfederation().getShortName());
			vector.add(competition.getConfederation().getCountry().getName());

			tableData.add(vector);
		}
	}


	public void setCompetitionComboBox(String playerID,
																		 String teamType,
																		 Vector<String> competitionNameVector,
																		 Map<String, String> competitionNameMap)
	{
		fetchCompetition(playerID, teamType);
		setCompetitionComboBoxDataMap(competitionNameVector, competitionNameMap);
	}


	public void setCompetitionComboBox(String competitionSubName,
																		 String competitionType,
																		 String competitionTeamType,
																		 String competitionCountryType,
																		 String competitionContinentID,
																		 String competitionNationID,
																		 Vector<String> competitionNameVector,
																		 Map<String, String> competitionNameMap)
	{
		fetchCompetition(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID
		);

		setCompetitionComboBoxDataMap(competitionNameVector, competitionNameMap);
	}

	public void setCompetitionEditionComboBox(Vector<String> competitionEditionVector,
																						String competitionID)
	{
		fetchCompetitionEdition(competitionID);

		competitionEditionVector.addAll(ctrlCompetition.getCompetitionMap().get(competitionID).getEditionSet());
	}



	public void setCompetitionTable(String competitionSubName,
																	String competitionType,
																	String competitionTeamType,
																	String competitionCountryType,
																	String competitionContinentID,
																	String competitionNationID,
																	Vector<Vector<String>> competitionTableData)
	{
		fetchCompetition(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID
		);

		setCompetitionTableData(competitionTableData);
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


	private void setTotalTeam()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		newTeam().setTotalTeam(teamDAO.countTeamDB());
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countTeams()
	{
		setTotalTeam();
		return newTeam().getTotalTeam();
	}


	private void mapTeam(List<String> listTeamID,
											 List<String> listTeamType,
											 List<String> listTeamShortName,
											 List<String> listTeamLongName,
											 List<String> listCountryID,
											 List<String> listCountryName)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();
		countryMap.clear();

		Map<String, Team> teamMap = newTeam().getTeamMap();
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

	private void mapTeam(List<String> listTeamID,
											 List<String> listTeamLongName)
	{
		Map<String, Team> teamMap = newTeam().getTeamMap();
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

		mapTeam(
						listTeamID,
						listTeamType,
						listTeamShortName,
						listTeamLongName,
						listCountryID,
						listCountryName
		);
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

		mapTeam(
						listTeamID,
						listTeamLongName
		);
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

		mapTeam(
						listTeamID,
						listTeamLongName
		);
	}


	private void setTeamComboBoxDataMap(Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		Map<String, Team> teamMap = newTeam().getTeamMap();

		for (String key : teamMap.keySet()) {

			String teamLongName = teamMap.get(key).getLongName();

			comboBoxData.add(teamLongName);
			comboBoxMap.put(teamLongName, key);
		}
	}

	public void setTeamTableDataMap(Vector<Vector<String>> tableData,
																	Map<Integer, String> teamTableMap)
	{
		Map<String, Team> teamMap = newTeam().getTeamMap();

		Integer row = 0;

		for (String key : teamMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Team team = teamMap.get(key);

			vector.add(team.getLongName());
			vector.add(team.getShortName());
			vector.add(StringUtils.capitalize(GuiConfiguration.getMessage(team.getType().toLowerCase())));
			vector.add(team.getCountry().getName());

			tableData.add(vector);

			teamTableMap.put(row, key);
			++row;
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
	public void setTeamComboBox(String teamSubLongName,
															String teamSubShortName,
															String teamType,
															String teamContinentID,
															String teamNationID,
															Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap)
	{
		fetchTeam(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamContinentID,
						teamNationID
		);

		setTeamComboBoxDataMap(teamLongNameVector, teamLongNameMap);
	}


	public void setTeamComboBox(String playerID,
															Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap)
	{
		fetchTeamPlayer(playerID);
		setTeamComboBoxDataMap(teamLongNameVector, teamLongNameMap);
	}



	public void setTeamTable(String teamSubLongName,
													 String teamSubShortName,
													 String teamType,
													 String teamContinentID,
													 String teamNationID,
													 Vector<Vector<String>> teamTableData,
													 Map<Integer, String> teamTableMap)
	{
		fetchTeam(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamContinentID,
						teamNationID
		);

		setTeamTableDataMap(teamTableData, teamTableMap);
	}

	/**
	 * TODO
	 * @param teamLongNameVector
	 * @param teamLongNameMap
	 * @param competitionStartYear
	 * @param competitionID
	 */
	public void setTeamComboBox(String competitionStartYear,
															String competitionID,
															Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap)
	{
		fetchTeam(competitionStartYear, competitionID);
		setTeamComboBoxDataMap(teamLongNameVector, teamLongNameMap);
	}

	public void setTeamView(String teamID,
													String startYear,
													Map<String, String> infoTeamMap,
													Vector<Vector<String>> teamSquadTableData,
													Vector<Vector<String>> teamPartecipationTableData,
													Vector<Vector<String>> teamTrophyTableData,
													Vector<Vector<String>> teamPrizeTableData)
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


		for (String key : team.getPlayerMap().keySet()) {
			Vector<String> playerVector = new Vector<>();

			Player player = team.getPlayerMap().get(key);

			playerVector.add(player.getRole());
			playerVector.add(player.getName());
			playerVector.add(player.getSurname());

			teamSquadTableData.add(playerVector);
		}


		for (Competition competition : team.getCompetitionSet()) {
			Vector<String> partecipationVector = new Vector<>();

			partecipationVector.add(competition.getName());
			partecipationVector.add(competition.getType());
			partecipationVector.add(competition.getConfederation().getShortName());

			teamPartecipationTableData.add(partecipationVector);
		}


		for (Trophy trophy : team.getTrophySet()) {
			Vector<String> trophyVector = new Vector<>();

			trophyVector.add(trophy.getCompetition().getName());
			trophyVector.add(trophy.getName());

			teamTrophyTableData.add(trophyVector);
		}


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


	private void setTotalPlayer()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		newPlayer().setTotalPlayers(playerDAO.countPlayerDB());
	}

	/**
	 * TODO
	 * @return
	 */
	public Integer countPlayers()
	{
		setTotalPlayer();
		return newPlayer().getTotalPlayers();
	}


	private void mapPlayer(List<String> listPlayerID,
												 List<String> listPlayerName,
												 List<String> listPlayerSurname,
												 List<String> listPlayerDob,
												 List<String> listPlayerFoot,
												 List<String> listPlayerRole,
												 List<String> listPlayerRetiredDate,
												 List<String> listPositionID,
												 List<String> listPositionName,
												 List<String> listCountryID,
												 List<String> listCountryName)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();
		countryMap.clear();

		Map<String, Position> positionMap = newPosition().getPositionMap();
		positionMap.clear();

		Map<String, Player> playerMap = newPlayer().getPlayerMap();
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

	private void mapPlayer(List<String> listPlayerID,
												 List<String> listPlayerName,
												 List<String> listPlayerSurname,
												 List<String> listPlayerRole)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();
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

		mapPlayer(
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


		mapPlayer(
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

		mapPlayer(
						listPlayerID,
						listPlayerName,
						listPlayerSurname,
						listPlayerRole
		);
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

	public void setPlayerComboBoxDataMap(Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();

		for (String key : playerMap.keySet()) {

			String playerInfo = "";
			playerInfo += playerMap.get(key).getName();
			playerInfo += " ";
			playerInfo += playerMap.get(key).getSurname();

			comboBoxData.add(playerInfo);
			comboBoxMap.put(playerInfo, key);
		}
	}

	public void setPlayerTableDataMap(Vector<Vector<String>> tableData,
																		Map<Integer, String> playerTableMap)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();

		Integer row = 0;

		for (String key : playerMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Player player = playerMap.get(key);

			vector.add(player.getSurname());
			vector.add(player.getName());
			vector.add(player.getDob());
			vector.add(player.getCountry().getName());
			vector.add(player.getFoot());
			vector.add(player.getRole());
			vector.add(player.getPosition().getName());

			if (null == player.getRetiredDate()) {
				vector.add("");
			} else {
				vector.add(player.getRetiredDate());
			}

			tableData.add(vector);

			playerTableMap.put(row, key);
			++row;
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
	public void setPlayerComboBox(String playerSubName,
																String playerSubSurname,
																String playerReferringYear,
																String playerMinAge,
																String playerMaxAge,
																String playerContinentID,
																String playerNationID,
																String playerRole,
																String playerPositionID,
																String playerFoot,
																Vector<String> playerInfoVector,
																Map<String, String> playerInfoMap)
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

		setPlayerComboBoxDataMap(playerInfoVector, playerInfoMap);
	}

	public void setPlayerComboBox(String startYear,
																String teamID,
																Vector<String> playerInfoVector,
																Map<String, String> playerInfoMap)
	{
		fetchPlayer(startYear, teamID);
		setPlayerComboBoxDataMap(playerInfoVector, playerInfoMap);
	}

	public void setPlayerComboBox(String playerID,
																Vector<String> seasonVector,
																Map<String, String> seasonMap)
	{
		fetchPlayerSeason(playerID);

		Set<String> playerPlaySeason = ctrlPlayer.getPlayerMap().get(playerID).getPlaySeason();

		for (String startYearSeason : playerPlaySeason) {
			seasonVector.add(startYearSeason);
			seasonMap.put(startYearSeason, startYearSeason);
		}
	}

	public void setPlayerTable(String playerSubName,
														 String playerSubSurname,
														 String playerReferringYear,
														 String playerMinAge,
														 String playerMaxAge,
														 String playerContinentID,
														 String playerNationID,
														 String playerRole,
														 String playerPositionID,
														 String playerFoot,
														 Vector<Vector<String>> playerTableData,
														 Map<Integer, String> playerTableMap)
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

		setPlayerTableDataMap(playerTableData, playerTableMap);
	}



	public void setPlayerTable(String militancyPlayerTeamID,
														 String militancyPlayerStartYear,
														 String militancyPlayerEndYear,
														 Vector<Vector<String>> playerTableData,
														 Map<Integer, String> playerTableMap)
	{
		fetchPlayer(
						militancyPlayerTeamID,
						militancyPlayerStartYear,
						militancyPlayerEndYear
		);

		setPlayerTableDataMap(playerTableData, playerTableMap);
	}


	public void setPlayerGeneralView(String playerID,
																	 Map<String, String> infoPlayerMap,
																	 Vector<Vector<String>> playerPositionTableData,
																	 Vector<Vector<String>> playerNationalityTableData)
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
		for (Position position : player.getPositionSet()) {
			Vector<String> positionVector = new Vector<>();

			positionVector.add(position.getRole());
			positionVector.add(position.getCode());
			positionVector.add(position.getName());

			playerPositionTableData.add(positionVector);
		}


		// tabella nazionalita
		for (Country country : player.getCountrySet()) {
			Vector<String> countryVector = new Vector<>();

			countryVector.add(country.getName());

			playerNationalityTableData.add(countryVector);
		}
	}


	public void setPlayerDetailedView(String playerID,
																		Map<String, String> infoPlayerMap,
																		Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																		Vector<Vector<String>> playerAttributeMentalTableData,
																		Vector<Vector<String>> playerAttributePhysicalTableData,
																		Vector<Vector<String>> playerAttributeTechnicalTableData,
																		Vector<Vector<String>> playerTagTableData)
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


		if (player.getRole().matches("GK")) {
			for (String key : player.getAttributeGoalkeepingMap().keySet()) {
				Vector<String> attributeGoalkeepingVector = new Vector<>();

				attributeGoalkeepingVector.add(key);
				attributeGoalkeepingVector.add(player.getAttributeGoalkeepingMap().get(key));

				playerAttributeGoalkeepingTableData.add(attributeGoalkeepingVector);
			}
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



		for (Tag tag : player.getTagSet()) {
			Vector<String> tagVector = new Vector<>();

			tagVector.add(tag.getName());

			playerTagTableData.add(tagVector);
		}
	}


	public void setPlayerCareerView(String playerID,
																	Map<String, String> infoPlayerMap,
																	Vector<Vector<String>> playerClubCareerTableData,
																	Vector<Vector<String>> playerNationalCareerTableData)
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
		for (String key : player.getNationalCareer().keySet()) {
			Vector<String> nationalCareerVector = new Vector<>();

			nationalCareerVector.add(key);
			nationalCareerVector.add(player.getNationalCareer().get(key).getLongName());

			playerNationalCareerTableData.add(nationalCareerVector);
		}
	}


	public void setPlayerStatisticView(String playerID,
																		 String teamType,
																		 String teamID,
																		 String competitionID,
																		 String startYear,
																		 String endYear,
																		 Map<String, String> infoPlayerMap,
																		 Vector<Vector<String>> playerStatisticTableData)
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


	public void setPlayerCaseView(String playerID,
																Map<String, String> infoPlayerMap,
																Vector<Vector<String>> playerClubTrophyTableData,
																Vector<Vector<String>> playerNationalTrophyTableData,
																Vector<Vector<String>> playerPrizeTableData)
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

	private void mapPosition(List<String> listPositionID,
													 List<String> listPositionRole,
													 List<String> listPositionCode,
													 List<String> listPositionName)
	{
		Map<String, Position> positionMap = newPosition().getPositionMap();
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

	private void mapPosition(String playerID,
													 List<String> listPositionRole,
													 List<String> listPositionCode,
													 List<String> listPositionName)
	{
		Set<Position> playerPositionSet = newPlayer().getPlayerMap().get(playerID).getPositionSet();
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

		mapPosition(
						listPositionID,
						listPositionRole,
						listPositionCode,
						listPositionName
		);
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

		mapPosition(
						playerID,
						listPositionRole,
						listPositionCode,
						listPositionName
		);
	}


	private void setPositionComboBoxDataMap(Vector<String> comboBoxData,
																					Map<String, String> comboBoxMap)
	{
		Map<String, Position> positionMap = newPosition().getPositionMap();

		for (String key : positionMap.keySet()) {

			String positionName = positionMap.get(key).getName();

			comboBoxData.add(positionName);
			comboBoxMap.put(positionName, key);
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
		setPositionComboBoxDataMap(positionNameVector, positionNameMap);
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


	public void setStatisticTable(String teamType,
																String playerRole,
																Vector<Vector<String>> statisticTableData)
	{
		fetchStatisticTotal(teamType, playerRole);

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


	public void setStatisticCompetitionEditionTable(String competitionStartYear,
																									String competitionID,
																									Vector<Vector<String>> statisticTableData)
	{
		fetchStatisticCompetitionEdition(competitionStartYear, competitionID);


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


	public void setStatisticPlayerTable(String playerID,
																			String teamType,
																			String teamID,
																			String competitionID,
																			String startYear,
																			String endYear,
																			Vector<Vector<String>> statisticTableData)
	{
		fetchStatisticPlayer(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear
		);


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

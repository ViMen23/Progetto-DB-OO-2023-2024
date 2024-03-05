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
	private static Controller controllerInstance = null;

	private Controller()
	{

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

		if (newAdmin().getAdminConnected() != null) {
			return false;
		}

		Admin admin = newAdmin(username, password);

		AdminDAO adminDAO = new PostgresImplAdminDAO();
		if (adminDAO.isAdminDB(admin.getUsername(), admin.getPassword())) {
			newAdmin().setAdminConnected(admin);
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
	 * TYPE : function - controller package
	 * <p>
	 * NAME : newCountry
	 * <p>
	 * DESC: funzione che crea una nuova istanza di paese chiamando il costruttore della classe
	 * @param type il tipo di paese
	 * @param code il codice univoco del paese
	 * @param name il nome del paese
	 * @param superCountry il paese che contiene il paese in questione
	 * @return il paese creato
	 */
	private Country newCountry(String type,
														 String code,
														 String name,
														 Country superCountry)
	{
		return new Country(type, code, name, superCountry);
	}


	/**
	 * TYPE : function - controller package
	 * <p>
	 * NAME : newCountry
	 * <p>
	 * DESC: funzione che crea una nuova istanza di paese chiamando la funzione newCountry della
	 * classe Controller con argomenti null.
	 * @return il paese creato
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
			vector.add(StringUtils.capitalize(GuiConfiguration.getMessage(country.getType())));

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

	/**
	 * TODO
	 * @return
	 */
	private Confederation newConfederation()
	{
		return newConfederation(null, null, null, null);
	}


	/**
	 * TODO
	 */
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


	/**
	 * TODO
	 * @param listConfederationID
	 * @param listConfederationShortName
	 * @param listConfederationLongName
	 * @param listCountryID
	 * @param listCountryName
	 * @param listCountryType
	 * @param listSuperConfederationID
	 * @param listSuperConfederationShortName
	 */
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


	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
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


	/**
	 * TODO
	 * @param tableData
	 */
	private void setConfederationTableData(Vector<Vector<String>> tableData)
	{
		Map<String, Confederation> confederationMap = newConfederation().getConfederationMap();

		for (String key : confederationMap.keySet()) {
			Vector<String> vector = new Vector<>();
			Confederation confederation = confederationMap.get(key);

			vector.add(confederation.getLongName());
			vector.add(confederation.getShortName());
			vector.add(GuiConfiguration.getMessage(confederation.getCountry().getType()));

			vector.add(confederation.getCountry().getName());

			if (confederation.getCountry().getType().equalsIgnoreCase(Country.COUNTRY_TYPE.WORLD.toString())) {
				vector.add("");
			} else {
				vector.add(confederation.getSuperConfederation().getShortName());
			}

			tableData.add(vector);
		}
	}


	/**
	 * TODO
	 * @param typeCountry
	 * @param superConfederationID
	 * @param confederationShortNameVector
	 * @param confederationShortNameMap
	 */
	public void setConfederationComboBox(String typeCountry,
																			 String superConfederationID,
																			 Vector<String> confederationShortNameVector,
																			 Map<String, String> confederationShortNameMap)
	{
		fetchConfederation(typeCountry, superConfederationID);
		setConfederationComboBoxDataMap(confederationShortNameVector, confederationShortNameMap);
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superConfederationID
	 * @param confederationTableData
	 */
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

	private void mapCompetition(String competitionID,
															List<String> listCompetitionEdition)
	{
		Set<String> competitionEditionSet = newCompetition().getCompetitionMap().get(competitionID).getEditionSet();
		competitionEditionSet.clear();

		competitionEditionSet.addAll(listCompetitionEdition);
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


	private void fetchCompetition(String competitionID)
	{
		List<String> listCompetitionEdition = new ArrayList<>();

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(competitionID, listCompetitionEdition);

		mapCompetition(competitionID, listCompetitionEdition);
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


	private void setCompetitionComboBoxDataMap(String teamType,
																						 String competitionID,
																						 Vector<String> comboBoxData,
																						 Map<String, String> comboBoxMap)
	{
		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			String season;
			for (String edition : newCompetition().getCompetitionMap().get(competitionID).getEditionSet()) {
				season = edition;
				season += "/";
				season += (Integer.parseInt(edition) + 1);

				comboBoxData.add(season);
				comboBoxMap.put(season, edition);
			}
		} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			for (String edition : newCompetition().getCompetitionMap().get(competitionID).getEditionSet()) {
				comboBoxData.add(edition);
				comboBoxMap.put(edition, edition);
			}
		}
	}


	private void setCompetitionTableData(Vector<Vector<String>> tableData)
	{
		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();

		for (String key : competitionMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Competition competition = competitionMap.get(key);

			vector.add(competition.getName());
			vector.add(GuiConfiguration.getMessage(competition.getType()));
			vector.add(GuiConfiguration.getMessage(competition.getTeamType()));
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

	public void setCompetitionEditionComboBox(String teamType,
																						String competitionID,
																						Vector<String> competitionEditionVector,
																						Map<String, String> competitionEditionMap)
	{
		fetchCompetition(competitionID);
		setCompetitionComboBoxDataMap(teamType, competitionID, competitionEditionVector, competitionEditionMap);
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

	private void mapTeam(String teamID,
											 Map<String, String> mapTeamInfo)
	{
		if (!(teamID.equalsIgnoreCase(mapTeamInfo.get("teamID")))) {
			System.out.println("ERRORE");
			return;
		}

		Map<String, Team> teamMap = newTeam().getTeamMap();
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

	private void mapTeam(String teamID,
											 List<String> listTeamYear)
	{
		Set<String> teamYearSet = newTeam().getTeamMap().get(teamID).getYearSet();
		teamYearSet.clear();

		teamYearSet.addAll(listTeamYear);
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

		mapTeam(teamID, mapTeamInfo);
	}

	private void fetchTeamYear(String teamID)
	{
		List<String> listTeamYear = new ArrayList<>();

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(teamID, listTeamYear);
		mapTeam(teamID, listTeamYear);
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

	private void setTeamComboBoxDataMap(String teamID,
																			String teamType,
																			Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			String season;
			for (String year : newTeam().getTeamMap().get(teamID).getYearSet()) {
				season = year;
				season += "/";
				season += (Integer.parseInt(year) + 1);

				comboBoxData.add(season);
				comboBoxMap.put(season, year);
			}
		} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			for (String year : newTeam().getTeamMap().get(teamID).getYearSet()) {
				comboBoxData.add(year);
				comboBoxMap.put(year, year);
			}
		}
	}

	public void setTeamTableDataMap(Vector<Vector<String>> tableData,
																	Map<Integer, Map<Integer, String>> teamTableMap)
	{
		Map<String, Team> teamMap = newTeam().getTeamMap();
		Map<Integer, String> teamLongNameMap = new HashMap<>();

		Integer row = 0;

		for (String key : teamMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Team team = teamMap.get(key);

			vector.add(team.getLongName());
			vector.add(team.getShortName());
			vector.add(GuiConfiguration.getMessage(team.getType()));
			vector.add(team.getCountry().getName());

			tableData.add(vector);

			teamLongNameMap.put(row, key);
			++row;
		}

		teamTableMap.put(0, teamLongNameMap);
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


	public void setTeamYearComboBox(String teamID,
																	String teamType,
																	Vector<String> teamYearVector,
																	Map<String, String> teamYearMap)
	{
		fetchTeamYear(teamID);
		setTeamComboBoxDataMap(teamID, teamType, teamYearVector, teamYearMap);
	}



	public void setTeamTable(String teamSubLongName,
													 String teamSubShortName,
													 String teamType,
													 String teamContinentID,
													 String teamNationID,
													 Vector<Vector<String>> teamTableData,
													 Map<Integer, Map<Integer, String>> teamTableMap)
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

	private void mapTeamInfoMap(String teamID,
															Map<String, String> infoTeamMap)
	{
		Team team = newTeam().getTeamMap().get(teamID);

		infoTeamMap.put(GuiConfiguration.getMessage("team"), team.getLongName());
		infoTeamMap.put(GuiConfiguration.getMessage("code"), team.getShortName());
		infoTeamMap.put(GuiConfiguration.getMessage("type"), GuiConfiguration.getMessage(team.getType()));
		infoTeamMap.put(GuiConfiguration.getMessage("country"), team.getCountry().getName());
		infoTeamMap.put(GuiConfiguration.getMessage("confederation"), team.getConfederation().getShortName());
	}

	public void setTeamInfoMap(String teamID,
														 Map<String, String> infoTeamMap)
	{
		fetchTeam(teamID);
		mapTeamInfoMap(teamID, infoTeamMap);

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

	public void setTeamSeasonView(String teamID,
																String startYear,
																Map<String, String> infoTeamMap,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap,
																Vector<Vector<String>> teamPartecipationTableData)
	{
		setTeamInfoMap(teamID, infoTeamMap);
		setPartecipationTable(teamID, startYear, teamPartecipationTableData);
		setTeamSquadTable(teamID, startYear, teamSquadTableData, teamSquadTableMap);
	}

	public void setTeamCaseView(String teamID,
															String teamType,
															Map<String, String> infoTeamMap,
															Vector<Vector<String>> teamTrophyTableData,
															Vector<Vector<String>> teamPrizeTableData)
	{
		setTeamInfoMap(teamID, infoTeamMap);
		setTeamPrizeTable(teamID, teamPrizeTableData);
		setTeamTrophyTable(teamID, teamType, teamTrophyTableData);
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

	private void mapPlayer(String playerID,
												 Map<String, String> mapPlayerInfo)
	{
		if (!(playerID.equalsIgnoreCase(mapPlayerInfo.get("playerID")))) {
			System.out.println("ERRORE");
			return;
		}


		Map<String, Player> playerMap = newPlayer().getPlayerMap();
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

		Set<String> playerPlaySeason = newPlayer().getPlayerMap().get(playerID).getPlaySeason();
		playerPlaySeason.clear();
		playerPlaySeason.addAll(startYearSeason);
	}


	private void fetchPlayer(String playerID)
	{
		Map<String, String> mapPlayerInfo = new LinkedHashMap<>();

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(playerID, mapPlayerInfo);

		mapPlayer(playerID, mapPlayerInfo);
	}

	private void mapPlayerInfoMap(String playerID,
																Map<String, String> infoPlayerMap)
	{
		Player player = newPlayer().getPlayerMap().get(playerID);

		infoPlayerMap.put(GuiConfiguration.getMessage("name"), player.getName());
		infoPlayerMap.put(GuiConfiguration.getMessage("surname"), player.getSurname());
		infoPlayerMap.put(GuiConfiguration.getMessage("dob"), player.getDob());
		infoPlayerMap.put(GuiConfiguration.getMessage("bornCountry"), player.getCountry().getName());
		infoPlayerMap.put(GuiConfiguration.getMessage("foot"), GuiConfiguration.getMessage(player.getFoot()));
		infoPlayerMap.put(GuiConfiguration.getMessage("mainPosition"), GuiConfiguration.getMessage(player.getPosition().getName()));
		// TODO attenzione ruolo
		infoPlayerMap.put(GuiConfiguration.getMessage("role"), GuiConfiguration.getMessage(player.getRole()));

		if (null == player.getRetiredDate()) {
			infoPlayerMap.put(GuiConfiguration.getMessage("retiredDate"), "");
		} else {
			infoPlayerMap.put(GuiConfiguration.getMessage("retiredDate"), player.getRetiredDate());
		}
	}

	public void setPlayerInfoMap(String playerID,
															 Map<String, String> infoPlayerMap)
	{
		fetchPlayer(playerID);
		mapPlayerInfoMap(playerID, infoPlayerMap);

	}

	public void setPlayerComboBoxDataMap(Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();

		for (String key : playerMap.keySet()) {

			// TODO ruolo attenzione
			String playerInfo = "";
			playerInfo += "[";
			playerInfo += GuiConfiguration.getMessage(playerMap.get(key).getRole());
			playerInfo += "] ";
			playerInfo += playerMap.get(key).getName();
			playerInfo += " ";
			playerInfo += playerMap.get(key).getSurname();

			comboBoxData.add(playerInfo);
			comboBoxMap.put(playerInfo, key);
		}
	}

	public void setPlayerTableDataMap(Vector<Vector<String>> tableData,
																		Map<Integer, Map<Integer, String>> playerTableMap)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();
		Map<Integer, String> playerSurnameMap = new HashMap<>();

		Integer row = 0;

		for (String key : playerMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Player player = playerMap.get(key);

			vector.add(player.getSurname());
			vector.add(player.getName());
			vector.add(player.getDob());
			vector.add(player.getCountry().getName());
			vector.add(GuiConfiguration.getMessage(player.getFoot()));
			vector.add(GuiConfiguration.getMessage(player.getRole()));
			vector.add(GuiConfiguration.getMessage(player.getPosition().getName()));

			if (null == player.getRetiredDate()) {
				vector.add("");
			} else {
				vector.add(player.getRetiredDate());
			}

			tableData.add(vector);

			playerSurnameMap.put(row, key);
			++row;
		}

		playerTableMap.put(0, playerSurnameMap);
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

		Set<String> playerPlaySeason = newPlayer().getPlayerMap().get(playerID).getPlaySeason();

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
														 Map<Integer, Map<Integer, String>> playerTableMap)
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
														 Map<Integer, Map<Integer, String>> playerTableMap)
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
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPositionTable(playerID, playerPositionTableData);
		setNationalityTable(playerID, playerNationalityTableData);
	}


	public void setPlayerDetailedView(String playerID,
																		Map<String, String> infoPlayerMap,
																		Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																		Vector<Vector<String>> playerAttributeMentalTableData,
																		Vector<Vector<String>> playerAttributePhysicalTableData,
																		Vector<Vector<String>> playerAttributeTechnicalTableData,
																		Vector<Vector<String>> playerTagTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setAttributeTable(
						playerID,
						playerAttributeGoalkeepingTableData,
						playerAttributeMentalTableData,
						playerAttributePhysicalTableData,
						playerAttributeTechnicalTableData
		);
		setTagTable(playerID, playerTagTableData);
	}


	public void setPlayerCareerView(String playerID,
																	Map<String, String> infoPlayerMap,
																	Vector<Vector<String>> playerClubCareerTableData,
																	Map<Integer, Map<Integer, String>> playerClubCareerTableMap,
																	Vector<Vector<String>> playerNationalCareerTableData,
																	Map<Integer, Map<Integer, String>> playerNationalCareerTableMap)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setClubCareerTable(playerID, playerClubCareerTableData, playerClubCareerTableMap);
		setNationalCareerTable(playerID, playerNationalCareerTableData, playerNationalCareerTableMap);
	}


	public void setPlayerStatisticView(String playerID,
																		 String teamType,
																		 String teamID,
																		 String competitionID,
																		 String startYear,
																		 String endYear,
																		 Map<String, String> infoPlayerMap,
																		 Vector<Vector<String>> playerStatisticTableData,
																		 Map<Integer, Map<Integer, String>> playerStatisticTableMap)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPlayerStatisticTable(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear,
						playerStatisticTableData,
						playerStatisticTableMap
		);
	}


	public void setPlayerCaseView(String playerID,
																Map<String, String> infoPlayerMap,
																Vector<Vector<String>> playerClubTrophyTableData,
																Map<Integer, Map<Integer, String>> playerClubTrophyTableMap,
																Vector<Vector<String>> playerNationalTrophyTableData,
																Map<Integer, Map<Integer, String>> playerNationalTrophyTableMap,
																Vector<Vector<String>> playerPrizeTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPlayerTrophyTable(playerID, "CLUB", playerClubTrophyTableData, playerClubTrophyTableMap);
		setPlayerTrophyTable(playerID, "NATIONAL", playerNationalTrophyTableData, playerNationalTrophyTableMap);
		setPlayerPrizeTable(playerID, playerPrizeTableData);
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

			String positionName = GuiConfiguration.getMessage(positionMap.get(key).getName());

			comboBoxData.add(positionName);
			comboBoxMap.put(positionName, key);
		}
	}

	private void setPositionTableData(String playerID,
																		Vector<Vector<String>> playerPositionTableData)
	{
		Set<Position> playerPositionSet = newPlayer().getPlayerMap().get(playerID).getPositionSet();

		for (Position position : playerPositionSet) {
			Vector<String> vector = new Vector<>();

			vector.add(GuiConfiguration.getMessage(position.getRole()));
			vector.add(position.getCode());
			vector.add(GuiConfiguration.getMessage(position.getName()));

			playerPositionTableData.add(vector);
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


	public void setPositionTable(String playerID,
															 Vector<Vector<String>> playerPositionTableData)
	{
		fetchPosition(playerID);
		setPositionTableData(playerID, playerPositionTableData);
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


	private void mapStatisticTotal(List<String> listPlayerID,
																 List<String> listPlayerRole,
																 List<String> listPlayerName,
																 List<String> listPlayerSurname,
																 List<String> listStatisticMatch,
																 List<String> listStatisticGoalScored,
																 List<String> listStatisticPenaltyScored,
																 List<String> listStatisticAssist,
																 List<String> listStatisticYellowCard,
																 List<String> listStatisticRedCard,
																 List<String> listStatisticGoalConceded,
																 List<String> listStatisticPenaltySaved)
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

			playerMap.get(playerID).getStatisticMap().putIfAbsent(
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
							),
							null
			);
		}
	}


	private void mapStatisticCompetitionEdition(List<String> listTeamID,
																							List<String> listTeamLongName,
																							List<String> listPlayerID,
																							List<String> listPlayerRole,
																							List<String> listPlayerName,
																							List<String> listPlayerSurname,
																							List<String> listStatisticMatch,
																							List<String> listStatisticGoalScored,
																							List<String> listStatisticPenaltyScored,
																							List<String> listStatisticAssist,
																							List<String> listStatisticYellowCard,
																							List<String> listStatisticRedCard,
																							List<String> listStatisticGoalConceded,
																							List<String> listStatisticPenaltySaved)
	{
		Map<String, Team> teamMap = newTeam().getTeamMap();
		teamMap.clear();

		Map<String, Player> playerMap = newPlayer().getPlayerMap();
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

			playerMap.get(playerID).getStatisticMap().putIfAbsent(
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
							),
							teamID
			);
		}
	}

	private void mapStatisticPlayer(String playerID,
																	List<String> listCompetitionStartYear,
																	List<String> listCompetitionID,
																	List<String> listCompetitionName,
																	List<String> listTeamID,
																	List<String> listTeamLongName,
																	List<String> listStatisticMatch,
																	List<String> listStatisticGoalScored,
																	List<String> listStatisticPenaltyScored,
																	List<String> listStatisticAssist,
																	List<String> listStatisticYellowCard,
																	List<String> listStatisticRedCard,
																	List<String> listStatisticGoalConceded,
																	List<String> listStatisticPenaltySaved)
	{
		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();
		competitionMap.clear();

		Map<String, Team> teamMap = newTeam().getTeamMap();
		teamMap.clear();

		Map<Statistic, String> playerStatisticMap = newPlayer().getPlayerMap().get(playerID).getStatisticMap();
		playerStatisticMap.clear();


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

			playerStatisticMap.putIfAbsent(
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
							),
							team_ID
			);
		}
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


		mapStatisticTotal(
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

		mapStatisticCompetitionEdition(
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


		mapStatisticPlayer(
						playerID,
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
	}

	private void setStatisticTableDataMap(Vector<Vector<String>> statisticTableData,
																				Map<Integer, Map<Integer, String>> statisticTableDataMap)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();
		Map<Integer, String> playerSurnameMap = new HashMap<>();

		Integer row = 0;

		for (String key : playerMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Player player = newPlayer().getPlayerMap().get(key);

			Statistic playerStatistic = player.getStatisticMap().keySet().iterator().next();

			vector.add(player.getRole());
			vector.add(player.getName());
			vector.add(player.getSurname());
			vector.add(playerStatistic.getMatch());
			vector.add(playerStatistic.getGoalScored());
			vector.add(playerStatistic.getPenaltyScored());
			vector.add(playerStatistic.getAssist());
			vector.add(playerStatistic.getYellowCard());
			vector.add(playerStatistic.getRedCard());
			vector.add(playerStatistic.getGoalConceded());
			vector.add(playerStatistic.getPenaltySaved());

			statisticTableData.add(vector);

			playerSurnameMap.put(row, key);
			++row;
		}

		statisticTableDataMap.put(2, playerSurnameMap);
	}

	private void setStatisticCompetitionEditionTableDataMap(Vector<Vector<String>> statisticTableData,
																													Map<Integer, Map<Integer, String>> statisticTableMap)
	{
		Map<String, Player> playerMap = newPlayer().getPlayerMap();
		Map<Integer, String> teamLongNameMap = new HashMap<>();
		Map<Integer, String> playerSurnameMap = new HashMap<>();

		Integer row = 0;

		for (String key : playerMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Player player = playerMap.get(key);
			Map<Statistic, String> playerStatistiMap = player.getStatisticMap();

			for (Statistic playerStatistic : playerStatistiMap.keySet()) {
				vector.add(playerStatistic.getTeam().getLongName());
				vector.add(player.getRole());
				vector.add(player.getName());
				vector.add(player.getSurname());
				vector.add(playerStatistic.getMatch());
				vector.add(playerStatistic.getGoalScored());
				vector.add(playerStatistic.getPenaltyScored());
				vector.add(playerStatistic.getAssist());
				vector.add(playerStatistic.getYellowCard());
				vector.add(playerStatistic.getRedCard());
				vector.add(playerStatistic.getGoalConceded());
				vector.add(playerStatistic.getPenaltySaved());

				statisticTableData.add(vector);

				teamLongNameMap.put(row, playerStatistiMap.get(playerStatistic));
				playerSurnameMap.put(row, key);
				++row;
			}
		}

		statisticTableMap.put(0, teamLongNameMap);
		statisticTableMap.put(3, playerSurnameMap);
	}


	private void setPlayerStatisticTableDataMap(String playerID,
																							String teamType,
																							Vector<Vector<String>> tableData,
																							Map<Integer, Map<Integer, String>> tableMap)
	{
		Map<Statistic, String> playerStatisticMap = newPlayer().getPlayerMap().get(playerID).getStatisticMap();
		Map<Integer, String> teamLongNameMap = new HashMap<>();

		Integer row = 0;

		if (teamType.equalsIgnoreCase("CLUB")) {
			String season;
			for (Statistic statistic : playerStatisticMap.keySet()) {
				Vector<String> vector = new Vector<>();

				season = statistic.getCompetitionYear();
				season += "/";
				season += (Integer.parseInt(statistic.getCompetitionYear()) + 1);
				vector.add(season);
				vector.add(statistic.getCompetition().getName());
				vector.add(statistic.getTeam().getLongName());
				vector.add(statistic.getMatch());
				vector.add(statistic.getGoalScored());
				vector.add(statistic.getPenaltyScored());
				vector.add(statistic.getAssist());
				vector.add(statistic.getYellowCard());
				vector.add(statistic.getRedCard());
				vector.add(statistic.getGoalConceded());
				vector.add(statistic.getPenaltySaved());

				tableData.add(vector);

				teamLongNameMap.put(row, playerStatisticMap.get(statistic));
				++row;
			}
		} else if (teamType.equalsIgnoreCase("NATIONAL")) {
			for (Statistic statistic : playerStatisticMap.keySet()) {
				Vector<String> vector = new Vector<>();

				vector.add(statistic.getCompetitionYear());
				vector.add(statistic.getCompetition().getName());
				vector.add(statistic.getTeam().getLongName());
				vector.add(statistic.getMatch());
				vector.add(statistic.getGoalScored());
				vector.add(statistic.getPenaltyScored());
				vector.add(statistic.getAssist());
				vector.add(statistic.getYellowCard());
				vector.add(statistic.getRedCard());
				vector.add(statistic.getGoalConceded());
				vector.add(statistic.getPenaltySaved());

				tableData.add(vector);

				teamLongNameMap.put(row, playerStatisticMap.get(statistic));
				++row;
			}
		}

		tableMap.put(2, teamLongNameMap);
	}



	public void setStatisticTable(String teamType,
																String playerRole,
																Vector<Vector<String>> statisticTableData,
																Map<Integer, Map<Integer, String>> statisticTableDataMap)
	{
		fetchStatisticTotal(teamType, playerRole);
		setStatisticTableDataMap(statisticTableData, statisticTableDataMap);

	}


	public void setStatisticCompetitionEditionTable(String competitionStartYear,
																									String competitionID,
																									Vector<Vector<String>> statisticTableData,
																									Map<Integer, Map<Integer, String>> statisticTableMap)
	{
		fetchStatisticCompetitionEdition(competitionStartYear, competitionID);
		setStatisticCompetitionEditionTableDataMap(statisticTableData, statisticTableMap);
	}



	public void setPlayerStatisticTable(String playerID,
																			String teamType,
																			String teamID,
																			String competitionID,
																			String startYear,
																			String endYear,
																			Vector<Vector<String>> playerStatisticTableData,
																			Map<Integer, Map<Integer, String>> playerStatisticTableMap)
	{
		fetchStatisticPlayer(
						playerID,
						teamType,
						teamID,
						competitionID,
						startYear,
						endYear
		);

		setPlayerStatisticTableDataMap(
						playerID,
						teamType,
						playerStatisticTableData,
						playerStatisticTableMap
		);

	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PARTECIPATION
	 *------------------------------------------------------------------------------------------------------*/

	private void mapPartecipation(String teamID,
																List<String> listCompetitionID,
																List<String> listCompetitionType,
																List<String> listCompetitionName,
																List<String> listConfederationID,
																List<String> listConfederationShortName)
	{
		Map<String, Confederation> confederationMap = newConfederation().getConfederationMap();
		confederationMap.clear();

		Set<Competition> teamCompetitionSet = newTeam().getTeamMap().get(teamID).getCompetitionSet();
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

		mapPartecipation(
						teamID,
						listCompetitionID,
						listCompetitionType,
						listCompetitionName,
						listConfederationID,
						listConfederationShortName
		);

	}

	private void setPartecipationTableData(String teamID,
																				 Vector<Vector<String>> teamPartecipationTableData)
	{
		Set<Competition> teamCompetitionSet = newTeam().getTeamMap().get(teamID).getCompetitionSet();

		for (Competition competition : teamCompetitionSet) {
			Vector<String> partecipationVector = new Vector<>();

			partecipationVector.add(competition.getName());
			partecipationVector.add(competition.getType());
			partecipationVector.add(competition.getConfederation().getShortName());

			teamPartecipationTableData.add(partecipationVector);
		}
	}

	public void setPartecipationTable(String teamID,
																		String competitionStartYear,
																		Vector<Vector<String>> teamPartecipationTableData)
	{
		fetchPartecipation(teamID, competitionStartYear);
		setPartecipationTableData(teamID, teamPartecipationTableData);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * MILITANCY
	 *------------------------------------------------------------------------------------------------------*/

	private void mapMilitancy(String teamID,
														List<String> listPlayerID,
														List<String> listPlayerName,
														List<String> listPlayerSurname,
														List<String> listPlayerRole)
	{
		Map<String, Player> teamPlayerMap = newTeam().getTeamMap().get(teamID).getPlayerMap();
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
	private void fetchMilitancy(String teamID,
															String startYear)
	{
		List<String> listPlayerID = new ArrayList<>();
		List<String> listPlayerName = new ArrayList<>();
		List<String> listPlayerSurname = new ArrayList<>();
		List<String> listPlayerRole = new ArrayList<>();

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(
						teamID,
						startYear,
						listPlayerID,
						listPlayerName,
						listPlayerSurname,
						listPlayerRole
		);

		mapMilitancy(
						teamID,
						listPlayerID,
						listPlayerName,
						listPlayerSurname,
						listPlayerRole
		);

	}

	private void mapClubMilitancy(String playerID,
																List<String> listMilitancyYear,
																List<String> listMilitancyType,
																List<String> listTeamID,
																List<String> listTeamLongName,
																List<String> listCountryID,
																List<String> listCountryName)
	{
		Map<String, Country> countryMap = newCountry().getCountryMap();
		countryMap.clear();

		Map<String, Team> teamMap = newTeam().getTeamMap();
		teamMap.clear();

		Map<String, Team> playerClubCareer = newPlayer().getPlayerMap().get(playerID).getClubCareer();
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
							teamID + "@" + listMilitancyYear.get(i) + "@" + listMilitancyType.get(i),
							teamMap.get(teamID)
			);
		}
	}

	private void mapNationalMilitancy(String playerID,
																		List<String> listMilitancyYear,
																		List<String> listTeamID,
																		List<String> listTeamLongName)
	{
		Map<String, Team> teamMap = newTeam().getTeamMap();
		teamMap.clear();

		Map<String, Team> playerNationalCareer = newPlayer().getPlayerMap().get(playerID).getNationalCareer();
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
							teamID + "@" + listMilitancyYear.get(i),
							teamMap.get(teamID)
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

		mapClubMilitancy(
						playerID,
						listMilitancyYear,
						listMilitancyType,
						listTeamID,
						listTeamLongName,
						listCountryID,
						listCountryName
		);
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

		mapNationalMilitancy(
						playerID,
						listMilitancyYear,
						listTeamID,
						listTeamLongName
		);
	}

	private void setTeamSquadTableDataMap(String teamID,
																				Vector<Vector<String>> teamSquadTableData,
																				Map<Integer, Map<Integer, String>> teamSquadTableMap)
	{
		Map<String, Player> teamPlayerMap = newTeam().getTeamMap().get(teamID).getPlayerMap();
		Map<Integer, String> playerSurnameMap = new HashMap<>();

		Integer row = 0;

		for (String key : teamPlayerMap.keySet()) {
			Vector<String> vector = new Vector<>();

			Player player = teamPlayerMap.get(key);

			vector.add(player.getRole());
			vector.add(player.getName());
			vector.add(player.getSurname());

			teamSquadTableData.add(vector);

			playerSurnameMap.put(row, key);
			++row;
		}

		teamSquadTableMap.put(2, playerSurnameMap);
	}


	private void setClubCareerTableDataMap(String playerID,
																				 Vector<Vector<String>> tableData,
																				 Map<Integer, Map<Integer, String>> tableMap)
	{
		Map<String, Team> playerClubCareer = newPlayer().getPlayerMap().get(playerID).getClubCareer();
		Map<Integer, String> teamLongNameMap = new HashMap<>();

		Integer row = 0;

		for (String key : playerClubCareer.keySet()) {
			Vector<String> vector = new Vector<>();

			String[] keyPart = key.split("@");

			String season = keyPart[1];
			season += "/";
			season += (Integer.parseInt(keyPart[1]) + 1);

			vector.add(season);

			String type = keyPart[2];

			vector.add(type);
			vector.add(playerClubCareer.get(key).getLongName());
			vector.add(playerClubCareer.get(key).getCountry().getName());

			tableData.add(vector);

			teamLongNameMap.put(row, keyPart[0]);
			++row;
		}

		tableMap.put(2, teamLongNameMap);
	}


	private void setNationalCareerTableDataMap(String playerID,
																						 Vector<Vector<String>> tableData,
																						 Map<Integer, Map<Integer, String>> tableMap)
	{
		Map<String, Team> playerNationalCareer = newPlayer().getPlayerMap().get(playerID).getNationalCareer();
		Map<Integer, String> teamLongNameMap = new HashMap<>();

		Integer row = 0;

		for (String key : playerNationalCareer.keySet()) {
			Vector<String> vector = new Vector<>();

			String[] keyPart = key.split("@");

			vector.add(keyPart[1]);
			vector.add(playerNationalCareer.get(key).getLongName());

			tableData.add(vector);

			teamLongNameMap.put(row, keyPart[0]);
			++row;
		}

		tableMap.put(1, teamLongNameMap);
	}


	public void setTeamSquadTable(String teamID,
																String startYear,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap)
	{
		fetchMilitancy(teamID, startYear);
		setTeamSquadTableDataMap(teamID, teamSquadTableData, teamSquadTableMap);
	}


	public void setNationalCareerTable(String playerID,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		fetchNationalMilitancy(playerID);
		setNationalCareerTableDataMap(playerID, tableData, tableMap);
	}

	public void setClubCareerTable(String playerID,
																 Vector<Vector<String>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		fetchClubMilitancy(playerID);
		setClubCareerTableDataMap(playerID, tableData, tableMap);
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
													 String competitionStartYear)
	{
		return new Trophy(type, role, name, player, team, competition, competitionStartYear);
	}


	/**
	 * TODO
	 * @return
	 */
	private Trophy newTrophy()
	{
		return newTrophy(null, null, null, null, null, null, null);
	}

	private void mapTeamTrophy(String teamID,
														 List<String> listTrophyID,
														 List<String> listTrophyName,
														 List<String> listCompetitionID,
														 List<String> listCompetitionStartYear,
														 List<String> listCompetitionName)
	{
		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();
		competitionMap.clear();

		Set<Trophy> teamTrophySet = newTeam().getTeamMap().get(teamID).getTrophySet();
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
											listCompetitionStartYear.get(i)
							)
			);
		}
	}

	/**
	 * TODO
	 * @param teamID
	 */
	private void fetchTeamTrophy(String teamID)
	{
		List<String> listTrophyID = new ArrayList<>();
		List<String> listTrophyName = new ArrayList<>();
		List<String> listCompetitionID = new ArrayList<>();
		List<String> listCompetitionStartYear = new ArrayList<>();
		List<String> listCompetitionName = new ArrayList<>();

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						teamID,
						listTrophyID,
						listTrophyName,
						listCompetitionID,
						listCompetitionStartYear,
						listCompetitionName
		);

		mapTeamTrophy(
						teamID,
						listTrophyID,
						listTrophyName,
						listCompetitionID,
						listCompetitionStartYear,
						listCompetitionName
		);
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

		Map<String, Competition> competitionMap = newCompetition().getCompetitionMap();
		competitionMap.clear();

		Map<String, Team> teamMap = newTeam().getTeamMap();
		teamMap.clear();

		Map<Trophy, String> playerTrophyMap = newPlayer().getPlayerMap().get(playerID).getTrophyMap();
		playerTrophyMap.clear();


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

			playerTrophyMap.putIfAbsent(
							newTrophy(
											null,
											null,
											listTrophyName.get(i),
											null,
											teamMap.get(teamID),
											competitionMap.get(competitionID),
											listCompetitionStartYear.get(i)
							),
							teamID
			);
		}
	}

	private void setTeamTrophyTableData(String teamID,
																			String teamType,
																			Vector<Vector<String>> tableData)
	{
		Set<Trophy> teamTrophySet = newTeam().getTeamMap().get(teamID).getTrophySet();

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			String season;
			for (Trophy trophy : teamTrophySet) {
				Vector<String> vector = new Vector<>();

				season = trophy.getCompetitionStartYear();
				season += "/";
				season += (Integer.parseInt(trophy.getCompetitionStartYear()) + 1);
				vector.add(season);
				vector.add(trophy.getCompetition().getName());
				vector.add(GuiConfiguration.getMessage(trophy.getName()));

				tableData.add(vector);
			}
		} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			for (Trophy trophy : teamTrophySet) {
				Vector<String> vector = new Vector<>();

				vector.add(trophy.getCompetitionStartYear());
				vector.add(trophy.getCompetition().getName());
				vector.add(GuiConfiguration.getMessage(trophy.getName()));

				tableData.add(vector);
			}
		}

	}

	private void setPlayerTrophyTableDataMap(String playerID,
																					 String teamType,
																					 Vector<Vector<String>> tableData,
																					 Map<Integer, Map<Integer, String>> tableMap)
	{
		Map<Trophy, String> playerTrophyMap = newPlayer().getPlayerMap().get(playerID).getTrophyMap();
		Map<Integer, String> teamLongNameMap = new HashMap<>();

		Integer row = 0;
		// TODO ID_TEAM
		if (teamType.equalsIgnoreCase("CLUB")) {
			String season;
			for (Trophy trophy : playerTrophyMap.keySet()) {
				Vector<String> vector = new Vector<>();

				season = trophy.getCompetitionStartYear();
				season += "/";
				season += (Integer.parseInt(trophy.getCompetitionStartYear()) + 1);
				vector.add(season);
				vector.add(trophy.getCompetition().getName());
				vector.add(trophy.getTeam().getLongName());
				vector.add(GuiConfiguration.getMessage(trophy.getName()));

				tableData.add(vector);

				teamLongNameMap.put(row, playerTrophyMap.get(trophy));
				++row;
			}
		} else if (teamType.equalsIgnoreCase("NATIONAL")) {
			for (Trophy trophy : playerTrophyMap.keySet()) {
				Vector<String> vector = new Vector<>();

				vector.add(trophy.getCompetitionStartYear());
				vector.add(trophy.getCompetition().getName());
				vector.add(trophy.getTeam().getLongName());
				vector.add(GuiConfiguration.getMessage(trophy.getName()));

				tableData.add(vector);

				teamLongNameMap.put(row, playerTrophyMap.get(trophy));
				++row;
			}
		}

		tableMap.put(2, teamLongNameMap);
	}

	public void setTeamTrophyTable(String teamID,
																 String teamType,
																 Vector<Vector<String>> tableData)
	{
		fetchTeamTrophy(teamID);
		setTeamTrophyTableData(teamID, teamType, tableData);
	}

	public void setPlayerTrophyTable(String playerID,
																	 String teamType,
																	 Vector<Vector<String>> tableData,
																	 Map<Integer, Map<Integer, String>> TableMap)
	{
		fetchPlayerTrophy(playerID, teamType);
		setPlayerTrophyTableDataMap(playerID, teamType, tableData, TableMap);
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


	private void mapTeamPrize(String teamID,
														List<String> listPrizeID,
														List<String> listPrizeAssignYear,
														List<String> listPrizeName,
														List<String> listPrizeGiven)
	{
		Set<Prize> teamPrizeSet = newTeam().getTeamMap().get(teamID).getPrizeSet();
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
											listPrizeAssignYear.get(i)
							)
			);
		}
	}

	private void mapPlayerPrize(String playerID,
															List<String> listPrizeAssignYear,
															List<String> listPrizeName,
															List<String> listPrizeGiven)
	{
		Set<Prize> playerPrizeSet = newPlayer().getPlayerMap().get(playerID).getPrizeSet();
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


	private void fetchTeamPrize(String teamID)
	{
		List<String> listPrizeID = new ArrayList<>();
		List<String> listPrizeAssignYear = new ArrayList<>();
		List<String> listPrizeName = new ArrayList<>();
		List<String> listPrizeGiven = new ArrayList<>();

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeDB(
						teamID,
						listPrizeID,
						listPrizeAssignYear,
						listPrizeName,
						listPrizeGiven
		);

		mapTeamPrize(
						teamID,
						listPrizeID,
						listPrizeAssignYear,
						listPrizeName,
						listPrizeGiven
		);

	}


	private void fetchPlayerPrize(String playerID)
	{
		List<String> listPrizeAssignYear = new ArrayList<>();
		List<String> listPrizeName = new ArrayList<>();
		List<String> listPrizeGiven = new ArrayList<>();

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrizeDB(
						playerID,
						listPrizeAssignYear,
						listPrizeName,
						listPrizeGiven
		);

		mapPlayerPrize(
						playerID,
						listPrizeAssignYear,
						listPrizeName,
						listPrizeGiven
		);
	}


	private void setTeamPrizeTableData(String teamID,
																		 Vector<Vector<String>> tableData)
	{
		Set<Prize> teamPrizeSet = newTeam().getTeamMap().get(teamID).getPrizeSet();

		for (Prize prize : teamPrizeSet) {
			Vector<String> vector = new Vector<>();

			vector.add(prize.getAssignedYear());
			vector.add(prize.getName());
			vector.add(prize.getGiven());

			tableData.add(vector);
		}
	}

	private void setPlayerPrizeTableData(String playerID,
																			 Vector<Vector<String>> tableData)
	{
		Set<Prize> playerPrizeSet = newPlayer().getPlayerMap().get(playerID).getPrizeSet();

		for (Prize prize : playerPrizeSet) {
			Vector<String> vector = new Vector<>();

			vector.add(prize.getAssignedYear());
			vector.add(prize.getName());
			vector.add(prize.getGiven());

			tableData.add(vector);
		}
	}

	public void setTeamPrizeTable(String teamID,
																Vector<Vector<String>> tableData)
	{
		fetchTeamPrize(teamID);
		setTeamPrizeTableData(teamID, tableData);
	}


	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		fetchPlayerPrize(playerID);
		setPlayerPrizeTableData(playerID, tableData);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * NATIONALITY
	 *------------------------------------------------------------------------------------------------------*/

	private void mapNationality(String playerID,
															List<String> listCountryName)
	{
		Set<Country> playerCountrySet = newPlayer().getPlayerMap().get(playerID).getCountrySet();
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

	private void fetchNationality(String playerID)
	{
		List<String> listCountryName = new ArrayList<>();

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(playerID, listCountryName);

		mapNationality(playerID, listCountryName);
	}

	private void setNationalityTableData(String playerID,
																			 Vector<Vector<String>> tableData)
	{
		Set<Country> playerCountrySet = newPlayer().getPlayerMap().get(playerID).getCountrySet();

		for (Country country : playerCountrySet) {
			Vector<String> vector = new Vector<>();

			vector.add(country.getName());

			tableData.add(vector);
		}
	}

	public void setNationalityTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		fetchNationality(playerID);
		setNationalityTableData(playerID, tableData);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * ATTRIBUTE
	 *------------------------------------------------------------------------------------------------------*/

	private void mapAttribute(String playerID,
														Map<String, String> attributeGoalkeepingMap,
														Map<String, String> attributeMentalMap,
														Map<String, String> attributePhysicalMap,
														Map<String, String> attributeTechnicalMap)
	{
		Player player = newPlayer().getPlayerMap().get(playerID);

		player.setAttributeGoalkeepingMap(attributeGoalkeepingMap);
		player.setAttributeMentalMap(attributeMentalMap);
		player.setAttributePhysicalMap(attributePhysicalMap);
		player.setAttributeTechnicalMap(attributeTechnicalMap);
	}

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

		mapAttribute(
						playerID,
						attributeGoalkeepingMap,
						attributeMentalMap,
						attributePhysicalMap,
						attributeTechnicalMap
		);
	}


	private void setAttributeTableData(String playerID,
																		 Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																		 Vector<Vector<String>> playerAttributeMentalTableData,
																		 Vector<Vector<String>> playerAttributePhysicalTableData,
																		 Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		Player player = newPlayer().getPlayerMap().get(playerID);

		if (player.getRole().matches("GK")) {
			for (String key : player.getAttributeGoalkeepingMap().keySet()) {
				Vector<String> attributeGoalkeepingVector = new Vector<>();

				attributeGoalkeepingVector.add(GuiConfiguration.getMessage(key));
				attributeGoalkeepingVector.add(player.getAttributeGoalkeepingMap().get(key));

				playerAttributeGoalkeepingTableData.add(attributeGoalkeepingVector);
			}
		}


		for (String key : player.getAttributeMentalMap().keySet()) {
			Vector<String> attributeMentalVector = new Vector<>();

			attributeMentalVector.add(GuiConfiguration.getMessage(key));
			attributeMentalVector.add(player.getAttributeMentalMap().get(key));

			playerAttributeMentalTableData.add(attributeMentalVector);
		}

		for (String key : player.getAttributePhysicalMap().keySet()) {
			Vector<String> attributePhysicalVector = new Vector<>();

			attributePhysicalVector.add(GuiConfiguration.getMessage(key));
			attributePhysicalVector.add(player.getAttributePhysicalMap().get(key));

			playerAttributePhysicalTableData.add(attributePhysicalVector);
		}

		for (String key : player.getAttributeTechnicalMap().keySet()) {
			Vector<String> attributeTechnicalVector = new Vector<>();

			attributeTechnicalVector.add(GuiConfiguration.getMessage(key));
			attributeTechnicalVector.add(player.getAttributeTechnicalMap().get(key));

			playerAttributeTechnicalTableData.add(attributeTechnicalVector);
		}
	}


	public void setAttributeTable(String playerID,
																Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																Vector<Vector<String>> playerAttributeMentalTableData,
																Vector<Vector<String>> playerAttributePhysicalTableData,
																Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		fetchAttribute(playerID);
		setAttributeTableData(
						playerID,
						playerAttributeGoalkeepingTableData,
						playerAttributeMentalTableData,
						playerAttributePhysicalTableData,
						playerAttributeTechnicalTableData
		);
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

	private void mapTag(String playerID,
											List <String> listTagName)
	{
		Set<Tag> playerTagSet = newPlayer().getPlayerMap().get(playerID).getTagSet();
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

	private void fetchTag(String playerID)
	{
		List<String> listTagName = new ArrayList<>();

		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(playerID, listTagName);

		mapTag(playerID, listTagName);
	}

	private void setTagTableData(String playerID,
															 Vector<Vector<String>> tableData)
	{
		Set<Tag> playerTagSet = newPlayer().getPlayerMap().get(playerID).getTagSet();

		for (Tag tag : playerTagSet) {
			Vector<String> vector = new Vector<>();

			vector.add(tag.getName());

			tableData.add(vector);
		}
	}

	public void setTagTable(String playerID,
													Vector<Vector<String>> tableData)
	{
		fetchTag(playerID);
		setTagTableData(playerID, tableData);
	}
	/*------------------------------------------------------------------------------------------------------*/
}

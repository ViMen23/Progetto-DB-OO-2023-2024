package controller;

import dao.*;
import gui.Regex;
import model.*;
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
	private static Admin adminConnected = null;

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

		if (adminConnected != null) {
			return false;
		}

		AdminDAO adminDAO = new PostgresImplAdminDAO();
		if (adminDAO.isAdminDB(username, password)) {
			adminConnected = new Admin(username, password);
			System.out.println("Connesso");
			return true;
		}

		return false;
	}


	/**
	 * TODO
	 */
	public void logoutAdmin()
	{
		if (null != adminConnected) {
			adminConnected = null;
			System.out.println("Disconnesso");
		}
	}


	/**
	 * TODO
	 * @return
	 */
	public boolean isAdminConnected()
	{
		return (null != adminConnected);
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COUNTRY
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @return
	 */
	public Integer countCountries()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		return countryDAO.countCountryDB();
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
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.fetchCountryDB(
						countryType,
						superCountryID,
						countryNameVector,
						countryNameMap
		);
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
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		countryDAO.fetchCountryDB(
						countryType,
						superCountryID,
						countryTableData
		);
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * CONFEDERATION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @return
	 */
	public Integer countConfederations()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		return confederationDAO.countConfederationDB();
	}


	/**
	 * TODO
	 * @param countryType
	 * @param superConfederationID
	 * @param confederationShortNameVector
	 * @param confederationShortNameMap
	 */
	public void setConfederationComboBox(String countryType,
																			 String superConfederationID,
																			 Vector<String> confederationShortNameVector,
																			 Map<String, String> confederationShortNameMap)
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						countryType,
						superConfederationID,
						confederationShortNameVector,
						confederationShortNameMap
		);
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
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						countryType,
						superConfederationID,
						confederationTableData
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param confederationMap
	 */
	public void setConfederationPartecipation(String teamID,
																						Map<String, String> confederationMap)
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederationDB(
						teamID,
						confederationMap
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COMPETITION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @return
	 */
	public Integer countCompetitions()
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.countCompetitionDB();
	}


	public void setCompetitionInfoMap(String competitionID,
																		Map<String, String> infoMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						competitionID,
						infoMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param competitionNameVector
	 * @param competitionNameMap
	 */
	public void setCompetitionComboBox(String playerID,
																		 String teamType,
																		 Vector<String> competitionNameVector,
																		 Map<String, String> competitionNameMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						playerID,
						teamType,
						competitionNameVector,
						competitionNameMap
		);
	}


	/**
	 * TODO
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryType
	 * @param competitionContinentID
	 * @param competitionNationID
	 * @param competitionNameVector
	 * @param competitionNameMap
	 */
	public void setCompetitionComboBox(String competitionSubName,
																		 String competitionType,
																		 String competitionTeamType,
																		 String competitionCountryType,
																		 String competitionContinentID,
																		 String competitionNationID,
																		 Vector<String> competitionNameVector,
																		 Map<String, String> competitionNameMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						competitionNameVector,
						competitionNameMap
		);
	}

	/**
	 * TODO
	 * @param teamType
	 * @param competitionID
	 * @param competitionEditionVector
	 * @param competitionEditionMap
	 */
	public void setCompetitionEditionComboBox(String teamType,
																						String competitionID,
																						Vector<String> competitionEditionVector,
																						Map<String, String> competitionEditionMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionEditionDB(
						teamType,
						competitionID,
						competitionEditionVector,
						competitionEditionMap
		);
	}


	/**
	 * TODO
	 * @param confederationID
	 * @param teamType
	 * @param competitionVector
	 * @param competitionMap
	 */
	public void setCompetitionConfederationComboBox(String confederationID,
																									String teamType,
																									Vector<String> competitionVector,
																									Map<String, String> competitionMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionConfederationDB(
						confederationID,
						teamType,
						competitionVector,
						competitionMap
		);
	}


	/**
	 * TODO
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryType
	 * @param competitionContinentID
	 * @param competitionNationID
	 * @param competitionTableData
	 */
	public void setCompetitionTable(String competitionSubName,
																	String competitionType,
																	String competitionTeamType,
																	String competitionCountryType,
																	String competitionContinentID,
																	String competitionNationID,
																	Vector<Vector<String>> competitionTableData)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionDB(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						competitionTableData
		);
	}


	/**
	 * TODO
	 * @param competitionSubName
	 * @param competitionType
	 * @param competitionTeamType
	 * @param competitionCountryType
	 * @param competitionContinentID
	 * @param competitionNationID
	 * @param tableData
	 * @param tableMap
	 */
	public void setCompetitionTableAdmin(String competitionSubName,
																			 String competitionType,
																			 String competitionTeamType,
																			 String competitionCountryType,
																			 String competitionContinentID,
																			 String competitionNationID,
																			 Vector<Vector<String>> tableData,
																			 Map<Integer, Map<Integer, String>> tableMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionAdminDB(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param competitionID
	 * @param teamType
	 * @param tableData
	 * @param tableMap
	 */
	public void setCompetitionTableAdmin(String competitionID,
																			 String teamType,
																			 Vector<Vector<Object>> tableData,
																			 Map<Integer, Map<Integer, String>> tableMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionEditionAdminDB(
						competitionID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param startYear
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setCompetitionPlayComboBox(String playerID,
																				 String teamType,
																				 String startYear,
																				 Vector<String> comboBoxData,
																				 Map<String, String> comboBoxMap)
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		competitionDAO.fetchCompetitionPlayDB(
						playerID,
						teamType,
						startYear,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String createCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.newCompetitionEditionDB(
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * TODO
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String deleteCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.deleteCompetitionEditionDB(
						competitionID,
						competitionStartYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TEAM
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @return
	 */
	public Integer countTeams()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.countTeamDB();
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
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamComboDB(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamContinentID,
						teamNationID,
						teamLongNameVector,
						teamLongNameMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamLongNameVector
	 * @param teamLongNameMap
	 */
	public void setTeamComboBox(String playerID,
															Vector<String> teamLongNameVector,
															Map<String, String> teamLongNameMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						playerID,
						teamLongNameVector,
						teamLongNameMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param teamType
	 * @param teamYearVector
	 * @param teamYearMap
	 */
	public void setTeamYearComboBox(String teamID,
																	String teamType,
																	Vector<String> teamYearVector,
																	Map<String, String> teamYearMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamID,
						teamType,
						teamYearVector,
						teamYearMap
		);
	}


	/**
	 * TODO
	 * @param teamSubLongName
	 * @param teamSubShortName
	 * @param teamType
	 * @param teamContinentID
	 * @param teamNationID
	 * @param teamTableData
	 * @param teamTableMap
	 */
	public void setTeamTable(String teamSubLongName,
													 String teamSubShortName,
													 String teamType,
													 String teamContinentID,
													 String teamNationID,
													 Vector<Vector<String>> teamTableData,
													 Map<Integer, Map<Integer, String>> teamTableMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamContinentID,
						teamNationID,
						teamTableData,
						teamTableMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param infoTeamMap
	 */
	public void setTeamInfoMap(String teamID,
														 Map<String, String> infoTeamMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamID,
						infoTeamMap
		);
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
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamCompetitionDB(
						competitionStartYear,
						competitionID,
						teamLongNameVector,
						teamLongNameMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setNationalTeamComboBox(String playerID,
																			Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamComboBoxDB(
						playerID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param startYear
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setTeamComboBox(String playerID,
															String teamType,
															String startYear,
															Vector<String> comboBoxData,
															Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						playerID,
						teamType,
						startYear,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param competitionStartYear
	 * @param competitionID
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setTeamPlayComboBox(String playerID,
																	String competitionStartYear,
																	String competitionID,
																	Vector<String> comboBoxData,
																	Map<String, String> comboBoxMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamPlayDB(
						playerID,
						competitionStartYear,
						competitionID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param startYear
	 * @param infoTeamMap
	 * @param teamSquadTableData
	 * @param teamSquadTableMap
	 * @param teamPartecipationTableData
	 */
	public void setTeamSeasonView(String teamID,
																String startYear,
																Map<String, String> infoTeamMap,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap,
																Vector<Vector<Object>> teamPartecipationTableData)
	{
		setTeamInfoMap(teamID, infoTeamMap);
		setPartecipationTable(teamID, startYear, teamPartecipationTableData);
		setTeamSquadTable(teamID, startYear, teamSquadTableData, teamSquadTableMap);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param teamType
	 * @param infoTeamMap
	 * @param teamTrophyTableData
	 * @param teamPrizeTableData
	 */
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


	/**
	 * TODO
	 * @param teamType
	 * @param teamLongName
	 * @param teamShortName
	 * @param countryID
	 * @return
	 */
	public String createTeam(String teamType,
													 String teamLongName,
													 String teamShortName,
													 String countryID)
	{
		String message = null;

		if (null == adminConnected) {
			message = "errorNoAdmin";
			return message;
		}

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			if (!Regex.patternAlnum.matcher(teamLongName).find()) {
				message = "errorMessageInput";
				return message;
			}

			if (!Regex.patternCode.matcher(teamShortName).find()) {
				message = "errorMessageInput";
				return message;
			}

			TeamDAO teamDAO = new PostgresImplTeamDAO();
			message = teamDAO.newClubTeamDB(countryID, teamLongName, teamShortName);
		} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			TeamDAO teamDAO = new PostgresImplTeamDAO();
			message = teamDAO.newNationalTeamDB(countryID);
		}

		return message;
	}


	/**
	 * TODO
	 * @param teamID
	 * @param teamType
	 * @param teamLongName
	 * @param teamShortName
	 * @return
	 */
	public String updateTeam(String teamID,
													 String teamType,
													 String teamLongName,
													 String teamShortName)
	{
		String message = null;

		if (null == adminConnected) {
			message = "errorNoAdmin";
			return message;
		}

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			message = "error";
			return message;
		}

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			if (!Regex.patternAlnum.matcher(teamLongName).find()) {
				message = "errorMessageInput";
				return message;
			}

			if (!Regex.patternCode.matcher(teamShortName).find()) {
				message = "errorMessageInput";
				return message;
			}

			TeamDAO teamDAO = new PostgresImplTeamDAO();
			message = teamDAO.updateClubTeamDB(teamID, teamLongName, teamShortName);
		}

		return message;
	}


	/**
	 * TODO
	 * @param teamID
	 * @return
	 */
	public String deleteTeam(String teamID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.deleteTeamDB(teamID);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PLAYER
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @return
	 */
	public Integer countPlayers()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.countPlayerDB();
	}


	/**
	 * TODO
	 * @param playerID
	 * @param infoPlayerMap
	 */
	public void setPlayerInfoMap(String playerID,
															 Map<String, String> infoPlayerMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayer(
						playerID,
						infoPlayerMap
		);
	}


	/**
	 * TODO
	 * @param startYear
	 * @param teamID
	 * @param playerInfoVector
	 * @param playerInfoMap
	 */
	public void setPlayerComboBox(String startYear,
																String teamID,
																Vector<String> playerInfoVector,
																Map<String, String> playerInfoMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayer(
						startYear,
						teamID,
						playerInfoVector,
						playerInfoMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param seasonVector
	 * @param seasonMap
	 */
	public void setPlayerComboBoxYear(String playerID,
																		String teamType,
																		Vector<String> seasonVector,
																		Map<String, String> seasonMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerYear(
						playerID,
						teamType,
						seasonVector,
						seasonMap
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
	 * @param playerTableData
	 * @param playerTableMap
	 */
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
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayer(
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
						playerTableData,
						playerTableMap
		);
	}


	/**
	 * TODO
	 * @param militancyPlayerTeamID
	 * @param militancyPlayerStartYear
	 * @param militancyPlayerEndYear
	 * @param playerTableData
	 * @param playerTableMap
	 */
	public void setPlayerTable(String militancyPlayerTeamID,
														 String militancyPlayerStartYear,
														 String militancyPlayerEndYear,
														 Vector<Vector<String>> playerTableData,
														 Map<Integer, Map<Integer, String>> playerTableMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayer(
						militancyPlayerTeamID,
						militancyPlayerStartYear,
						militancyPlayerEndYear,
						playerTableData,
						playerTableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param infoPlayerMap
	 * @param playerPositionTableData
	 * @param playerNationalityTableData
	 */
	public void setPlayerGeneralView(String playerID,
																	 Map<String, String> infoPlayerMap,
																	 Vector<Vector<String>> playerPositionTableData,
																	 Vector<Vector<String>> playerNationalityTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setPositionTable(playerID, playerPositionTableData);
		setNationalityTable(playerID, playerNationalityTableData);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param infoPlayerMap
	 * @param playerAttributeGoalkeepingTableData
	 * @param playerAttributeMentalTableData
	 * @param playerAttributePhysicalTableData
	 * @param playerAttributeTechnicalTableData
	 * @param playerTagTableData
	 */
	public void setPlayerDetailedView(String playerID,
																		Map<String, String> infoPlayerMap,
																		Vector<Vector<String>> playerAttributeGoalkeepingTableData,
																		Vector<Vector<String>> playerAttributeMentalTableData,
																		Vector<Vector<String>> playerAttributePhysicalTableData,
																		Vector<Vector<String>> playerAttributeTechnicalTableData,
																		Vector<Vector<String>> playerTagTableData)
	{
		setPlayerInfoMap(playerID, infoPlayerMap);
		setAttributeGoalkeepingTable(playerID, playerAttributeGoalkeepingTableData);
		setAttributeMentalTable(playerID, playerAttributeMentalTableData);
		setAttributePhysicalTable(playerID, playerAttributePhysicalTableData);
		setAttributeTechnicalTable(playerID, playerAttributeTechnicalTableData);
		setTagTable(playerID, playerTagTableData);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param infoPlayerMap
	 * @param playerClubCareerTableData
	 * @param playerClubCareerTableMap
	 * @param playerNationalCareerTableData
	 * @param playerNationalCareerTableMap
	 */
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


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param teamID
	 * @param competitionID
	 * @param startYear
	 * @param endYear
	 * @param infoPlayerMap
	 * @param playerStatisticTableData
	 * @param playerStatisticTableMap
	 */
	public void setPlayerStatisticView(String playerID,
																		 String teamType,
																		 String teamID,
																		 String competitionID,
																		 String startYear,
																		 String endYear,
																		 Map<String, String> infoPlayerMap,
																		 Vector<Vector<Object>> playerStatisticTableData,
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


	/**
	 * TODO
	 * @param playerID
	 * @param infoPlayerMap
	 * @param playerClubTrophyTableData
	 * @param playerClubTrophyTableMap
	 * @param playerNationalTrophyTableData
	 * @param playerNationalTrophyTableMap
	 * @param playerPrizeTableData
	 */
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


	/**
	 * TODO
	 * @param playerID
	 * @return
	 */
	public String setPlayerYear(String playerID)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.fetchPlayerYear(playerID);
	}


	/**
	 * TODO
	 * @param name
	 * @param surname
	 * @param dob
	 * @param countryID
	 * @param foot
	 * @param positionID
	 * @param role
	 * @return
	 */
	public String newPlayer(String name,
													String surname,
													String dob,
													String countryID,
													String foot,
													String positionID,
													String role)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.newPlayer(
						name,
						surname,
						dob,
						countryID,
						foot,
						positionID,
						role
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @return
	 */
	public String deletePlayer(String playerID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.deletePlayer(playerID);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param name
	 * @param surname
	 * @param dob
	 * @param countryID
	 * @param foot
	 * @param positionID
	 * @return
	 */
	public String updatePlayer(String playerID,
														 String name,
														 String surname,
														 String dob,
														 String countryID,
														 String foot,
														 String positionID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.updatePlayer(
						playerID,
						name,
						surname,
						dob,
						countryID,
						foot,
						positionID
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param retiredDate
	 * @return
	 */
	public String setRetiredDate(String playerID,
															 String retiredDate)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.setRetiredDate(
						playerID,
						retiredDate
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * POSITION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param positionNameVector
	 * @param positionNameMap
	 */
	public void setPositionComboBox(Vector<String> positionNameVector,
																	Map<String, String> positionNameMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPosition(
						positionNameVector,
						positionNameMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param playerPositionTableData
	 */
	public void setPositionTable(String playerID,
															 Vector<Vector<String>> playerPositionTableData)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPosition(
						playerID,
						playerPositionTableData
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setPositionTable(String playerID,
															 Vector<Vector<Object>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPosition(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param positionID
	 * @return
	 */
	public String addPlayerPosition(String playerID,
																	String positionID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.newPlayerPosition(
						playerID,
						positionID
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param positionID
	 * @return
	 */
	public String removePlayerPosition(String playerID,
																		 String positionID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.deletePlayerPosition(
						playerID,
						positionID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * STATISTIC
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param teamType
	 * @param playerRole
	 * @param statisticTableData
	 * @param statisticTableDataMap
	 */
	public void setStatisticTable(String teamType,
																String playerRole,
																Vector<Vector<Object>> statisticTableData,
																Map<Integer, Map<Integer, String>> statisticTableDataMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticTotal(
						teamType,
						playerRole,
						statisticTableData,
						statisticTableDataMap
		);
	}


	/**
	 * TODO
	 * @param competitionStartYear
	 * @param competitionID
	 * @param statisticTableData
	 * @param statisticTableMap
	 */
	public void setStatisticCompetitionEditionTable(String competitionStartYear,
																									String competitionID,
																									Vector<Vector<Object>> statisticTableData,
																									Map<Integer, Map<Integer, String>> statisticTableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticEdition(
						competitionStartYear,
						competitionID,
						statisticTableData,
						statisticTableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param teamID
	 * @param competitionID
	 * @param startYear
	 * @param endYear
	 * @param playerStatisticTableData
	 * @param playerStatisticTableMap
	 */
	public void setPlayerStatisticTable(String playerID,
																			String teamType,
																			String teamID,
																			String competitionID,
																			String startYear,
																			String endYear,
																			Vector<Vector<Object>> playerStatisticTableData,
																			Map<Integer, Map<Integer, String>> playerStatisticTableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticPlayer(
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


	/**
	 * TODO
	 * @param playerID
	 * @param teamID
	 * @param competitionID
	 * @param competitionStartYear
	 * @param tableData
	 * @param tableMap
	 */
	public void setStatisticTableAdmin(String playerID,
																		 String teamID,
																		 String competitionID,
																		 String competitionStartYear,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticAdmin(
						playerID,
						teamID,
						competitionID,
						competitionStartYear,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playID
	 * @param match
	 * @param goalScored
	 * @param assist
	 * @param yellowCard
	 * @param redCard
	 * @param penaltyScored
	 * @param goalConceded
	 * @param penaltySaved
	 * @return
	 */
	public String updateStatistic(String playID,
																String match,
																String goalScored,
																String assist,
																String yellowCard,
																String redCard,
																String penaltyScored,
																String goalConceded,
																String penaltySaved)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		return statisticDAO.updateStatistic(
						playID,
						match,
						goalScored,
						assist,
						yellowCard,
						redCard,
						penaltyScored,
						goalConceded,
						penaltySaved
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PARTECIPATION
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param teamID
	 * @param competitionStartYear
	 * @param teamPartecipationTableData
	 */
	public void setPartecipationTable(String teamID,
																		String competitionStartYear,
																		Vector<Vector<Object>> teamPartecipationTableData)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipation(teamID, competitionStartYear, teamPartecipationTableData);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param competitionStartYear
	 * @param teamPartecipationTableData
	 * @param tableMap
	 */
	public void setPartecipationTableAdmin(String teamID,
																				 String competitionStartYear,
																				 Vector<Vector<Object>> teamPartecipationTableData,
																				 Map<Integer, Map<Integer, String>> tableMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationAdmin(
						teamID,
						competitionStartYear,
						teamPartecipationTableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param teamType
	 * @param partecipationYearVector
	 * @param partecipationYearMap
	 */
	public void setPartecipationYearComboBox(String teamID,
																					 String teamType,
																					 Vector<String> partecipationYearVector,
																					 Map<String, String> partecipationYearMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationYear(
						teamID,
						teamType,
						partecipationYearVector,
						partecipationYearMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param competitionStartYear
	 * @param partecipationNameVector
	 * @param partecipationNameMap
	 */
	public void setPartecipationComboBox(String teamID,
																			 String competitionStartYear,
																			 Vector<String> partecipationNameVector,
																			 Map<String, String> partecipationNameMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipation(
						teamID,
						competitionStartYear,
						partecipationNameVector,
						partecipationNameMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String deletePartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.deletePartecipationDB(teamID, competitionID, competitionStartYear);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String createPartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.newPartecipationDB(teamID, competitionID, competitionStartYear);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * MILITANCY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param teamID
	 * @param startYear
	 * @param teamSquadTableData
	 * @param teamSquadTableMap
	 */
	public void setTeamSquadTable(String teamID,
																String startYear,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancy(teamID, startYear, teamSquadTableData, teamSquadTableMap);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setNationalCareerTable(String playerID,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNational(playerID, tableData, tableMap);
	}

	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setClubCareerTable(String playerID,
																 Vector<Vector<String>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClub(playerID, tableData, tableMap);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setNationalCareerAdmin(String playerID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNationalAdmin(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setClubCareerAdmin(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClubAdmin(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamID
	 * @param teamType
	 * @param startYear
	 * @param seasonType
	 * @return
	 */
	public String newMilitancy(String playerID,
														 String teamID,
														 String teamType,
														 String startYear,
														 String seasonType)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		return militancyDAO.newMilitancy(
						playerID,
						teamID,
						teamType,
						startYear,
						seasonType
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamID
	 * @param startYear
	 * @return
	 */
	public String deleteMilitancy(String playerID,
																String teamID,
																String startYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		return militancyDAO.deleteMilitancy(
						playerID,
						teamID,
						startYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TROPHY
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setTeamTrophyComboBox(Vector<String> comboBoxData,
																		Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophy(comboBoxData, comboBoxMap);
	}


	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setPlayerTrophyComboBox(Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchPlayerTrophy(comboBoxData, comboBoxMap);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param teamType
	 * @param tableData
	 */
	public void setTeamTrophyTable(String teamID,
																 String teamType,
																 Vector<Vector<String>> tableData)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophy(
						teamID,
						teamType,
						tableData
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param teamType
	 * @param tableData
	 * @param tableMap
	 */
	public void setTeamTrophyTableAdmin(String teamID,
																			String teamType,
																			Vector<Vector<Object>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophyAdmin(
						teamID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param tableData
	 * @param tableMap
	 */
	public void setPlayerTrophyTable(String playerID,
																	 String teamType,
																	 Vector<Vector<String>> tableData,
																	 Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophy(
						playerID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamType
	 * @param tableData
	 * @param tableMap
	 */
	public void setPlayerTrophyTableAdmin(String playerID,
																				String teamType,
																				Vector<Vector<Object>> tableData,
																				Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyPlayerAdmin(
						playerID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param trophyID
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String assignTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.newTrophyTeam(
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param trophyID
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String removeTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.deleteTrophyTeam(
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamID
	 * @param trophyID
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String assignTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.newTrophyPlayer(
						playerID,
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param teamID
	 * @param trophyID
	 * @param competitionID
	 * @param competitionStartYear
	 * @return
	 */
	public String removeTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.deleteTrophyPlayer(
						playerID,
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PRIZE
	 *------------------------------------------------------------------------------------------------------*/

	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setTeamPrizeComboBox(Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrize(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setPlayerPrizeComboBox(Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrize(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param tableData
	 */
	public void setTeamPrizeTable(String teamID,
																Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrize(teamID, tableData);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param tableData
	 * @param tableMap
	 */
	public void setTeamPrizeTableAdmin(String teamID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeAdmin(
						teamID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 */
	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrize(playerID, tableData);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param prizeID
	 * @param assignedYear
	 * @return
	 */
	public String assignPrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPrizeTeam(
						teamID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * TODO
	 * @param teamID
	 * @param prizeID
	 * @param assignedYear
	 * @return
	 */
	public String removePrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePrizeTeam(
						teamID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<Object>> tableData,
																	Map<Integer, Map<Integer, String>> tableMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrize(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param prizeID
	 * @param assignedYear
	 * @return
	 */
	public String addPlayerPrize(String playerID,
															 String prizeID,
															 String assignedYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPlayerPrize(
						playerID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param prizeID
	 * @param assignedYear
	 * @return
	 */
	public String deletePlayerPrize(String playerID,
																	String prizeID,
																	String assignedYear)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePlayerPrize(
						playerID,
						prizeID,
						assignedYear
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * NATIONALITY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 */
	public void setNationalityTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(
						playerID,
						tableData
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setNationalityTable(String playerID,
																	Vector<Vector<Object>> tableData,
																	Map<Integer, Map<Integer, String>> tableMap)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setNationalityComboBox(String playerID,
																		 Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityComboBoxDB(
						playerID,
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param countryID
	 * @return
	 */
	public String addNationality(String playerID,
															 String countryID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		return nationalityDAO.newNationalityDB(
						playerID,
						countryID
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param countryID
	 * @return
	 */
	public String removeNationality(String playerID,
																	String countryID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		return nationalityDAO.deleteNationalityDB(
						playerID,
						countryID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * ATTRIBUTE
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param playerID
	 * @param playerAttributeGoalkeepingTableData
	 */
	public void setAttributeGoalkeepingTable(String playerID,
																					 Vector<Vector<String>> playerAttributeGoalkeepingTableData)
	{
		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		attributeGoalkeepingDAO.fetchAttributeGoalkeeping(playerID, playerAttributeGoalkeepingTableData);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param playerAttributeMentalTableData
	 */
	public void setAttributeMentalTable(String playerID,
																			Vector<Vector<String>> playerAttributeMentalTableData)
	{
		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		attributeMentalDAO.fetchAttributeMental(playerID, playerAttributeMentalTableData);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param playerAttributePhysicalTableData
	 */
	public void setAttributePhysicalTable(String playerID,
																				Vector<Vector<String>> playerAttributePhysicalTableData)
	{
		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		attributePhysicalDAO.fetchAttributePhysical(playerID, playerAttributePhysicalTableData);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param playerAttributeTechnicalTableData
	 */
	public void setAttributeTechnicalTable(String playerID,
																				 Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		attributeTechnicalDAO.fetchAttributeTechnical(playerID, playerAttributeTechnicalTableData);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param aerialReach
	 * @param commandOfArea
	 * @param communication
	 * @param eccentricity
	 * @param firstTouchGk
	 * @param handling
	 * @param kicking
	 * @param oneOnOnes
	 * @param passingGk
	 * @param punchingTendency
	 * @param reflexes
	 * @param rushingOutTendency
	 * @param throwing
	 * @return
	 */
	public String updateAttributeGoalkeeping(String playerID,
																					 String aerialReach,
																					 String commandOfArea,
																					 String communication,
																					 String eccentricity,
																					 String firstTouchGk,
																					 String handling,
																					 String kicking,
																					 String oneOnOnes,
																					 String passingGk,
																					 String punchingTendency,
																					 String reflexes,
																					 String rushingOutTendency,
																					 String throwing)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		return attributeGoalkeepingDAO.updateAttributeGoalkeeping(
						playerID,
						aerialReach,
						commandOfArea,
						communication,
						eccentricity,
						firstTouchGk,
						handling,
						kicking,
						oneOnOnes,
						passingGk,
						punchingTendency,
						reflexes,
						rushingOutTendency,
						throwing
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param aggression
	 * @param anticipation
	 * @param bravery
	 * @param composure
	 * @param concentration
	 * @param decision
	 * @param determination
	 * @param flair
	 * @param leadership
	 * @param offTheBall
	 * @param positioning
	 * @param teamwork
	 * @param vision
	 * @param workRate
	 * @return
	 */
	public String updateAttributeMental(String playerID,
																			String aggression,
																			String anticipation,
																			String bravery,
																			String composure,
																			String concentration,
																			String decision,
																			String determination,
																			String flair,
																			String leadership,
																			String offTheBall,
																			String positioning,
																			String teamwork,
																			String vision,
																			String workRate)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		return attributeMentalDAO.updateAttributeMental(
						playerID,
						aggression,
						anticipation,
						bravery,
						composure,
						concentration,
						decision,
						determination,
						flair,
						leadership,
						offTheBall,
						positioning,
						teamwork,
						vision,
						workRate
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param acceleration
	 * @param agility
	 * @param balance
	 * @param jumpingReach
	 * @param naturalFitness
	 * @param pace
	 * @param stamina
	 * @param strength
	 * @return
	 */
	public String updateAttributePhysical(String playerID,
																				String acceleration,
																				String agility,
																				String balance,
																				String jumpingReach,
																				String naturalFitness,
																				String pace,
																				String stamina,
																				String strength)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		return attributePhysicalDAO.updateAttributePhysical(
						playerID,
						acceleration,
						agility,
						balance,
						jumpingReach,
						naturalFitness,
						pace,
						stamina,
						strength
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param corners
	 * @param crossing
	 * @param dribbling
	 * @param finishing
	 * @param firstTouch
	 * @param freeKickTaking
	 * @param heading
	 * @param longShots
	 * @param longThrows
	 * @param marking
	 * @param passing
	 * @param penaltyTaking
	 * @param tackling
	 * @param technique
	 * @return
	 */
	public String updateAttributeTechnical(String playerID,
																				 String corners,
																				 String crossing,
																				 String dribbling,
																				 String finishing,
																				 String firstTouch,
																				 String freeKickTaking,
																				 String heading,
																				 String longShots,
																				 String longThrows,
																				 String marking,
																				 String passing,
																				 String penaltyTaking,
																				 String tackling,
																				 String technique)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		return attributeTechnicalDAO.updateAttributeTechnical(
						playerID,
						corners,
						crossing,
						dribbling,
						finishing,
						firstTouch,
						freeKickTaking,
						heading,
						longShots,
						longThrows,
						marking,
						passing,
						penaltyTaking,
						tackling,
						technique
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TAG
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 */
	public void setTagTable(String playerID,
													Vector<Vector<String>> tableData)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTag(
						playerID,
						tableData
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tableData
	 * @param tableMap
	 */
	public void setTagTable(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTag(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * TODO
	 * @param comboBoxData
	 * @param comboBoxMap
	 */
	public void setTagComboBox(Vector<String> comboBoxData,
														 Map<String, String> comboBoxMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTag(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tagID
	 * @return
	 */
	public String addPlayerTag(String playerID,
														 String tagID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.newPlayerTag(
						playerID,
						tagID
		);
	}


	/**
	 * TODO
	 * @param playerID
	 * @param tagID
	 * @return
	 */
	public String removePlayerTag(String playerID,
																String tagID)
	{
		if (null == adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.deletePlayerTag(
						playerID,
						tagID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/
}

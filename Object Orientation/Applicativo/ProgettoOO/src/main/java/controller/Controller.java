package controller;

import dao.*;
import gui.Regex;
import model.*;
import postgresImplDAO.*;

import java.util.*;

/**
 * The type Controller.
 */
public class Controller
{
	private static Controller controllerInstance = null;
	private static boolean adminConnected = false;

	private Controller()
	{
	}

	/**
	 * Gets instance.
	 *
	 * @return the instance
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
	 * Is admin boolean.
	 *
	 * @param username the username
	 * @param password the password
	 * @return the boolean
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

		if (adminConnected) {
			return false;
		}

		AdminDAO adminDAO = new PostgresImplAdminDAO();
		//return adminDAO.isAdminDB(username, password);
		if (adminDAO.isAdminDB(username, password)) {
			System.out.println("Connesso");
			return true;
		} else {
			System.out.println("Non Connesso");
			return false;
		}
	}


	/**
	 * Logout admin.
	 */
	public void logoutAdmin()
	{
		if (adminConnected) {
			adminConnected = false;
		}
	}


	/**
	 * Is admin connected boolean.
	 *
	 * @return the boolean
	 */
	public boolean isAdminConnected()
	{
		return adminConnected;
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COUNTRY
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Count countries integer.
	 *
	 * @return the integer
	 */
	public Integer countCountries()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		return countryDAO.countCountryDB();
	}


	/**
	 * Sets country combo box.
	 *
	 * @param countryType       the country type
	 * @param superCountryID    the super country id
	 * @param countryNameVector the country name vector
	 * @param countryNameMap    the country name map
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
	 * Sets country table.
	 *
	 * @param countryType      the country type
	 * @param superCountryID   the super country id
	 * @param countryTableData the country table data
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


	public Integer countConfederations()
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		return confederationDAO.countConfederationDB();
	}


	/**
	 * Sets confederation combo box.
	 *
	 * @param countryType                  the country type
	 * @param superConfederationID         the super confederation id
	 * @param confederationShortNameVector the confederation short name vector
	 * @param confederationShortNameMap    the confederation short name map
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
	 * Sets confederation table.
	 *
	 * @param countryType            the country type
	 * @param superConfederationID   the super confederation id
	 * @param confederationTableData the confederation table data
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
	 * Sets confederation partecipation.
	 *
	 * @param teamID           the team id
	 * @param confederationMap the confederation map
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
	 * Count competitions integer.
	 *
	 * @return the integer
	 */
	public Integer countCompetitions()
	{
		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.countCompetitionDB();
	}


	/**
	 * Sets competition info map.
	 *
	 * @param competitionID the competition id
	 * @param infoMap       the info map
	 */
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
	 * Sets competition combo box.
	 *
	 * @param playerID              the player id
	 * @param teamType              the team type
	 * @param competitionNameVector the competition name vector
	 * @param competitionNameMap    the competition name map
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
	 * Sets competition combo box.
	 *
	 * @param competitionSubName     the competition sub name
	 * @param competitionType        the competition type
	 * @param competitionTeamType    the competition team type
	 * @param competitionCountryType the competition country type
	 * @param competitionContinentID the competition continent id
	 * @param competitionNationID    the competition nation id
	 * @param competitionNameVector  the competition name vector
	 * @param competitionNameMap     the competition name map
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
	 * Sets competition edition combo box.
	 *
	 * @param teamType                 the team type
	 * @param competitionID            the competition id
	 * @param competitionEditionVector the competition edition vector
	 * @param competitionEditionMap    the competition edition map
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
	 * Sets competition confederation combo box.
	 *
	 * @param confederationID   the confederation id
	 * @param teamType          the team type
	 * @param competitionVector the competition vector
	 * @param competitionMap    the competition map
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
	 * Sets competition table.
	 *
	 * @param competitionSubName     the competition sub name
	 * @param competitionType        the competition type
	 * @param competitionTeamType    the competition team type
	 * @param competitionCountryType the competition country type
	 * @param competitionContinentID the competition continent id
	 * @param competitionNationID    the competition nation id
	 * @param competitionTableData   the competition table data
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
	 * Sets competition table admin.
	 *
	 * @param competitionSubName     the competition sub name
	 * @param competitionType        the competition type
	 * @param competitionTeamType    the competition team type
	 * @param competitionCountryType the competition country type
	 * @param competitionContinentID the competition continent id
	 * @param competitionNationID    the competition nation id
	 * @param tableData              the table data
	 * @param tableMap               the table map
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
	 * Sets competition table admin.
	 *
	 * @param competitionID the competition id
	 * @param teamType      the team type
	 * @param tableData     the table data
	 * @param tableMap      the table map
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
	 * Sets competition play combo box.
	 *
	 * @param playerID     the player id
	 * @param teamType     the team type
	 * @param startYear    the start year
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
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
	 * Create competition edition string.
	 *
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String createCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.newCompetitionEditionDB(
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Delete competition edition string.
	 *
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String deleteCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (adminConnected) {
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
	 * Count teams integer.
	 *
	 * @return the integer
	 */
	public Integer countTeams()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.countTeamDB();
	}


	/**
	 * Sets team combo box.
	 *
	 * @param teamSubLongName    the team sub long name
	 * @param teamSubShortName   the team sub short name
	 * @param teamType           the team type
	 * @param teamContinentID    the team continent id
	 * @param teamNationID       the team nation id
	 * @param teamLongNameVector the team long name vector
	 * @param teamLongNameMap    the team long name map
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
	 * Sets team combo box.
	 *
	 * @param playerID           the player id
	 * @param teamLongNameVector the team long name vector
	 * @param teamLongNameMap    the team long name map
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
	 * Sets team year combo box.
	 *
	 * @param teamID         the team id
	 * @param teamType       the team type
	 * @param teamYearVector the team year vector
	 * @param teamYearMap    the team year map
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
	 * Sets team table.
	 *
	 * @param teamSubLongName  the team sub long name
	 * @param teamSubShortName the team sub short name
	 * @param teamType         the team type
	 * @param teamContinentID  the team continent id
	 * @param teamNationID     the team nation id
	 * @param teamTableData    the team table data
	 * @param teamTableMap     the team table map
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
	 * Sets team info map.
	 *
	 * @param teamID      the team id
	 * @param infoTeamMap the info team map
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
	 * Sets team combo box.
	 *
	 * @param competitionStartYear the competition start year
	 * @param competitionID        the competition id
	 * @param teamLongNameVector   the team long name vector
	 * @param teamLongNameMap      the team long name map
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
	 * Sets national team combo box.
	 *
	 * @param playerID     the player id
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
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
	 * Sets team combo box.
	 *
	 * @param playerID     the player id
	 * @param teamType     the team type
	 * @param startYear    the start year
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
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
	 * Sets team play combo box.
	 *
	 * @param playerID             the player id
	 * @param competitionStartYear the competition start year
	 * @param competitionID        the competition id
	 * @param comboBoxData         the combo box data
	 * @param comboBoxMap          the combo box map
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
	 * Sets team season view.
	 *
	 * @param teamID                     the team id
	 * @param startYear                  the start year
	 * @param infoTeamMap                the info team map
	 * @param teamSquadTableData         the team squad table data
	 * @param teamSquadTableMap          the team squad table map
	 * @param teamPartecipationTableData the team partecipation table data
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
	 * Sets team case view.
	 *
	 * @param teamID              the team id
	 * @param teamType            the team type
	 * @param infoTeamMap         the info team map
	 * @param teamTrophyTableData the team trophy table data
	 * @param teamPrizeTableData  the team prize table data
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
	 * Create team string.
	 *
	 * @param teamType      the team type
	 * @param teamLongName  the team long name
	 * @param teamShortName the team short name
	 * @param countryID     the country id
	 * @return the string
	 */
	public String createTeam(String teamType,
													 String teamLongName,
													 String teamShortName,
													 String countryID)
	{
		String message = null;

		if (adminConnected) {
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
	 * Update team string.
	 *
	 * @param teamID        the team id
	 * @param teamType      the team type
	 * @param teamLongName  the team long name
	 * @param teamShortName the team short name
	 * @return the string
	 */
	public String updateTeam(String teamID,
													 String teamType,
													 String teamLongName,
													 String teamShortName)
	{
		String message = null;

		if (adminConnected) {
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
	 * Delete team string.
	 *
	 * @param teamID the team id
	 * @return the string
	 */
	public String deleteTeam(String teamID)
	{
		if (adminConnected) {
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
	 * Count players integer.
	 *
	 * @return the integer
	 */
	public Integer countPlayers()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.countPlayerDB();
	}


	/**
	 * Sets player info map.
	 *
	 * @param playerID      the player id
	 * @param infoPlayerMap the info player map
	 */
	public void setPlayerInfoMap(String playerID,
															 Map<String, String> infoPlayerMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						playerID,
						infoPlayerMap
		);
	}


	/**
	 * Sets player combo box.
	 *
	 * @param startYear        the start year
	 * @param teamID           the team id
	 * @param playerInfoVector the player info vector
	 * @param playerInfoMap    the player info map
	 */
	public void setPlayerComboBox(String startYear,
																String teamID,
																Vector<String> playerInfoVector,
																Map<String, String> playerInfoMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						startYear,
						teamID,
						playerInfoVector,
						playerInfoMap
		);
	}


	/**
	 * Sets player combo box year.
	 *
	 * @param playerID     the player id
	 * @param teamType     the team type
	 * @param seasonVector the season vector
	 * @param seasonMap    the season map
	 */
	public void setPlayerComboBoxYear(String playerID,
																		String teamType,
																		Vector<String> seasonVector,
																		Map<String, String> seasonMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerYearDB(
						playerID,
						teamType,
						seasonVector,
						seasonMap
		);
	}


	/**
	 * Sets player table.
	 *
	 * @param playerSubName       the player sub name
	 * @param playerSubSurname    the player sub surname
	 * @param playerReferringYear the player referring year
	 * @param playerMinAge        the player min age
	 * @param playerMaxAge        the player max age
	 * @param playerContinentID   the player continent id
	 * @param playerNationID      the player nation id
	 * @param playerRole          the player role
	 * @param playerPositionID    the player position id
	 * @param playerFoot          the player foot
	 * @param playerTableData     the player table data
	 * @param playerTableMap      the player table map
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
						playerTableData,
						playerTableMap
		);
	}


	/**
	 * Sets player table.
	 *
	 * @param militancyPlayerTeamID    the militancy player team id
	 * @param militancyPlayerStartYear the militancy player start year
	 * @param militancyPlayerEndYear   the militancy player end year
	 * @param playerTableData          the player table data
	 * @param playerTableMap           the player table map
	 */
	public void setPlayerTable(String militancyPlayerTeamID,
														 String militancyPlayerStartYear,
														 String militancyPlayerEndYear,
														 Vector<Vector<String>> playerTableData,
														 Map<Integer, Map<Integer, String>> playerTableMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						militancyPlayerTeamID,
						militancyPlayerStartYear,
						militancyPlayerEndYear,
						playerTableData,
						playerTableMap
		);
	}


	/**
	 * Sets player general view.
	 *
	 * @param playerID                   the player id
	 * @param infoPlayerMap              the info player map
	 * @param playerPositionTableData    the player position table data
	 * @param playerNationalityTableData the player nationality table data
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
	 * Sets player detailed view.
	 *
	 * @param playerID                            the player id
	 * @param infoPlayerMap                       the info player map
	 * @param playerAttributeGoalkeepingTableData the player attribute goalkeeping table data
	 * @param playerAttributeMentalTableData      the player attribute mental table data
	 * @param playerAttributePhysicalTableData    the player attribute physical table data
	 * @param playerAttributeTechnicalTableData   the player attribute technical table data
	 * @param playerTagTableData                  the player tag table data
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
	 * Sets player career view.
	 *
	 * @param playerID                      the player id
	 * @param infoPlayerMap                 the info player map
	 * @param playerClubCareerTableData     the player club career table data
	 * @param playerClubCareerTableMap      the player club career table map
	 * @param playerNationalCareerTableData the player national career table data
	 * @param playerNationalCareerTableMap  the player national career table map
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
	 * Sets player statistic view.
	 *
	 * @param playerID                 the player id
	 * @param teamType                 the team type
	 * @param teamID                   the team id
	 * @param competitionID            the competition id
	 * @param startYear                the start year
	 * @param endYear                  the end year
	 * @param infoPlayerMap            the info player map
	 * @param playerStatisticTableData the player statistic table data
	 * @param playerStatisticTableMap  the player statistic table map
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
	 * Sets player case view.
	 *
	 * @param playerID                      the player id
	 * @param infoPlayerMap                 the info player map
	 * @param playerClubTrophyTableData     the player club trophy table data
	 * @param playerClubTrophyTableMap      the player club trophy table map
	 * @param playerNationalTrophyTableData the player national trophy table data
	 * @param playerNationalTrophyTableMap  the player national trophy table map
	 * @param playerPrizeTableData          the player prize table data
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
	 * Gets random player.
	 *
	 * @return the random player
	 */
	public String getRandomPlayer()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.randomPlayerDB();
	}


	/**
	 * Sets player year.
	 *
	 * @param playerID the player id
	 * @return the player year
	 */
	public String setPlayerYear(String playerID)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.fetchPlayerYearDB(playerID);
	}


	/**
	 * New player string.
	 *
	 * @param name       the name
	 * @param surname    the surname
	 * @param dob        the dob
	 * @param countryID  the country id
	 * @param foot       the foot
	 * @param positionID the position id
	 * @return the string
	 */
	public String newPlayer(String name,
													String surname,
													String dob,
													String countryID,
													String foot,
													String positionID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.newPlayerDB(
						name,
						surname,
						dob,
						countryID,
						foot,
						positionID
		);
	}


	/**
	 * Delete player string.
	 *
	 * @param playerID the player id
	 * @return the string
	 */
	public String deletePlayer(String playerID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.deletePlayerDB(playerID);
	}


	/**
	 * Update player string.
	 *
	 * @param playerID   the player id
	 * @param name       the name
	 * @param surname    the surname
	 * @param dob        the dob
	 * @param countryID  the country id
	 * @param foot       the foot
	 * @param positionID the position id
	 * @return the string
	 */
	public String updatePlayer(String playerID,
														 String name,
														 String surname,
														 String dob,
														 String countryID,
														 String foot,
														 String positionID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.updatePlayerDB(
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
	 * Sets retired date.
	 *
	 * @param playerID    the player id
	 * @param retiredDate the retired date
	 * @return the retired date
	 */
	public String setRetiredDate(String playerID,
															 String retiredDate)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.setRetiredDateDB(
						playerID,
						retiredDate
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * POSITION
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Sets position combo box.
	 *
	 * @param positionNameVector the position name vector
	 * @param positionNameMap    the position name map
	 */
	public void setPositionComboBox(Vector<String> positionNameVector,
																	Map<String, String> positionNameMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						positionNameVector,
						positionNameMap
		);
	}


	/**
	 * Sets position table.
	 *
	 * @param playerID                the player id
	 * @param playerPositionTableData the player position table data
	 */
	public void setPositionTable(String playerID,
															 Vector<Vector<String>> playerPositionTableData)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						playerID,
						playerPositionTableData
		);
	}


	/**
	 * Sets position table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setPositionTable(String playerID,
															 Vector<Vector<Object>> tableData,
															 Map<Integer, Map<Integer, String>> tableMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Add player position string.
	 *
	 * @param playerID   the player id
	 * @param positionID the position id
	 * @return the string
	 */
	public String addPlayerPosition(String playerID,
																	String positionID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.newPlayerPositionDB(
						playerID,
						positionID
		);
	}


	/**
	 * Remove player position string.
	 *
	 * @param playerID   the player id
	 * @param positionID the position id
	 * @return the string
	 */
	public String removePlayerPosition(String playerID,
																		 String positionID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.deletePlayerPositionDB(
						playerID,
						positionID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * STATISTIC
	 *------------------------------------------------------------------------------------------------------*/


	/**
	 * Sets statistic table.
	 *
	 * @param teamType              the team type
	 * @param playerRole            the player role
	 * @param statisticTableData    the statistic table data
	 * @param statisticTableDataMap the statistic table data map
	 */
	public void setStatisticTable(String teamType,
																String playerRole,
																Vector<Vector<Object>> statisticTableData,
																Map<Integer, Map<Integer, String>> statisticTableDataMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticTotalDB(
						teamType,
						playerRole,
						statisticTableData,
						statisticTableDataMap
		);
	}


	/**
	 * Sets statistic competition edition table.
	 *
	 * @param competitionStartYear the competition start year
	 * @param competitionID        the competition id
	 * @param statisticTableData   the statistic table data
	 * @param statisticTableMap    the statistic table map
	 */
	public void setStatisticCompetitionEditionTable(String competitionStartYear,
																									String competitionID,
																									Vector<Vector<Object>> statisticTableData,
																									Map<Integer, Map<Integer, String>> statisticTableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticEditionDB(
						competitionStartYear,
						competitionID,
						statisticTableData,
						statisticTableMap
		);
	}


	/**
	 * Sets player statistic table.
	 *
	 * @param playerID                 the player id
	 * @param teamType                 the team type
	 * @param teamID                   the team id
	 * @param competitionID            the competition id
	 * @param startYear                the start year
	 * @param endYear                  the end year
	 * @param playerStatisticTableData the player statistic table data
	 * @param playerStatisticTableMap  the player statistic table map
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
		statisticDAO.fetchStatisticPlayerDB(
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
	 * Sets statistic table admin.
	 *
	 * @param playerID             the player id
	 * @param teamID               the team id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @param tableData            the table data
	 * @param tableMap             the table map
	 */
	public void setStatisticTableAdmin(String playerID,
																		 String teamID,
																		 String competitionID,
																		 String competitionStartYear,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		statisticDAO.fetchStatisticAdminDB(
						playerID,
						teamID,
						competitionID,
						competitionStartYear,
						tableData,
						tableMap
		);
	}


	/**
	 * Update statistic string.
	 *
	 * @param playID        the play id
	 * @param match         the match
	 * @param goalScored    the goal scored
	 * @param assist        the assist
	 * @param yellowCard    the yellow card
	 * @param redCard       the red card
	 * @param penaltyScored the penalty scored
	 * @param goalConceded  the goal conceded
	 * @param penaltySaved  the penalty saved
	 * @return the string
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
		if (adminConnected) {
			return "errorNoAdmin";
		}

		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		return statisticDAO.updateStatisticDB(
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
	 * Sets partecipation table.
	 *
	 * @param teamID                     the team id
	 * @param competitionStartYear       the competition start year
	 * @param teamPartecipationTableData the team partecipation table data
	 */
	public void setPartecipationTable(String teamID,
																		String competitionStartYear,
																		Vector<Vector<Object>> teamPartecipationTableData)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationDB(teamID, competitionStartYear, teamPartecipationTableData);
	}


	/**
	 * Sets partecipation table admin.
	 *
	 * @param teamID                     the team id
	 * @param competitionStartYear       the competition start year
	 * @param teamPartecipationTableData the team partecipation table data
	 * @param tableMap                   the table map
	 */
	public void setPartecipationTableAdmin(String teamID,
																				 String competitionStartYear,
																				 Vector<Vector<Object>> teamPartecipationTableData,
																				 Map<Integer, Map<Integer, String>> tableMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationAdminDB(
						teamID,
						competitionStartYear,
						teamPartecipationTableData,
						tableMap
		);
	}


	/**
	 * Sets partecipation year combo box.
	 *
	 * @param teamID                  the team id
	 * @param teamType                the team type
	 * @param partecipationYearVector the partecipation year vector
	 * @param partecipationYearMap    the partecipation year map
	 */
	public void setPartecipationYearComboBox(String teamID,
																					 String teamType,
																					 Vector<String> partecipationYearVector,
																					 Map<String, String> partecipationYearMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationYearDB(
						teamID,
						teamType,
						partecipationYearVector,
						partecipationYearMap
		);
	}


	/**
	 * Sets partecipation combo box.
	 *
	 * @param teamID                  the team id
	 * @param competitionStartYear    the competition start year
	 * @param partecipationNameVector the partecipation name vector
	 * @param partecipationNameMap    the partecipation name map
	 */
	public void setPartecipationComboBox(String teamID,
																			 String competitionStartYear,
																			 Vector<String> partecipationNameVector,
																			 Map<String, String> partecipationNameMap)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationDB(
						teamID,
						competitionStartYear,
						partecipationNameVector,
						partecipationNameMap
		);
	}


	/**
	 * Delete partecipation string.
	 *
	 * @param teamID               the team id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String deletePartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.deletePartecipationDB(teamID, competitionID, competitionStartYear);
	}


	/**
	 * Create partecipation string.
	 *
	 * @param teamID               the team id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String createPartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (adminConnected) {
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
	 * Sets team squad table.
	 *
	 * @param teamID             the team id
	 * @param startYear          the start year
	 * @param teamSquadTableData the team squad table data
	 * @param teamSquadTableMap  the team squad table map
	 */
	public void setTeamSquadTable(String teamID,
																String startYear,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(teamID, startYear, teamSquadTableData, teamSquadTableMap);
	}


	/**
	 * Sets national career table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setNationalCareerTable(String playerID,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNationalDB(playerID, tableData, tableMap);
	}

	/**
	 * Sets club career table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setClubCareerTable(String playerID,
																 Vector<Vector<String>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClubDB(playerID, tableData, tableMap);
	}


	/**
	 * Sets national career admin.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setNationalCareerAdmin(String playerID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNationalAdminDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Sets club career admin.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setClubCareerAdmin(String playerID,
																 Vector<Vector<Object>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClubAdminDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * New militancy string.
	 *
	 * @param playerID   the player id
	 * @param teamID     the team id
	 * @param teamType   the team type
	 * @param startYear  the start year
	 * @param seasonType the season type
	 * @return the string
	 */
	public String newMilitancy(String playerID,
														 String teamID,
														 String teamType,
														 String startYear,
														 String seasonType)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		return militancyDAO.newMilitancyDB(
						playerID,
						teamID,
						teamType,
						startYear,
						seasonType
		);
	}


	/**
	 * Delete militancy string.
	 *
	 * @param playerID  the player id
	 * @param teamID    the team id
	 * @param startYear the start year
	 * @return the string
	 */
	public String deleteMilitancy(String playerID,
																String teamID,
																String startYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		return militancyDAO.deleteMilitancyDB(
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
	 * Sets team trophy combo box.
	 *
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
	 */
	public void setTeamTrophyComboBox(Vector<String> comboBoxData,
																		Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophyDB(comboBoxData, comboBoxMap);
	}


	/**
	 * Sets player trophy combo box.
	 *
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
	 */
	public void setPlayerTrophyComboBox(Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchPlayerTrophyDB(comboBoxData, comboBoxMap);
	}


	/**
	 * Sets team trophy table.
	 *
	 * @param teamID    the team id
	 * @param teamType  the team type
	 * @param tableData the table data
	 */
	public void setTeamTrophyTable(String teamID,
																 String teamType,
																 Vector<Vector<String>> tableData)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						teamID,
						teamType,
						tableData
		);
	}


	/**
	 * Sets team trophy table admin.
	 *
	 * @param teamID    the team id
	 * @param teamType  the team type
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setTeamTrophyTableAdmin(String teamID,
																			String teamType,
																			Vector<Vector<Object>> tableData,
																			Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophyAdminDB(
						teamID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Sets player trophy table.
	 *
	 * @param playerID  the player id
	 * @param teamType  the team type
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setPlayerTrophyTable(String playerID,
																	 String teamType,
																	 Vector<Vector<String>> tableData,
																	 Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyDB(
						playerID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Sets player trophy table admin.
	 *
	 * @param playerID  the player id
	 * @param teamType  the team type
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setPlayerTrophyTableAdmin(String playerID,
																				String teamType,
																				Vector<Vector<Object>> tableData,
																				Map<Integer, Map<Integer, String>> tableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophyPlayerAdminDB(
						playerID,
						teamType,
						tableData,
						tableMap
		);
	}


	/**
	 * Assign trophy team string.
	 *
	 * @param teamID               the team id
	 * @param trophyID             the trophy id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String assignTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.newTrophyTeamDB(
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Remove trophy team string.
	 *
	 * @param teamID               the team id
	 * @param trophyID             the trophy id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String removeTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.deleteTrophyTeamDB(
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Assign trophy player string.
	 *
	 * @param playerID             the player id
	 * @param teamID               the team id
	 * @param trophyID             the trophy id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String assignTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.newTrophyPlayerDB(
						playerID,
						teamID,
						trophyID,
						competitionID,
						competitionStartYear
		);
	}


	/**
	 * Remove trophy player string.
	 *
	 * @param playerID             the player id
	 * @param teamID               the team id
	 * @param trophyID             the trophy id
	 * @param competitionID        the competition id
	 * @param competitionStartYear the competition start year
	 * @return the string
	 */
	public String removeTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		return trophyDAO.deleteTrophyPlayerDB(
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
	 * Sets team prize combo box.
	 *
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
	 */
	public void setTeamPrizeComboBox(Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeDB(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Sets player prize combo box.
	 *
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
	 */
	public void setPlayerPrizeComboBox(Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrizeDB(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Sets team prize table.
	 *
	 * @param teamID    the team id
	 * @param tableData the table data
	 */
	public void setTeamPrizeTable(String teamID,
																Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizeDB(teamID, tableData);
	}


	/**
	 * Sets team prize table admin.
	 *
	 * @param teamID    the team id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setTeamPrizeTableAdmin(String teamID,
																		 Vector<Vector<Object>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeAdminDB(
						teamID,
						tableData,
						tableMap
		);
	}


	/**
	 * Sets player prize table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 */
	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizePlayerDB(playerID, tableData);
	}


	/**
	 * Assign prize team string.
	 *
	 * @param teamID       the team id
	 * @param prizeID      the prize id
	 * @param assignedYear the assigned year
	 * @return the string
	 */
	public String assignPrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPrizeTeamDB(
						teamID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * Remove prize team string.
	 *
	 * @param teamID       the team id
	 * @param prizeID      the prize id
	 * @param assignedYear the assigned year
	 * @return the string
	 */
	public String removePrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePrizeTeamDB(
						teamID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * Sets player prize table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<Object>> tableData,
																	Map<Integer, Map<Integer, String>> tableMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrizeDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Add player prize string.
	 *
	 * @param playerID     the player id
	 * @param prizeID      the prize id
	 * @param assignedYear the assigned year
	 * @return the string
	 */
	public String addPlayerPrize(String playerID,
															 String prizeID,
															 String assignedYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPlayerPrizeDB(
						playerID,
						prizeID,
						assignedYear
		);
	}


	/**
	 * Delete player prize string.
	 *
	 * @param playerID     the player id
	 * @param prizeID      the prize id
	 * @param assignedYear the assigned year
	 * @return the string
	 */
	public String deletePlayerPrize(String playerID,
																	String prizeID,
																	String assignedYear)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePlayerPrizeDB(
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
	 * Sets nationality table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
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
	 * Sets nationality table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
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
	 * Sets nationality combo box.
	 *
	 * @param playerID     the player id
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
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
	 * Add nationality string.
	 *
	 * @param playerID  the player id
	 * @param countryID the country id
	 * @return the string
	 */
	public String addNationality(String playerID,
															 String countryID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		return nationalityDAO.newNationalityDB(
						playerID,
						countryID
		);
	}


	/**
	 * Remove nationality string.
	 *
	 * @param playerID  the player id
	 * @param countryID the country id
	 * @return the string
	 */
	public String removeNationality(String playerID,
																	String countryID)
	{
		if (adminConnected) {
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
	 * Sets attribute goalkeeping table.
	 *
	 * @param playerID                            the player id
	 * @param playerAttributeGoalkeepingTableData the player attribute goalkeeping table data
	 */
	public void setAttributeGoalkeepingTable(String playerID,
																					 Vector<Vector<String>> playerAttributeGoalkeepingTableData)
	{
		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		attributeGoalkeepingDAO.fetchAttributeGoalkeepingDB(playerID, playerAttributeGoalkeepingTableData);
	}


	/**
	 * Sets attribute mental table.
	 *
	 * @param playerID                       the player id
	 * @param playerAttributeMentalTableData the player attribute mental table data
	 */
	public void setAttributeMentalTable(String playerID,
																			Vector<Vector<String>> playerAttributeMentalTableData)
	{
		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		attributeMentalDAO.fetchAttributeMentalDB(playerID, playerAttributeMentalTableData);
	}


	/**
	 * Sets attribute physical table.
	 *
	 * @param playerID                         the player id
	 * @param playerAttributePhysicalTableData the player attribute physical table data
	 */
	public void setAttributePhysicalTable(String playerID,
																				Vector<Vector<String>> playerAttributePhysicalTableData)
	{
		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		attributePhysicalDAO.fetchAttributePhysicalDB(playerID, playerAttributePhysicalTableData);
	}


	/**
	 * Sets attribute technical table.
	 *
	 * @param playerID                          the player id
	 * @param playerAttributeTechnicalTableData the player attribute technical table data
	 */
	public void setAttributeTechnicalTable(String playerID,
																				 Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		attributeTechnicalDAO.fetchAttributeTechnicalDB(playerID, playerAttributeTechnicalTableData);
	}


	/**
	 * Update attribute goalkeeping string.
	 *
	 * @param playerID           the player id
	 * @param aerialReach        the aerial reach
	 * @param commandOfArea      the command of area
	 * @param communication      the communication
	 * @param eccentricity       the eccentricity
	 * @param firstTouchGk       the first touch gk
	 * @param handling           the handling
	 * @param kicking            the kicking
	 * @param oneOnOnes          the one on ones
	 * @param passingGk          the passing gk
	 * @param punchingTendency   the punching tendency
	 * @param reflexes           the reflexes
	 * @param rushingOutTendency the rushing out tendency
	 * @param throwing           the throwing
	 * @return the string
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
		if (adminConnected) {
			return "errorNoAdmin";
		}

		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		return attributeGoalkeepingDAO.updateAttributeGoalkeepingDB(
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
	 * Update attribute mental string.
	 *
	 * @param playerID      the player id
	 * @param aggression    the aggression
	 * @param anticipation  the anticipation
	 * @param bravery       the bravery
	 * @param composure     the composure
	 * @param concentration the concentration
	 * @param decision      the decision
	 * @param determination the determination
	 * @param flair         the flair
	 * @param leadership    the leadership
	 * @param offTheBall    the off the ball
	 * @param positioning   the positioning
	 * @param teamwork      the teamwork
	 * @param vision        the vision
	 * @param workRate      the work rate
	 * @return the string
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
		if (adminConnected) {
			return "errorNoAdmin";
		}

		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		return attributeMentalDAO.updateAttributeMentalDB(
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
	 * Update attribute physical string.
	 *
	 * @param playerID       the player id
	 * @param acceleration   the acceleration
	 * @param agility        the agility
	 * @param balance        the balance
	 * @param jumpingReach   the jumping reach
	 * @param naturalFitness the natural fitness
	 * @param pace           the pace
	 * @param stamina        the stamina
	 * @param strength       the strength
	 * @return the string
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
		if (adminConnected) {
			return "errorNoAdmin";
		}

		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		return attributePhysicalDAO.updateAttributePhysicalDB(
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
	 * Update attribute technical string.
	 *
	 * @param playerID       the player id
	 * @param corners        the corners
	 * @param crossing       the crossing
	 * @param dribbling      the dribbling
	 * @param finishing      the finishing
	 * @param firstTouch     the first touch
	 * @param freeKickTaking the free kick taking
	 * @param heading        the heading
	 * @param longShots      the long shots
	 * @param longThrows     the long throws
	 * @param marking        the marking
	 * @param passing        the passing
	 * @param penaltyTaking  the penalty taking
	 * @param tackling       the tackling
	 * @param technique      the technique
	 * @return the string
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
		if (adminConnected) {
			return "errorNoAdmin";
		}

		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		return attributeTechnicalDAO.updateAttributeTechnicalDB(
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
	 * Sets tag table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 */
	public void setTagTable(String playerID,
													Vector<Vector<String>> tableData)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						playerID,
						tableData
		);
	}


	/**
	 * Sets tag table.
	 *
	 * @param playerID  the player id
	 * @param tableData the table data
	 * @param tableMap  the table map
	 */
	public void setTagTable(String playerID,
													Vector<Vector<Object>> tableData,
													Map<Integer, Map<Integer, String>> tableMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						playerID,
						tableData,
						tableMap
		);
	}


	/**
	 * Sets tag combo box.
	 *
	 * @param comboBoxData the combo box data
	 * @param comboBoxMap  the combo box map
	 */
	public void setTagComboBox(Vector<String> comboBoxData,
														 Map<String, String> comboBoxMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						comboBoxData,
						comboBoxMap
		);
	}


	/**
	 * Add player tag string.
	 *
	 * @param playerID the player id
	 * @param tagID    the tag id
	 * @return the string
	 */
	public String addPlayerTag(String playerID,
														 String tagID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.newPlayerTagDB(
						playerID,
						tagID
		);
	}


	/**
	 * Remove player tag string.
	 *
	 * @param playerID the player id
	 * @param tagID    the tag id
	 * @return the string
	 */
	public String removePlayerTag(String playerID,
																String tagID)
	{
		if (adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.deletePlayerTagDB(
						playerID,
						tagID
		);
	}
	/*------------------------------------------------------------------------------------------------------*/
}

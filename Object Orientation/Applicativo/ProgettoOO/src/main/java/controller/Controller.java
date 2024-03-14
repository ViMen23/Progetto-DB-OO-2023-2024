package controller;

import dao.*;
import gui.Regex;
import model.*;
import postgresImplDAO.*;

import java.util.*;

public class Controller
{
	private static Controller controllerInstance = null;
	private static boolean adminConnected = false;

	private Controller()
	{
	}

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
			adminConnected = true;
			return true;
		} else {
			System.out.println("Non Connesso");
			adminConnected = false;
			return false;
		}
	}


	public void logoutAdmin()
	{
		if (adminConnected) {
			adminConnected = false;
		}
	}


	public boolean isAdminConnected()
	{
		return adminConnected;
	}


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * COUNTRY
	 *------------------------------------------------------------------------------------------------------*/


	public Integer countCountries()
	{
		CountryDAO countryDAO = new PostgresImplCountryDAO();
		return countryDAO.countCountryDB();
	}


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


	public String createCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		CompetitionDAO competitionDAO = new PostgresImplCompetitionDAO();
		return competitionDAO.newCompetitionEditionDB(
						competitionID,
						competitionStartYear
		);
	}


	public String deleteCompetitionEdition(String competitionID,
																				 String competitionStartYear)
	{
		if (!adminConnected) {
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


	public Integer countTeams()
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.countTeamDB();
	}


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


	public void setTeamInfoMap(String teamID,
														 Map<String, String> infoTeamMap)
	{
		TeamDAO teamDAO = new PostgresImplTeamDAO();
		teamDAO.fetchTeamDB(
						teamID,
						infoTeamMap
		);
	}

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


	public String createTeam(String teamType,
													 String teamLongName,
													 String teamShortName,
													 String countryID)
	{
		String message = null;

		if (!adminConnected) {
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


	public String updateTeam(String teamID,
													 String teamType,
													 String teamLongName,
													 String teamShortName)
	{
		String message = null;

		if (!adminConnected) {
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


	public String deleteTeam(String teamID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TeamDAO teamDAO = new PostgresImplTeamDAO();
		return teamDAO.deleteTeamDB(teamID);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PLAYER
	 *------------------------------------------------------------------------------------------------------*/


	public Integer countPlayers()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.countPlayerDB();
	}


	public void setPlayerInfoMap(String playerID,
															 Map<String, String> infoPlayerMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayerDB(
						playerID,
						infoPlayerMap
		);
	}


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
		setAttributeGoalkeepingTable(playerID, playerAttributeGoalkeepingTableData);
		setAttributeMentalTable(playerID, playerAttributeMentalTableData);
		setAttributePhysicalTable(playerID, playerAttributePhysicalTableData);
		setAttributeTechnicalTable(playerID, playerAttributeTechnicalTableData);
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


	public String getRandomPlayer()
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.randomPlayerDB();
	}


	public String setPlayerYear(String playerID)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.fetchPlayerYearDB(playerID);
	}


	public String newPlayer(String name,
													String surname,
													String dob,
													String countryID,
													String foot,
													String positionID)
	{
		if (!adminConnected) {
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


	public String deletePlayer(String playerID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		return playerDAO.deletePlayerDB(playerID);
	}


	public String updatePlayer(String playerID,
														 String name,
														 String surname,
														 String dob,
														 String countryID,
														 String foot,
														 String positionID)
	{
		if (!adminConnected) {
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


	public String setRetiredDate(String playerID,
															 String retiredDate)
	{
		if (!adminConnected) {
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


	public void setPositionComboBox(Vector<String> positionNameVector,
																	Map<String, String> positionNameMap)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						positionNameVector,
						positionNameMap
		);
	}


	public void setPositionTable(String playerID,
															 Vector<Vector<String>> playerPositionTableData)
	{
		PositionDAO positionDAO = new PostgresImplPositionDAO();
		positionDAO.fetchPositionDB(
						playerID,
						playerPositionTableData
		);
	}


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


	public String addPlayerPosition(String playerID,
																	String positionID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PositionDAO positionDAO = new PostgresImplPositionDAO();
		return positionDAO.newPlayerPositionDB(
						playerID,
						positionID
		);
	}


	public String removePlayerPosition(String playerID,
																		 String positionID)
	{
		if (!adminConnected) {
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


	public String setStatisticMapAdmin(String playerID,
																		 String teamID,
																		 String competitionID,
																		 String competitionStartYear,
																		 Map<String, String> dataMap)
	{
		StatisticDAO statisticDAO = new PostgresImplStatisticDAO();
		return statisticDAO.fetchStatisticAdminDB(
						playerID,
						teamID,
						competitionID,
						competitionStartYear,
						dataMap
		);
	}


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
		if (!adminConnected) {
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

	public void setPartecipationTable(String teamID,
																		String competitionStartYear,
																		Vector<Vector<Object>> teamPartecipationTableData)
	{
		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipationDB(teamID, competitionStartYear, teamPartecipationTableData);
	}


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


	public String deletePartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.deletePartecipationDB(teamID, competitionID, competitionStartYear);
	}


	public String createPartecipation(String teamID,
																		String competitionID,
																		String competitionStartYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		return partecipationDAO.newPartecipationDB(teamID, competitionID, competitionStartYear);
	}

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * MILITANCY
	 *------------------------------------------------------------------------------------------------------*/


	public void setTeamSquadTable(String teamID,
																String startYear,
																Vector<Vector<String>> teamSquadTableData,
																Map<Integer, Map<Integer, String>> teamSquadTableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyDB(teamID, startYear, teamSquadTableData, teamSquadTableMap);
	}


	public void setNationalCareerTable(String playerID,
																		 Vector<Vector<String>> tableData,
																		 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyNationalDB(playerID, tableData, tableMap);
	}

	public void setClubCareerTable(String playerID,
																 Vector<Vector<String>> tableData,
																 Map<Integer, Map<Integer, String>> tableMap)
	{
		MilitancyDAO militancyDAO = new PostgresImplMilitancyDAO();
		militancyDAO.fetchMilitancyClubDB(playerID, tableData, tableMap);
	}


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


	public String newMilitancy(String playerID,
														 String teamID,
														 String teamType,
														 String startYear,
														 String seasonType)
	{
		if (!adminConnected) {
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


	public String deleteMilitancy(String playerID,
																String teamID,
																String startYear)
	{
		if (!adminConnected) {
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

	public void setTeamTrophyComboBox(Vector<String> comboBoxData,
																		Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTeamTrophyDB(comboBoxData, comboBoxMap);
	}


	public void setPlayerTrophyComboBox(Vector<String> comboBoxData,
																			Map<String, String> comboBoxMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchPlayerTrophyDB(comboBoxData, comboBoxMap);
	}


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


	public String assignTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (!adminConnected) {
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


	public String removeTrophyTeam(String teamID,
																 String trophyID,
																 String competitionID,
																 String competitionStartYear)
	{
		if (!adminConnected) {
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


	public String assignTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (!adminConnected) {
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


	public String removeTrophyPlayer(String playerID,
																	 String teamID,
																	 String trophyID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		if (!adminConnected) {
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

	public void setTeamPrizeComboBox(Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchTeamPrizeDB(
						comboBoxData,
						comboBoxMap
		);
	}


	public void setPlayerPrizeComboBox(Vector<String> comboBoxData,
																		 Map<String, String> comboBoxMap)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPlayerPrizeDB(
						comboBoxData,
						comboBoxMap
		);
	}


	public void setTeamPrizeTable(String teamID,
																Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizeDB(teamID, tableData);
	}


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


	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrizePlayerDB(playerID, tableData);
	}


	public String assignPrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPrizeTeamDB(
						teamID,
						prizeID,
						assignedYear
		);
	}


	public String removePrizeTeam(String teamID,
																String prizeID,
																String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.deletePrizeTeamDB(
						teamID,
						prizeID,
						assignedYear
		);
	}


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


	public String addPlayerPrize(String playerID,
															 String prizeID,
															 String assignedYear)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		return prizeDAO.newPlayerPrizeDB(
						playerID,
						prizeID,
						assignedYear
		);
	}


	public String deletePlayerPrize(String playerID,
																	String prizeID,
																	String assignedYear)
	{
		if (!adminConnected) {
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


	public void setNationalityTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationalityDB(
						playerID,
						tableData
		);
	}


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


	public String addNationality(String playerID,
															 String countryID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		return nationalityDAO.newNationalityDB(
						playerID,
						countryID
		);
	}


	public String removeNationality(String playerID,
																	String countryID)
	{
		if (!adminConnected) {
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


	public void setAttributeGoalkeepingTable(String playerID,
																					 Vector<Vector<String>> playerAttributeGoalkeepingTableData)
	{
		AttributeGoalkeepingDAO attributeGoalkeepingDAO = new PostgresImplAttributeGoalkeepingDAO();
		attributeGoalkeepingDAO.fetchAttributeGoalkeepingDB(playerID, playerAttributeGoalkeepingTableData);
	}


	public void setAttributeMentalTable(String playerID,
																			Vector<Vector<String>> playerAttributeMentalTableData)
	{
		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		attributeMentalDAO.fetchAttributeMentalDB(playerID, playerAttributeMentalTableData);
	}


	public void setAttributePhysicalTable(String playerID,
																				Vector<Vector<String>> playerAttributePhysicalTableData)
	{
		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		attributePhysicalDAO.fetchAttributePhysicalDB(playerID, playerAttributePhysicalTableData);
	}


	public void setAttributeTechnicalTable(String playerID,
																				 Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		attributeTechnicalDAO.fetchAttributeTechnicalDB(playerID, playerAttributeTechnicalTableData);
	}


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
		if (!adminConnected) {
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
		if (!adminConnected) {
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
		if (!adminConnected) {
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
		if (!adminConnected) {
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


	public void setTagTable(String playerID,
													Vector<Vector<String>> tableData)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						playerID,
						tableData
		);
	}


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


	public void setTagComboBox(Vector<String> comboBoxData,
														 Map<String, String> comboBoxMap)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTagDB(
						comboBoxData,
						comboBoxMap
		);
	}


	public String addPlayerTag(String playerID,
														 String tagID)
	{
		if (!adminConnected) {
			return "errorNoAdmin";
		}

		TagDAO tagDAO = new PostgresImplTagDAO();
		return tagDAO.newPlayerTagDB(
						playerID,
						tagID
		);
	}


	public String removePlayerTag(String playerID,
																String tagID)
	{
		if (!adminConnected) {
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

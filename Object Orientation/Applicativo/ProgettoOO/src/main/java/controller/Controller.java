package controller;

import dao.*;
import gui.GuiConfiguration;
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
		countryDAO.fetchCountry(
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
		countryDAO.fetchCountry(
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
		confederationDAO.fetchConfederation(
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
		confederationDAO.fetchConfederation(
						countryType,
						superConfederationID,
						confederationTableData
		);
	}


	public void setConfederationPartecipation(String teamID,
																						Map<String, String> confederationMap)
	{
		ConfederationDAO confederationDAO = new PostgresImplConfederationDAO();
		confederationDAO.fetchConfederation(
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
		competitionDAO.fetchCompetition(
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
		competitionDAO.fetchCompetition(
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
		competitionDAO.fetchCompetitionEdition(
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
		competitionDAO.fetchCompetitionConfederation(
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
		competitionDAO.fetchCompetition(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID,
						competitionTableData
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
		teamDAO.fetchTeamCombo(
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
		teamDAO.fetchTeam(
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
		teamDAO.fetchTeam(
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
		teamDAO.fetchTeam(
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
		teamDAO.fetchTeam(
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
		teamDAO.fetchTeamCompetition(
						competitionStartYear,
						competitionID,
						teamLongNameVector,
						teamLongNameMap
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
		setPartecipationTable(teamID, startYear, teamPartecipationTableData, false);
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


	public void setPlayerInfoMap(String playerID,
															 Map<String, String> infoPlayerMap)
	{
		PlayerDAO playerDAO = new PostgresImplPlayerDAO();
		playerDAO.fetchPlayer(
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
		playerDAO.fetchPlayer(
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
		playerDAO.fetchPlayerYear(
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
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * STATISTIC
	 *------------------------------------------------------------------------------------------------------*/


	public void setStatisticTable(String teamType,
																String playerRole,
																Vector<Vector<String>> statisticTableData,
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


	public void setStatisticCompetitionEditionTable(String competitionStartYear,
																									String competitionID,
																									Vector<Vector<String>> statisticTableData,
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



	public void setPlayerStatisticTable(String playerID,
																			String teamType,
																			String teamID,
																			String competitionID,
																			String startYear,
																			String endYear,
																			Vector<Vector<String>> playerStatisticTableData,
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

	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PARTECIPATION
	 *------------------------------------------------------------------------------------------------------*/

	public void setPartecipationTable(String teamID,
																		String competitionStartYear,
																		Vector<Vector<Object>> teamPartecipationTableData,
																		boolean checkBox)
	{
		if (null == newAdmin().getAdminConnected()) {
			checkBox = false;
		}

		PartecipationDAO partecipationDAO = new PostgresImplPartecipationDAO();
		partecipationDAO.fetchPartecipation(teamID, competitionStartYear, teamPartecipationTableData, checkBox);
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


	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TROPHY
	 *------------------------------------------------------------------------------------------------------*/


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

	public void setPlayerTrophyTable(String playerID,
																	 String teamType,
																	 Vector<Vector<String>> tableData,
																	 Map<Integer, Map<Integer, String>> TableMap)
	{
		TrophyDAO trophyDAO = new PostgresImplTrophyDAO();
		trophyDAO.fetchTrophy(
						playerID,
						teamType,
						tableData,
						TableMap
		);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * PRIZE
	 *------------------------------------------------------------------------------------------------------*/


	public void setTeamPrizeTable(String teamID,
																Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrize(teamID, tableData);
	}


	public void setPlayerPrizeTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		PrizeDAO prizeDAO = new PostgresImplPrizeDAO();
		prizeDAO.fetchPrize(playerID, tableData);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * NATIONALITY
	 *------------------------------------------------------------------------------------------------------*/


	public void setNationalityTable(String playerID,
																	Vector<Vector<String>> tableData)
	{
		NationalityDAO nationalityDAO = new PostgresImplNationalityDAO();
		nationalityDAO.fetchNationality(
						playerID,
						tableData
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
		attributeGoalkeepingDAO.fetchAttributeGoalkeeping(playerID, playerAttributeGoalkeepingTableData);
	}

	public void setAttributeMentalTable(String playerID,
																			Vector<Vector<String>> playerAttributeMentalTableData)
	{
		AttributeMentalDAO attributeMentalDAO = new PostgresImplAttributeMentalDAO();
		attributeMentalDAO.fetchAttributeMental(playerID, playerAttributeMentalTableData);
	}

	public void setAttributePhysicalTable(String playerID,
																				Vector<Vector<String>> playerAttributePhysicalTableData)
	{
		AttributePhysicalDAO attributePhysicalDAO = new PostgresImplAttributePhysicalDAO();
		attributePhysicalDAO.fetchAttributePhysical(playerID, playerAttributePhysicalTableData);
	}

	public void setAttributeTechnicalTable(String playerID,
																				 Vector<Vector<String>> playerAttributeTechnicalTableData)
	{
		AttributeTechnicalDAO attributeTechnicalDAO = new PostgresImplAttributeTechnicalDAO();
		attributeTechnicalDAO.fetchAttributeTechnical(playerID, playerAttributeTechnicalTableData);
	}
	/*------------------------------------------------------------------------------------------------------*/


	/*--------------------------------------------------------------------------------------------------------
	 * TAG
	 *------------------------------------------------------------------------------------------------------*/


	public void setTagTable(String playerID,
													Vector<Vector<String>> tableData)
	{
		TagDAO tagDAO = new PostgresImplTagDAO();
		tagDAO.fetchTag(
						playerID,
						tableData
		);
	}
	/*------------------------------------------------------------------------------------------------------*/
}

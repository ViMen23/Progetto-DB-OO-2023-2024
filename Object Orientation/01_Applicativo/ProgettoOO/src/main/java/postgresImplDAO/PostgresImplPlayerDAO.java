package postgresImplDAO;

import dao.PlayerDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia PlayerDAO.
 */
public class PostgresImplPlayerDAO
				implements PlayerDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplPlayerDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Conta il numero di giocatori presenti nel database.
	 * <p>
	 * @return Il numero totale di giocatori nel database.
	 */
	@Override
	public int countPlayerDB()
	{
		int count = 0;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call count_player()}");
			cs.registerOutParameter(1, Types.INTEGER);

			cs.execute();

			count = cs.getInt(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return count;
	}


	/**
	 * Recupera le informazioni dettagliate di un giocatore dal database in base al suo ID.
	 * <p>
	 * @param playerID L'ID del giocatore da recuperare.
	 * @param infoMap Una mappa per popolare con le informazioni del giocatore.
	 */
	@Override
	public void fetchPlayerDB(String playerID,
														Map<String, String> infoMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call info_player(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				infoMap.put(GuiConfiguration.getMessage("name").toUpperCase(), rs.getString("player_name"));
				infoMap.put(GuiConfiguration.getMessage("surname").toUpperCase(), rs.getString("player_surname"));
				infoMap.put(GuiConfiguration.getMessage("dob").toUpperCase(), rs.getString("player_dob"));
				infoMap.put(GuiConfiguration.getMessage("bornCountry"), rs.getString("country_name"));
				infoMap.put(GuiConfiguration.getMessage("foot").toUpperCase(), GuiConfiguration.getMessage(rs.getString("player_foot")));
				infoMap.put(GuiConfiguration.getMessage("mainPosition"), GuiConfiguration.getMessage(rs.getString("position_name")));
				infoMap.put(GuiConfiguration.getMessage("role"), role);
				infoMap.put(GuiConfiguration.getMessage("retiredDate").toUpperCase(), rs.getString("player_retired_date"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera i giocatori di una squadra in un determinato anno per popolare una combobox.
	 * <p>
	 * @param startYear L'anno di riferimento per i giocatori da recuperare.
	 * @param teamID L'ID della squadra di cui recuperare i giocatori.
	 * @param comboBoxData Un vettore di stringhe per popolare la combobox con la lista dei giocatori.
	 * @param comboBoxMap Una mappa per associare i valori della combobox agli ID dei giocatori nel database.
	 */
	@Override
	public void fetchPlayerDB(String startYear,
														String teamID,
														Vector<String> comboBoxData,
														Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call filter_player(?, ?)}");
			cs.setString(1, startYear);
			cs.setString(2, teamID);


			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				String playerInfo = "";
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				playerInfo += "[";
				playerInfo += role;
				playerInfo += "] ";
				playerInfo += rs.getString("player_name");
				playerInfo += " ";
				playerInfo += rs.getString("player_surname");

				comboBoxData.add(playerInfo);
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("player_id"));
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera giocatori in base a criteri di ricerca avanzati per popolare una tabella.
	 * <p>
	 * @param playerSubName Una porzione del nome del giocatore da ricercare.
	 * @param playerSubSurname Una porzione del cognome del giocatore da ricercare.
	 * @param playerReferringYear L'anno di riferimento per la ricerca.
	 * @param playerMinAge L'età minima dei giocatori da ricercare.
	 * @param playerMaxAge L'età massima dei giocatori da ricercare.
	 * @param playerContinentID L'ID del continente del giocatore da ricercare.
	 * @param playerNationID L'ID della nazione del giocatore da ricercare.
	 * @param playerRole Il ruolo del giocatore da ricercare.
	 * @param playerPositionID L'ID del ruolo del giocatore da ricercare.
	 * @param playerFoot Il piede preferito del giocatore da ricercare.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i risultati della ricerca.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchPlayerDB(String playerSubName,
														String playerSubSurname,
														String playerReferringYear,
														String playerMinAge,
														String playerMaxAge,
														String playerContinentID,
														String playerNationID,
														String playerRole,
														String playerPositionID,
														String playerFoot,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_player(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.setString(1, playerSubName);
			cs.setString(2, playerSubSurname);
			cs.setString(3, playerReferringYear);
			cs.setString(4, playerMinAge);
			cs.setString(5, playerMaxAge);
			cs.setString(6, playerContinentID);
			cs.setString(7, playerNationID);
			cs.setString(8, playerRole);
			cs.setString(9, playerPositionID);
			cs.setString(10, playerFoot);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> playerMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				vector.add(rs.getString("player_surname"));
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_dob"));
				vector.add(rs.getString("country_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("player_foot")));
				vector.add(role);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));
				vector.add(rs.getString("player_retired_date"));


				tableData.add(vector);
				playerMap.put(row, rs.getString("player_id"));
				++row;
			}

			tableMap.put(0, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera giocatori in base a criteri di militanza in una squadra per popolare una tabella.
	 * <p>
	 * @param militancyPlayerTeamID L'ID della squadra per la quale cercare le militanze dei giocatori.
	 * @param militancyPlayerStartYear L'anno di inizio della militanza da ricercare.
	 * @param militancyPlayerEndYear L'anno di fine della militanza da ricercare.
	 * @param tableData Un vettore di vettori di stringhe per popolare la tabella con i risultati della ricerca.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchPlayerDB(String militancyPlayerTeamID,
														String militancyPlayerStartYear,
														String militancyPlayerEndYear,
														Vector<Vector<String>> tableData,
														Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call search_militancy_player(?, ?, ?)}");
			cs.setString(1, militancyPlayerTeamID);
			cs.setString(2, militancyPlayerStartYear);
			cs.setString(3, militancyPlayerEndYear);


			ResultSet rs = cs.executeQuery();

			Map<Integer, String> playerMap = new HashMap<>();
			int row = 0;

			while (rs.next()) {
				Vector<String> vector = new Vector<>();
				String role = "";

				String[] keyPart = rs.getString("player_role").split("_");

				for (String part : keyPart) {
					role += "_";
					role += GuiConfiguration.getMessage(part);
				}

				role = role.substring(1);

				vector.add(rs.getString("player_surname"));
				vector.add(rs.getString("player_name"));
				vector.add(rs.getString("player_dob"));
				vector.add(rs.getString("country_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("player_foot")));
				vector.add(role);
				vector.add(GuiConfiguration.getMessage(rs.getString("position_name")));
				vector.add(rs.getString("player_retired_date"));

				tableData.add(vector);
				playerMap.put(row, rs.getString("player_id"));
				++row;
			}

			tableMap.put(0, playerMap);

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera gli anni in cui un giocatore ha giocato o potrebbe giocare in una squadra, in base al tipo di squadra.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @param teamType Il tipo di squadra.
	 * @param comboBoxData Un vettore di stringhe per popolare una combobox con gli anni recuperati.
	 * @param comboBoxMap Una mappa per associare i valori della combobox ai valori del database.
	 */
	@Override
	public void fetchPlayerYearDB(String playerID,
																String teamType,
																Vector<String> comboBoxData,
																Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call season_play(?, ?)}");
			cs.setString(1, playerID);
			cs.setString(2, teamType);

			ResultSet rs = cs.executeQuery();

			if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
				String season = null;
				while (rs.next()) {
					season = rs.getString("start_year");
					season += "/";
					season += (Integer.parseInt(rs.getString("start_year")) + 1);

					comboBoxData.add(season);
					comboBoxMap.put(season, rs.getString("start_year"));
				}
			} else if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
				while (rs.next()) {
					comboBoxData.add(rs.getString("start_year"));
					comboBoxMap.put(comboBoxData.getLast(), comboBoxData.getLast());
				}
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera gli anni validi di un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore.
	 * @return Una stringa contenente informazioni riguardo gli anni validi del giocatore.
	 */
	@Override
	public String fetchPlayerYearDB(String playerID)
	{
		String playerYear = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call player_year(?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);

			cs.execute();

			playerYear = cs.getString(1);

			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return playerYear;
	}


	/**
	 * Crea un nuovo giocatore nel database.
	 * <p>
	 * @param name Il nome del giocatore.
	 * @param surname Il cognome del giocatore.
	 * @param dob La data di nascita del giocatore.
	 * @param countryID L'ID della nazione del giocatore.
	 * @param foot Il piede preferito del giocatore.
	 * @param positionID L'ID del ruolo del giocatore.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newPlayerDB(String name,
														String surname,
														String dob,
														String countryID,
														String foot,
														String positionID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_player(?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, name);
			cs.setString(3, surname);
			cs.setString(4, dob);
			cs.setString(5, countryID);
			cs.setString(6, foot);
			cs.setString(7, positionID);

			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Elimina un giocatore dal database.
	 * <p>
	 * @param playerID L'ID del giocatore da eliminare.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deletePlayerDB(String playerID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_player(?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);

			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Aggiorna le informazioni di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore da aggiornare.
	 * @param name Il nuovo nome del giocatore.
	 * @param surname Il nuovo cognome del giocatore.
	 * @param dob La nuova data di nascita del giocatore.
	 * @param countryID Il nuovo ID della nazione del giocatore.
	 * @param foot Il nuovo piede preferito del giocatore.
	 * @param positionID Il nuovo ID del ruolo del giocatore.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String updatePlayerDB(String playerID,
															 String name,
															 String surname,
															 String dob,
															 String countryID,
															 String foot,
															 String positionID)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_player(?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, name);
			cs.setString(4, surname);
			cs.setString(5, dob);
			cs.setString(6, countryID);
			cs.setString(7, foot);
			cs.setString(8, positionID);


			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Imposta la data del ritiro di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui impostare la data del ritiro.
	 * @param retiredDate La data del ritiro del giocatore.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String setRetiredDateDB(String playerID,
																 String retiredDate)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call set_retired_date(?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, retiredDate);


			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}


	/**
	 * Seleziona un giocatore casuale dal database.
	 * <p>
	 * @return L'ID del giocatore casuale.
	 */
	@Override
	public String randomPlayerDB()
	{
		String randomID = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call random_player()}");
			cs.registerOutParameter(1, Types.VARCHAR);

			cs.execute();

			randomID = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return randomID;
	}

}

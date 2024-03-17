package postgresImplDAO;

import dao.PartecipationDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;
import model.Team;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia PartecipationDAO.
 */
public class PostgresImplPartecipationDAO
				implements PartecipationDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplPartecipationDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Crea una nuova partecipazione di una squadra a una competizione nel database.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String newPartecipationDB(String teamID,
																	 String competitionID,
																	 String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call new_partecipation(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, competitionID);
			cs.setString(4, competitionStartYear);

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
	 * Elimina una partecipazione di una squadra a una competizione dal database.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionID L'ID della competizione.
	 * @param competitionStartYear L'anno di inizio della competizione da eliminare.
	 * @return Un messaggio di conferma.
	 */
	@Override
	public String deletePartecipationDB(String teamID,
																			String competitionID,
																			String competitionStartYear)
	{
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call delete_partecipation(?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, teamID);
			cs.setString(3, competitionID);
			cs.setString(4, competitionStartYear);

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
	 * Recupera informazioni sulle partecipazioni di una squadra a competizioni dal database.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionStartYear L'anno di inizio delle competizioni da recuperare.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 */
	@Override
	public void fetchPartecipationDB(String teamID,
																	 String competitionStartYear,
																	 Vector<Vector<Object>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(rs.getString("comp_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type")));
				vector.add(rs.getString("conf_short_name"));

				tableData.add(vector);
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera gli anni delle competizioni a cui una squadra ha partecipato o potrebbe partecipare.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param teamType Il tipo di squadra.
	 * @param comboBoxData Un vettore di stringhe per popolare una combobox con gli anni delle competizioni.
	 * @param comboBoxMap Una mappa per associare i valori della combobox ai valori del database.
	 */
	@Override
	public void fetchPartecipationYearDB(String teamID,
																			 String teamType,
																			 Vector<String> comboBoxData,
																			 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_year(?)}");
			cs.setString(1, teamID);

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
	 * Recupera informazioni sulle competizioni a cui una squadra ha partecipato in un determinato anno.
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionStartYear L'anno di inizio delle competizioni da recuperare.
	 * @param comboBoxData Un vettore di stringhe per popolare una combobox con le competizioni.
	 * @param comboBoxMap Una mappa per associare i valori della combobox ai valori del database.
	 */
	@Override
	public void fetchPartecipationDB(String teamID,
																	 String competitionStartYear,
																	 Vector<String> comboBoxData,
																	 Map<String, String> comboBoxMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();


			while (rs.next()) {
				comboBoxData.add(rs.getString("comp_name"));
				comboBoxMap.put(comboBoxData.getLast(), rs.getString("comp_id"));
			}


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Recupera informazioni dettagliate sulle partecipazioni di una squadra a competizioni dal database (sezione amministrativa).
	 * <p>
	 * @param teamID L'ID della squadra.
	 * @param competitionStartYear L'anno di inizio delle competizioni da recuperare.
	 * @param tableData Un vettore di vettori di oggetti per popolare una tabella con i dati recuperati.
	 * @param tableMap Una mappa nidificata per associare i valori della tabella ai valori del database.
	 */
	@Override
	public void fetchPartecipationAdminDB(String teamID,
																				String competitionStartYear,
																				Vector<Vector<Object>> tableData,
																				Map<Integer, Map<Integer, String>> tableMap)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call partecipation_team(?, ?)}");
			cs.setString(1, teamID);
			cs.setString(2, competitionStartYear);

			ResultSet rs = cs.executeQuery();

			Map<Integer, String> competitionMap = new HashMap<>();

			while (rs.next()) {
				Vector<Object> vector = new Vector<>();

				vector.add(false);
				vector.add(rs.getString("comp_name"));
				vector.add(GuiConfiguration.getMessage(rs.getString("comp_type")));
				vector.add(rs.getString("conf_short_name"));

				tableData.add(vector);
				competitionMap.put(rs.getRow() - 1, rs.getString("comp_id"));
			}

			tableMap.put(1, competitionMap);


			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}
}

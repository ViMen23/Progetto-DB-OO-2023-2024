package postgresImplDAO;

import dao.AttributeMentalDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Vector;

/**
 * Implementazione specifica per PostgreSQL dell'interfaccia AttributeMentalDAO.
 */
public class PostgresImplAttributeMentalDAO
				implements AttributeMentalDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplAttributeMentalDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Recupera gli attributi mentali per un giocatore specifico dal database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui recuperare gli attributi.
	 * @param tableData Un oggetto in cui memorizzare i dati degli attributi recuperati.
	 *                    Ogni elemento interno del vettore rappresenta una coppia di valori:
	 *                    - Il primo elemento della coppia è il nome dell'attributo.
	 *                    - Il secondo elemento della coppia è il valore dell'attributo.
	 */
	@Override
	public void fetchAttributeMentalDB(String playerID,
																		 Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_mental(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("aggression")); add(rs.getString("aggression"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("anticipation")); add(rs.getString("anticipation"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("bravery")); add(rs.getString("bravery"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("composure")); add(rs.getString("composure"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("concentration")); add(rs.getString("concentration"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("decision")); add(rs.getString("decision"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("determination")); add(rs.getString("determination"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("flair")); add(rs.getString("flair"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("leadership")); add(rs.getString("leadership"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("offTheBall")); add(rs.getString("off_the_ball"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("positioning")); add(rs.getString("positioning"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("teamwork")); add(rs.getString("teamwork"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("vision")); add(rs.getString("vision"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("workRate")); add(rs.getString("work_rate"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}


	/**
	 * Aggiorna gli attributi mentali di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui aggiornare gli attributi.
	 * @param aggression Il nuovo valore dell'attributo "aggression".
	 * @param anticipation Il nuovo valore dell'attributo "anticipation".
	 * @param bravery Il nuovo valore dell'attributo "bravery".
	 * @param composure Il nuovo valore dell'attributo "composure".
	 * @param concentration Il nuovo valore dell'attributo "concentration".
	 * @param decision Il nuovo valore dell'attributo "decision".
	 * @param determination Il nuovo valore dell'attributo "determination".
	 * @param flair Il nuovo valore dell'attributo "flair".
	 * @param leadership Il nuovo valore dell'attributo "leadership".
	 * @param offTheBall Il nuovo valore dell'attributo "off_the_ball".
	 * @param positioning Il nuovo valore dell'attributo "positioning".
	 * @param teamwork Il nuovo valore dell'attributo "teamwork".
	 * @param vision Il nuovo valore dell'attributo "vision".
	 * @param workRate Il nuovo valore dell'attributo "work_rate".
	 * @return Una stringa che indica il risultato dell'aggiornamento.
	 */
	@Override
	public String updateAttributeMentalDB(String playerID,
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
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_attribute_mental(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, aggression);
			cs.setString(4, anticipation);
			cs.setString(5, bravery);
			cs.setString(6, composure);
			cs.setString(7, concentration);
			cs.setString(8, decision);
			cs.setString(9, determination);
			cs.setString(10, flair);
			cs.setString(11, leadership);
			cs.setString(12, offTheBall);
			cs.setString(13, positioning);
			cs.setString(14, teamwork);
			cs.setString(15, vision);
			cs.setString(16, workRate);


			cs.execute();

			message = cs.getString(1);


			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}

		return message;
	}
}

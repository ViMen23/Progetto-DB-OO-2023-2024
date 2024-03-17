package postgresImplDAO;

import dao.AttributeGoalkeepingDAO;
import database.DatabaseConnection;
import gui.GuiConfiguration;

import java.sql.*;
import java.util.Vector;

/**
 * Implementazione specifica per PostgresSQL dell'interfaccia AttributeGoalkeepingDAO.
 */
public class PostgresImplAttributeGoalkeepingDAO
				implements AttributeGoalkeepingDAO
{
	private Connection conn;

	/**
	 * Costruttore della classe che stabilisce la connessione al database.
	 */
	public PostgresImplAttributeGoalkeepingDAO()
	{
		try {
			conn = DatabaseConnection.getInstance().conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * Recupera gli attributi del portiere per un giocatore specifico dal database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui recuperare gli attributi.
	 * @param tableData Un oggetto in cui memorizzare i dati degli attributi recuperati.
	 *                    Ogni elemento interno del vettore rappresenta una coppia di valori:
	 *                    - Il primo elemento della coppia è il nome dell'attributo.
	 *                    - Il secondo elemento della coppia è il valore dell'attributo.
	 */
	@Override
	public void fetchAttributeGoalkeepingDB(String playerID,
																					Vector<Vector<String>> tableData)
	{
		try {
			CallableStatement cs = this.conn.prepareCall("{call get_attribute_goalkeeping(?)}");
			cs.setString(1, playerID);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("aerialReach")); add(rs.getString("aerial_reach"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("commandOfArea")); add(rs.getString("command_of_area"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("communication")); add(rs.getString("communication"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("eccentricity")); add(rs.getString("eccentricity"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("firstTouchGk")); add(rs.getString("first_touch_gk"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("handling")); add(rs.getString("handling"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("kicking")); add(rs.getString("kicking"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("oneOnOnes")); add(rs.getString("one_on_ones"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("passingGk")); add(rs.getString("passing_gk"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("punchingTendency")); add(rs.getString("punching_tendency"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("reflexes")); add(rs.getString("reflexes"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("rushingOutTendency")); add(rs.getString("rushing_out_tendency"));}});
				tableData.add(new Vector<String>(){{add(GuiConfiguration.getMessage("throwing")); add(rs.getString("throwing"));}});
			}

			rs.close();
			cs.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Errore: " + e.getMessage());
		}
	}

	/**
	 * Aggiorna gli attributi del portiere per un giocatore specifico nel database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui aggiornare gli attributi.
	 * @param aerialReach Il nuovo valore dell'attributo "aerial_reach".
	 * @param commandOfArea Il nuovo valore dell'attributo "command_of_area".
	 * @param communication Il nuovo valore dell'attributo "communication".
	 * @param eccentricity Il nuovo valore dell'attributo "eccentricity".
	 * @param firstTouchGk Il nuovo valore dell'attributo "first_touch_gk".
	 * @param handling Il nuovo valore dell'attributo "handling".
	 * @param kicking Il nuovo valore dell'attributo "kicking".
	 * @param oneOnOnes Il nuovo valore dell'attributo "one_on_ones".
	 * @param passingGk Il nuovo valore dell'attributo "passing_gk".
	 * @param punchingTendency Il nuovo valore dell'attributo "punching_tendency".
	 * @param reflexes Il nuovo valore dell'attributo "reflexes".
	 * @param rushingOutTendency Il nuovo valore dell'attributo "rushing_out_tendency".
	 * @param throwing Il nuovo valore dell'attributo "throwing".
	 * @return Un messaggio che indica il risultato dell'aggiornamento.
	 */
	@Override
	public String updateAttributeGoalkeepingDB(String playerID,
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
		String message = null;

		try {
			CallableStatement cs = this.conn.prepareCall("{? = call update_attribute_goalkeeping(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setString(2, playerID);
			cs.setString(3, aerialReach);
			cs.setString(4, commandOfArea);
			cs.setString(5, communication);
			cs.setString(6, eccentricity);
			cs.setString(7, firstTouchGk);
			cs.setString(8, handling);
			cs.setString(9, kicking);
			cs.setString(10, oneOnOnes);
			cs.setString(11, passingGk);
			cs.setString(12, punchingTendency);
			cs.setString(13, reflexes);
			cs.setString(14, rushingOutTendency);
			cs.setString(15, throwing);


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

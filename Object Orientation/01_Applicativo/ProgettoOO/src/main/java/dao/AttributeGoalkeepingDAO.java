package dao;

import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi agli attributi di portiere di un calciatore.
 */
public interface AttributeGoalkeepingDAO
{
	/**
	 * Recupera gli attributi del portiere per un giocatore specifico dal database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui recuperare gli attributi.
	 * @param tableData Un oggetto in cui memorizzare i dati degli attributi recuperati.
	 *                    Ogni elemento interno del vettore rappresenta una coppia di valori:
	 *                    - Il primo elemento della coppia è il nome dell'attributo.
	 *                    - Il secondo elemento della coppia è il valore dell'attributo.
	 */
	void fetchAttributeGoalkeepingDB(String playerID,
																	 Vector<Vector<String>> tableData);

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
	String updateAttributeGoalkeepingDB(String playerID,
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
																			String throwing);
}

package dao;

import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi agli attributi mentali di un calciatore.
 */
public interface AttributeMentalDAO
{
	/**
	 * Recupera gli attributi mentali per un giocatore specifico dal database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui recuperare gli attributi.
	 * @param tableData Un oggetto in cui memorizzare i dati degli attributi recuperati.
	 *                    Ogni elemento interno del vettore rappresenta una coppia di valori:
	 *                    - Il primo elemento della coppia è il nome dell'attributo.
	 *                    - Il secondo elemento della coppia è il valore dell'attributo.
	 */
	void fetchAttributeMentalDB(String playerID,
															Vector<Vector<String>> tableData);

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
	String updateAttributeMentalDB(String playerID,
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
																 String workRate);
}

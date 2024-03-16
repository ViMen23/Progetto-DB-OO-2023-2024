package dao;

import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi agli attributi fisici di un calciatore.
 */
public interface AttributePhysicalDAO
{
	/**
	 * Recupera gli attributi fisici per un giocatore specifico dal database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui recuperare gli attributi.
	 * @param tableData Un oggetto in cui memorizzare i dati degli attributi recuperati.
	 *                    Ogni elemento interno del vettore rappresenta una coppia di valori:
	 *                    - Il primo elemento della coppia è il nome dell'attributo.
	 *                    - Il secondo elemento della coppia è il valore dell'attributo.
	 */
	void fetchAttributePhysicalDB(String playerID,
																Vector<Vector<String>> tableData);

	/**
	 * Aggiorna gli attributi fisici di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui aggiornare gli attributi.
	 * @param acceleration Il nuovo valore dell'attributo "acceleration".
	 * @param agility Il nuovo valore dell'attributo "agility".
	 * @param balance Il nuovo valore dell'attributo "balance".
	 * @param jumpingReach Il nuovo valore dell'attributo "jumping_reach".
	 * @param naturalFitness Il nuovo valore dell'attributo "natural_fitness".
	 * @param pace Il nuovo valore dell'attributo "pace".
	 * @param stamina Il nuovo valore dell'attributo "stamina".
	 * @param strength Il nuovo valore dell'attributo "strength".
	 * @return Una stringa che indica il risultato dell'aggiornamento.
	 */
	String updateAttributePhysicalDB(String playerID,
																	 String acceleration,
																	 String agility,
																	 String balance,
																	 String jumpingReach,
																	 String naturalFitness,
																	 String pace,
																	 String stamina,
																	 String strength);
}

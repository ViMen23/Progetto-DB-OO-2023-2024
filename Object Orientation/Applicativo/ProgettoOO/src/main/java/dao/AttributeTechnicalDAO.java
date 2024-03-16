package dao;

import java.util.Vector;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi agli attributi tecnici di un calciatore.
 */
public interface AttributeTechnicalDAO
{
	/**
	 * Recupera gli attributi tecnici per un giocatore specifico dal database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui recuperare gli attributi.
	 * @param tableData Un oggetto in cui memorizzare i dati degli attributi recuperati.
	 *                    Ogni elemento interno del vettore rappresenta una coppia di valori:
	 *                    - Il primo elemento della coppia è il nome dell'attributo.
	 *                    - Il secondo elemento della coppia è il valore dell'attributo.
	 */
	void fetchAttributeTechnicalDB(String playerID,
																 Vector<Vector<String>> tableData);

	/**
	 * Aggiorna gli attributi tecnici di un giocatore nel database.
	 * <p>
	 * @param playerID L'ID del giocatore per cui aggiornare gli attributi.
	 * @param corners Il nuovo valore dell'attributo "corners".
	 * @param crossing Il nuovo valore dell'attributo "crossing".
	 * @param dribbling Il nuovo valore dell'attributo "dribbling".
	 * @param finishing Il nuovo valore dell'attributo "finishing".
	 * @param firstTouch Il nuovo valore dell'attributo "first_touch".
	 * @param freeKickTaking Il nuovo valore dell'attributo "free_kick_taking".
	 * @param heading Il nuovo valore dell'attributo "heading".
	 * @param longShots Il nuovo valore dell'attributo "long_shots".
	 * @param longThrows Il nuovo valore dell'attributo "long_throws".
	 * @param marking Il nuovo valore dell'attributo "marking".
	 * @param passing Il nuovo valore dell'attributo "passing".
	 * @param penaltyTaking Il nuovo valore dell'attributo "penalty_taking".
	 * @param tackling Il nuovo valore dell'attributo "tackling".
	 * @param technique Il nuovo valore dell'attributo "technique".
	 * @return Una stringa che indica il risultato dell'aggiornamento.
	 */
	String updateAttributeTechnicalDB(String playerID,
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
																		String technique);
}

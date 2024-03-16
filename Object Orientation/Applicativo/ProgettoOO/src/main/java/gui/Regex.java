package gui;

import java.util.regex.Pattern;

/**
 * Questa classe fornisce metodi statici per la convalida di stringhe utilizzando espressioni regolari.
 * <p>
 * Le espressioni regolari definite in questa classe sono utilizzate per verificare se una stringa soddisfa determinati criteri di formato.
 */
public class Regex
{
	/**
	 * Espressione regolare per stringhe alfanumeriche estese.
	 * <p>
	 * Questa espressione regolare verifica se una stringa contiene da 0 a 98 caratteri alfanumerici, seguiti da un punto opzionale e altri caratteri alfanumerici.
	 * I caratteri alfanumerici includono lettere maiuscole e minuscole, cifre decimali e alcuni caratteri speciali consentiti (spazio, apostrofo, trattino, punto, barra, underscore).
	 */
	private static final String alnum = "(?=^" +
																				"[" +
																					"\u0030-\u0039" +
																					"\u0041-\u005A" +
																					"\u0061-\u007A" +
																					"\u00C0-\u00D6" +
																					"\u00D8-\u00F6" +
																					"\u00F8-\u00FF" +
																					"\u0100-\u017F" +
																					"\u0180-\u024F" +
																					"\u0259" +
																				"]" +
																				"[" +
																					"\u0020" +
																					"\u0027" +
																					"\u002D" +
																					"\u002E" +
																					"\u002F" +
																					"\u0030-\u0039" +
																					"\u0041-\u005A" +
																					"\u0060" +
																					"\u0061-\u007A" +
																					"\u00C0-\u00D6" +
																					"\u00D8-\u00F6" +
																					"\u00F8-\u00FF" +
																					"\u0100-\u017F" +
																					"\u0180-\u024F" +
																					"\u0259" +
																				"]{0,98}" +
																				"[" +
																					"\u002E" +
																					"\u0030-\u0039" +
																					"\u0041-\u005A" +
																					"\u0061-\u007A" +
																					"\u00C0-\u00D6" +
																					"\u00D8-\u00F6" +
																					"\u00F8-\u00FF" +
																					"\u0100-\u017F" +
																					"\u0180-\u024F" +
																					"\u0259" +
																				"]" +
																			"$)" +
																			"(?!.*(" +
																				"[\u0020\u0027\u002D\u002F\u0060]{2}" +
																				"|" +
																				"[\u0027\u002D\u002E\u002F\u0060]{2}" +
																				"|" +
																				"\u0020\\u002E" +
																			"))";

	/**
	 * Espressione regolare per codici.
	 * <p>
	 * Questa espressione regolare verifica se una stringa è composta da 2 o 3 lettere maiuscole (da A a Z).
	 */
	private static final String code = "(?=^[\u0041-\u005A]{2,3}$)";

	/**
	 * Espressione regolare per password.
	 * <p>
	 * Questa espressione regolare verifica se una stringa soddisfa i requisiti di sicurezza per le password.
	 * <p>
	 * Requisiti:
	 * <li> Lunghezza minima: 8 caratteri
	 * <li> Lunghezza massima: 255 caratteri
	 * <li> Almeno un carattere minuscolo (a-z)
	 * <li> Almeno un carattere maiuscolo (A-Z)
	 * <li> Almeno un numero decimale (0-9)
	 * <li> Almeno un carattere speciale consentito (spazio, caratteri di punteggiatura comuni, simboli matematici comuni, underscore)
	 */
	private static final String password =	"(?=^[\u0020-\u007E]{8,255}$)" +
																					"(?=.*[\u0030-\u0039]{1})" +
																					"(?=.*[\u0041-\u005A]{1})" +
																					"(?=.*[\u0061-\u007A]{1})" +
																					"(?=.*[\u0020-\u002F\u003A-\u0040\\u005B-\u0060\u007B-\u007E]{1})";


	/**
	 * Espressione regolare per stringhe di testo generiche.
	 * <p>
	 * Questa espressione regolare verifica se una stringa soddisfa i seguenti criteri:
	 * <li> Può iniziare con una lettera maiuscola o minuscola con accenti (dalla A alla ö e dalla à alla ÿ), oppure altri caratteri specifici Unicode.
	 * <li> Può contenere da 0 a 98 caratteri alfanumerici con accenti (lettere maiuscole/minuscole, cifre 0-9) oppure spazio, apostrofo, trattino, punto.
	 * <li> Deve finire con una lettera maiuscola o minuscola con accenti oppure altri caratteri specifici Unicode.
	 * <li> Non può contenere due o più caratteri consecutivi tra spazio, apostrofo, trattino o punto (es. "   ", "--", "..").
	 */
	private static final String string =	"(?=^" +
																					"[" +
																						"\u0041-\u005A" +
																						"\u0061-\u007A" +
																						"\u00C0-\u00D6" +
																						"\u00D8-\u00F6" +
																						"\u00F8-\u00FF" +
																						"\u0100-\u017F" +
																						"\u0180-\u024F" +
																						"\u0259" +
																					"]" +
																					"[" +
																						"\u0020" +
																						"\u0027" +
																						"\u002D" +
																						"\u002E" +
																						"\u0041-\u005A" +
																						"\u0061-\u007A" +
																						"\u00C0-\u00D6" +
																						"\u00D8-\u00F6" +
																						"\u00F8-\u00FF" +
																						"\u0100-\u017F" +
																						"\u0180-\u024F" +
																						"\u0259" +
																					"]{0,98}" +
																					"[" +
																						"\u002E" +
																						"\u0041-\u005A" +
																						"\u0061-\u007A" +
																						"\u00C0-\u00D6" +
																						"\u00D8-\u00F6" +
																						"\u00F8-\u00FF" +
																						"\u0100-\u017F" +
																						"\u0180-\u024F" +
																						"\u0259" +
																					"]" +
																				"$)" +
																				"(?!.*(" +
																					"[\u0020\u0027\u002D]{2}" +
																					"|" +
																					"[\u0027\u002D\u002E]{2}"  +
																					"|" +
																					"\u0020\\u002E" +
																				"))";


	/**
	 * Espressione regolare per nomi utente.
	 * <p>
	 * Questa espressione regolare verifica se una stringa soddisfa i requisiti per un nome utente valido:
	 * <li> Può iniziare con una lettera maiuscola o minuscola (dalla A alla Z e dalla a alla z).
	 * <li> Può contenere da 2 a 18 caratteri alfanumerici (lettere maiuscole/minuscole e cifre 0-9), oppure trattino (-), punto (.) o underscore (_).
	 * <li> Deve finire con una lettera maiuscola o minuscola (dalla A alla Z e dalla a alla z).
	 * <li> Non può contenere due o più caratteri consecutivi tra trattino, punto o underscore (es. "--", "..", "__").
	 * <p>
	 */
	private static final String username =	"(?=^" +
																						"[" +
																							"\u0030-\u0039" +
																							"\u0041-\u005A" +
																							"\u0061-\u007A" +
																						"]" +
																						"[" +
																							"\u002D" +
																							"\u002E" +
																							"\u0030-\u0039" +
																							"\u0041-\u005A" +
																							"\u005F" +
																							"\u0061-\u007A" +
																						"]{2,18}" +
																						"[" +
																							"\u0030-\u0039" +
																							"\u0041-\u005A" +
																							"\u0061-\u007A" +
																						"]" +
																					"$)" +
																					"(?!.*[\u002D\u002E\u005F]{2})";


	/**
	 * Pattern compilato per l'espressione regolare `alnum`.
	 */
	public static final Pattern patternAlnum = Pattern.compile(alnum);
	/**
	 * Pattern compilato per l'espressione regolare `code`.
	 */
	public static final Pattern patternCode = Pattern.compile(code);
	/**
	 * Pattern compilato per l'espressione regolare `password`.
	 */
	public static final Pattern patternPassword = Pattern.compile(password);
	/**
	 * Pattern compilato per l'espressione regolare `string`.
	 */
	public static final Pattern patternString = Pattern.compile(string);
	/**
	 * Pattern compilato per l'espressione regolare `username`.
	 */
	public static final Pattern patternUsername = Pattern.compile(username);

}

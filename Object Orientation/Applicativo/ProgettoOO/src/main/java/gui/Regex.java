
package gui;

import java.util.regex.Pattern;


public class Regex
{
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
																				"\u0020\u002E" +
																			"))";

	private static final String code = "(?=^[\u0041-\u005A]{2,3}$)";
	private static final String password =	"(?=^[\u0020-\u007E]{8,255}$)" +
																					"(?=.*[\u0030-\u0039]{1})" +
																					"(?=.*[\u0041-\u005A]{1})" +
																					"(?=.*[\u0061-\u007A]{1})" +
																					"(?=.*[\u0020-\u002F\u003A-\u0040\\u005B-\u0060\u007B-\u007E]{1})";

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
																					"\u0020\u002E" +
																				"))";

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

	public static final Pattern patternAlnum = Pattern.compile(alnum);
	public static final Pattern patternCode = Pattern.compile(code);
	public static final Pattern patternPassword = Pattern.compile(password);
	public static final Pattern patternString = Pattern.compile(string);
	public static final Pattern patternUsername = Pattern.compile(username);

}

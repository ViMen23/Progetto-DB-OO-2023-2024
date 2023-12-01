package controller;

import dao.LoginPasswordDAO;
import dao.LoginUsernameDAO;
import implementazionePostgresDao.ImplementazioneControlloPasswordDAO;
import implementazionePostgresDao.ImplementazioneControlloUsernameDAO;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Controller
{

	// controllo se l'username esiste nel database
	public Boolean controlloUsername(String username)
	{
		LoginUsernameDAO controllo = new ImplementazioneControlloUsernameDAO();
		return controllo.controlloUsernameDB(username);
	}

	// controllo se l'username sia ben formato
	public Boolean controlloFormatoUsername(String username)
	{
			String regex = "^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$";
			Pattern pattern = Pattern.compile( regex, Pattern.CASE_INSENSITIVE );
			Matcher matcher = pattern.matcher( username );

			return ( matcher.matches() );
	}

	// controllo se la password esiste nel database
	public Boolean controlloPassword(String username, String password)
	{
		LoginPasswordDAO controllo = new ImplementazioneControlloPasswordDAO();
		return controllo.controlloPasswordDB(username,password);
	}

	public boolean controlloFormatoPassword(String password)
	{
		String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[~`!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\"/?.>,<])[A-Za-z\\d~`!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\"/?.>,<]{8,255}$";
		Pattern pattern = Pattern.compile( regex, Pattern.CASE_INSENSITIVE );
		Matcher matcher = pattern.matcher( password );

		return ( matcher.matches() );
	}
}

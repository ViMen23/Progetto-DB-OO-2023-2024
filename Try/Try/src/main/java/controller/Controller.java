package controller;

import dao.AggiungiUtenteDAO;
import dao.LoginPasswordDAO;
import dao.LoginUsernameDAO;
import dao.RegistrationUsernameDAO;
import implementazionePostgresDao.ImplementazioneAggiungiUtenteDAO;
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
	public Boolean usernameIsValid(String username)
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

	public boolean passwordIsValid(String password)
	{
		String regex = "";
		regex += "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)";
		regex += "(?=.*[~`!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\"/?.>,<])";
		regex += "[A-Za-z\\d~`!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\"/?.>,<]{8,255}$";

		Pattern pattern = Pattern.compile( regex, Pattern.CASE_INSENSITIVE );
		Matcher matcher = pattern.matcher( password );

		return ( matcher.matches() );
	}

	public boolean usernameIsAvailable(String username)
	{
		RegistrationUsernameDAO controllo = new ImplementazioneControlloUsernameDAO();
		return controllo.usernameDisponibileDB(username);
	}

	public void aggiungiUtente(String username, String password)
	{
		AggiungiUtenteDAO interfaccia = new ImplementazioneAggiungiUtenteDAO();
		interfaccia.addUserDB(username, password);
	}
}

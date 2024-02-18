package controller;

import dao.RowExistsDao;
import postgresDaoImplementation.RowExistsPostgresDaoImpl;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ItemEvent;
import java.util.regex.Pattern;

/**
 * TYPE : class - controller package
 * NAME : Controller
 *
 * DESC: TODO
 */
public class Controller
{
	private static Controller controllerInstance = null;

	private Controller()
	{
	}

	public static Controller getControllerInstance()
	{
		if (null == controllerInstance) {
			controllerInstance = new Controller();
		}

		return controllerInstance;
	}

	public Boolean isAdmin(String username, String password)
	{
		String separator = "@";

		while (Pattern.compile(separator).matcher(password).find()) {
			separator += separator;
		}

		String string = "";
		string += "fp_admin";
		string += separator;
		string += "username";
		string += separator;
		string += username;
		string += separator;
		string += "password";
		string += separator;
		string += password;

		RowExistsDao reDao = new RowExistsPostgresDaoImpl();

		return reDao.rowExistsDB(separator, string);
	}
}

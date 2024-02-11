package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;

/**
 * TYPE : class - gui package
 * NAME : TopPanel
 *
 * DESC: TODO
 */

public class TopPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JButton logoButton;
	protected JButton projectnameButton;
	protected JButton localeButton;
	protected JButton loginLogoutButton;

	final static float outputFontSize = 22;
	final static float inputFontSize = 20;


	public TopPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		// configurazione bottone logo
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		logoButton = new JButton("Logo");
		logoButton.setFont(outputFont);

		add(logoButton, gbc);

		// configurazione bottone nome progetto
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		projectnameButton = new JButton("Nome Progetto");
		projectnameButton.setFont(outputFont);

		add(projectnameButton, gbc);


		// configurazione bottone scelta locale
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		localeButton = new JButton("Locale");
		localeButton.setFont(outputFont);

		add(localeButton, gbc);

		// configurazione bottone login/logout admin
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		loginLogoutButton = new JButton("Login/Logout");
		loginLogoutButton.setFont(outputFont);

		add(loginLogoutButton, gbc);


	}

	@Override
	public void actionPerformed(ActionEvent e)
	{

	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{

	}

	@Override
	public void caretUpdate(CaretEvent e)
	{

	}

}

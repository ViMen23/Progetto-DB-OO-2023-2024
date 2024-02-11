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
	protected JLabel logoLabel;
	protected JLabel projectnameLabel;
	protected JButton localeButton;
	protected JButton loginLogoutButton;

	final static float outputFontSize = 22;
	final static float inputFontSize = 20;

	final ImageIcon logoImageIcon = Main.createImageIcon("images/logo16.png", 75, 75);
	final ImageIcon localeImageIcon = Main.createImageIcon("images/world2.png", 50, 50);
	final ImageIcon loginLogoutImageIcon = Main.createImageIcon("images/loginLogout.png", 25, 25);


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
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		logoLabel = new JLabel(logoImageIcon);

		add(logoLabel, gbc);

		// configurazione label nome progetto
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		projectnameLabel = new JLabel("UNINA Football");
		projectnameLabel.setFont(outputFont);

		add(projectnameLabel, gbc);


		// configurazione bottone scelta locale
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		localeButton = new JButton(localeImageIcon);

		add(localeButton, gbc);

		// configurazione bottone login/logout admin
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		loginLogoutButton = new JButton("Login", loginLogoutImageIcon);
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

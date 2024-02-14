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
 * NAME : UserFilterPanel
 *
 * DESC: TODO
 */

public class UserFilterPanelNew
				extends  JPanel
  				implements ActionListener, CaretListener, ItemListener
{
	protected JButton button;

	final static float outputFontSize = 18;

	public static Timer timer;


	public UserFilterPanelNew(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);

		timer = new Timer(250, this);


		// configurazione bottone home
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.anchor = GridBagConstraints.CENTER;

		button = new JButton
						(
										Main.createImageIcon("images/home.png", 30, 30)
						);

		add(button, gbc);


		// configurazione bottone paesi
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		button = new JButton
						(
										currentLocale.getString("countries").toUpperCase(),
										Main.createImageIcon("images/country.png", 30, 30)
						);

		button.setFont(outputFont);
		button.setForeground(Color.WHITE);

		add(button, gbc);

		// configurazione bottone confederazioni
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		button = new JButton
						(
										currentLocale.getString("confederations").toUpperCase(),
										Main.createImageIcon("images/competition.png", 30, 30)
						);

		button.setFont(outputFont);
		button.setForeground(Color.WHITE);

		add(button, gbc);

		// configurazione bottone competizioni
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton
						(
										currentLocale.getString("competitions").toUpperCase(),
										Main.createImageIcon("images/competition.png", 30, 30)
						);

		button.setFont(outputFont);
		button.setForeground(Color.WHITE);

		add(button, gbc);

		// configurazione bottone ricerca competizioni
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.anchor = GridBagConstraints.FIRST_LINE_END;

		button = new JButton(Main.createImageIcon("images/search.png", 30, 30));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 5;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton
						(
										currentLocale.getString("teams").toUpperCase(),
										Main.createImageIcon("images/team.png", 30, 30)
						);

		button.setFont(outputFont);
		button.setForeground(Color.WHITE);

		add(button, gbc);

		// configurazione bottone ricerca squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 6;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.anchor = GridBagConstraints.FIRST_LINE_END;

		button = new JButton(Main.createImageIcon("images/search.png", 30, 30));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone calciatori
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 7;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton
						(
										currentLocale.getString("players").toUpperCase(),
										Main.createImageIcon("images/player.png", 30, 30)
						);

		button.setFont(outputFont);
		button.setForeground(Color.WHITE);

		add(button, gbc);

		// configurazione bottone ricerca calciatore
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 8;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_END;

		button = new JButton(Main.createImageIcon("images/search.png", 30, 30));
		button.setFont(outputFont);

		add(button, gbc);

	}


	@Override
	public void actionPerformed(ActionEvent e)
	{

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}
}

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
	protected JLabel seasonLabel;
	protected JLabel countryLabel;
	protected JLabel competitionLabel;
	protected JLabel teamLabel;
	protected JLabel playerLabel;

	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final ImageIcon seasonImageIcon = Main.createImageIcon("images/season.png", 30, 30);
	final ImageIcon countryImageIcon = Main.createImageIcon("images/country.png", 50, 50);
	final ImageIcon competitionImageIcon = Main.createImageIcon("images/competition.png", 50, 50);
	final ImageIcon teamImageIcon = Main.createImageIcon("images/team.png", 50, 50);
	final ImageIcon playerImageIcon = Main.createImageIcon("images/player.png", 50, 50);

	public UserFilterPanelNew(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);


		// configurazione label stagione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		seasonLabel = new JLabel(currentLocale.getString("season"), seasonImageIcon, SwingConstants.CENTER);
		seasonLabel.setFont(outputFont);

		add(seasonLabel, gbc);


		// configurazione label paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		countryLabel = new JLabel(currentLocale.getString("country"), countryImageIcon, SwingConstants.CENTER);
		countryLabel.setFont(outputFont);

		add(countryLabel, gbc);

		// configurazione label competizione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		competitionLabel = new JLabel(currentLocale.getString("competition"), competitionImageIcon, SwingConstants.CENTER);
		competitionLabel.setFont(outputFont);

		add(competitionLabel, gbc);

		// configurazione label squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		teamLabel = new JLabel(currentLocale.getString("team"), teamImageIcon, SwingConstants.CENTER);
		teamLabel.setFont(outputFont);

		add(teamLabel, gbc);

		// configurazione label calciatore
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		playerLabel = new JLabel(currentLocale.getString("player"), playerImageIcon, SwingConstants.CENTER);
		playerLabel.setFont(outputFont);

		add(playerLabel, gbc);


	}


	@Override
	public void actionPerformed(ActionEvent e) {

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}
}

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
import org.jdesktop.swingx.autocomplete.Configurator;

/**
 * TYPE : class - gui package
 * NAME : UserFilterPanel
 *
 * DESC: TODO
 */

public class UserFilterPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel seasonLabel;
	protected JComboBox<String> seasonComboBox;
	protected JLabel countryLabel;
	protected JComboBox<String> countryComboBox;
	protected JLabel competitionLabel;
	protected JComboBox<String> competitionComboBox;
	protected JLabel teamLabel;
	protected JComboBox<String> teamComboBox;
	protected JLabel playerLabel;
	protected JComboBox<String> playerComboBox;


	final static float outputFontSize = 22;
	final static float inputFontSize = 20;


	public UserFilterPanel(Controller controller, ResourceBundle currentLocale)
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
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		seasonLabel = new JLabel(currentLocale.getString("season"), SwingConstants.CENTER);
		seasonLabel.setFont(outputFont);

		add(seasonLabel, gbc);

		// configurazione label paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		countryLabel = new JLabel(currentLocale.getString("country"), SwingConstants.CENTER);
		countryLabel.setFont(outputFont);

		add(countryLabel, gbc);

		// configurazione label competizione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		competitionLabel = new JLabel(currentLocale.getString("competition"), SwingConstants.CENTER);
		competitionLabel.setFont(outputFont);

		add(competitionLabel, gbc);

		// configurazione label squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		teamLabel = new JLabel(currentLocale.getString("team"), SwingConstants.CENTER);
		teamLabel.setFont(outputFont);

		add(teamLabel, gbc);

		// configurazione label calciatore
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		playerLabel = new JLabel(currentLocale.getString("player"), SwingConstants.CENTER);
		playerLabel.setFont(outputFont);

		add(playerLabel, gbc);

		// configurazione combobox stagione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		seasonComboBox = new JComboBox<String>();
		seasonComboBox.setFont(outputFont);

		seasonComboBox.addItem("casa");
		seasonComboBox.addItem("cosa");
		seasonComboBox.addItem("case");
		seasonComboBox.addItem("albero");
		seasonComboBox.addItem("brodo");
		seasonComboBox.addItem("televisore");
		seasonComboBox.addItem("casi");

		seasonComboBox.setEditable(true);
		seasonComboBox


		add(seasonComboBox, gbc);

		// configurazione combobox paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		countryComboBox = new JComboBox<String>();
		countryComboBox.setFont(outputFont);

		add(countryComboBox, gbc);

		// configurazione combobox competizione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		competitionComboBox = new JComboBox<String>();
		competitionComboBox.setFont(outputFont);

		add(competitionComboBox, gbc);

		// configurazione combobox squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		teamComboBox = new JComboBox<String>();
		teamComboBox.setFont(outputFont);

		add(teamComboBox, gbc);

		// configurazione combobox calciatori
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		playerComboBox = new JComboBox<String>();
		playerComboBox.setFont(outputFont);

		add(playerComboBox, gbc);

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

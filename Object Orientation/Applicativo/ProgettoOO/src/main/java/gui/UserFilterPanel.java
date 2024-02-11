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
	final static int rowCount = 3;


	public UserFilterPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		ComboBoxEditor editor;
		JTextField textField;


		// configurazione label stagione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		seasonLabel = new JLabel(currentLocale.getString("season"), SwingConstants.CENTER);
		seasonLabel.setFont(outputFont);

		add(seasonLabel, gbc);

		// configurazione label paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		countryLabel = new JLabel(currentLocale.getString("country"), SwingConstants.CENTER);
		countryLabel.setFont(outputFont);

		add(countryLabel, gbc);

		// configurazione label competizione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		competitionLabel = new JLabel(currentLocale.getString("competition"), SwingConstants.CENTER);
		competitionLabel.setFont(outputFont);

		add(competitionLabel, gbc);

		// configurazione label squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		teamLabel = new JLabel(currentLocale.getString("team"), SwingConstants.CENTER);
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

		playerLabel = new JLabel(currentLocale.getString("player"), SwingConstants.CENTER);
		playerLabel.setFont(outputFont);

		add(playerLabel, gbc);

		// configurazione combobox stagione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		seasonComboBox = new JComboBox<String>();
		seasonComboBox.setFont(outputFont);
		seasonComboBox.setMaximumRowCount(rowCount);
		seasonComboBox.setSize(30, 5);

		seasonComboBox.addItem("2023-2024");
		seasonComboBox.addItem("2022-2023");
		seasonComboBox.addItem("2021-2022");
		seasonComboBox.addItem("2020-2021");
		seasonComboBox.addItem("2019-2020");
		seasonComboBox.addItem("2018-2019");
		seasonComboBox.addItem("2017-2018");

		seasonComboBox.setEditable(true);

		/*
		ComboBoxEditor seasonEditor = seasonComboBox.getEditor();
		JTextField seasonTextField = (JTextField)seasonEditor.getEditorComponent();
		seasonTextField.setColumns(0);
		*/
		add(seasonComboBox, gbc);

		// configurazione combobox paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		countryComboBox = new JComboBox<String>();
		countryComboBox.setFont(outputFont);
		countryComboBox.setMaximumRowCount(rowCount);


		countryComboBox.addItem("ciao come stai ttto bene oggi sono andato al mare");
		countryComboBox.addItem("ciao come stai ttto ");
		countryComboBox.addItem("ciao come stai ttto bene oggi sono ");
		countryComboBox.addItem("ciao sono andato al mare");
		countryComboBox.addItem("ciao ttto bene oggi mare");

		countryComboBox.setEditable(true);

		ComboBoxEditor countryEditor = countryComboBox.getEditor();
		JTextField countryTextField = (JTextField)countryEditor.getEditorComponent();
		countryTextField.setColumns(10);

		add(countryComboBox, gbc);

		// configurazione combobox competizione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		competitionComboBox = new JComboBox<String>();
		competitionComboBox.setFont(outputFont);
		competitionComboBox.setMaximumRowCount(rowCount);


		competitionComboBox.addItem("ciao come stai ttto bene oggi sono andato al mare");
		competitionComboBox.addItem("ciao come stai ttto ");
		competitionComboBox.addItem("ciao come stai ttto bene oggi sono ");
		competitionComboBox.addItem("ciao sono andato al mare");
		competitionComboBox.addItem("ciao ttto bene oggi mare");

		competitionComboBox.setSelectedIndex(-1);

		competitionComboBox.setEditable(true);

		ComboBoxEditor competitionEditor = competitionComboBox.getEditor();
		JTextField competitionTextField = (JTextField)competitionEditor.getEditorComponent();
		competitionTextField.setColumns(5);

		add(competitionComboBox, gbc);

		// configurazione combobox squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		teamComboBox = new JComboBox<String>();
		teamComboBox.setFont(outputFont);
		teamComboBox.setMaximumRowCount(rowCount);

		teamComboBox.addItem("ciao come stai ttto bene oggi sono andato al mare");
		teamComboBox.addItem("ciao come stai ttto ");
		teamComboBox.addItem("ciao come stai ttto bene oggi sono ");
		teamComboBox.addItem("ciao sono andato al mare");
		teamComboBox.addItem("ciao ttto bene oggi mare");

		teamComboBox.setEditable(true);

		ComboBoxEditor teamEditor = teamComboBox.getEditor();
		JTextField teamTextField = (JTextField)teamEditor.getEditorComponent();
		teamTextField.setColumns(10);

		add(teamComboBox, gbc);

		// configurazione combobox calciatori
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		playerComboBox = new JComboBox<String>();
		playerComboBox.setFont(outputFont);
		playerComboBox.setMaximumRowCount(rowCount);


		playerComboBox.addItem("ciao come stai ttto ");
		playerComboBox.addItem("ciao come stai ttto bene oggi sono ");
		playerComboBox.addItem("ciao sono andato al mare");
		playerComboBox.addItem("ciao come stai ttto bene oggi sono andato al mare");
		playerComboBox.addItem("ciao ttto bene oggi mare");

		playerComboBox.setEditable(true);

		ComboBoxEditor playerEditor = playerComboBox.getEditor();
		JTextField playerTextField = (JTextField)playerEditor.getEditorComponent();
		playerTextField.setColumns(1);

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

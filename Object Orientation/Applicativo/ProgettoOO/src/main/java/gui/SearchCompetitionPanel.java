package gui;

import controller.Controller;
import model.Competition;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;
import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ArrayList;
import java.util.List;


public class SearchCompetitionPanel
				extends JPanel
{
	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");

	protected JPanel competitionPanel;
	protected JPanel namePanel;
	protected JPanel competitionTypePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel competitionTablePanel;

	protected JButton titleButton;
	protected JButton searchButton;

	protected JCheckBox nameSearchCheckBox;
	protected JCheckBox competitionTypeSearchCheckBox;
	protected JCheckBox teamTypeSearchCheckBox;
	protected JCheckBox countrySearchCheckBox;

	protected JRadioButton leagueRadioButton;
	protected JRadioButton cupRadioButton;
	protected JRadioButton supercupRadioButton;
	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;
	protected JRadioButton worldRadioButton;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;

	protected JTextField nameTextField;

	protected ButtonGroup competitionTypeGroupButton;
	protected ButtonGroup teamTypeGroupButton;
	protected ButtonGroup countryGroupButton;

	protected JComboBox<List<String>> continentComboBox;
	protected JComboBox<List<String>> nationComboBox;

	protected JLabel label;
	protected JTable competitionTable;
	protected JScrollPane scrollPane;
	protected Color panelColor = Color.white;

	protected Boolean nameSearchValid = false;
	protected Boolean competitionTypeSearchValid = false;
	protected Boolean teamTypeSearchValid = false;
	protected Boolean countryTypeSearchValid = false;


	protected String competitionSubName = null;
	protected String competitionType = null;
	protected String competitionTeamType = null;
	protected String competitionCountryID = null;

	public SearchCompetitionPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]20[]50[]10"
			);

		setLayout(migLayout);
		setName("searchCompetitionPanel");


		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("competitions");
		string += " - ";
		string += GuiConfiguration.getMessage("competitions");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countCompetitions().toString();
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				if (competitionPanel.isShowing()){
					remove(competitionPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else{
					add(competitionPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]10[]0[]20[]20"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setOpaque(false);

		add(competitionPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * CHECK BOX RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchCheckBox = new JCheckBox(string);
		nameSearchCheckBox.setOpaque(true);
		nameSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchCheckBox.setForeground(Color.white);
		nameSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		nameSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (nameSearchCheckBox.isSelected()) {
					nameTextField.setEnabled(true);
				} else {
					nameSearchValid = false;
					setEnableButton();

					competitionSubName = null;

					nameTextField.setEnabled(false);
					nameTextField.setText("");
				}
			}
		});

		competitionPanel.add(nameSearchCheckBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50[]80[]20:push",
				"10[]10"
			);


		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		competitionPanel.add(namePanel);

		/*
		 * Campo nome: stampa
		 */
		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome: textfield
		 */
		nameTextField = new JTextField(GuiConfiguration.getInputColumn());
		nameTextField.setEnabled(false);

		nameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e) {
				if (Regex.patternAlnum.matcher(nameTextField.getText()).find()) {
					nameSearchValid = true;
					setEnableButton();

					nameTextField.setBackground(Color.white);

					competitionSubName = nameTextField.getText();
				} else {
					nameSearchValid = false;
					setEnableButton();

					competitionSubName = null;
					nameTextField.setBackground(Color.red);
				}
			}
		});

		namePanel.add(nameTextField);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * CHECK BOX RICERCA PER TIPO COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo di competizione: panel
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		competitionTypeSearchCheckBox = new JCheckBox(string);
		competitionTypeSearchCheckBox.setOpaque(true);
		competitionTypeSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		competitionTypeSearchCheckBox.setForeground(Color.white);
		competitionTypeSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionTypeSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (competitionTypeSearchCheckBox.isSelected()) {
					leagueRadioButton.setEnabled(true);
					cupRadioButton.setEnabled(true);
					supercupRadioButton.setEnabled(true);
				} else {
					competitionTypeSearchValid = false;
					setEnableButton();

					competitionType = null;

					competitionTypeGroupButton.clearSelection();
					leagueRadioButton.setEnabled(false);
					cupRadioButton.setEnabled(false);
					supercupRadioButton.setEnabled(false);
				}
			}
		});

		competitionPanel.add(competitionTypeSearchCheckBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER TIPO COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50[]80[]80[]20:push",
				"10[]10"
			);

		competitionTypePanel = new JPanel(migLayout);

		competitionTypePanel.setBackground(panelColor);

		competitionPanel.add(competitionTypePanel);

		/*
		 * Campo campionato: radioButton
		 */
		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);

		leagueRadioButton = new JRadioButton(string);
		leagueRadioButton.setEnabled(false);

		leagueRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = true;
				setEnableButton();

				competitionType = Competition.COMPETITION_TYPE.LEAGUE.toString();
			}
		});

		competitionTypePanel.add(leagueRadioButton);

		/*
		 * Campo coppa: radioButton
		 */
		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);

		cupRadioButton = new JRadioButton(string);
		cupRadioButton.setEnabled(false);

		cupRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = true;
				setEnableButton();

				competitionType = Competition.COMPETITION_TYPE.CUP.toString();
			}
		});


		competitionTypePanel.add(cupRadioButton);

		/*
		 * Campo supercoppa: radioButton
		 */
		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);

		supercupRadioButton = new JRadioButton(string);
		supercupRadioButton.setEnabled(false);


		supercupRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = true;
				setEnableButton();

				competitionType = Competition.COMPETITION_TYPE.SUPER_CUP.toString();
			}
		});

		competitionTypePanel.add(supercupRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		competitionTypeGroupButton = new ButtonGroup();

		competitionTypeGroupButton.add(leagueRadioButton);
		competitionTypeGroupButton.add(cupRadioButton);
		competitionTypeGroupButton.add(supercupRadioButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * CHECK BOX RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo squadra: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		teamTypeSearchCheckBox = new JCheckBox(string);
		teamTypeSearchCheckBox.setOpaque(true);
		teamTypeSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		teamTypeSearchCheckBox.setForeground(Color.white);
		teamTypeSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		teamTypeSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (teamTypeSearchCheckBox.isSelected()) {
					clubRadioButton.setEnabled(true);
					nationalRadioButton.setEnabled(true);
				} else {
					teamTypeSearchValid = false;
					setEnableButton();

					competitionTeamType = null;

					teamTypeGroupButton.clearSelection();
					clubRadioButton.setEnabled(false);
					nationalRadioButton.setEnabled(false);
				}
			}
		});

		competitionPanel.add(teamTypeSearchCheckBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo squadra: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50[]80[]20:push",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		competitionPanel.add(teamTypePanel);

		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setEnabled(false);

		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamTypeSearchValid = true;
				setEnableButton();

				competitionTeamType = Team.TEAM_TYPE.CLUB.toString();
			}
		});

		teamTypePanel.add(clubRadioButton);

		/*
		 * Campo nazionale: radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);
		nationalRadioButton.setEnabled(false);

		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamTypeSearchValid = true;
				setEnableButton();

				competitionTeamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});

		teamTypePanel.add(nationalRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		teamTypeGroupButton = new ButtonGroup();

		teamTypeGroupButton.add(clubRadioButton);
		teamTypeGroupButton.add(nationalRadioButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * CHECK BOX RICERCA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		countrySearchCheckBox = new JCheckBox(string);
		countrySearchCheckBox.setOpaque(true);
		countrySearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		countrySearchCheckBox.setForeground(Color.white);
		countrySearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		countrySearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (countrySearchCheckBox.isSelected()) {
					worldRadioButton.setEnabled(true);
					continentRadioButton.setEnabled(true);
					nationRadioButton.setEnabled(true);
				} else {
					countryTypeSearchValid = false;
					setEnableButton();

					competitionCountryID = null;

					countryGroupButton.clearSelection();
					worldRadioButton.setEnabled(false);
					continentRadioButton.setEnabled(false);
					nationRadioButton.setEnabled(false);
				}
			}
		});

		competitionPanel.add(countrySearchCheckBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50[]80[]20:push",
				"10[]20[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		competitionPanel.add(countryConfederationPanel);

		/*
		 * Campo mondo: radio button
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);
		worldRadioButton.setEnabled(false);

		worldRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				countryTypeSearchValid = true;
				setEnableButton();

				List<List<String>> world = Controller.getInstance().getCountryList
								(
												Country.COUNTRY_TYPE.WORLD.toString(),
												null,
												false
								);

				competitionCountryID = world.getFirst().getLast();
			}
		});

		countryConfederationPanel.add(worldRadioButton, "wrap");

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);
		continentRadioButton.setEnabled(false);

		continentRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (continentRadioButton.isSelected()) {
					fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
				} else {
					continentComboBox.setEnabled(false);
					continentComboBox.removeAllItems();
				}

				countryTypeSearchValid = false;
				setEnableButton();
			}
		});

		countryConfederationPanel.add(continentRadioButton);


		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<List<String>>();

		continentComboBox.setRenderer(new ComboBoxRenderer());
		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setEnabled(false);

		List<String> aa = new ArrayList<String>();
		aa.add("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

		continentComboBox.setPrototypeDisplayValue(aa);

		continentComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (continentComboBox.getSelectedIndex() != -1) {
					competitionCountryID = ((List<String>)continentComboBox.getSelectedItem()).getLast();

					if (nationRadioButton.isSelected()) {
						fillCountryComboBox(nationComboBox, Country.COUNTRY_TYPE.NATION.toString(), competitionCountryID);
					} else if (continentRadioButton.isSelected()) {
						countryTypeSearchValid = true;
						setEnableButton();
					}

				} else {
					countryTypeSearchValid = false;
					setEnableButton();

					competitionCountryID = null;
				}
			}
		});

		countryConfederationPanel.add(continentComboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);
		nationRadioButton.setEnabled(false);
		nationRadioButton.setActionCommand(Country.COUNTRY_TYPE.NATION.toString());

		nationRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationRadioButton.isSelected()) {
					fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
					nationComboBox.setEnabled(false);
				} else {
					continentComboBox.setEnabled(false);
					continentComboBox.removeAllItems();

					nationComboBox.setEnabled(false);
					nationComboBox.removeAllItems();
				}

				countryTypeSearchValid = false;
				setEnableButton();
			}
		});

		countryConfederationPanel.add(nationRadioButton);

		/*
		 * Campo nazione: combo box
		 */
		nationComboBox = new JComboBox<List<String>>();

		nationComboBox.setRenderer(new ComboBoxRenderer());
		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.setPrototypeDisplayValue(aa);

		nationComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationComboBox.getSelectedIndex() != -1) {
					countryTypeSearchValid = true;
					setEnableButton();

					competitionCountryID = ((List<String>) nationComboBox.getSelectedItem()).getLast();
				} else {
					countryTypeSearchValid = false;
					setEnableButton();
				}
			}
		});

		countryConfederationPanel.add(nationComboBox);


		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		countryGroupButton = new ButtonGroup();

		countryGroupButton.add(worldRadioButton);
		countryGroupButton.add(continentRadioButton);
		countryGroupButton.add(nationRadioButton);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		searchButton.setEnabled(false);


		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				List<List<String>> data = Controller.getInstance().getCompetitionList
					(
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryID,
						true
					);

				competitionTable.setModel(new TableModel("competitions", data));
				competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());
				competitionTablePanel.revalidate();
			}
		});

		competitionPanel.add(searchButton);

		/*
		 * Campo tabella competizioni: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		competitionTablePanel = new JPanel(migLayout);
		competitionTablePanel.setBackground(panelColor);

		add(competitionTablePanel);

		/*
		 * Campo tabella paesi: table
		 */
		competitionTable = new JTable(new TableModel("competitions", null));

		competitionTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());
		competitionTable.setFillsViewportHeight(true);
		competitionTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(competitionTable);

		competitionTablePanel.add(scrollPane);
	}


	public void setEnableButton()
	{
		if (nameSearchValid || competitionTypeSearchValid || teamTypeSearchValid || countryTypeSearchValid) {
			searchButton.setEnabled(true);
		} else {
			searchButton.setEnabled(false);
		}
	}


	public void fillCountryComboBox(JComboBox<List<String>> comboBox, String type, String superCountryID)
	{
		List<List<String>> nameCountryList = Controller.getInstance().getCountryList
						(
										type,
										superCountryID,
										false
						);

		for (List<String> countryList : nameCountryList) {
			comboBox.addItem(countryList);
		}

		comboBox.setSelectedIndex(-1);
		comboBox.setEnabled(true);
	}
}
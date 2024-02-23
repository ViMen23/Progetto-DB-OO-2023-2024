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
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.List;


public class SearchCompetitionPanel
				extends JPanel
{
	protected final Color panelColor = Color.white;
	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	protected final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
	protected final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	protected JPanel competitionPanel;
	protected JPanel namePanel;
	protected JPanel competitionTypePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel competitionTablePanel;

	protected JButton titleButton;
	protected JButton nameFieldResetButton;
	protected JButton competitionTypeResetButton;
	protected JButton teamTypeResetButton;
	protected JButton countryResetButton;
	protected JButton searchButton;

	protected JLabel nameSearchLabel;
	protected JLabel errorLabel;
	protected JLabel competitionTypeLabel;
	protected JLabel teamTypeSearchLabel;
	protected JLabel countrySearchLabel;

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

	protected Boolean nameSearchValid = false;
	protected Boolean competitionTypeSearchValid = false;
	protected Boolean teamTypeSearchValid = false;
	protected Boolean countryTypeSearchValid = false;


	protected String competitionSubName = null;
	protected String competitionType = null;
	protected String competitionTeamType = null;
	protected String competitionCountryType = null;
	protected String competitionCountryID = null;
	protected String competitionContinentID = null;

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
				"0[]0[]10[]0[]10[]0[]10[]0[]20[]0"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setOpaque(false);

		add(competitionPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: label
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchLabel = new JLabel(string);
		nameSearchLabel.setOpaque(true);
		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchLabel.setForeground(Color.white);
		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(nameSearchLabel);
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
				"50:push[]80[]10[]70[]20:push",
				"10[]10"
			);


		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		competitionPanel.add(namePanel);

		/*
		 * Campo nome: label
		 */
		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome: textField
		 */
		nameTextField = new JTextField(GuiConfiguration.getInputColumn());

		nameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternAlnum.matcher(nameTextField.getText()).find()) {
					nameSearchValid = true;
					searchButton.setEnabled(true);

					competitionSubName = nameTextField.getText();
					errorLabel.setVisible(false);
				} else {
					nameSearchValid = false;
					setEnableButton();

					competitionSubName = null;
					errorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(nameTextField);

		/*
		 * Campo errore regex: label
		 */
		errorLabel = new JLabel(errorIcon);

		namePanel.add(errorLabel);

		/*
		 * Campo bottone reset: button
		 */
		nameFieldResetButton = new JButton(resetIcon);
		nameFieldResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				nameSearchValid = false;
				setEnableButton();

				competitionSubName = null;
				nameTextField.setText(null);
			}
		});

		namePanel.add(nameFieldResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo di competizione: panel
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		competitionTypeLabel = new JLabel(string);
		competitionTypeLabel.setOpaque(true);
		competitionTypeLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		competitionTypeLabel.setForeground(Color.white);
		competitionTypeLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(competitionTypeLabel);
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
				"50:push[]80[]80[]80[]20:push",
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
		leagueRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = true;
				searchButton.setEnabled(true);

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
		cupRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = true;
				searchButton.setEnabled(true);

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
		supercupRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = true;
				searchButton.setEnabled(true);

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

		/*
		 * Campo bottone reset: button
		 */
		competitionTypeResetButton = new JButton(resetIcon);

		competitionTypeResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTypeSearchValid = false;
				setEnableButton();

				competitionType = null;
				competitionTypeGroupButton.clearSelection();
			}
		});

		competitionTypePanel.add(competitionTypeResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo squadra: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		teamTypeSearchLabel = new JLabel(string);
		teamTypeSearchLabel.setOpaque(true);
		teamTypeSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		teamTypeSearchLabel.setForeground(Color.white);
		teamTypeSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(teamTypeSearchLabel);
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
				"50:push[]80[]80[]20:push",
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
		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamTypeSearchValid = true;
				searchButton.setEnabled(true);

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
		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamTypeSearchValid = true;
				searchButton.setEnabled(true);

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

		/*
		 * Campo bottone reset: button
		 */
		teamTypeResetButton = new JButton(resetIcon);

		teamTypeResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamTypeSearchValid = false;
				setEnableButton();

				competitionTeamType = null;
				teamTypeGroupButton.clearSelection();
			}
		});

		teamTypePanel.add(teamTypeResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER PAESE
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

		countrySearchLabel = new JLabel(string);
		countrySearchLabel.setOpaque(true);
		countrySearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		countrySearchLabel.setForeground(Color.white);
		countrySearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(countrySearchLabel);
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
				"50:push[]80[]20:push",
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
		worldRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				countryTypeSearchValid = true;
				searchButton.setEnabled(true);

				competitionCountryType = Country.COUNTRY_TYPE.WORLD.toString();
			}
		});

		countryConfederationPanel.add(worldRadioButton);

		/*
		 * Campo bottone reset: button
		 */
		countryResetButton = new JButton(resetIcon);
		countryResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				countryTypeSearchValid = false;
				setEnableButton();

				competitionCountryType = null;
				competitionCountryID = null;
				countryGroupButton.clearSelection();
			}
		});

		countryConfederationPanel.add(countryResetButton);

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);
		continentRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (continentRadioButton.isSelected()) {

					countryTypeSearchValid = true;
					searchButton.setEnabled(true);

					continentComboBox.setEnabled(true);

					continentComboBox.firePopupMenuWillBecomeVisible();

					competitionCountryType = Country.COUNTRY_TYPE.CONTINENT.toString();

				} else {
					continentComboBox.setEnabled(false);
					continentComboBox.setSelectedIndex(-1);
					competitionCountryID = null;
				}
			}
		});

		countryConfederationPanel.add(continentRadioButton);


		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<List<String>>();
		continentComboBox.setEnabled(false);

		continentComboBox.setRenderer(new ComboBoxRenderer());

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				continentComboBox.removeAllItems();
				fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				competitionContinentID = ((List<String>) continentComboBox.getSelectedItem()).getLast();

				competitionCountryID = competitionContinentID;

				if (nationRadioButton.isSelected()) {

					if (competitionCountryID == null) {
						nationComboBox.setEnabled(false);
						nationComboBox.setSelectedIndex(-1);
					}
					else {
						nationComboBox.setEnabled(true);
						nationComboBox.firePopupMenuWillBecomeVisible();
					}
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryConfederationPanel.add(continentComboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);
		nationRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationRadioButton.isSelected()){
					countryTypeSearchValid = true;
					searchButton.setEnabled(true);

					continentComboBox.setEnabled(true);

					continentComboBox.firePopupMenuWillBecomeVisible();

					competitionCountryType = Country.COUNTRY_TYPE.NATION.toString();
				}
				else {
					continentComboBox.setEnabled(false);
					continentComboBox.setSelectedIndex(-1);

					nationComboBox.setEnabled(false);
					nationComboBox.setSelectedIndex(-1);

					competitionCountryID = null;
				}
			}
		});

		countryConfederationPanel.add(nationRadioButton);

		/*
		 * Campo nazione: combo box
		 */
		nationComboBox = new JComboBox<List<String>>();
		nationComboBox.setEnabled(false);

		nationComboBox.setRenderer(new ComboBoxRenderer());
		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				nationComboBox.removeAllItems();
				fillCountryComboBox(nationComboBox, Country.COUNTRY_TYPE.NATION.toString(), competitionCountryID);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				String tmp = ((List<String>) nationComboBox.getSelectedItem()).getLast();

				if (tmp != null) {
					competitionCountryID = tmp;
				}
				else {
					competitionCountryID = competitionContinentID;
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryConfederationPanel.add(nationComboBox);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		countryGroupButton = new ButtonGroup();

		countryGroupButton.add(worldRadioButton);
		countryGroupButton.add(continentRadioButton);
		countryGroupButton.add(nationRadioButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/

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
						competitionCountryType,
						competitionCountryID,
						true
					);

				competitionTable.setModel(new TableModel("competitions", data));
				competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());
				competitionTablePanel.revalidate();
			}
		});

		competitionPanel.add(searchButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA
		 *------------------------------------------------------------------------------------------------------*/

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
		/*------------------------------------------------------------------------------------------------------*/
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
		comboBox.addItem(GuiConfiguration.getListStringSelectAll());

		List<List<String>> nameCountryList = Controller.getInstance().getCountryList
			(
				type,
				superCountryID,
				false
			);

		for (List<String> countryList: nameCountryList) {
			comboBox.addItem(countryList);
		}

	}
}
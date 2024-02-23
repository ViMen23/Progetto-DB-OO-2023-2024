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
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;


public class SearchCompetitionPanel
				extends JPanel
{
	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	private final JPanel competitionPanel;
	private final JPanel namePanel;
	private final JPanel competitionTypePanel;
	private final JPanel teamTypePanel;
	private final JPanel countryConfederationPanel;
	private final JPanel competitionTablePanel;

	private final JButton titleButton;
	private final JButton nameFieldResetButton;
	private final JButton competitionTypeResetButton;
	private final JButton teamTypeResetButton;
	private final JButton countryResetButton;
	private final JButton searchButton;

	private final JLabel nameSearchLabel;
	private final JLabel errorLabel;
	private final JLabel competitionTypeLabel;
	private final JLabel teamTypeSearchLabel;
	private final JLabel countrySearchLabel;
	private final JLabel titleTable;

	private final JRadioButton leagueRadioButton;
	private final JRadioButton cupRadioButton;
	private final JRadioButton supercupRadioButton;
	private final JRadioButton clubRadioButton;
	private final JRadioButton nationalRadioButton;
	private final JRadioButton worldRadioButton;
	private final JRadioButton continentRadioButton;
	private final JRadioButton nationRadioButton;

	private final JTextField nameTextField;

	private final ButtonGroup competitionTypeGroupButton;
	private final ButtonGroup teamTypeGroupButton;
	private final ButtonGroup countryGroupButton;

	private final JComboBox<String> continentComboBox;

	private final Vector<String> competitionContinentVector = new Vector<>();
	private final Map<String, String> competitionContinentMap = new HashMap<>();

	private final JComboBox<String> nationComboBox;

	private final Vector<String> competitionNationVector = new Vector<>();
	private final Map<String, String> competitionNationMap = new HashMap<>();


	private final JLabel label;
	private final JTable competitionTable;
	private final Vector<String> competitionTableColumnName = new Vector<>();
	private final Vector<Vector<String>> competitionTableData = new Vector<>();

	private final JScrollPane scrollPane;

	private Boolean nameSearchValid = false;
	private Boolean competitionTypeSearchValid = false;
	private Boolean teamTypeSearchValid = false;
	private Boolean countryTypeSearchValid = false;


	private String competitionSubName = null;
	private String competitionType = null;
	private String competitionTeamType = null;
	private String competitionCountryType = null;
	private String competitionNationID = null;
	private String competitionContinentID = null;

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
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

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
		nameFieldResetButton.setCursor(GuiConfiguration.getButtonCursor());
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
		leagueRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
		cupRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
		supercupRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
		competitionTypeResetButton.setCursor(GuiConfiguration.getButtonCursor());

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
		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
		teamTypeResetButton.setCursor(GuiConfiguration.getButtonCursor());

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
		worldRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
		countryResetButton.setCursor(GuiConfiguration.getButtonCursor());
		countryResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				countryTypeSearchValid = false;
				setEnableButton();

				competitionCountryType = null;
				competitionNationID = null;
				competitionContinentID = null;

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
		continentRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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
					competitionNationID = null;
				}
			}
		});

		countryConfederationPanel.add(continentRadioButton);


		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<String>();
		continentComboBox.setEnabled(false);

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						continentComboBox,
						competitionContinentVector,
						competitionContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				competitionContinentID = competitionContinentMap.get( (String) continentComboBox.getSelectedItem() );


				if (nationRadioButton.isSelected()) {

					if (competitionContinentID == null) { //È STATO SELEZIONATO MOSTRA TUTTO

						nationComboBox.setEnabled(false);
						nationComboBox.setSelectedIndex(-1);
						competitionNationID = null;
					}
					else {

						nationComboBox.setEnabled(true);
						nationComboBox.firePopupMenuWillBecomeVisible();
						competitionNationID = null;
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
		nationRadioButton.setCursor(GuiConfiguration.getButtonCursor());
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

					competitionContinentID = null;
					competitionNationID = null;
				}
			}
		});

		countryConfederationPanel.add(nationRadioButton);

		/*
		 * Campo nazione: combo box
		 */
		nationComboBox = new JComboBox<String>();
		nationComboBox.setEnabled(false);

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

				fillCountryComboBox
					(
						nationComboBox,
						competitionNationVector,
						competitionNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						competitionContinentID
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				competitionNationID = competitionNationMap.get((String) nationComboBox.getSelectedItem());

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
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		searchButton.setEnabled(false);

		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionTableColumnName.clear();
				competitionTableData.clear();

				Controller.getInstance().setCompetitionTable
					(
						competitionTableColumnName,
						competitionTableData,
						competitionSubName,
						competitionType,
						competitionTeamType,
						competitionCountryType,
						competitionContinentID,
						competitionNationID
					);

				competitionTable.setModel(new TableModel(competitionTableData, competitionTableColumnName));
				competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());

				GuiConfiguration.setTitleTable(titleTable, "competitions", competitionTableData.size());

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
		 * Campo titolo tabella paesi: label
		 */
		string = GuiConfiguration.getMessage("no");
		string += " ";
		string += GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("performed");
		string = string.toUpperCase();

		titleTable = new JLabel(string);

		titleTable.setOpaque(true);
		titleTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titleTable.setForeground(Color.white);

		titleTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionTablePanel.add(titleTable);

		/*
		 * Campo tabella paesi: table
		 */
		competitionTable = new JTable();

		competitionTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());
		competitionTable.setFillsViewportHeight(true);

		competitionTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		competitionTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) competitionTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);


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

	public void fillCountryComboBox(JComboBox<String> comboBox,
									Vector<String> competitionVector,
									Map<String, String> competitionMap,
									String type,
									String superCountryID)
	{

		GuiConfiguration.initComboBoxVector(competitionVector, competitionMap);

		Controller.getInstance().setCountryComboBox
			(
				competitionVector,
				competitionMap,
				type,
				superCountryID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(competitionVector));
	}
}
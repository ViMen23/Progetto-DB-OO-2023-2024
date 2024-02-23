package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.util.List;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SearchTeamPanel
				extends JPanel
{

	protected final Color panelColor = Color.white;
	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	protected final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
	protected final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	protected JPanel teamPanel;
	protected JPanel namePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel teamTablePanel;


	protected JButton titleButton;
	protected JButton longNameResetButton;
	protected JButton shortNameResetButton;
	protected JButton teamTypeResetButton;
	protected JButton countryResetButton;
	protected JButton searchButton;

	protected JLabel nameSearchLabel;
	protected JLabel longNameErrorLabel;
	protected JLabel shortNameErrorLabel;

	protected JLabel teamTypeSearchLabel;
	protected JLabel nationConfederationSearchLabel;

	protected JTextField longNameTextField;
	protected JTextField shortNameTextField;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;
	protected JComboBox<List<String>> continentComboBox;
	protected JComboBox<List<String>> nationComboBox;

	protected JTable teamTable;
	protected JScrollPane scrollPane;

	protected ButtonGroup buttonGroup;

	protected JLabel label;

	protected Boolean longNameSearchValid = false;
	protected Boolean shortNameSearchValid = false;
	protected Boolean teamTypeSearchValid = false;
	protected Boolean countryTypeSearchValid = false;


	protected String teamSubLongName = null;
	protected String teamSubShortName = null;

	protected String teamType = null;
	protected String teamCountryType = null;
	protected String teamCountryID = null;
	protected String teamContinentType = null;
	protected String teamContinentID = null;



	public SearchTeamPanel()
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
		setName("searchTeamPanel");

		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("teams");
		string += " - ";
		string += GuiConfiguration.getMessage("teams");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countTeams().toString();
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				if (teamPanel.isShowing()){
					remove(teamPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else{
					add(teamPanel, 1);
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
				"0[]0[]10[]0[]10[]0[]20[]20"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setOpaque(false);

		add(teamPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: checkBox
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

		teamPanel.add(nameSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 4",
				"50:push[]80[]10[]70[]20:push",
				"10[]20[]10"
			);

		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		teamPanel.add(namePanel);

		/*
		 * Campo nome esteso: stampa
		 */
		string = GuiConfiguration.getMessage("longName");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome esteso: textField
		 */
		longNameTextField = new JTextField(GuiConfiguration.getInputColumn());
		longNameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternAlnum.matcher(longNameTextField.getText()).find()) {

					longNameSearchValid = true;
					searchButton.setEnabled(true);

					teamSubLongName = longNameTextField.getText();
					longNameErrorLabel.setVisible(false);
				}
				else {
					longNameSearchValid = false;
					setEnableButton();

					teamSubLongName = null;
					longNameErrorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(longNameTextField);

		/*
		 * Campo errore regex: label
		 */
		longNameErrorLabel = new JLabel(errorIcon);

		namePanel.add(longNameErrorLabel);

		/*
		 * Campo bottone reset: button
		 */
		longNameResetButton = new JButton(resetIcon);
		longNameResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				longNameSearchValid = false;
				setEnableButton();

				teamSubLongName = null;
				longNameTextField.setText(null);
			}
		});

		namePanel.add(longNameResetButton);

		/*
		 * Campo nome abbreviato: stampa
		 */
		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome abbreviato: textField
		 */
		shortNameTextField = new JTextField(GuiConfiguration.getInputColumn());

		shortNameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternCode.matcher(shortNameTextField.getText()).find()) {

					shortNameSearchValid = true;
					searchButton.setEnabled(true);

					teamSubShortName = shortNameTextField.getText();
					shortNameErrorLabel.setVisible(false);
				}
				else {

					shortNameSearchValid = false;
					setEnableButton();

					teamSubShortName = null;
					shortNameErrorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(shortNameTextField);

		/*
		 * Campo errore regex: label
		 */
		shortNameErrorLabel = new JLabel(errorIcon);

		namePanel.add(shortNameErrorLabel);

		/*
		 * Campo bottone reset: button
		 */
		shortNameResetButton = new JButton(resetIcon);
		shortNameResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				shortNameSearchValid = false;
				setEnableButton();

				teamSubShortName = null;
				shortNameTextField.setText(null);
			}
		});

		namePanel.add(shortNameResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo squadra: label
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

		teamPanel.add(teamTypeSearchLabel);

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

		teamPanel.add(teamTypePanel);

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

				teamType = Team.TEAM_TYPE.CLUB.toString();
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

				teamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});

		teamTypePanel.add(nationalRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(clubRadioButton);
		buttonGroup.add(nationalRadioButton);

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

				teamType = null;
				buttonGroup.clearSelection();
			}
		});

		teamTypePanel.add(teamTypeResetButton);
		/*------------------------------------------------------------------------------------------------------*/

		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NAZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nazione e confederazione: label
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		nationConfederationSearchLabel = new JLabel(string);

		nationConfederationSearchLabel.setOpaque(true);
		nationConfederationSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nationConfederationSearchLabel.setForeground(Color.white);
		nationConfederationSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		teamPanel.add(nationConfederationSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NAZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nazione e confederazione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 3",
				"50:push[]80[]80[]20:push",
				"10[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		teamPanel.add(countryConfederationPanel);

		/*
		 * Campo continente: stampa
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);

		/*
		 * Campo continente: comboBox
		 */
		continentComboBox = new JComboBox<List<String>>();

		continentComboBox.setRenderer(new ComboBoxRenderer());

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				continentComboBox.removeAllItems();
				fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);

				countryTypeSearchValid = true;
				searchButton.setEnabled(true);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				teamContinentID   = ((List<String>) continentComboBox.getSelectedItem()).getLast();
				teamContinentType = Country.COUNTRY_TYPE.CONTINENT.toString();

				teamCountryID = teamContinentID;
				teamCountryType = teamContinentType;

				if (teamContinentID == null) {
					nationComboBox.setEnabled(false);
					nationComboBox.setSelectedIndex(-1);
				}
				else {
					nationComboBox.setEnabled(true);
					nationComboBox.firePopupMenuWillBecomeVisible();
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryConfederationPanel.add(continentComboBox);

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

				continentComboBox.setSelectedIndex(-1);
				nationComboBox.setEnabled(false);
				nationComboBox.setSelectedIndex(-1);

				teamCountryType = null;
				teamCountryID = null;
				teamContinentID = null;
				teamContinentType = null;
			}
		});

		countryConfederationPanel.add(countryResetButton, "spany 2");


		/*
		 * Campo nazione: stampa
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);

		/*
		 * Campo nazione: comboBox
		 */
		nationComboBox = new JComboBox<List<String>>();

		nationComboBox.setRenderer(new ComboBoxRenderer());
		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				nationComboBox.removeAllItems();
				fillCountryComboBox(nationComboBox, Country.COUNTRY_TYPE.NATION.toString(), teamCountryID);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				String tmp = ((List<String>) nationComboBox.getSelectedItem()).getLast();

				if (tmp != null) {
					teamCountryID = tmp;
					teamCountryType = Country.COUNTRY_TYPE.NATION.toString();
				}
				else {
					teamCountryType = teamContinentType;
					teamCountryID = teamContinentID;
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryConfederationPanel.add(nationComboBox);
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
				List<List<String>> data = Controller.getInstance().getTeamList
					(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamCountryType,
						teamCountryID,
						true
					);

				System.out.println("teamCountryType -> " + teamCountryType);
				System.out.println("teamCountryID -> " + teamCountryID);

				teamTable.setModel(new TableModel("teams", data));
				teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());
				teamTablePanel.revalidate();

			}
		});

		teamPanel.add(searchButton);
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

		teamTablePanel = new JPanel(migLayout);
		teamTablePanel.setBackground(panelColor);

		add(teamTablePanel);

		/*
		 * Campo tabella paesi: table
		 */
		teamTable = new JTable(new TableModel("teams", null));

		teamTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());
		teamTable.setFillsViewportHeight(true);
		teamTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(teamTable);

		teamTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void setEnableButton()
	{
		if (longNameSearchValid || shortNameSearchValid || teamTypeSearchValid || countryTypeSearchValid) {
			searchButton.setEnabled(true);
		}
		else {
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

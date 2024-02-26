
package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
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

/**
 * TYPE : class - gui package
 * NAME : ChooseYearRangePanel
 *
 * DESC: Pannello per l'interfaccia di scelta di un intervallo di tempo
 *       compreso tra due anni
 */

public class CompetitionEditionFilterPanel
				extends JPanel
{
	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	private final JPanel titlePanel;
	private final JPanel competitionEditionPanel;
	private final JPanel teamTypePanel;
	private final JPanel seasonPanel;
	private final JPanel countryPanel;
	private final JPanel competitionPanel;
	private final JPanel playerTablePanel;

	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private final JRadioButton clubRadioButton;
	private final JRadioButton nationalRadioButton;
	private final JRadioButton worldRadioButton;
	private final JRadioButton continentRadioButton;
	private final JRadioButton nationRadioButton;

	private final JComboBox<String> seasonComboBox;
	private final JComboBox<String> continentComboBox;
	private final JComboBox<String> nationComboBox;
	private final JComboBox<String> competitionComboBox;


	private final Vector<String> continentVector = new Vector<>();
	private final Vector<String> nationVector = new Vector<>();
	private final Vector<String> competitionVector = new Vector<>();
	private final Vector<String> seasonVector = new Vector<>();

	private final Map<String, String> continentMap = new HashMap<>();
	private final Map<String, String> nationMap = new HashMap<>();
	private final Map<String, String> competitionMap = new HashMap<>();
	private final Map<String, String> seasonMap = new HashMap<>();

	private final ButtonGroup teamTypeButtonGroup;
	private final ButtonGroup countryTypeButtonGroup;

	private final JLabel titleTableLabel;
	private final JTable playerTable;
	private final Vector<String> playerTableColumnName = new Vector<>();
	private final Vector<Vector<String>> playerTableData = new Vector<>();

	private final JScrollPane scrollPane;




	private JPanel infoPanel;

	private JLabel label;

	private String teamType;
	private String countryType;
	private String continentID;
	private String nationID;
	private String competitionID;
	private String seasonStartYear;

	public CompetitionEditionFilterPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[]0",
				"10[]10[]0[]10"
			);

		setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"0[]110[]0",
				"10[]10"
			);

		titlePanel = new JPanel(migLayout);
		titlePanel.setOpaque(true);
		titlePanel.setBackground(panelColor);

		add(titlePanel, "sgx general, dock north");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("stepFilter");
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		titlePanel.add(titleButton, "width 80%");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (competitionEditionPanel.isShowing()) {
					remove(competitionEditionPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(competitionEditionPanel,"dock center, sgx general");
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER STEPFILTER PANEL
		 *------------------------------------------------------------------------------------------------------*/



		resetButton = new JButton(resetIcon);
		resetButton.setCursor(GuiConfiguration.getButtonCursor());

		titlePanel.add(resetButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				MainFrame.getMainFrameInstance().remove(component);

				CompetitionEditionFilterPanel competitionEditionFilterPanel = new CompetitionEditionFilterPanel();

				MainFrame.getMainFrameInstance().add(competitionEditionFilterPanel, "sgx frame");
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRO GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[60%, fill]50[35%, fill]10",
				"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0"
			);

		competitionEditionPanel = new JPanel(migLayout);
		competitionEditionPanel.setOpaque(false);

		add(competitionEditionPanel, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"5%[15%]10%[15%]5%",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		competitionEditionPanel.add(teamTypePanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA CLUB
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(clubRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (teamType != null) {
					resetFromTeamType();
				}

				teamType = Team.TEAM_TYPE.CLUB.toString();

				worldRadioButton.setEnabled(true);
				continentRadioButton.setEnabled(true);
				nationRadioButton.setEnabled(true);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA NAZIONALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);
		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(nationalRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (teamType != null) {
					resetFromTeamType();
				}

				teamType = Team.TEAM_TYPE.NATIONAL.toString();

				worldRadioButton.setEnabled(true);
				continentRadioButton.setEnabled(true);
				nationRadioButton.setEnabled(true);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/


		teamTypeButtonGroup = new ButtonGroup();

		teamTypeButtonGroup.add(clubRadioButton);
		teamTypeButtonGroup.add(nationalRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionEditionPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = "2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10:push[40%]5%",
				"10[]20[]20[]10"
			);

		countryPanel = new JPanel(migLayout);
		countryPanel.setBackground(panelColor);

		competitionEditionPanel.add(countryPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE MONDO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);
		worldRadioButton.setEnabled(false);

		countryPanel.add(worldRadioButton, "wrap");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		worldRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (worldRadioButton.isSelected()) {
					countryType = Country.COUNTRY_TYPE.WORLD.toString();

					competitionComboBox.setEnabled(true);
				}
				else {
					resetFromCountry();
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);
		continentRadioButton.setEnabled(false);

		countryPanel.add(continentRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (continentRadioButton.isSelected()) {

					countryType = Country.COUNTRY_TYPE.CONTINENT.toString();

					continentComboBox.setEnabled(true);
				}
				else {
					continentComboBox.setEnabled(false);

					continentComboBox.setSelectedIndex(-1);

					continentID = null;

					resetFromCountry();
				}

			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox = new JComboBox<>();
		continentComboBox.setEnabled(false);

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		countryPanel.add(continentComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillCountryComboBox
					(
						continentComboBox,
						continentVector,
						continentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						false
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (continentID != null) {
					resetFromCountry();
				}

				continentID = continentMap.get((String) continentComboBox.getSelectedItem());

				if (continentRadioButton.isSelected()) {
					competitionComboBox.setEnabled(true);
				}
				else if (nationRadioButton.isSelected()) {

					nationComboBox.setEnabled(true);

					nationComboBox.setSelectedIndex(-1);

					nationID = null;
				}
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);
		nationRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		nationRadioButton.setEnabled(false);

		countryPanel.add(nationRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationRadioButton.isSelected()) {
					countryType = Country.COUNTRY_TYPE.NATION.toString();

					continentComboBox.setEnabled(true);
				}
				else {
					continentComboBox.setEnabled(false);
					nationComboBox.setEnabled(false);

					continentComboBox.setSelectedIndex(-1);
					nationComboBox.setSelectedIndex(-1);

					continentID = null;
					nationID = null;

					resetFromCountry();
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox = new JComboBox<>();
		nationComboBox.setEnabled(false);

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		countryPanel.add(nationComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillCountryComboBox
					(
						nationComboBox,
						nationVector,
						nationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						continentID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (nationID != null) {
					resetFromCountry();
				}

				nationID = nationMap.get((String) nationComboBox.getSelectedItem());

				competitionComboBox.setEnabled(true);
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO PAESE
		 *------------------------------------------------------------------------------------------------------*/



		countryTypeButtonGroup = new ButtonGroup();

		countryTypeButtonGroup.add(worldRadioButton);
		countryTypeButtonGroup.add(continentRadioButton);
		countryTypeButtonGroup.add(nationRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionEditionPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/


		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[][]10"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setBackground(panelColor);

		competitionEditionPanel.add(competitionPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("competition");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		competitionPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		competitionComboBox = new JComboBox<>();
		competitionComboBox.setEnabled(false);

		competitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		competitionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		competitionPanel.add(competitionComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		competitionComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCompetitionComboBox
					(
						competitionComboBox,
						competitionVector,
						competitionMap,
						null,
						null,
						teamType,
						countryType,
						continentID,
						nationID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (competitionID != null) {
					resetFromCompetition();
				}

				competitionID = competitionMap.get((String) competitionComboBox.getSelectedItem());


				if (competitionID != null) {
					seasonComboBox.setEnabled(true);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRO PER COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionEditionPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = "4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string +=  GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionEditionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[]10"
			);

		seasonPanel = new JPanel(migLayout);
		seasonPanel.setBackground(panelColor);

		competitionEditionPanel.add(seasonPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("season");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		seasonPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox = new JComboBox<>();
		seasonComboBox.setEnabled(false);

		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		seasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		seasonPanel.add(seasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
					seasonComboBox.removeAllItems();
				}

				fillSeasonComboBox
					(
						seasonComboBox,
						seasonVector,
						seasonMap,
						competitionID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

				if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
					seasonStartYear = seasonMap.get((String) seasonComboBox.getSelectedItem());
				}
				else {
					seasonStartYear = (String) seasonComboBox.getSelectedItem();
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRO PER STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionEditionPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		competitionEditionPanel.add(searchButton, "span 2");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				//fillPlayerTable(playerTableData, playerTableColumnName, playerTable, "competitionEditionPlayerStatistics");

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		playerTablePanel = new JPanel(migLayout);
		playerTablePanel.setBackground(panelColor);

		add(playerTablePanel, "dock south, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("no");
		string += " ";
		string += GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("performed");
		string = string.toUpperCase();

		titleTableLabel = new JLabel(string);

		titleTableLabel.setOpaque(true);
		titleTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		titleTableLabel.setForeground(Color.white);

		titleTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerTablePanel.add(titleTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		playerTable = new JTable();

		playerTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());
		playerTable.setFillsViewportHeight(true);

		playerTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		playerTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) playerTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerTable);

		playerTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/

	}

	public void resetFromTeamType()
	{
		worldRadioButton.setEnabled(false);
		continentRadioButton.setEnabled(false);
		nationRadioButton.setEnabled(false);

		countryTypeButtonGroup.clearSelection();

		countryType = null;

		resetFromCountry();
	}

	public void resetFromCountry()
	{
		competitionComboBox.setEnabled(false);

		competitionComboBox.setSelectedIndex(-1);

		competitionID = null;

		resetFromCompetition();
	}
	public void resetFromCompetition() {
		seasonComboBox.setEnabled(false);

		seasonComboBox.setSelectedIndex(-1);

		seasonStartYear = null;
	}

	public void fillCompetitionComboBox(JComboBox<String> comboBox,
										Vector<String> vector,
										Map<String, String> map,
										String competitionSubName,
										String competitionType,
										String competitionTeamType,
										String competitionCountryType,
										String competitionContinentID,
										String competitionNationID,
										Boolean selectAll)
	{
		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setCompetitionComboBox
			(
				vector,
				map,
				competitionSubName,
				competitionType,
				competitionTeamType,
				competitionCountryType,
				competitionContinentID,
				competitionNationID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}

	public void fillSeasonComboBox(JComboBox<String> comboBox,
								   Vector<String> vector,
								   Map<String, String> map,
								   String competitionID,
								   Boolean selectAll)
	{
		String season;

		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setCompetitionEditionComboBox(vector, competitionID);


		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			for (String string : vector) {

				Integer year = Integer.valueOf(string);

				season = year.toString();
				season += " - ";

				year = (++year)%100;

				season += year.toString();

				comboBox.addItem(season);

				map.put(season, string);
			}
		}
		else {
			comboBox.setModel(new DefaultComboBoxModel<>(vector));
		}
	}


	public void fillPlayerTable()
	{
		//TODO
	}
}

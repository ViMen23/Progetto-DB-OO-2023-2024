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
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	private final JPanel titlePanel;
	private final JPanel competitionPanel;
	private final JPanel namePanel;
	private final JPanel competitionTypePanel;
	private final JPanel teamTypePanel;
	private final JPanel countryConfederationPanel;
	private final JPanel competitionTablePanel;

	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private final JLabel nameSearchLabel;
	private final JLabel competitionTypeLabel;
	private final JLabel teamTypeSearchLabel;
	private final JLabel countrySearchLabel;
	private final JLabel titleTableLabel;

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
	private final JComboBox<String> nationComboBox;

	private final Vector<String> competitionContinentVector = new Vector<>();
	private final Vector<String> competitionNationVector = new Vector<>();
	private final Map<String, String> competitionContinentMap = new HashMap<>();
	private final Map<String, String> competitionNationMap = new HashMap<>();


	private final JTable competitionTable;
	private final Vector<String> competitionTableColumnName = new Vector<>();
	private final Vector<Vector<String>> competitionTableData = new Vector<>();

	private final JScrollPane scrollPane;

	private JPanel infoPanel;
	private JLabel label;


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

		titlePanel.add(titleButton, "width 80%");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (competitionPanel.isShowing()){
					remove(competitionPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else{
					add(competitionPanel, "dock center, sgx general");
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER COUNTRY PANEL
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
				nameTextField.setText(null);
				competitionSubName = null;

				competitionTypeGroupButton.clearSelection();
				competitionType = null;


				teamTypeGroupButton.clearSelection();
				competitionTeamType = null;

				countryGroupButton.clearSelection();
				competitionCountryType = null;

				continentComboBox.setEnabled(false);
				continentComboBox.setSelectedIndex(-1);
				competitionContinentID = null;

				nationComboBox.setEnabled(false);
				nationComboBox.setSelectedIndex(-1);
				competitionNationID = null;
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[60%, fill]50[35%, fill]10",
				"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setOpaque(false);

		add(competitionPanel, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchLabel = new JLabel(string);

		nameSearchLabel.setOpaque(true);
		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchLabel.setForeground(Color.white);

		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(nameSearchLabel, "sgx panel_first_column");
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

		competitionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10%[40%]20%",
				"10[]10"
			);

		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		competitionPanel.add(namePanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NOME
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TEXTFIELD NOME
		 *------------------------------------------------------------------------------------------------------*/



		nameTextField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(nameTextField);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternAlnum.matcher(nameTextField.getText()).find()) {
					competitionSubName = nameTextField.getText();
				} else {
					competitionSubName = null;
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



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
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER TIPO COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"30[20%, center]80[20%, center]80[20%, center]30",
				"10[]10"
			);

		competitionTypePanel = new JPanel(migLayout);

		competitionTypePanel.setBackground(panelColor);

		competitionPanel.add(competitionTypePanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO COMPETIZIONE CAMPIONATO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);

		leagueRadioButton = new JRadioButton(string);
		leagueRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		competitionTypePanel.add(leagueRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		leagueRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionType = Competition.COMPETITION_TYPE.LEAGUE.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO COMPETIZIONE COPPA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);

		cupRadioButton = new JRadioButton(string);
		cupRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		competitionTypePanel.add(cupRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		cupRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionType = Competition.COMPETITION_TYPE.CUP.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO COMPETIZIONE SUPERCOPPA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);

		supercupRadioButton = new JRadioButton(string);
		supercupRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		competitionTypePanel.add(supercupRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		supercupRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionType = Competition.COMPETITION_TYPE.SUPER_CUP.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		competitionTypeGroupButton = new ButtonGroup();

		competitionTypeGroupButton.add(leagueRadioButton);
		competitionTypeGroupButton.add(cupRadioButton);
		competitionTypeGroupButton.add(supercupRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER TIPO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

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
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"30[20%, center]80[20%, center]30",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		competitionPanel.add(teamTypePanel);
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
				competitionTeamType = Team.TEAM_TYPE.CLUB.toString();
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
				competitionTeamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		teamTypeGroupButton = new ButtonGroup();

		teamTypeGroupButton.add(clubRadioButton);
		teamTypeGroupButton.add(nationalRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



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

		competitionPanel.add(countrySearchLabel, "sgx panel_first_column");
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

		competitionPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		competitionPanel.add(countryConfederationPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE MONDO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);
		worldRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		countryConfederationPanel.add(worldRadioButton, "wrap");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		worldRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				competitionCountryType = Country.COUNTRY_TYPE.WORLD.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);
		continentRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		countryConfederationPanel.add(continentRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (continentRadioButton.isSelected()) {

					continentComboBox.setEnabled(true);

					continentComboBox.firePopupMenuWillBecomeVisible();

					competitionCountryType = Country.COUNTRY_TYPE.CONTINENT.toString();

				} else {
					continentComboBox.setEnabled(false);
					continentComboBox.setSelectedIndex(-1);
					competitionContinentID = null;
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

		countryConfederationPanel.add(continentComboBox);



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
						competitionContinentVector,
						competitionContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						true
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				competitionContinentID = competitionContinentMap.get( (String) continentComboBox.getSelectedItem() );


				if (nationRadioButton.isSelected()) {

					if (competitionContinentID != null) { //NON È STATO SELEZIONATO MOSTRA TUTTO
						nationComboBox.setEnabled(true);
					}
					else {
						nationComboBox.setEnabled(false);
					}

					nationComboBox.setSelectedIndex(-1);
					competitionNationID = null;
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

		countryConfederationPanel.add(nationRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationRadioButton.isSelected()){

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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox = new JComboBox<>();
		nationComboBox.setEnabled(false);

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		countryConfederationPanel.add(nationComboBox);



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
						competitionNationVector,
						competitionNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						competitionContinentID,
						true
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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP TIPO PAESE
		 *------------------------------------------------------------------------------------------------------*/



		countryGroupButton = new ButtonGroup();

		countryGroupButton.add(worldRadioButton);
		countryGroupButton.add(continentRadioButton);
		countryGroupButton.add(nationRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER TIPO PAESE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		competitionPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		competitionPanel.add(searchButton, "sgx panel_first_column");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				fillCompetitionTable
					(
						competitionTableData,
						competitionTableColumnName,
						competitionTable,
						"competitions"
					);

				competitionTablePanel.revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA COMPETIZIONI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		competitionTablePanel = new JPanel(migLayout);
		competitionTablePanel.setBackground(panelColor);

		add(competitionTablePanel, "dock south, sgx general");
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

		competitionTablePanel.add(titleTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DELLE COMPETIZIONI
		 *------------------------------------------------------------------------------------------------------*/



		competitionTable = new JTable();

		competitionTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());
		competitionTable.setFillsViewportHeight(true);

		competitionTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		competitionTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) competitionTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(competitionTable);

		competitionTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void fillCompetitionTable(Vector<Vector<String>> tableData,
									 Vector<String> tableColumnName,
									 JTable table,
									 String tableName)
	{
		tableData.clear();
		tableColumnName.clear();

		Controller.getInstance().setCompetitionTable
			(
				tableColumnName,
				tableData,
				competitionSubName,
				competitionType,
				competitionTeamType,
				competitionCountryType,
				competitionContinentID,
				competitionNationID
			);

		table.setModel(new TableModel(tableData, tableColumnName));
		table.setPreferredScrollableViewportSize(table.getPreferredSize());

		GuiConfiguration.setTitleTable(titleTableLabel, tableName, tableData.size());
	}
}
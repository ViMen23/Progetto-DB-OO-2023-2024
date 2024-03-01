//package gui;
//
//import controller.Controller;
//import model.Country;
//import model.Team;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import javax.swing.event.CaretEvent;
//import javax.swing.event.CaretListener;
//import javax.swing.event.PopupMenuEvent;
//import javax.swing.event.PopupMenuListener;
//import javax.swing.table.DefaultTableCellRenderer;
//import java.util.HashMap;
//
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.util.Map;
//import java.util.Vector;
//
//public class SearchTeamPanel
//				extends JPanel
//{
//
//	private final Color panelColor = Color.white;
//
//	private final JPanel titlePanel;
//	private final JPanel teamPanel;
//	private final JPanel namePanel;
//	private final JPanel teamTypePanel;
//	private final JPanel countryConfederationPanel;
//	private final JPanel teamTablePanel;
//
//
//	private final JButton titleButton;
//	private final JButton resetButton;
//	private final JButton searchButton;
//
//	private final JLabel nameSearchLabel;
//	private final JLabel teamTypeSearchLabel;
//	private final JLabel nationConfederationSearchLabel;
//	private final JLabel titleTableLabel;
//
//	private final JTextField longNameTextField;
//	private final JTextField shortNameTextField;
//
//	private final JRadioButton clubRadioButton;
//	private final JRadioButton nationalRadioButton;
//	private final JComboBox<String> continentComboBox;
//	private final Vector<String> teamContinentVector = new Vector<>();
//	private final Map<String, String> teamContinentMap = new HashMap<>();
//
//	private final JComboBox<String> nationComboBox;
//
//	private final Vector<String> teamNationVector = new Vector<>();
//	private final Map<String, String> teamNationMap = new HashMap<>();
//
//	private final JTable teamTable;
//	private final Vector<String> teamTableColumnName = new Vector<>();
//	private final Vector<Vector<String>> teamTableData = new Vector<>();
//
//	private final JScrollPane scrollPane;
//
//	private final ButtonGroup buttonGroup;
//
//	private JPanel infoPanel;
//	private JLabel label;
//
//	private String teamSubLongName = null;
//	private String teamSubShortName = null;
//	private String teamType = null;
//	private String teamNationID = null;
//	private String teamContinentID = null;
//
//
//	public SearchTeamPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"0[]0",
//				"10[]10[]0[]10"
//			);
//
//		setLayout(migLayout);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL TITOLO GENERALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"0[]110[]0",
//				"10[]10"
//			);
//
//		titlePanel = new JPanel(migLayout);
//		titlePanel.setOpaque(true);
//		titlePanel.setBackground(panelColor);
//
//		add(titlePanel, "sgx general, dock north");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE TITOLO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("search");
//		string += " ";
//		string += GuiConfiguration.getMessage("teams");
//		string += " - ";
//		string += GuiConfiguration.getMessage("teams");
//		string += " ";
//		string += GuiConfiguration.getMessage("available");
//		string += " ";
//		string += Controller.getInstance().countTeams().toString();
//		string = string.toUpperCase();
//
//		titleButton = new JButton(string);
//
//		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
//		titleButton.setIcon(GuiConfiguration.getMaximizeIcon());
//		titleButton.setIconTextGap(40);
//		titleButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		titlePanel.add(titleButton, "width 80%");
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		titleButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//
//				GuiConfiguration.minimizePanel
//					(
//						getRootPanel(),
//						teamPanel,
//						titleButton,
//						"dock center, sgx general"
//					);
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE DI RESET PER TEAM PANEL
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		resetButton = new JButton(GuiConfiguration.getResetIcon());
//		resetButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		titlePanel.add(resetButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		resetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				GuiConfiguration.switchPanel
//					(
//						MainFrame.getMainFrameInstance().getContentPane(),
//						new SearchCompetitionPanel(),
//						2,
//						"sgx frame"
//					);
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA GENERALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"10[60%, fill]50[35%, fill]10",
//				"0[]0[fill]10[]0[fill]10[]0[fill]20[]0"
//			);
//
//		teamPanel = new JPanel(migLayout);
//		teamPanel.setOpaque(false);
//
//		add(teamPanel, "dock center, sgx general");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER NOME
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("name");
//		string = string.toUpperCase();
//
//		nameSearchLabel = new JLabel(string);
//
//		nameSearchLabel.setOpaque(true);
//		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		nameSearchLabel.setForeground(Color.white);
//
//		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamPanel.add(nameSearchLabel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER NOME
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"5%[20%]10:push[40%]5%",
//				"10[]20[]10"
//			);
//
//		namePanel = new JPanel(migLayout);
//		namePanel.setBackground(panelColor);
//
//		teamPanel.add(namePanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL NOME ESTESO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("longName");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		namePanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * TEXTFIELD NOME ESTESO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		longNameTextField = new JTextField(GuiConfiguration.getInputColumn());
//
//		namePanel.add(longNameTextField);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		longNameTextField.addCaretListener(new CaretListener() {
//			@Override
//			public void caretUpdate(CaretEvent e)
//			{
//				if (Regex.patternAlnum.matcher(longNameTextField.getText()).find()) {
//					teamSubLongName = longNameTextField.getText();
//				}
//				else {
//					teamSubLongName = null;
//				}
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL NOME ESTESO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("shortName");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		namePanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * TEXTFIELD NOME ABBREVIATO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		shortNameTextField = new JTextField(GuiConfiguration.getInputColumn());
//
//		namePanel.add(shortNameTextField);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		shortNameTextField.addCaretListener(new CaretListener() {
//			@Override
//			public void caretUpdate(CaretEvent e)
//			{
//				if (Regex.patternCode.matcher(shortNameTextField.getText()).find()) {
//					teamSubShortName = shortNameTextField.getText();
//				}
//				else {
//					teamSubShortName = null;
//				}
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO RICERCA PER NOME
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[]",
//				"[]"
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		teamPanel.add(infoPanel, "sg panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("teamType");
//		string = string.toUpperCase();
//
//		teamTypeSearchLabel = new JLabel(string);
//
//		teamTypeSearchLabel.setOpaque(true);
//		teamTypeSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		teamTypeSearchLabel.setForeground(Color.white);
//
//		teamTypeSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamPanel.add(teamTypeSearchLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx, center",
//				"12.5%[15%]15%[15%]15%[15%]12.5%",
//				"10[]10"
//			);
//
//		teamTypePanel = new JPanel(migLayout);
//		teamTypePanel.setBackground(panelColor);
//
//		teamPanel.add(teamTypePanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO SQUADRA CLUB
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("club");
//		string = StringUtils.capitalize(string);
//
//		clubRadioButton = new JRadioButton(string);
//		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		teamTypePanel.add(clubRadioButton, "skip 1");
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		clubRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				teamType = Team.TEAM_TYPE.CLUB.toString();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO SQUADRA NAZIONALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("national");
//		string = StringUtils.capitalize(string);
//
//		nationalRadioButton = new JRadioButton(string);
//		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		teamTypePanel.add(nationalRadioButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationalRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				teamType = Team.TEAM_TYPE.NATIONAL.toString();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BUTTONGROUP PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		buttonGroup = new ButtonGroup();
//
//		buttonGroup.add(clubRadioButton);
//		buttonGroup.add(nationalRadioButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO RICERCA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"",
//				""
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		teamPanel.add(infoPanel, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER NAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("nation");
//		string += "/";
//		string += GuiConfiguration.getMessage("confederation");
//		string = string.toUpperCase();
//
//		nationConfederationSearchLabel = new JLabel(string);
//
//		nationConfederationSearchLabel.setOpaque(true);
//		nationConfederationSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		nationConfederationSearchLabel.setForeground(Color.white);
//
//		nationConfederationSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamPanel.add(nationConfederationSearchLabel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER NAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"5%[20%]10:push[40%]5%",
//				"10[]20[]20[]10"
//			);
//
//		countryConfederationPanel = new JPanel(migLayout);
//		countryConfederationPanel.setBackground(panelColor);
//
//		teamPanel.add(countryConfederationPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL TIPO PAESE CONTINENTE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		countryConfederationPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX TIPO PAESE CONTINENTE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentComboBox = new JComboBox<>();
//		continentComboBox.setCursor(GuiConfiguration.getButtonCursor());
//
//		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		countryConfederationPanel.add(continentComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				GuiConfiguration.fillCountryComboBox
//					(
//						continentComboBox,
//						teamContinentVector,
//						teamContinentMap,
//						Country.COUNTRY_TYPE.CONTINENT.toString(),
//						null,
//						true
//					);
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//
//				teamContinentID   = GuiConfiguration.getSelectedItemIDComboBox(continentComboBox, teamContinentMap);
//
//				teamNationID = null;
//
//				if (teamContinentID != null) {
//					nationComboBox.setEnabled(true);
//				}
//				else {
//					nationComboBox.setEnabled(false);
//				}
//
//				nationComboBox.setSelectedIndex(-1);
//				teamNationID = null;
//
//			}
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL TIPO PAESE NAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		countryConfederationPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX TIPO PAESE NAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationComboBox = new JComboBox<>();
//		nationComboBox.setEnabled(false);
//		nationComboBox.setCursor(GuiConfiguration.getButtonCursor());
//
//		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		countryConfederationPanel.add(nationComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				GuiConfiguration.fillCountryComboBox
//					(
//						nationComboBox,
//						teamNationVector,
//						teamNationMap,
//						Country.COUNTRY_TYPE.NATION.toString(),
//						teamContinentID,
//						true
//					);
//			}
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//
//				teamNationID = GuiConfiguration.getSelectedItemIDComboBox(nationComboBox, teamNationMap);
//
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO RICERCA PER TIPO PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[]",
//				"[]"
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		teamPanel.add(infoPanel, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE RICERCA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("search");
//		string = string.toUpperCase();
//
//		searchButton = new JButton(string);
//		searchButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		teamPanel.add(searchButton, "span 2");
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		searchButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				fillTeamTable();
//
//				GuiConfiguration.setTitleTable
//					(
//						titleTableLabel,
//						GuiConfiguration.getMessage("teams"),
//						teamTableData.size()
//					);
//
//				revalidate();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL TABELLA SQUADRE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[grow, fill]",
//				"10[]10"
//			);
//
//		teamTablePanel = new JPanel(migLayout);
//		teamTablePanel.setBackground(panelColor);
//
//		add(teamTablePanel, "dock south, sgx general");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL TITOLO TABELLA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("no");
//		string += " ";
//		string += GuiConfiguration.getMessage("research");
//		string += " ";
//		string += GuiConfiguration.getMessage("performed");
//		string = string.toUpperCase();
//
//		titleTableLabel = new JLabel(string);
//
//		titleTableLabel.setOpaque(true);
//		titleTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		titleTableLabel.setForeground(Color.white);
//
//		titleTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		teamTablePanel.add(titleTableLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * TABLE TABELLA DEI CALCIATORI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		teamTable = new JTable();
//
//		teamTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());
//		teamTable.setFillsViewportHeight(true);
//
//		teamTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//		teamTable.setAutoCreateRowSorter(true);
//		( (DefaultTableCellRenderer) teamTable.getTableHeader().getDefaultRenderer()
//		).setHorizontalAlignment(SwingConstants.CENTER);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		scrollPane = new JScrollPane(teamTable);
//
//		teamTablePanel.add(scrollPane);
//		/*------------------------------------------------------------------------------------------------------*/
//	}
//
//	/**
//	 *
//	 * @return
//	 */
//	public JPanel getRootPanel()
//	{
//		return this;
//	}
//
//	public void getTeamTableData(Vector<String> tableColumnName,
//								 Vector<Vector<String>> tableData,
//								 String teamSubLongName,
//								 String teamSubShortName,
//								 String teamType,
//								 String teamContinentID,
//								 String teamNationID)
//	{
//		tableColumnName.clear();
//		tableData.clear();
//
//
//		Controller.getInstance().setTeamTable
//			(
//				tableColumnName,
//				tableData,
//				teamSubLongName,
//				teamSubShortName,
//				teamType,
//				teamContinentID,
//				teamNationID
//			);
//	}
//
//	public void fillTeamTable()
//	{
//
//		getTeamTableData
//			(
//				teamTableColumnName,
//				teamTableData,
//				teamSubLongName,
//				teamSubShortName,
//				teamType,
//				teamContinentID,
//				teamNationID
//			);
//
//		GuiConfiguration.fillTable(teamTable, teamTableData, teamTableColumnName);
//	}
//
//}

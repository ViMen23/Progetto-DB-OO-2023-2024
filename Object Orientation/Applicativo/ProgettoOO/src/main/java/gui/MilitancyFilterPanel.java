
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
import java.awt.event.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;


public class MilitancyFilterPanel
				extends JPanel
{

	protected final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	private final JPanel titlePanel;
	private final JPanel militancyPanel;
	private final JPanel teamTypePanel;
	private final JPanel countryConfederationPanel;
	private final JPanel teamPanel;
	private final JPanel yearPanel;
	private final JPanel militancyPlayerTablePanel;
	private JPanel infoPanel;


	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private final JRadioButton clubRadioButton;
	private final JRadioButton nationalRadioButton;

	private final JComboBox<String> continentComboBox;
	private final JComboBox<String> nationComboBox;
	private final JComboBox<String> teamComboBox;
	private final JComboBox<String> fromYearComboBox;
	private final JComboBox<String> toYearComboBox;

	private final Vector<String> militancyContinentVector = new Vector<>();
	private final Vector<String> militancyNationVector = new Vector<>();
	private final Vector<String> militancyTeamVector = new Vector<>();
	private final Map<String, String> militancyContinentMap = new HashMap<>();
	private final Map<String, String> militancyNationMap = new HashMap<>();
	private final Map<String, String> militancyTeamMap = new HashMap<>();


	private JLabel label;
	private final JLabel titleTableLabel;
	private ButtonGroup teamTypeButtonGroup;

	private final JTable militancyPlayerTable;
	private final Vector<String> militancyPlayerTableColumnName = new Vector<>();
	private final Vector<Vector<String>> militancyPlayerTableData = new Vector<>();

	private final JScrollPane scrollPane;


	private String militancyTeamType = null;
	private String militancyContinentID = null;
	private String militancyNationID = null;
	private String militancyTeam = null;
	private String militancyFromYear = null;
	private String militancyToYear = null;


	public MilitancyFilterPanel()
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



		string = GuiConfiguration.getMessage("militancyFilter");
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

				if (militancyPanel.isShowing()) {
					remove(militancyPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(militancyPanel, "dock center, sgx general");
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER MILITANCY PANEL
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

				MilitancyFilterPanel militancyFilterPanel = new MilitancyFilterPanel();

				MainFrame.getMainFrameInstance().add(militancyFilterPanel, "sgx frame");
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

		militancyPanel = new JPanel(migLayout);
		militancyPanel.setOpaque(false);

		add(militancyPanel, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = "1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		militancyPanel.add(label, "sgx panel_first_column");
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

		militancyPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/


		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10:push[40%]5%",
				"10[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		militancyPanel.add(countryConfederationPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox = new JComboBox<>();

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
						militancyContinentVector,
						militancyContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						false
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyContinentID = militancyContinentMap.get((String) continentComboBox.getSelectedItem());

				if (nationComboBox.isEnabled()){
					resetFromContinent();
				}

				nationComboBox.setEnabled(true);
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox = new JComboBox<>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

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
						militancyNationVector,
						militancyNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						militancyContinentID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyNationID = militancyNationMap.get((String) nationComboBox.getSelectedItem());

				if (clubRadioButton.isEnabled() || nationalRadioButton.isEnabled()) {
					resetFromNation();
				}

				clubRadioButton.setEnabled(true);
				nationalRadioButton.setEnabled(true);
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		militancyPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		militancyPanel.add(label, "sgx panel_first_column");
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

		militancyPanel.add(label, "sgx panel_second_column");
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

		militancyPanel.add(teamTypePanel, "sgx panel_first_column");
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
				militancyTeamType = Team.TEAM_TYPE.CLUB.toString();

				if (militancyTeamType != null){
					resetFromTeamType();
				}

				teamComboBox.setEnabled(true);
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
				militancyTeamType = Team.TEAM_TYPE.NATIONAL.toString();

				if (militancyTeamType != null){
					resetFromTeamType();
				}
				teamComboBox.setEnabled(true);
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

		militancyPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		militancyPanel.add(label, "sgx panel_first_column");
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

		militancyPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[]10"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setBackground(panelColor);

		militancyPanel.add(teamPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		teamPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TEAM
		 *------------------------------------------------------------------------------------------------------*/



		teamComboBox = new JComboBox<>();

		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		teamComboBox.setEnabled(false);

		teamComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		teamPanel.add(teamComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		teamComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillTeamComboBox
					(
						teamComboBox,
						militancyTeamVector,
						militancyTeamMap,
						null,
						null,
						militancyTeamType,
						militancyContinentID,
						militancyNationID
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyTeam = militancyTeamMap.get( (String) teamComboBox.getSelectedItem() );

				if (fromYearComboBox.isEnabled() || toYearComboBox.isEnabled()){
					resetFromTeam();
				}

				searchButton.setEnabled(true);

				if (militancyTeam != null) {
					fromYearComboBox.setEnabled(true);
					toYearComboBox.setEnabled(true);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRO PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		militancyPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER ANNI
		 *------------------------------------------------------------------------------------------------------*/



		string = "4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("years");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		militancyPanel.add(label, "sgx panel_first_column");
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

		militancyPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER ANNI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10:push[40%]5%",
				"10[]20[]10"
			);

		yearPanel = new JPanel(migLayout);
		yearPanel.setBackground(panelColor);

		militancyPanel.add(yearPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL DA ANNO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("from");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		yearPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX DA ANNO
		 *------------------------------------------------------------------------------------------------------*/



		fromYearComboBox = new JComboBox<>();

		fromYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		fromYearComboBox.setEnabled(false);

		fromYearComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		yearPanel.add(fromYearComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		fromYearComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillYearComboBox(fromYearComboBox, GuiConfiguration.getMinYear());
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyFromYear = (String) fromYearComboBox.getSelectedItem();

				toYearComboBox.setSelectedIndex(-1);
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL AD ANNO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		yearPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX AD ANNO
		 *------------------------------------------------------------------------------------------------------*/



		toYearComboBox = new JComboBox<>();

		toYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		toYearComboBox.setEnabled(false);

		toYearComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		yearPanel.add(toYearComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		toYearComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillYearComboBox(toYearComboBox, Integer.valueOf(militancyFromYear));
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyToYear = (String) toYearComboBox.getSelectedItem();
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
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

		militancyPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE CERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setEnabled(false);

		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		militancyPanel.add(searchButton, "span 2");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				fillPlayerTable
					(
						militancyPlayerTableData,
						militancyPlayerTableColumnName,
						militancyPlayerTable,
						"players"
					);

				militancyPlayerTablePanel.revalidate();
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

		militancyPlayerTablePanel = new JPanel(migLayout);
		militancyPlayerTablePanel.setBackground(panelColor);

		add(militancyPlayerTablePanel, "dock south, sgx general");
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

		militancyPlayerTablePanel.add(titleTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		militancyPlayerTable = new JTable();

		militancyPlayerTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		militancyPlayerTable.setPreferredScrollableViewportSize(militancyPlayerTable.getPreferredSize());
		militancyPlayerTable.setFillsViewportHeight(true);

		militancyPlayerTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		militancyPlayerTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) militancyPlayerTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(militancyPlayerTable);

		militancyPlayerTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void fillTeamComboBox(JComboBox<String> comboBox,
									Vector<String> vector,
									Map<String, String> map,
									String teamSubLongName,
									String teamSubShortName,
									String teamType,
									String teamContinentID,
								 	String teamNationID)
	{

		GuiConfiguration.initComboBoxVector(vector, map, false);

		Controller.getInstance().setTeamComboBox
			(
				vector,
				map,
				teamSubLongName,
				teamSubShortName,
				teamType,
				teamContinentID,
				teamNationID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}


	public void resetFromContinent()
	{
		nationComboBox.setEnabled(false);
		nationComboBox.setSelectedIndex(-1);

		militancyNationID = null;

		resetFromNation();

	}
	public void resetFromNation()
	{
		clubRadioButton.setEnabled(false);
		nationalRadioButton.setEnabled(false);

		teamTypeButtonGroup.clearSelection();

		militancyTeamType = null;

		resetFromTeamType();
	}
	public void resetFromTeamType()
	{
		teamComboBox.setEnabled(false);
		teamComboBox.setSelectedIndex(-1);

		militancyTeam = null;

		resetFromTeam();
	}

	public void resetFromTeam()
	{
		searchButton.setEnabled(false);

		resetFromYear();
	}

	public void resetFromYear()
	{
		fromYearComboBox.setEnabled(false);
		toYearComboBox.setEnabled(false);

		fromYearComboBox.setSelectedIndex(-1);
		toYearComboBox.setSelectedIndex(-1);

		militancyFromYear = null;
		militancyToYear = null;
	}

	public void fillPlayerTable(Vector<Vector<String>> tableData,
								Vector<String> tableColumnName,
								JTable table,
								String tableName)
	{
		tableData.clear();
		tableColumnName.clear();

		Controller.getInstance().setPlayerTable
			(
				tableColumnName,
				tableData,
				militancyTeam,
				militancyFromYear,
				militancyToYear
			);

		table.setModel(new TableModel(tableData, tableColumnName));
		table.setPreferredScrollableViewportSize(table.getPreferredSize());

		GuiConfiguration.setTitleTable(titleTableLabel, tableName, tableData.size());
	}
}

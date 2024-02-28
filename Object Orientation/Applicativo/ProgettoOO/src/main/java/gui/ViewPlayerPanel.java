package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerPanel
	extends JPanel
{

	private final String playerID;
	private final Color panelColor = Color.white;

	private final JPanel informationPanel;
	private final JPanel navigationPanel;
	private final JPanel generalInformationPanel;

	private final JLabel playerPositionTableLabel;
	private final JLabel nationalityTableLabel;
	private final JLabel playerAttributeMentalTableLabel;
	private final JLabel playerAttributeGoalkeepingTableLabel;
	private final JLabel playerAttributePhysicalTableLabel;
	private final JLabel playerAttributeTechnicalTableLabel;
	private final JLabel playerTagTableLabel;
	private final JLabel playerCareerClubTableLabel;
	private final JLabel playerCareerNationalTableLabel;


	private final JButton generalInformationButton;
	private final JButton detailedInformationButton;
	private final JButton careerInformationButton;
	private final JButton clubStatisticsButton;
	private final JButton nationalStatisticsButton;


	private final JTable playerPositionTable;
	private final JTable playerNationalityTable;
	private final JTable playerAttributeGoalkeepingTable;
	private final JTable playerAttributeMentalTable;
	private final JTable playerAttributePhysicalTable;
	private final JTable playerAttributeTechnicalTable;
	private final JTable playerTagTable;
	private final JTable playerCareerClubTable;
	private final JTable playerCareerNationalTable;
	private final JTable caseTrophyClubTable;
	private final JTable caseTrophyNationalTable;
	private final JTable casePrizeTable;




	private final Map<String, String> generalInformationPlayer = new LinkedHashMap<>();

	private final Vector<Vector<String>> playerPositionTableData = new Vector<>();
	private final Vector<Vector<String>> playerNationalityTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributeGoalkeepingTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributeMentalTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributePhysicalTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributeTechnicalTableData = new Vector<>();
	private final Vector<Vector<String>> playerTagTableData = new Vector<>();
	private final Vector<Vector<String>> playerCareerClubTableData = new Vector<>();
	private final Vector<Vector<String>> playerCareerNationalTableData = new Vector<>();
	private final Vector<Vector<String>> playerClubStatisticsTableData = new Vector<>();
	private final Vector<Vector<String>> playerNationalStatisticsTableData = new Vector<>();
	private final Vector<Vector<String>> playerCaseTrophyClubTableData = new Vector<>();
	private final Vector<Vector<String>> playerCaseTrophyNationalTableData = new Vector<>();
	private final Vector<Vector<String>> playerCasePrizeTableData = new Vector<>();


	private final Vector<String> playerPositionTableColumnName = new Vector<>();
	private final Vector<String> playerNationalityTableColumnName = new Vector<>();
	private final Vector<String> playerAttributeGoalkeepingTableColumnName = new Vector<>();
	private final Vector<String> playerAttributeMentalTableColumnName = new Vector<>();
	private final Vector<String> playerAttributePhysicalTableColumnName = new Vector<>();
	private final Vector<String> playerAttributeTechnicalTableColumnName = new Vector<>();
	private final Vector<String> playerTagTableColumnName = new Vector<>();
	private final Vector<String> playerCareerClubTableColumnName = new Vector<>();
	private final Vector<String> playerCareerNationalTableColumnName = new Vector<>();
	private final Vector<String> playerClubStatisticsTableColumnName = new Vector<>();
	private final Vector<String> playerNationalStatisticsTableColumnName = new Vector<>();
	private final Vector<String> playerCaseTrophyClubTableColumnName = new Vector<>();
	private final Vector<String> playerCaseTrophyNationalTableColumnName = new Vector<>();
	private final Vector<String> playerCasePrizeTableColumnName = new Vector<>();


	private final JPanel detailedInformationPanel;
	private final JPanel careerInformationTablePanel;
	private final JPanel clubStatisticsPanel;
	private final JPanel nationalStatisticsPanel;
	private final JPanel casePanel;
	private final JPanel filterStatisticsClubPanel;
	private final JButton filterStatisticsClubButton;

	private final JPanel titleClubFilterPanel;
	private final JButton resetStatisticsClubButton;
	private final JComboBox<String> filterStatisticsClubTeamComboBox;
	private final JComboBox<String> filterStatisticsClubCompetitionComboBox;
	private final JComboBox<String> filterStatisticsClubInitialSeasonComboBox;
	private final JComboBox<String> filterStatisticsClubFinalSeasonComboBox;
	private final JComboBox<String> filterStatisticsNationalFinalSeasonComboBox;
	private final JButton caseButton;
	private final JButton searchStatisticsClubButton;
	private final JPanel clubStatisticsTablePanel;
	private final JTable playerClubStatisticsTable;

	private final JPanel titleNationalFilterPanel;
	private final JButton filterStatisticsNationalButton;
	private final JComboBox<String> filterStatisticsNationalCompetitionComboBox;
	private final JComboBox<String> filterStatisticsNationalInitialSeasonComboBox;
	private final JPanel nationalStatisticsTablePanel;
	private final JTable playerNationalStatisticsTable;
	private final JButton resetStatisticsNationalButton;
	private final JButton searchStatisticsNationalButton;


	private JScrollPane scrollPane;
	private JPanel panel;
	private JLabel label;

	private String teamType = null;
	private String teamID = null;
	private String competitionID = null;
	private String startYear = null;
	private String endYear = null;
	private JPanel filterStatisticsNationalPanel;


	public ViewPlayerPanel(String playerID)
	{
		this.playerID = playerID;

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[fill]10",
				"0[]20[]20[]10"
			);

		setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFORMAZIONI GENERALI
		 *------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[grow, fill]40[grow, fill]10",
				"10[]10[]10[]10[]10[]10[]10[]10"
			);

		informationPanel = new JPanel(migLayout);
		informationPanel.setBackground(panelColor);

		add(informationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL GENERALE PER LA NAVIGAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"2%[14%, fill]0[14%, fill]0[14%, fill]0[14%, fill]0[14%, fill]0[14%, fill]2%",
				"10[]10"
			);



		navigationPanel = new JPanel(migLayout);
		navigationPanel.setBackground(panelColor);

		add(navigationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI GENERALI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("generalInformation");
		string = string.toUpperCase();

		generalInformationButton = new JButton(string);
		generalInformationButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(generalInformationButton);



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI GENERALI
		 *------------------------------------------------------------------------------------------------------*/



		generalInformationButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(getRootPanel(), generalInformationPanel, 2, null);

				initFilterStats();

				fillPlayerGeneralView();

				MainFrame.getMainFrameInstance().pack();

			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI NEL DETTAGLIO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("detailedInformation");
		string = string.toUpperCase();

		detailedInformationButton = new JButton(string);
		detailedInformationButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(detailedInformationButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		detailedInformationButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(getRootPanel(), detailedInformationPanel, 2, null);

				initFilterStats();

				fillPlayerDetailedView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLA MILITANZA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("career");
		string = string.toUpperCase();

		careerInformationButton = new JButton(string);
		careerInformationButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(careerInformationButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		careerInformationButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(getRootPanel(), careerInformationTablePanel, 2, null);

				fillPlayerCareerView();

				initFilterStats();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLE STATISTICHE CLUB
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("clubStatistics");
		string = string.toUpperCase();

		clubStatisticsButton = new JButton(string);
		clubStatisticsButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(clubStatisticsButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		clubStatisticsButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(getRootPanel(), clubStatisticsPanel, 2, null);

				initFilterStats();

				teamType = Team.TEAM_TYPE.CLUB.toString();

				fillClubStatisticsView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLE STATISTICHE NAZIONALI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("nationalStatistics");
		string = string.toUpperCase();

		nationalStatisticsButton = new JButton(string);
		nationalStatisticsButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(nationalStatisticsButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationalStatisticsButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(getRootPanel(), nationalStatisticsPanel, 2, null);


				initFilterStats();

				teamType = Team.TEAM_TYPE.NATIONAL.toString();

				fillNationalStatisticsView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		
		
		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLE STATISTICHE NAZIONALI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("case");
		string = string.toUpperCase();

		caseButton = new JButton(string);
		caseButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(caseButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		caseButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(getRootPanel(), casePanel, 2, null);

				initFilterStats();

				fillCaseView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLE INFORMAZIONI GENERALI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2, fill",
				"0[grow, fill]30[grow, fill]0",
				"10[]10"
			);

		generalInformationPanel = new JPanel(migLayout);
		generalInformationPanel.setBackground(panelColor);
		generalInformationPanel.setOpaque(false);

		add(generalInformationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		generalInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA POSIZIONI
		 *------------------------------------------------------------------------------------------------------*/
		string = "Tabella posizioni"; //TODO i18n


		playerPositionTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerPositionTableLabel.setOpaque(true);
		playerPositionTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerPositionTableLabel.setForeground(Color.white);

		playerPositionTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(playerPositionTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA POSIZIONI
		 *------------------------------------------------------------------------------------------------------*/


		playerPositionTable = new JTable(new DefaultTableModel(5, 3));

		playerPositionTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerPositionTable.setPreferredScrollableViewportSize(playerPositionTable.getPreferredSize());
		playerPositionTable.setFillsViewportHeight(true);

		playerPositionTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerPositionTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA POSIZIONI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerPositionTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		generalInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA NAZIONALITÀ
		 *------------------------------------------------------------------------------------------------------*/
		string = "Tabella nazionalità"; //TODO i18n


		nationalityTableLabel = new JLabel(string, SwingConstants.LEADING);

		nationalityTableLabel.setOpaque(true);
		nationalityTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nationalityTableLabel.setForeground(Color.white);

		nationalityTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(nationalityTableLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA NAZIONALITÀ
		 *------------------------------------------------------------------------------------------------------*/


		playerNationalityTable = new JTable(new DefaultTableModel(3, 1));

		playerNationalityTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerNationalityTable.setPreferredScrollableViewportSize(playerNationalityTable.getPreferredSize());
		playerNationalityTable.setFillsViewportHeight(true);

		playerNationalityTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerNationalityTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA NAZIONALITÀ
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerNationalityTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		fillPlayerGeneralView();
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLE INFORMAZIONI DETTAGLIATE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 5, fill",
				"0[10%, fill]30[10%, fill]30[10%, fill]30[10%, fill]30[10%, fill]0",
				"10[top]10"
			);

		detailedInformationPanel = new JPanel(migLayout);
		detailedInformationPanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		detailedInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA ATTRIBUTI PORTIERE
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella attributi goalkeeping"; //TODO i18n


		playerAttributeGoalkeepingTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerAttributeGoalkeepingTableLabel.setOpaque(true);
		playerAttributeGoalkeepingTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerAttributeGoalkeepingTableLabel.setForeground(Color.white);

		playerAttributeGoalkeepingTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(playerAttributeGoalkeepingTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ATTRIBUTI PORTIERI
		 *------------------------------------------------------------------------------------------------------*/


		playerAttributeGoalkeepingTable = new JTable(new DefaultTableModel(10, 2));

		playerAttributeGoalkeepingTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerAttributeGoalkeepingTable.setPreferredScrollableViewportSize(playerAttributeGoalkeepingTable.getPreferredSize());
		playerAttributeGoalkeepingTable.setFillsViewportHeight(true);

		playerAttributeGoalkeepingTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerAttributeGoalkeepingTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ATTRIBUTI PORTIERI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerAttributeGoalkeepingTable);

		panel.add(scrollPane, "top");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		detailedInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA ATTRIBUTI MENTALI
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella attributi mental"; //TODO i18n


		playerAttributeMentalTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerAttributeMentalTableLabel.setOpaque(true);
		playerAttributeMentalTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerAttributeMentalTableLabel.setForeground(Color.white);

		playerAttributeMentalTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(playerAttributeMentalTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ATTRIBUTI MENTALI
		 *------------------------------------------------------------------------------------------------------*/


		playerAttributeMentalTable = new JTable(new DefaultTableModel(10, 2));

		playerAttributeMentalTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerAttributeMentalTable.setPreferredScrollableViewportSize(playerAttributeMentalTable.getPreferredSize());
		playerAttributeMentalTable.setFillsViewportHeight(true);

		playerAttributeMentalTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerAttributeMentalTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ATTRIBUTI MENTALI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerAttributeMentalTable);

		panel.add(scrollPane, "top");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		detailedInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA ATTRIBUTI FISICI
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella attributi physical"; //TODO i18n


		playerAttributePhysicalTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerAttributePhysicalTableLabel.setOpaque(true);
		playerAttributePhysicalTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerAttributePhysicalTableLabel.setForeground(Color.white);

		playerAttributePhysicalTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(playerAttributePhysicalTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ATTRIBUTI FISICI
		 *------------------------------------------------------------------------------------------------------*/


		playerAttributePhysicalTable = new JTable(new DefaultTableModel(10, 2));

		playerAttributePhysicalTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerAttributePhysicalTable.setPreferredScrollableViewportSize(playerAttributePhysicalTable.getPreferredSize());
		playerAttributePhysicalTable.setFillsViewportHeight(true);

		playerAttributePhysicalTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerAttributePhysicalTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ATTRIBUTI FISICI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerAttributePhysicalTable);

		panel.add(scrollPane, "top");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		detailedInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA ATTRIBUTI TECNICI
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella attributi technical"; //TODO i18n


		playerAttributeTechnicalTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerAttributeTechnicalTableLabel.setOpaque(true);
		playerAttributeTechnicalTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerAttributeTechnicalTableLabel.setForeground(Color.white);

		playerAttributeTechnicalTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(playerAttributeTechnicalTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ATTRIBUTI TECNICI
		 *------------------------------------------------------------------------------------------------------*/


		playerAttributeTechnicalTable = new JTable(new DefaultTableModel(10, 2));

		playerAttributeTechnicalTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerAttributeTechnicalTable.setPreferredScrollableViewportSize(playerAttributeTechnicalTable.getPreferredSize());
		playerAttributeTechnicalTable.setFillsViewportHeight(true);

		playerAttributeTechnicalTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerAttributeTechnicalTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ATTRIBUTI TECNICI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerAttributeTechnicalTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[grow, fill]0",
				"0[]10[]0"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		detailedInformationPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA TAG
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella tag"; //TODO i18n


		playerTagTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerTagTableLabel.setOpaque(true);
		playerTagTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerTagTableLabel.setForeground(Color.white);

		playerTagTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		panel.add(playerTagTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TAG
		 *------------------------------------------------------------------------------------------------------*/


		playerTagTable = new JTable(new DefaultTableModel(4, 1));

		playerTagTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerTagTable.setPreferredScrollableViewportSize(playerTagTable.getPreferredSize());
		playerTagTable.setFillsViewportHeight(true);

		playerTagTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerTagTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA TAG
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerTagTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLE CARRIERA CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2, fill",
				"0[40%, fill]30[40%, fill]0",
				"10[]10[]10"
			);

		careerInformationTablePanel = new JPanel(migLayout);
		careerInformationTablePanel.setBackground(panelColor);
		careerInformationTablePanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA CARRIERA CLUB
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella carriera club"; //TODO i18n


		playerCareerClubTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerCareerClubTableLabel.setOpaque(true);
		playerCareerClubTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerCareerClubTableLabel.setForeground(Color.white);

		playerCareerClubTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		careerInformationTablePanel.add(playerCareerClubTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA CARRIERA NAZIONALE
		 *------------------------------------------------------------------------------------------------------*/

		string = "Tabella carriera nazionale"; //TODO i18n


		playerCareerNationalTableLabel = new JLabel(string, SwingConstants.LEADING);

		playerCareerNationalTableLabel.setOpaque(true);
		playerCareerNationalTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		playerCareerNationalTableLabel.setForeground(Color.white);

		playerCareerNationalTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		careerInformationTablePanel.add(playerCareerNationalTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA CARRIERA CLUB
		 *------------------------------------------------------------------------------------------------------*/


		playerCareerClubTable = new JTable(new DefaultTableModel(10, 2));

		playerCareerClubTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerCareerClubTable.setPreferredScrollableViewportSize(playerCareerClubTable.getPreferredSize());
		playerCareerClubTable.setFillsViewportHeight(true);

		playerCareerClubTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerCareerClubTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ATTRIBUTI FISICI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerCareerClubTable);

		careerInformationTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA CARRIERA CLUB
		 *------------------------------------------------------------------------------------------------------*/


		playerCareerNationalTable = new JTable(new DefaultTableModel(10, 2));

		playerCareerNationalTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerCareerNationalTable.setPreferredScrollableViewportSize(playerCareerNationalTable.getPreferredSize());
		playerCareerNationalTable.setFillsViewportHeight(true);

		playerCareerNationalTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) playerCareerNationalTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ATTRIBUTI FISICI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerCareerNationalTable);

		careerInformationTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL STATISTICHE CLUB GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"0[]10[]0"
			);

		clubStatisticsPanel = new JPanel(migLayout);
		clubStatisticsPanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO GENERALE DEL FILTRO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"0[]110[]0",
				"10[]10"
			);

		titleClubFilterPanel = new JPanel(migLayout);
		titleClubFilterPanel.setOpaque(true);
		titleClubFilterPanel.setBackground(panelColor);

		clubStatisticsPanel.add(titleClubFilterPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON MOSTRA/NASCODI FILTRO
		 *------------------------------------------------------------------------------------------------------*/

		string = "Filtro per statistiche club"; //TODO i18n

		filterStatisticsClubButton = new JButton(string);

		filterStatisticsClubButton.setHorizontalTextPosition(SwingConstants.LEADING);
		filterStatisticsClubButton.setIcon(GuiConfiguration.getMinimizeIcon());
		filterStatisticsClubButton.setIconTextGap(40);

		filterStatisticsClubButton.setCursor(GuiConfiguration.getButtonCursor());

		titleClubFilterPanel.add(filterStatisticsClubButton, "width 80%");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.minimizePanel
					(
						clubStatisticsPanel,
						filterStatisticsClubPanel,
						filterStatisticsClubButton,
						"dock center, sgx general"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER FILTER PANEL
		 *------------------------------------------------------------------------------------------------------*/



		resetStatisticsClubButton = new JButton(GuiConfiguration.getResetIcon());
		resetStatisticsClubButton.setCursor(GuiConfiguration.getButtonCursor());

		titleClubFilterPanel.add(resetStatisticsClubButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		resetStatisticsClubButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				clubStatisticsButton.doClick();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL STATISTICHE CLUB FILTRO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]20[]0"
			);

		filterStatisticsClubPanel = new JPanel(migLayout);
		filterStatisticsClubPanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SCEGLI TEAM
		 *------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		filterStatisticsClubPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO FILTRI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		filterStatisticsClubPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TEAM
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TEAM
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubTeamComboBox = new JComboBox<>();

		filterStatisticsClubTeamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsClubTeamComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsClubTeamComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubTeamComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SCEGLI COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		filterStatisticsClubPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO FILTRI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		filterStatisticsClubPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL COMPETITION
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("competition");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubCompetitionComboBox = new JComboBox<>();

		filterStatisticsClubCompetitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsClubCompetitionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsClubCompetitionComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubCompetitionComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SCEGLI UNA STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("seasonRange");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		filterStatisticsClubPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO FILTRI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10:push[40%]5%",
				"10[]10[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		filterStatisticsClubPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE INIZIALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("initialSeason");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE INIZIALE
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubInitialSeasonComboBox = new JComboBox<>();

		filterStatisticsClubInitialSeasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsClubInitialSeasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsClubInitialSeasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubInitialSeasonComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE FINALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("finalSeason");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE FINALE
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubFinalSeasonComboBox = new JComboBox<>();

		filterStatisticsClubFinalSeasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsClubFinalSeasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsClubFinalSeasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsClubFinalSeasonComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchStatisticsClubButton = new JButton(string);
		searchStatisticsClubButton.setCursor(GuiConfiguration.getButtonCursor());

		filterStatisticsClubPanel.add(searchStatisticsClubButton, "span 2");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchStatisticsClubButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA STATISTICHE CLUB DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		clubStatisticsTablePanel = new JPanel(migLayout);
		clubStatisticsTablePanel.setBackground(panelColor);

		clubStatisticsPanel.add(clubStatisticsTablePanel, "dock south, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = "Titolo"; //TODO i18n

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		clubStatisticsTablePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DELLE STATISTICHE TOTALI DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		playerClubStatisticsTable = new JTable();

		playerClubStatisticsTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerClubStatisticsTable.setPreferredScrollableViewportSize(playerClubStatisticsTable.getPreferredSize());
		playerClubStatisticsTable.setFillsViewportHeight(true);

		playerClubStatisticsTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		playerClubStatisticsTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) playerClubStatisticsTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerClubStatisticsTable);

		clubStatisticsTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL STATISTICHE NAZIONALI GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"0[]10[]0"
			);

		nationalStatisticsPanel = new JPanel(migLayout);
		nationalStatisticsPanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO GENERALE DEL FILTRO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"0[]110[]0",
				"10[]10"
			);

		titleNationalFilterPanel = new JPanel(migLayout);
		titleNationalFilterPanel.setOpaque(true);
		titleNationalFilterPanel.setBackground(panelColor);

		nationalStatisticsPanel.add(titleNationalFilterPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON MOSTRA/NASCODI FILTRO
		 *------------------------------------------------------------------------------------------------------*/



		string = "Filtro per statistiche nazionali"; //TODO i18n

		filterStatisticsNationalButton = new JButton(string);

		filterStatisticsNationalButton.setHorizontalTextPosition(SwingConstants.LEADING);
		filterStatisticsNationalButton.setIcon(GuiConfiguration.getMinimizeIcon());
		filterStatisticsNationalButton.setIconTextGap(40);

		filterStatisticsNationalButton.setCursor(GuiConfiguration.getButtonCursor());

		titleNationalFilterPanel.add(filterStatisticsNationalButton, "width 80%");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.minimizePanel
					(
						nationalStatisticsPanel,
						filterStatisticsNationalPanel,
						filterStatisticsNationalButton,
						"dock center, sgx general"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER FILTER PANEL
		 *------------------------------------------------------------------------------------------------------*/



		resetStatisticsNationalButton = new JButton(GuiConfiguration.getResetIcon());
		resetStatisticsNationalButton.setCursor(GuiConfiguration.getButtonCursor());

		titleNationalFilterPanel.add(resetStatisticsNationalButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		resetStatisticsNationalButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				nationalStatisticsButton.doClick();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL STATISTICHE CLUB FILTRO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]20[]0"
			);

		filterStatisticsNationalPanel = new JPanel(migLayout);
		filterStatisticsNationalPanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SCEGLI COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		filterStatisticsNationalPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO FILTRI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		filterStatisticsNationalPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL COMPETITION
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("competition");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalCompetitionComboBox = new JComboBox<>();

		filterStatisticsNationalCompetitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsNationalCompetitionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsNationalCompetitionComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalCompetitionComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SCEGLI UNA STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("seasonRange");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		filterStatisticsNationalPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SUPPORTO FILTRI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10:push[40%]5%",
				"10[]10[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		filterStatisticsNationalPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE INIZIALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("initialSeason");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE INIZIALE
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalInitialSeasonComboBox = new JComboBox<>();

		filterStatisticsNationalInitialSeasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsNationalInitialSeasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsNationalInitialSeasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalInitialSeasonComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE FINALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("finalSeason");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE FINALE
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalFinalSeasonComboBox = new JComboBox<>();

		filterStatisticsNationalFinalSeasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		filterStatisticsNationalFinalSeasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		panel.add(filterStatisticsNationalFinalSeasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterStatisticsNationalFinalSeasonComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchStatisticsNationalButton = new JButton(string);
		searchStatisticsNationalButton.setCursor(GuiConfiguration.getButtonCursor());

		filterStatisticsNationalPanel.add(searchStatisticsNationalButton, "span 2");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchStatisticsNationalButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA STATISTICHE CLUB DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		nationalStatisticsTablePanel = new JPanel(migLayout);
		nationalStatisticsTablePanel.setBackground(panelColor);

		nationalStatisticsPanel.add(nationalStatisticsTablePanel, "dock south, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = "Titolo"; //TODO i18n

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		nationalStatisticsTablePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DELLE STATISTICHE TOTALI DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		playerNationalStatisticsTable = new JTable();

		playerNationalStatisticsTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerNationalStatisticsTable.setPreferredScrollableViewportSize(playerNationalStatisticsTable.getPreferredSize());
		playerNationalStatisticsTable.setFillsViewportHeight(true);

		playerNationalStatisticsTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		playerNationalStatisticsTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) playerNationalStatisticsTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerNationalStatisticsTable);

		nationalStatisticsTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL BACHECA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, fill",
				"0[grow, fill]0[grow, fill]0[grow, fill]",
				"0[]10[]0"
			);

		casePanel = new JPanel(migLayout);
		casePanel.setOpaque(false);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL PANNELLO DI SUPPORTO PER TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"0[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		casePanel.add(panel);
		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = "Titolo"; //TODO i18n

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DEI TROFEI CLUB DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		caseTrophyClubTable = new JTable();

		caseTrophyClubTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		caseTrophyClubTable.setPreferredScrollableViewportSize(caseTrophyClubTable.getPreferredSize());
		caseTrophyClubTable.setFillsViewportHeight(true);

		caseTrophyClubTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		caseTrophyClubTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) caseTrophyClubTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(caseTrophyClubTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL PANNELLO DI SUPPORTO PER TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"0[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		casePanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = "Titolo"; //TODO i18n

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DEI TROFEI NAZIONALI DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		caseTrophyNationalTable = new JTable();

		caseTrophyNationalTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		caseTrophyNationalTable.setPreferredScrollableViewportSize(caseTrophyNationalTable.getPreferredSize());
		caseTrophyNationalTable.setFillsViewportHeight(true);

		caseTrophyNationalTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		caseTrophyNationalTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) caseTrophyNationalTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(caseTrophyNationalTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
		/*--------------------------------------------------------------------------------------------------------
		 * PANEL PANNELLO DI SUPPORTO PER TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"0[]10"
			);

		panel = new JPanel(migLayout);
		panel.setBackground(panelColor);

		casePanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = "Titolo"; //TODO i18n

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		panel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DEI TROFEI NAZIONALI DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		casePrizeTable = new JTable();

		casePrizeTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		casePrizeTable.setPreferredScrollableViewportSize(casePrizeTable.getPreferredSize());
		casePrizeTable.setFillsViewportHeight(true);

		casePrizeTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		casePrizeTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) casePrizeTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(casePrizeTable);

		panel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}
	public JPanel getRootPanel()
	{
		return this;
	}

	public void initFilterStats()
	{
		teamType = null;
		teamID = null;
		competitionID = null;
		startYear = null;
		endYear = null;
	}

	public void getDataPlayerGeneralView()
	{

		generalInformationPlayer.clear();
		playerPositionTableColumnName.clear();
		playerPositionTableData.clear();
		playerNationalityTableColumnName.clear();
		playerNationalityTableData.clear();

		Controller.getInstance().setPlayerGeneralView
			(
				generalInformationPlayer,
				playerPositionTableColumnName,
				playerPositionTableData,
				playerNationalityTableColumnName,
				playerNationalityTableData,
				playerID
			);
	}

	public void getDataPlayerDetailedView()
	{

		generalInformationPlayer.clear();

		playerAttributeGoalkeepingTableData.clear();
		playerAttributeGoalkeepingTableColumnName.clear();

		playerAttributeMentalTableData.clear();
		playerAttributeMentalTableColumnName.clear();

		playerAttributePhysicalTableData.clear();
		playerAttributePhysicalTableColumnName.clear();

		playerAttributeTechnicalTableData.clear();
		playerAttributeTechnicalTableColumnName.clear();

		playerTagTableData.clear();
		playerTagTableColumnName.clear();

		Controller.getInstance().setPlayerDetailedView
			(
				generalInformationPlayer,
				playerAttributeGoalkeepingTableColumnName,
				playerAttributeGoalkeepingTableData,
				playerAttributeMentalTableColumnName,
				playerAttributeMentalTableData,
				playerAttributePhysicalTableColumnName,
				playerAttributePhysicalTableData,
				playerAttributeTechnicalTableColumnName,
				playerAttributeTechnicalTableData,
				playerTagTableColumnName,
				playerTagTableData,
				playerID
			);
	}
	public void getDataPlayerCareerView()
	{
		generalInformationPlayer.clear();

		playerCareerClubTableColumnName.clear();
		playerCareerClubTableData.clear();

		playerCareerNationalTableColumnName.clear();
		playerCareerNationalTableData.clear();

		Controller.getInstance().setPlayerCareerView
			(
				generalInformationPlayer,
				playerCareerClubTableColumnName,
				playerCareerClubTableData,
				playerCareerNationalTableColumnName,
				playerCareerNationalTableData,
				playerID
			);
	}
	public void getDataPlayerStatisticsView(Vector<String> tableColumnName, Vector<Vector<String>> tableData)
	{
		generalInformationPlayer.clear();

		tableColumnName.clear();
		tableData.clear();


		Controller.getInstance().setPlayerStatisticView
			(
				generalInformationPlayer,
				tableColumnName,
				tableData,
				playerID,
				teamType,
				teamID,
				competitionID,
				startYear,
				endYear
			);
	}

	public void getDataPlayerCaseView()
	{
		generalInformationPlayer.clear();

		playerCaseTrophyClubTableColumnName.clear();
		playerCaseTrophyClubTableData.clear();


		playerCaseTrophyNationalTableColumnName.clear();
		playerCaseTrophyNationalTableData.clear();

		playerCasePrizeTableColumnName.clear();
		playerCasePrizeTableData.clear();


		Controller.getInstance().setPlayerCaseView
			(
				generalInformationPlayer,
				playerCaseTrophyClubTableColumnName,
				playerCaseTrophyClubTableData,
				playerCaseTrophyNationalTableColumnName,
				playerCaseTrophyNationalTableData,
				playerCasePrizeTableColumnName,
				playerCasePrizeTableData,
				playerID
			);
	}

	public void fillPlayerGeneralView()
	{
		getDataPlayerGeneralView();

		GuiConfiguration.fillTable
			(
				playerPositionTable,
				playerPositionTableData,
				playerPositionTableColumnName
			);

		GuiConfiguration.fillTable
			(
				playerNationalityTable,
				playerNationalityTableData,
				playerNationalityTableColumnName
			);

		createGeneralInfoPanel(informationPanel, generalInformationPlayer, "playerInformation");

	}

	public void fillPlayerDetailedView()
	{
		getDataPlayerDetailedView();

		GuiConfiguration.fillTable
			(
				playerAttributeGoalkeepingTable,
				playerAttributeGoalkeepingTableData,
				playerAttributeGoalkeepingTableColumnName
			);

		GuiConfiguration.fillTable
			(
				playerAttributeMentalTable,
				playerAttributeMentalTableData,
				playerAttributeMentalTableColumnName
			);

		GuiConfiguration.fillTable
			(
				playerAttributePhysicalTable,
				playerAttributePhysicalTableData,
				playerAttributePhysicalTableColumnName
			);

		GuiConfiguration.fillTable
			(
				playerAttributeTechnicalTable,
				playerAttributeTechnicalTableData,
				playerAttributeTechnicalTableColumnName
			);


		GuiConfiguration.fillTable
			(
				playerTagTable,
				playerTagTableData,
				playerTagTableColumnName
			);

		createGeneralInfoPanel(informationPanel, generalInformationPlayer, "playerInformation");

	}

	public void fillPlayerCareerView()
	{
		getDataPlayerCareerView();

		GuiConfiguration.fillTable
			(
				playerCareerClubTable,
				playerCareerClubTableData,
				playerCareerClubTableColumnName
			);

		GuiConfiguration.fillTable
			(
				playerCareerNationalTable,
				playerCareerNationalTableData,
				playerCareerNationalTableColumnName
			);

		createGeneralInfoPanel(informationPanel, generalInformationPlayer, "playerInformation");
	}

	public void fillClubStatisticsView()
	{
		getDataPlayerStatisticsView(playerClubStatisticsTableColumnName, playerClubStatisticsTableData);

		GuiConfiguration.fillTable
			(
				playerClubStatisticsTable,
				playerClubStatisticsTableData,
				playerClubStatisticsTableColumnName
			);
		
		createGeneralInfoPanel(informationPanel, generalInformationPlayer, "playerInformation");
	}
	
	public void fillNationalStatisticsView()
	{
		getDataPlayerStatisticsView(playerNationalStatisticsTableColumnName, playerNationalStatisticsTableData);

		GuiConfiguration.fillTable
			(
				playerNationalStatisticsTable,
				playerNationalStatisticsTableData,
				playerNationalStatisticsTableColumnName
			);
		
		createGeneralInfoPanel(informationPanel, generalInformationPlayer, "playerInformation");
	}


	public void fillCaseView()
	{
		getDataPlayerCaseView();

		GuiConfiguration.fillTable
			(
				caseTrophyClubTable,
				playerCaseTrophyClubTableData,
				playerCaseTrophyClubTableColumnName
			);

		GuiConfiguration.fillTable
			(
				caseTrophyNationalTable,
				playerCaseTrophyNationalTableData,
				playerCaseTrophyNationalTableColumnName
			);


		GuiConfiguration.fillTable
			(
				casePrizeTable,
				playerCasePrizeTableData,
				playerCasePrizeTableColumnName
			);

		createGeneralInfoPanel(informationPanel, generalInformationPlayer, "playerInformation");
	}
	public JLabel createInformationTitle(String messageKey)
	{
		String string;
		JLabel label;


		string = GuiConfiguration.getMessage(messageKey);
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		return label;
	}


	public void createGeneralInfoPanel(JPanel panel, Map<String, String> panelHashMap, String messageKey)
	{
		JLabel label;

		panel.removeAll();

		panel.add(createInformationTitle(messageKey), "span 2");


		for (String key: panelHashMap.keySet()) {

			label = new JLabel(key, SwingConstants.LEADING);

			panel.add(label);


			label = new JLabel(panelHashMap.get(key), SwingConstants.LEADING);

			label.setFont(GuiConfiguration.getOutputBoldFont());


			panel.add(label);
		}

	}
}


package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
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
	private final JPanel generalInformationTablePanel;

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
	private final JButton statisticsButton;


	private final JTable playerPositionTable;
	private final JTable playerNationalityTable;
	private final JTable playerAttributeGoalkeepingTable;
	private final JTable playerAttributeMentalTable;

	private final JTable playerAttributePhysicalTable;
	private final JTable playerAttributeTechnicalTable;
	private final JTable playerTagTable;
	private final JTable playerCareerClubTable;
	private final JTable playerCareerNationalTable;



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


	private final Vector<String> playerPositionTableColumnName = new Vector<>();
	private final Vector<String> playerNationalityTableColumnName = new Vector<>();
	private final Vector<String> playerAttributeGoalkeepingTableColumnName = new Vector<>();
	private final Vector<String> playerAttributeMentalTableColumnName = new Vector<>();
	private final Vector<String> playerAttributePhysicalTableColumnName = new Vector<>();
	private final Vector<String> playerAttributeTechnicalTableColumnName = new Vector<>();
	private final Vector<String> playerTagTableColumnName = new Vector<>();
	private final Vector<String> playerCareerClubTableColumnName = new Vector<>();
	private final Vector<String> playerCareerNationalTableColumnName = new Vector<>();

	private final JPanel detailedInformationTablePanel;
	private final JPanel careerInformationTablePanel;


	private JScrollPane scrollPane;
	private JPanel panel;
	private JLabel label;



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
				"0[25%, fill]0[25%, fill]0[25%, fill]0[25%, fill]0",
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
				/*
				GuiConfiguration.switchPanel(getRootPanel(), generalInformationTablePanel, 2);

				 */

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
				/*
				GuiConfiguration.switchPanel(getRootPanel(), detailedInformationTablePanel, 2);

				 */

				fillPlayerDetailedView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLA MILITANZA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("careerInformation");
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
				/*
				GuiConfiguration.switchPanel(getRootPanel(), careerInformationTablePanel, 2);

				 */

				fillPlayerCareerView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLE STATISTICHE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("statistics");
		string = string.toUpperCase();

		statisticsButton = new JButton(string);
		statisticsButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(statisticsButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		statisticsButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{

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

		generalInformationTablePanel = new JPanel(migLayout);
		generalInformationTablePanel.setBackground(panelColor);
		generalInformationTablePanel.setOpaque(false);

		add(generalInformationTablePanel);
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

		generalInformationTablePanel.add(panel);
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

		generalInformationTablePanel.add(panel);
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
				"10[]10[]10"
			);

		detailedInformationTablePanel = new JPanel(migLayout);
		detailedInformationTablePanel.setBackground(panelColor);
		detailedInformationTablePanel.setOpaque(false);

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

		detailedInformationTablePanel.add(panel);
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

		panel.add(scrollPane);
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

		panel.add(scrollPane);
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

		panel.add(scrollPane);
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

		/*
		JLabel label;

		panel.removeAll();

		panel.add(createInformationTitle(messageKey), "span 2");


		for (String key: panelHashMap.keySet()) {

			label = new JLabel(key, SwingConstants.LEADING);

			panel.add(label);


			label = new JLabel(panelHashMap.get(key), SwingConstants.LEADING);

			label.setFont(GuiConfiguration.getOutputBoldFont());


			panel.add(label);
		 */
		}
	}


	/*
	public JPanel getRootPanel()
	{
		return this;
	}

	 */


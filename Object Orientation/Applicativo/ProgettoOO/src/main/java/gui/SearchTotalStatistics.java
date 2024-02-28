package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class SearchTotalStatistics
				extends JPanel
{

	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	private final JPanel titlePanel;
	private final JPanel totalStatisticsPanel;
	private final JPanel teamTypePanel;
	private final JPanel rolePanel;
	private final JPanel totalStatisticsTablePanel;

	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private final JRadioButton clubRadioButton;
	private final JRadioButton nationalRadioButton;

	private final JCheckBox goalkeeperCheckBox;
	private final JCheckBox defenderCheckBox;
	private final JCheckBox midfielderCheckBox;
	private final JCheckBox forwardCheckBox;

	private final ButtonGroup teamTypeGroupButton;

	private final JLabel titleTableLabel;

	private final JTable totalStatisticsTable;
	private final JScrollPane scrollPane;

	private final Vector<String> totalStatisticsTableColumnName = new Vector<>();
	private final Vector<Vector<String>> totalStatisticsTableData = new Vector<>();



	private JPanel infoPanel;
	private JLabel label;

	private String teamType = null;
	private String playerRole = null;

	public SearchTotalStatistics()
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
		string += GuiConfiguration.getMessage("totalPlayerStatistics");
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
				GuiConfiguration.minimizePanel
					(
						getRootPanel(),
						totalStatisticsPanel,
						titleButton,
						"dock center, sgx general"
					);
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
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						new SearchTotalStatistics(),
						2,
						"sgx frame"
					);
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
				"0[]0[fill]10[]0[fill]20[]0"
			);

		totalStatisticsPanel = new JPanel(migLayout);
		totalStatisticsPanel.setOpaque(false);

		add(totalStatisticsPanel, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		totalStatisticsPanel.add(label);
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

		totalStatisticsPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"8%[15%]8%[15%]8%[15%]8%[15%]8%",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		totalStatisticsPanel.add(teamTypePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA CLUB
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(clubRadioButton, "skip 1");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamType = Team.TEAM_TYPE.CLUB.toString();
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
				teamType = Team.TEAM_TYPE.NATIONAL.toString();
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

		totalStatisticsPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		totalStatisticsPanel.add(label);
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

		totalStatisticsPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"8%[15%]8%[15%]8%[15%]8%[15%]8%",
				"10[]10"
			);


		rolePanel = new JPanel(migLayout);
		rolePanel.setBackground(panelColor);

		totalStatisticsPanel.add(rolePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO PORTIERE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("goalkeeper");
		string = StringUtils.capitalize(string);

		goalkeeperCheckBox = new JCheckBox(string);
		goalkeeperCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(goalkeeperCheckBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO DIFENSORE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("defender");
		string = StringUtils.capitalize(string);

		defenderCheckBox = new JCheckBox(string);
		defenderCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(defenderCheckBox);

		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO CENTROCAMPISTA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("midfield");
		string = StringUtils.capitalize(string);

		midfielderCheckBox = new JCheckBox(string);
		midfielderCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(midfielderCheckBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO ATTACCANTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("fowarder");
		string = StringUtils.capitalize(string);

		forwardCheckBox = new JCheckBox(string);
		forwardCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(forwardCheckBox);



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		totalStatisticsPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		totalStatisticsPanel.add(searchButton, "span 2");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				setRolePlayer();

				fillTotalStatisticsTable();

				GuiConfiguration.setTitleTable
					(
						titleTableLabel,
						GuiConfiguration.getMessage("totalPlayerStatistics"),
						totalStatisticsTableData.size()
					);

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA STATISTICHE TOTALI DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		totalStatisticsTablePanel = new JPanel(migLayout);
		totalStatisticsTablePanel.setBackground(panelColor);

		add(totalStatisticsTablePanel, "dock south, sgx general");
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

		totalStatisticsTablePanel.add(titleTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DELLE STATISTICHE TOTALI DI UN CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		totalStatisticsTable = new JTable();

		totalStatisticsTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		totalStatisticsTable.setPreferredScrollableViewportSize(totalStatisticsTable.getPreferredSize());
		totalStatisticsTable.setFillsViewportHeight(true);

		totalStatisticsTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		totalStatisticsTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) totalStatisticsTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(totalStatisticsTable);

		totalStatisticsTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public JPanel getRootPanel()
	{
		return this;
	}
	public void setRolePlayer()
	{
		String string = "";

		if (goalkeeperCheckBox.isSelected()) {
			string += "_GK";
		}

		if (defenderCheckBox.isSelected()) {
			string += "_DF";
		}

		if (midfielderCheckBox.isSelected()) {
			string += "_MF";
		}

		if (forwardCheckBox.isSelected()) {
			string += "_FW";
		}

		if (string.isEmpty()){
			playerRole = null;
		}
		else {
			playerRole = string.substring(1);
		}
	}

	public void getTotalStatisticsTableData(Vector<String> tableColumnName,
											Vector<Vector<String>> tableData,
											String teamType,
											String playerRole)
	{
		tableData.clear();
		tableColumnName.clear();

		Controller.getInstance().setStatisticTable
			(
				tableColumnName,
				tableData,
				teamType,
				playerRole
			);
	}

	public void fillTotalStatisticsTable()
	{
		getTotalStatisticsTableData
			(
				totalStatisticsTableColumnName,
				totalStatisticsTableData,
				teamType,
				playerRole
			);

		GuiConfiguration.fillTable(totalStatisticsTable, totalStatisticsTableData, totalStatisticsTableColumnName);
	}
}

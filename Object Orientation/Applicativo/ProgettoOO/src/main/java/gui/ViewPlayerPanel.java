package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

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

	private final JLabel nameValueLabel;
	private final JLabel dobValueLabel;
	private final JLabel bornCountryValueLabel;
	private final JLabel preferredFootLabel;
	private final JLabel mainPositionValueLabel;
	private final JLabel roleValueLabel;
	private final JLabel retiredDateValueLabel;
	private final JLabel playerPositionTableLabel;
	private final JLabel nationalityTableLabel;
	private final JLabel playerAttributeMentalTableLabel;
	private final JLabel playerAttributeGoalkeepingTableLabel;
	private final JLabel playerAttributePhysicalTableLabel;
	private final JLabel playerAttributeTechnicalTableLabel;
	private final JLabel playerTagTableLabel;

	private final JButton generalInformationButton;
	private final JButton detailedInformationButton;
	private final JButton militancyInformationButton;
	private final JButton statisticsButton;


	private final JTable playerPositionTable;
	private final JTable playerNationalityTable;
	private final JTable playerAttributeGoalkeepingTable;
	private final JTable playerAttributeMentalTable;

	private final JTable playerAttributePhysicalTable;
	private final JTable playerAttributeTechnicalTable;
	private final JTable playerTagTable;


	private final Map<String, String> generalInformationPlayer = new LinkedHashMap<>();
	private final Vector<Vector<String>> playerPositionTableData = new Vector<>();
	private final Vector<Vector<String>> playerNationalityTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributeGoalkeepingTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributeMentalTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributePhysicalTableData = new Vector<>();
	private final Vector<Vector<String>> playerAttributeTechnicalTableData = new Vector<>();
	private final Vector<Vector<String>> playerTagTableData = new Vector<>();

	private final Vector<String> playerPositionTableColumnName = new Vector<>();
	private final Vector<String> playerNationalityTableColumnName = new Vector<>();
	private final  Vector<String> playerAttributeGoalkeepingTableColumnName = new Vector<>();
	private final  Vector<String> playerAttributeMentalTableColumnName = new Vector<>();
	private final  Vector<String> playerAttributePhysicalTableColumnName = new Vector<>();
	private final  Vector<String> playerAttributeTechnicalTableColumnName = new Vector<>();
	private final  Vector<String> playerTagTableColumnName = new Vector<>();

	private final JPanel detailedInformationTablePanel;

	private JScrollPane scrollPane;
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
		 * LABEL INTESTAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("player");
		string = string.toUpperCase();
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INTESTAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		nameValueLabel = new JLabel();
		nameValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(nameValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL DATA DI NASCITA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("dob");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL DATA DI NASCITA VALORE
		 *------------------------------------------------------------------------------------------------------*/



		dobValueLabel = new JLabel();
		dobValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(dobValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NAZIONE DI NASCITA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("bornCountry");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NAZIONE DI NASCITA VALORE
		 *------------------------------------------------------------------------------------------------------*/




		bornCountryValueLabel = new JLabel();
		bornCountryValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(bornCountryValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PIEDE PREFERITO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("preferredFoot");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PIEDE PREFERITO VALORE
		 *------------------------------------------------------------------------------------------------------*/



		preferredFootLabel = new JLabel();
		preferredFootLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(preferredFootLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("mainPosition");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL POSIZIONE PRINCIPALE VALORE
		 *------------------------------------------------------------------------------------------------------*/



		mainPositionValueLabel = new JLabel();
		mainPositionValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(mainPositionValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RUOLO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("role");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RUOLO VALORE
		 *------------------------------------------------------------------------------------------------------*/



		roleValueLabel = new JLabel();
		roleValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(roleValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL DATA DI RITIRO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("retiredDate");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL DATA DI RITIRO VALORE
		 *------------------------------------------------------------------------------------------------------*/



		retiredDateValueLabel = new JLabel();
		retiredDateValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(retiredDateValueLabel);
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
				GuiConfiguration.switchPanel(getRootPanel(), generalInformationTablePanel, 2);

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
				GuiConfiguration.switchPanel(getRootPanel(), detailedInformationTablePanel, 2);

				fillPlayerDetailedView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON VAI ALLE INFORMAZIONI SULLA MILITANZA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("militancyInformation");
		string = string.toUpperCase();

		militancyInformationButton = new JButton(string);
		militancyInformationButton.setCursor(GuiConfiguration.getButtonCursor());

		navigationPanel.add(militancyInformationButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		militancyInformationButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e)
			{

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
				"10[]10[]10"
			);

		generalInformationTablePanel = new JPanel(migLayout);
		generalInformationTablePanel.setBackground(panelColor);

		add(generalInformationTablePanel);
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


		generalInformationTablePanel.add(playerPositionTableLabel);
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


		generalInformationTablePanel.add(nationalityTableLabel);
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

		generalInformationTablePanel.add(scrollPane);
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

		generalInformationTablePanel.add(scrollPane);
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


		detailedInformationTablePanel.add(playerAttributeGoalkeepingTableLabel);
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


		detailedInformationTablePanel.add(playerAttributeMentalTableLabel);
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


		detailedInformationTablePanel.add(playerAttributePhysicalTableLabel);
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


		detailedInformationTablePanel.add(playerAttributeTechnicalTableLabel);
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


		detailedInformationTablePanel.add(playerTagTableLabel);
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

		detailedInformationTablePanel.add(scrollPane);
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

		detailedInformationTablePanel.add(scrollPane);
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

		detailedInformationTablePanel.add(scrollPane);
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

		detailedInformationTablePanel.add(scrollPane);
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

		detailedInformationTablePanel.add(scrollPane);
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

		createGeneralInfoPanel();

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
		
		createGeneralInfoPanel();

	}

	public JLabel createInformationTitle()
	{
		String string;


		string = GuiConfiguration.getMessage("playerInformation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		return label;
	}


	public void createGeneralInfoPanel()
	{

		informationPanel.removeAll();

		informationPanel.add(createInformationTitle(), "span 2");


		for (String key: generalInformationPlayer.keySet()) {

			label = new JLabel(key, SwingConstants.LEADING);

			informationPanel.add(label);


			label = new JLabel(generalInformationPlayer.get(key), SwingConstants.LEADING);

			label.setFont(GuiConfiguration.getOutputBoldFont());

			informationPanel.add(label);
		}
	}


	public JPanel getRootPanel()
	{
		return this;
	}
}

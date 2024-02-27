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
import java.sql.Array;
import java.util.*;

public class ViewTeamPanel
				extends JPanel
{

	private final String teamType;
	private final String teamID;
	private final Color panelColor = Color.white;



	private final JPanel informationPanel;
	private final JPanel seasonPanel;
	private final JPanel tablePanel;
	private final JPanel squadPanel;
	private final JPanel participationPanel;
	private final JPanel awardPanel;

	private final JTable squadTable;
	private final JTable participationTable;
	private final JTable trophyTable;
	private final JTable prizeTable;


	private final JComboBox<String> seasonComboBox;

	private final JButton showButton;

	private final JLabel titleLabel;
	private final JLabel teamNameLabel;
	private final JLabel shortNameLabel;
	private final JLabel shortNameValueLabel;
	private final JLabel typeLabel;
	private final JLabel typeValueLabel;
	private final JLabel countryLabel;
	private final JLabel countryValueLabel;
	private final JLabel confederationLabel;
	private final JLabel confederationValueLabel;
	private final JLabel titleSquadTable;
	private final JLabel titleParticipantTable;
	private final JLabel titleTrophyTable;
	private final JLabel titlePrizeTable;

	private final Map<String, String> seasonMap = new HashMap<>();

	private final Map<String, String> generalInformationTeam = new LinkedHashMap<>();
	private final Vector<String> teamSquadTableColumnName = new Vector<>();
	private final Vector<String> teamParticipationTableColumnName = new Vector<>();
	private final Vector<String> teamTrophyTableColumnName = new Vector<>();
	private final Vector<String> teamPrizeTableColumnName = new Vector<>();

	private final Vector<Vector<String>> teamSquadTableData = new Vector<>();
	private final Vector<Vector<String>> teamParticipationTableData = new Vector<>();
	private final Vector<Vector<String>> teamTrophyTableData = new Vector<>();
	private final Vector<Vector<String>> teamPrizeTableData = new Vector<>();


	private String startYear;

	private JScrollPane scrollPane;
	private JLabel label;



	public ViewTeamPanel(String teamID, String teamType)
	{

		this.teamID = teamID;
		this.teamType = teamType;

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]10",
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
				"10[40%, fill]40[50%, fill]10",
				"10[]10[]10[]10[]10[]10[]10[]10"
			);

		informationPanel = new JPanel(migLayout);
		informationPanel.setBackground(panelColor);

		add(informationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INTESTAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		string += ": ";

		titleLabel = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INTESTAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		teamNameLabel = new JLabel();
		teamNameLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(teamNameLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NOME ABBREVIATO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);
		string += ": ";

		shortNameLabel = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(shortNameLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NOME ABBREVIATO VALORE
		 *------------------------------------------------------------------------------------------------------*/


		shortNameValueLabel = new JLabel();
		shortNameValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(shortNameValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("teamType");
		string = StringUtils.capitalize(string);
		string += ": ";

		typeLabel = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(typeLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TIPO SQUADRA VALORE
		 *------------------------------------------------------------------------------------------------------*/



		typeValueLabel = new JLabel();
		typeValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(typeValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("country");
		string = StringUtils.capitalize(string);
		string += ": ";


		countryLabel = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(countryLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PAESE VALORE
		 *------------------------------------------------------------------------------------------------------*/



		countryValueLabel = new JLabel();
		countryValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(countryValueLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CONFEDERAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("confederation");
		string = StringUtils.capitalize(string);
		string += ": ";

		confederationLabel = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(confederationLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CONFEDERAZIONE VALORE
		 *------------------------------------------------------------------------------------------------------*/



		confederationValueLabel = new JLabel();
		confederationValueLabel.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(confederationValueLabel);
		/*------------------------------------------------------------------------------------------------------*/




		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"20[]30[]20[]20",
				"10[]10"
			);

		seasonPanel = new JPanel(migLayout);
		seasonPanel.setBackground(panelColor);

		add(seasonPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		seasonPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox = new JComboBox<>();

		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		GuiConfiguration.fillSeasonComboBox(seasonComboBox, GuiConfiguration.getMinYear(), this.teamType, seasonMap);

		startYear = seasonMap.get((String) seasonComboBox.getSelectedItem());

		seasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		seasonPanel.add(seasonComboBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE MOSTRA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("show");
		string = string.toUpperCase();

		showButton = new JButton(string);

		seasonPanel.add(showButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		showButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				startYear = seasonMap.get((String) seasonComboBox.getSelectedItem());

				fillTeamView();

				MainFrame.getMainFrameInstance().pack();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"0[60%, fill]3%[36%, fill]0",
				"0[]20[]10"

			);

		tablePanel = new JPanel(migLayout);
		tablePanel.setOpaque(false);

		add(tablePanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[fill]0",
				"0[]10[]10"
			);

		squadPanel = new JPanel(migLayout);
		squadPanel.setBackground(panelColor);

		tablePanel.add(squadPanel, "spany, top");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/




		titleSquadTable = new JLabel();

		titleSquadTable.setOpaque(true);
		titleSquadTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titleSquadTable.setForeground(Color.white);

		titleSquadTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		titleSquadTable.setFont(GuiConfiguration.getOutputBoldFont());

		setTitleTable(titleSquadTable, "squad");

		squadPanel.add(titleSquadTable);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/


		squadTable = new JTable(new DefaultTableModel(30, 5));

		squadTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		squadTable.setPreferredScrollableViewportSize(squadTable.getPreferredSize());
		squadTable.setFillsViewportHeight(true);

		squadTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) squadTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(squadTable);

		squadPanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[fill]0",
				"0[]10[]10"
			);

		participationPanel = new JPanel(migLayout);
		participationPanel.setBackground(panelColor);

		tablePanel.add(participationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/


		titleParticipantTable = new JLabel();

		titleParticipantTable.setOpaque(true);
		titleParticipantTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titleParticipantTable.setForeground(Color.white);

		titleParticipantTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		titleParticipantTable.setFont(GuiConfiguration.getOutputBoldFont());

		setTitleTable(titleParticipantTable, "participations");

		participationPanel.add(titleParticipantTable);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/



		participationTable = new JTable(new DefaultTableModel(10, 5));

		participationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());
		participationTable.setFillsViewportHeight(true);

		participationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) participationTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(participationTable);

		participationPanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[fill]0",
				"0[]10[]20[]10[]0[]10"
			);

		awardPanel = new JPanel(migLayout);
		awardPanel.setBackground(panelColor);


		tablePanel.add(awardPanel, "skip 1, top");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		titleTrophyTable = new JLabel();

		titleTrophyTable.setOpaque(true);
		titleTrophyTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titleTrophyTable.setForeground(Color.white);

		titleTrophyTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		titleTrophyTable.setFont(GuiConfiguration.getOutputBoldFont());

		setTitleTable(titleTrophyTable, "trophies");

		awardPanel.add(titleTrophyTable);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		trophyTable = new JTable(new DefaultTableModel(5, 5));

		trophyTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());
		trophyTable.setFillsViewportHeight(true);

		trophyTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) trophyTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(trophyTable);

		awardPanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		titlePrizeTable = new JLabel(string, SwingConstants.LEADING);

		titlePrizeTable.setOpaque(true);
		titlePrizeTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titlePrizeTable.setForeground(Color.white);

		titlePrizeTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		titlePrizeTable.setFont(GuiConfiguration.getOutputBoldFont());

		setTitleTable(titlePrizeTable, "prizes");

		awardPanel.add(titlePrizeTable);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		prizeTable = new JTable(new DefaultTableModel(5,5));

		prizeTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		prizeTable.setPreferredScrollableViewportSize(prizeTable.getPreferredSize());
		prizeTable.setFillsViewportHeight(true);

		prizeTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) prizeTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI PREMI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(prizeTable);

		awardPanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/

		fillTeamView();

	}


	public void getDataTeamView(String teamID,
							 String startYear,
							 Map<String, String> generalInformationTeam,
							 Vector<String> teamSquadTableColumnName,
							 Vector<Vector<String>> teamSquadTableData,
							 Vector<String> teamParticipationTableColumnName,
							 Vector<Vector<String>> teamParticipationTableData,
							 Vector<String> teamTrophyTableColumnName,
							 Vector<Vector<String>> teamTrophyTableData,
							 Vector<String> teamPrizeTableColumnName,
							 Vector<Vector<String>> teamPrizeTableData)
	{

		generalInformationTeam.clear();
		teamSquadTableColumnName.clear();
		teamSquadTableData.clear();
		teamParticipationTableColumnName.clear();
		teamParticipationTableData.clear();
		teamTrophyTableColumnName.clear();
		teamTrophyTableData.clear();
		teamPrizeTableColumnName.clear();
		teamPrizeTableData.clear();

		Controller.getInstance().setTeamView
			(
				generalInformationTeam,
				teamSquadTableColumnName,
				teamSquadTableData,
				teamParticipationTableColumnName,
				teamParticipationTableData,
				teamTrophyTableColumnName,
				teamTrophyTableData,
				teamPrizeTableColumnName,
				teamPrizeTableData,
				teamID,
				startYear
			);
	}

	public void fillTeamView()
	{
		getDataTeamView
			(
				teamID,
				startYear,
				generalInformationTeam,
				teamSquadTableColumnName,
				teamSquadTableData,
				teamParticipationTableColumnName,
				teamParticipationTableData,
				teamTrophyTableColumnName,
				teamTrophyTableData,
				teamPrizeTableColumnName,
				teamPrizeTableData
			);

		fillTable(squadTable, teamSquadTableData, teamSquadTableColumnName);

		setTitleTable(titleSquadTable, "squad");

		fillTable(participationTable, teamParticipationTableData, teamParticipationTableColumnName);

		setTitleTable(titleParticipantTable, "participants");

		fillTable(trophyTable, teamTrophyTableData, teamTrophyTableColumnName);

		setTitleTable(titleTrophyTable, "trophies");

		fillTable(prizeTable, teamPrizeTableData, teamPrizeTableColumnName);
		setTitleTable(titlePrizeTable, "prizes");

		createGeneralInfoPanel();

	}

	public void fillTable(JTable table, Vector<Vector<String>> tableData, Vector<String> tableColumnName)
	{
		table.setModel(new TableModel(tableData, tableColumnName));

		table.setPreferredScrollableViewportSize(table.getPreferredSize());
	}

	public void setTitleTable(JLabel label, String tableName)
	{
		String string;

		string = GuiConfiguration.getMessage(tableName);
		string += " ";
		string += generalInformationTeam.get("SQUADRA");
		string += " ";
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label.setText(string);
	}
	public void createGeneralInfoPanel()
	{
		Integer i = 0;

		JLabel[] tmp = new JLabel[]{ teamNameLabel, shortNameValueLabel, typeValueLabel, countryValueLabel, confederationValueLabel};


		for (String key: generalInformationTeam.keySet()) {
			tmp[i].setText(generalInformationTeam.get(key));
			i++;
		}
	}
}

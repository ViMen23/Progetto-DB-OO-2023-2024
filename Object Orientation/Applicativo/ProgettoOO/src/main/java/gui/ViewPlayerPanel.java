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
import java.util.Map;
import java.util.Vector;

public class ViewPlayerPanel
	extends JPanel
{

	private final String playerID;
	private final Color panelColor = Color.white;

	private final JPanel informationPanel;
	private final JPanel navigationPanel;
	private final JPanel tablePanel;

	private final JLabel nameValueLabel;
	private final JLabel dobValueLabel;
	private final JLabel bornCountryValueLabel;
	private final JLabel preferredFootLabel;
	private final JLabel mainPositionValueLabel;
	private final JLabel roleValueLabel;
	private final JLabel retiredDateValueLabel;
	private final JLabel positionTableLabel;
	private final JLabel nationalityTableLabel;
	private final JButton generalInformationButton;
	private final JButton detailedInformationButton;
	private final JButton militancyInformationButton;
	private final JButton statisticsButton;


	private final JTable positionTable;
	private final JTable nationalityTable;

	private JScrollPane scrollPane;
	private JLabel label;

	private String teamType;


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
		 * LABEL TITOLO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("playerInformation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		informationPanel.add(label, "span 2");
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
		 * PANEL TABELLE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2, fill",
				"0[grow, fill]30[grow, fill]0",
				"10[]10[]10"
			);

		tablePanel = new JPanel(migLayout);
		tablePanel.setBackground(panelColor);

		add(tablePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA POSIZIONI
		 *------------------------------------------------------------------------------------------------------*/
		string = "Tabella posizioni";


		positionTableLabel = new JLabel(string, SwingConstants.LEADING);

		positionTableLabel.setOpaque(true);
		positionTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		positionTableLabel.setForeground(Color.white);

		positionTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		tablePanel.add(positionTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TITOLO TABELLA NAZIONALITÀ
		 *------------------------------------------------------------------------------------------------------*/
		string = "Tabella nazionalità";


		nationalityTableLabel = new JLabel(string, SwingConstants.LEADING);

		nationalityTableLabel.setOpaque(true);
		nationalityTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nationalityTableLabel.setForeground(Color.white);

		nationalityTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		tablePanel.add(nationalityTableLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA POSIZIONI
		 *------------------------------------------------------------------------------------------------------*/


		positionTable = new JTable(new DefaultTableModel(5, 3));

		positionTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		positionTable.setPreferredScrollableViewportSize(positionTable.getPreferredSize());
		positionTable.setFillsViewportHeight(true);

		positionTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) positionTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(positionTable);

		tablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA POSIZIONI
		 *------------------------------------------------------------------------------------------------------*/


		nationalityTable = new JTable(new DefaultTableModel(3, 1));

		nationalityTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		nationalityTable.setPreferredScrollableViewportSize(nationalityTable.getPreferredSize());
		nationalityTable.setFillsViewportHeight(true);

		nationalityTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		( (DefaultTableCellRenderer) nationalityTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(nationalityTable);

		tablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	/*
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


	 */
	public void fillTable(JTable table, Vector<Vector<String>> tableData, Vector<String> tableColumnName)
	{
		table.setModel(new TableModel(tableData, tableColumnName));

		table.setPreferredScrollableViewportSize(table.getPreferredSize());
	}


	public void createGeneralInfoPanel()
	{
		Integer i = 0;

		JLabel[] tmp = new JLabel[]
			{
				nameValueLabel,
				dobValueLabel,
				bornCountryValueLabel,
				preferredFootLabel,
				mainPositionValueLabel,
				roleValueLabel,
				retiredDateValueLabel
			};


		/*
		for (String key: generalInformationTeam.keySet()) {
			tmp[i].setText(generalInformationTeam.get(key));
			i++;
		}

		 */
	}
}

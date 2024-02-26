package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.*;

public class ViewTeamPanel
				extends JPanel
{

	protected JPanel informationPanel;
	protected JPanel seasonPanel;
	protected JPanel tablePanel;
	protected JPanel squadPanel;
	protected JPanel participationPanel;
	protected JPanel awardPanel;
	protected JPanel trophyPanel;
	protected JPanel prizePanel;
	protected JTable squadTable;
	protected JTable participationTable;
	protected JTable trophyTable;
	protected JTable prizeTable;
	protected JScrollPane scrollPane;


	protected JLabel label;
	protected JComboBox<String> seasonComboBox;
	protected JButton showButton;
	protected JButton goButton;

	private final Color panelColor = Color.white;


	public ViewTeamPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"20[]10[]10[]10"
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
				"10[]0[]10[]10[]10[]10[]10"
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

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INTESTAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = "SSC Napoli"; //TODO REPLACE WITH CALL TO DB

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NOME ABBREVIATO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NOME ABBREVIATO VALORE
		 *------------------------------------------------------------------------------------------------------*/



		string = "NAP"; //TODO REPLACE WITH CALL TO DB

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("teamType");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TIPO SQUADRA VALORE
		 *------------------------------------------------------------------------------------------------------*/



		string = "CLUB";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("country");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PAESE VALORE
		 *------------------------------------------------------------------------------------------------------*/



		string = "ITALIA WITH FLAG";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CONFEDERAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("confederation");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CONFEDERAZIONE VALORE
		 *------------------------------------------------------------------------------------------------------*/



		string = "FEDERAZIONE GIUOCO CALCIO";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		informationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"20:push[]30[]20[]20:push",
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
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		seasonPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox = new JComboBox<>();

		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, fill",
				"0[grow,fill]10[grow,fill]10",
				"0[grow, fill]0"
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
				"[grow, fill]",
				"10[]0[]10[]10"
			);

		squadPanel = new JPanel(migLayout);
		squadPanel.setBackground(panelColor);

		tablePanel.add(squadPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("squad");
		string += " ";
		string += "SCC Napoli"; //TODO REPLACE WITH VALUE GIVEN;
		string += " ";
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += (String) seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		squadPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/


		squadTable = new JTable();

		squadTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		squadTable.setPreferredScrollableViewportSize(squadTable.getPreferredSize());
		squadTable.setFillsViewportHeight(true);

		squadTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		squadTable.setAutoCreateRowSorter(true);
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
				"0[grow, fill]0",
				"10[]0[]10[]10"
			);

		participationPanel = new JPanel(migLayout);
		participationPanel.setBackground(panelColor);

		tablePanel.add(participationPanel, "split 2, flowy");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/


		string = GuiConfiguration.getMessage("participations");
		string += " ";
		string += "SCC Napoli "; //TODO REPLACE WITH GIVEN VALUE
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += (String) seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		participationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/



		participationTable = new JTable();

		participationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());
		participationTable.setFillsViewportHeight(true);

		participationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		participationTable.setAutoCreateRowSorter(true);
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
				"[fill]",
				"10[]0[]10[]10"
			);

		trophyPanel = new JPanel(migLayout);
		trophyPanel.setBackground(panelColor);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("trophies");
		string += " ";
		string += "SCC Napoli ";//TODO REPLACE WITH GIVEN VALUE
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += (String) seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		trophyPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		trophyTable = new JTable();

		trophyTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());
		trophyTable.setFillsViewportHeight(true);

		trophyTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		trophyTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) trophyTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(trophyTable);

		trophyPanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA PREMI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[fill]0",
				"10[]0[]10[]10"
			);

		prizePanel = new JPanel(migLayout);
		prizePanel.setBackground(panelColor);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("prizes");
		string += " ";
		string += "SCC Napoli ";//TODO replace with given value
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += (String) seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		prizePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		prizeTable = new JTable();

		prizeTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		prizeTable.setPreferredScrollableViewportSize(prizeTable.getPreferredSize());
		prizeTable.setFillsViewportHeight(true);

		prizeTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		prizeTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) prizeTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI PREMI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(prizeTable);

		prizePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA AWARD
		 *------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[fill]0",
				"0[]0[]0[]0"
			);

		awardPanel = new JPanel(migLayout);
		awardPanel.setBackground(panelColor);

		tablePanel.add(awardPanel);

		awardPanel.add(trophyPanel);
		awardPanel.add(prizePanel);
	}
}

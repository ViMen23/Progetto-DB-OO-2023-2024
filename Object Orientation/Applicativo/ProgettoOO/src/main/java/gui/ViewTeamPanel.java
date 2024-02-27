package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;

public class ViewTeamPanel
				extends JPanel
{

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

	private final Map<String, String> seasonMap = new HashMap<>();


	private JScrollPane scrollPane;
	private JLabel label;

	private String teamType;


	public ViewTeamPanel()
	{

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



		string = GuiConfiguration.getMessage("teamInformation");
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
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		seasonPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox = new JComboBox<>();

		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		GuiConfiguration.fillSeasonComboBox(seasonComboBox, GuiConfiguration.getMinYear(), teamType, seasonMap);

		seasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		seasonPanel.add(seasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/




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
				"debug, wrap 2",
				"0[60%, fill]3%[37%, fill]0",
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

		tablePanel.add(squadPanel, "spany");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("squad");
		string += " ";
		string += "SCC Napoli "; //TODO REPLACE WITH GIVEN VALUE
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += (String) seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		label.setFont(GuiConfiguration.getOutputBoldFont());

		squadPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA ROSA
		 *------------------------------------------------------------------------------------------------------*/


		squadTable = new JTable(new DefaultTableModel(30, 5));

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



		string = GuiConfiguration.getMessage("participations");
		string += " ";
		string += "SCC Napoli "; //TODO REPLACE WITH GIVEN VALUE
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += (String) seasonComboBox.getSelectedItem();
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		label.setFont(GuiConfiguration.getOutputBoldFont());

		participationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA PARTECIPAZIONI
		 *------------------------------------------------------------------------------------------------------*/



		participationTable = new JTable(new DefaultTableModel(10, 5));

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
				"0[fill]0",
				"0[]10[]20[]10[]0[]10"
			);

		awardPanel = new JPanel(migLayout);
		awardPanel.setBackground(panelColor);


		tablePanel.add(awardPanel, "skip 1");
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

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		label.setFont(GuiConfiguration.getOutputBoldFont());

		awardPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		trophyTable = new JTable(new DefaultTableModel(5, 5));

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

		awardPanel.add(scrollPane);
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

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		label.setFont(GuiConfiguration.getOutputBoldFont());

		awardPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABELLA TROFEI
		 *------------------------------------------------------------------------------------------------------*/



		prizeTable = new JTable(new DefaultTableModel(5,5));

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

		awardPanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}
}

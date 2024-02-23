//package gui;
//
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import java.awt.*;
//
//public class ViewTeamPanel
//				extends JPanel
//{
//
//	protected JPanel informationPanel;
//	protected JPanel seasonPanel;
//	protected JPanel tablePanel;
//	protected JPanel squadPanel;
//	protected JPanel participationPanel;
//	protected JPanel awardPanel;
//	protected JPanel trophyPanel;
//	protected JPanel prizePanel;
//	protected JTable squadTable;
//	protected JTable participationTable;
//	protected JTable trophyTable;
//	protected JTable prizeTable;
//	protected JScrollPane scrollPane;
//
//
//	protected JLabel label;
//	protected JComboBox<String> comboBox;
//	protected JButton showButton;
//	protected JButton goButton;
//
//	protected Color panelColor = Color.white;
//
//
//	public ViewTeamPanel()
//	{
//		String string;
//		MigLayout migLayout;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"0[grow, fill]0",
//				"20[]10[]10[]10"
//			);
//
//		setLayout(migLayout);
//
//
//		/*
//		 * Campo informazioni squadra: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"10[grow, fill]40[grow, fill]10",
//				"10[]0[]10[]10[]10[]10[]10"
//			);
//
//		informationPanel = new JPanel(migLayout);
//		informationPanel.setBackground(panelColor);
//
//		add(informationPanel);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("team");
//		string = string.toUpperCase();
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore titolo: stampa
//		 */
//		string = "SSC Napoli";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: stampa
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		informationPanel.add(label, "spanx 2");
//
//		/*
//		 * Campo nome abbreviato: stampa
//		 */
//		string = GuiConfiguration.getMessage("shortName");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo nome abbreviato: stampa
//		 */
//		string = "NAP";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo tipo squadra: stampa
//		 */
//		string = GuiConfiguration.getMessage("teamType");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore tipo squadra: stampa
//		 */
//		string = "CLUB";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo paese: stampa
//		 */
//		string = GuiConfiguration.getMessage("country");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore paese: stampa
//		 */
//		string = "ITALIA WITH FLAG";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//
//		/*
//		 * Campo confederazione: stampa
//		 */
//		string = GuiConfiguration.getMessage("confederation");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore confederazione: stampa
//		 */
//		string = "FEDERAZIONE GIUOCO CALCIO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//
//		/*
//		 * Campo panello stagione: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20:push[]30[]20[]20:push",
//				"10[]10"
//			);
//
//		seasonPanel = new JPanel(migLayout);
//		seasonPanel.setBackground(panelColor);
//
//		add(seasonPanel);
//
//		/*
//		 * Campo stagione: stampa
//		 */
//		string = GuiConfiguration.getMessage("season");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		seasonPanel.add(label);
//
//		/*
//		 * Campo stagione: comboBox
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		seasonPanel.add(comboBox);
//
//		/*
//		 * Campo stagione azione mostra: bottone
//		 */
//		string = GuiConfiguration.getMessage("show");
//		string = string.toUpperCase();
//
//		showButton = new JButton(string);
//
//		seasonPanel.add(showButton);
//
//		/*
//		 * Campo tabelle squadra: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx, fill",
//				"0[grow,fill]10[grow,fill]10",
//				"0[grow, fill]0"
//			);
//
//		tablePanel = new JPanel(migLayout);
//		tablePanel.setOpaque(false);
//
//		add(tablePanel);
//
//		/*
//		 * Campo tabella rosa: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"[grow, fill]",
//				"10[]0[]10[]10"
//			);
//
//		squadPanel = new JPanel(migLayout);
//		squadPanel.setBackground(panelColor);
//
//		tablePanel.add(squadPanel);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("squad");
//		string += " ";
//		string += "SCC Napoli";
//		string += " ";
//		string += GuiConfiguration.getMessage("season");
//		string += " ";
//		string += "2022-2023";
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		squadPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: stampa
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		squadPanel.add(label);
//
//		/*
//		 * Campo tabella rosa squadra: table
//		 */
//		squadTable = new JTable(new TableModel("squad", null));
//
//		squadTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		squadTable.setFillsViewportHeight(true);
//		squadTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(squadTable);
//
//		squadPanel.add(scrollPane);
//
//		/*
//		 * Campo tabella partecipazioni: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"0[grow, fill]0",
//				"10[]0[]10[]10"
//			);
//
//		participationPanel = new JPanel(migLayout);
//		participationPanel.setBackground(panelColor);
//
//		tablePanel.add(participationPanel, "split 2, flowy");
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("participations");
//		string += " ";
//		string += "SCC Napoli ";
//		string += GuiConfiguration.getMessage("season");
//		string += " ";
//		string += "2022-2023";
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		participationPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: stampa
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		participationPanel.add(label);
//
//		/*
//		 * Campo tabella partecipazioni: table
//		 */
//		participationTable = new JTable(new TableModel("competitionParticipation", null));
//
//		participationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		participationTable.setFillsViewportHeight(true);
//		participationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(participationTable);
//
//		participationPanel.add(scrollPane);
//
//		/*
//		 * Campo tabella trofei: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"[fill]",
//				"10[]0[]10[]10"
//			);
//
//		trophyPanel = new JPanel(migLayout);
//		trophyPanel.setBackground(panelColor);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("trophies");
//		string += " ";
//		string += "SCC Napoli ";
//		string += GuiConfiguration.getMessage("season");
//		string += " ";
//		string += "2022-2023";
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		trophyPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: stampa
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		trophyPanel.add(label);
//
//		/*
//		 * Campo tabella trofei: table
//		 */
//		trophyTable = new JTable(new TableModel("trophyTeam", null));
//
//		trophyTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		trophyTable.setFillsViewportHeight(true);
//		trophyTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(trophyTable);
//
//		trophyPanel.add(scrollPane);
//
//		/*
//		 * Campo tabella premi: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"0[fill]0",
//				"10[]0[]10[]10"
//			);
//
//		prizePanel = new JPanel(migLayout);
//		prizePanel.setBackground(panelColor);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("prizes");
//		string += " ";
//		string += "SCC Napoli ";
//		string += GuiConfiguration.getMessage("season");
//		string += " ";
//		string += "2022-2023";
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		prizePanel.add(label);
//
//		/*
//		 * Campo separatore titolo: stampa
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		prizePanel.add(label);
//
//		/*
//		 * Campo tabella premi: table
//		 */
//		prizeTable = new JTable(new TableModel("prizeTeam", null));
//
//		prizeTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		prizeTable.setFillsViewportHeight(true);
//		prizeTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(prizeTable);
//
//		prizePanel.add(scrollPane);
//
//		/*
//		 * Campo tabella trofei e premi: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"0[fill]0",
//				"0[]0[]0[]0"
//			);
//
//		awardPanel = new JPanel(migLayout);
//		awardPanel.setBackground(panelColor);
//
//		tablePanel.add(awardPanel);
//
//		awardPanel.add(trophyPanel);
//		awardPanel.add(prizePanel);
//
//
//		/*
//		 * Campo azione alla bacheca: button
//		 */
//		string = GuiConfiguration.getMessage("go");
//		string += " ";
//		string += GuiConfiguration.getMessage("to");
//		string += " ";
//		string += GuiConfiguration.getMessage("case");
//		string = StringUtils.capitalize(string);
//
//		goButton = new JButton(string);
//
//		awardPanel.add(goButton, "right");
//	}
//}

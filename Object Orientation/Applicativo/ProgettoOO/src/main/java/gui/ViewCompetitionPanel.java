//package gui;
//
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import java.awt.*;
//
//public class ViewCompetitionPanel
//				extends JPanel
//{
//	protected JPanel informationPanel;
//	protected JPanel seasonPanel;
//	protected JPanel teamTrophyPanel;
//	protected JPanel playerTrophyPanel;
//	protected JPanel partecipationPanel;
//
//	protected JLabel label;
//	protected JComboBox<String> comboBox;
//	protected JButton showButton;
//	protected JTable teamTrophyTable;
//	protected JTable playerTrophyTable;
//	protected JTable partecipationTable;
//	protected JScrollPane scrollPane;
//
//	protected Color panelColor = Color.white;
//
//	public ViewCompetitionPanel()
//	{
//		String string;
//		MigLayout migLayout;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"0[grow, fill]0",
//				"20[]10[]10[]10[]10"
//			);
//
//		setLayout(migLayout);
//
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
//		string = GuiConfiguration.getMessage("competition");
//		string += ": ";
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore titolo: stampa
//		 */
//		string = "Serie A";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: bordo
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		informationPanel.add(label, "spanx 2");
//
//		/*
//		 * Campo tipo: stampa
//		 */
//		string = GuiConfiguration.getMessage("competitionType");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore tipo: stampa
//		 */
//
//		string = "CAMPIONATO-CLUB";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo frequenza: stampa
//		 */
//		string = GuiConfiguration.getMessage("frequency");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		informationPanel.add(label);
//
//		/*
//		 * Campo valore frequenza: stampa
//		 */
//		string = "1";
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
//		string = "Italia";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
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
//		 * Campo confederazione: stampa
//		 */
//		string = "Federazione giuco calcio";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		informationPanel.add(label);
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
//		 * Campo tabella partecipazioni squadre: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"[fill]",
//				"10[]0[]10[]10"
//			);
//
//		partecipationPanel = new JPanel(migLayout);
//		partecipationPanel.setBackground(panelColor);
//
//		add(partecipationPanel);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("teams");
//		string += " ";
//		string += GuiConfiguration.getMessage("participants");
//		string += " ";
//		string += "Serie A 2022-2023";
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.CENTER);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		partecipationPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: stampa
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		partecipationPanel.add(label);
//
//		/*
//		 * Campo tabella trofei squadra: table
//		 */
//		partecipationTable = new JTable(new TableModel("partecipant", null));
//
//		partecipationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		partecipationTable.setFillsViewportHeight(true);
//		partecipationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(partecipationTable);
//
//		partecipationPanel.add(scrollPane);
//
//		/*
//		 * Campo tabella trofei squadra: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"[fill]",
//				"10[]0[]10[]10"
//			);
//
//		teamTrophyPanel = new JPanel(migLayout);
//		teamTrophyPanel.setBackground(panelColor);
//
//		add(teamTrophyPanel, "split 2, flowx");
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("teamTrophies");
//		string += " ";
//		string += "Serie A 2022-2023";
//		string = string.toUpperCase();
//
//
//		label = new JLabel(string, SwingConstants.CENTER);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		teamTrophyPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: bordo
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		teamTrophyPanel.add(label);
//
//		/*
//		 * Campo tabella trofei squadra: table
//		 */
//		teamTrophyTable = new JTable(new TableModel("teamTrophy", null));
//
//		teamTrophyTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		teamTrophyTable.setFillsViewportHeight(true);
//		teamTrophyTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(teamTrophyTable);
//
//		teamTrophyPanel.add(scrollPane);
//
//		/*
//		 * Campo tabella trofei calciatori: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"[fill]",
//				"10[]0[]10[]10"
//			);
//
//		playerTrophyPanel = new JPanel(migLayout);
//		playerTrophyPanel.setBackground(panelColor);
//
//		add(playerTrophyPanel);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("playerTrophies");
//		string += " ";
//		string += "Serie A 2022-2023";
//		string = string.toUpperCase();
//
//
//		label = new JLabel(string, SwingConstants.CENTER);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		playerTrophyPanel.add(label);
//
//		/*
//		 * Campo separatore titolo: bordo
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		playerTrophyPanel.add(label);
//
//		/*
//		 * Campo tabella trofei squadra: table
//		 */
//		playerTrophyTable = new JTable(new TableModel("playerTrophy", null));
//
//		playerTrophyTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		playerTrophyTable.setFillsViewportHeight(true);
//		playerTrophyTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(playerTrophyTable);
//
//		playerTrophyPanel.add(scrollPane);
//	}
//}

package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;

public class TeamTrophy
				extends JPanel
{

	protected JLabel label;
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
	protected JButton button;

	protected Color panelColor = Color.white;



	public TeamTrophy()
	{

		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowx",
				"10[grow, fill]40[grow, fill]10",
				"10[]10"
			);

		setLayout(migLayout);


		/*
		 * Campo tabella rosa: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"[fill]",
				"10[]0[]10[]10"
			);

		squadPanel = new JPanel(migLayout);
		squadPanel.setBackground(panelColor);

		add(squadPanel);

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("squad");
		string += " ";
		string += "SCC Napoli";
		string += " ";
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += "2022-2023";
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		squadPanel.add(label);

		/*
		 * Campo separatore titolo: stampa
		 */
		label = new JLabel();
		label.setBorder(GuiConfiguration.getLabelBorder());

		squadPanel.add(label);

		/*
		 * Campo tabella rosa squadra: table
		 */
		squadTable = new JTable(new TableModel("squad"));

		squadTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		squadTable.setFillsViewportHeight(true);
		squadTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(squadTable);

		squadPanel.add(scrollPane);

		/*
		 * Campo tabella partecipazioni: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"[fill]",
				"10[]0[]10[]10"
			);

		participationPanel = new JPanel(migLayout);
		participationPanel.setBackground(panelColor);

		add(participationPanel, "split 2, flowy");

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("participations");
		string += " ";
		string += "SCC Napoli ";
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += "2022-2023";
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		participationPanel.add(label);

		/*
		 * Campo separatore titolo: stampa
		 */
		label = new JLabel();
		label.setBorder(GuiConfiguration.getLabelBorder());

		participationPanel.add(label);

		/*
		 * Campo tabella partecipazioni: table
		 */
		participationTable = new JTable(new TableModel("competitionParticipation"));

		participationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		participationTable.setFillsViewportHeight(true);
		participationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(participationTable);

		participationPanel.add(scrollPane);

		/*
		 * Campo tabella trofei: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"[fill]",
				"10[]0[]10[]10"
			);

		trophyPanel = new JPanel(migLayout);
		trophyPanel.setBackground(panelColor);

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("trophies");
		string += " ";
		string += "SCC Napoli ";
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += "2022-2023";
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		trophyPanel.add(label);

		/*
		 * Campo separatore titolo: stampa
		 */
		label = new JLabel();
		label.setBorder(GuiConfiguration.getLabelBorder());

		trophyPanel.add(label);

		/*
		 * Campo tabella trofei: table
		 */
		trophyTable = new JTable(new TableModel("trophyTeam"));

		trophyTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		trophyTable.setFillsViewportHeight(true);
		trophyTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(trophyTable);

		trophyPanel.add(scrollPane);

		/*
		 * Campo tabella premi: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"[fill]",
				"10[]0[]10[]10"
			);

		prizePanel = new JPanel(migLayout);
		prizePanel.setBackground(panelColor);

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("prizes");
		string += " ";
		string += "SCC Napoli ";
		string += GuiConfiguration.getMessage("season");
		string += " ";
		string += "2022-2023";
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		prizePanel.add(label);

		/*
		 * Campo separatore titolo: stampa
		 */
		label = new JLabel();
		label.setBorder(GuiConfiguration.getLabelBorder());

		prizePanel.add(label);

		/*
		 * Campo tabella premi: table
		 */
		prizeTable = new JTable(new TableModel("prizeTeam"));

		prizeTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		prizeTable.setFillsViewportHeight(true);
		prizeTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(prizeTable);

		prizePanel.add(scrollPane);

		/*
		 * Campo tabella trofei e premi: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"10[]20[]10[]10"
			);

		awardPanel = new JPanel(migLayout);
		awardPanel.setBackground(panelColor);

		add(awardPanel);

		awardPanel.add(trophyPanel);
		awardPanel.add(prizePanel);


		/*
		 * Campo azione alla bacheca: button
		 */
		string = GuiConfiguration.getMessage("go");
		string += " ";
		string += GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("case");
		string = StringUtils.capitalize(string);

		button = new JButton(string);

		awardPanel.add(button);
	}
}
package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;

public class ViewAllConfederation
	extends JPanel
{
	protected JPanel filterPanel;
	protected JPanel confederationTablePanel;
	protected JRadioButton worldRadioButton;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;
	protected JComboBox<String> continentComboBox;
	protected JTable confederationTable;


	protected JLabel label;
	protected ButtonGroup buttonGroup;
	protected JScrollPane scrollPane;

	protected Color panelColor = Color.white;

	public ViewAllConfederation()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]10[]10[]20"
			);

		setLayout(migLayout);

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("confederationsList");
		string += " - ";
		string += "200";
		string += " ";
		string += GuiConfiguration.getMessage("results");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);

		/*
		 * Campo filtro: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[grow, fill][grow, fill]10",
				"10[]10[]10[]10"
			);

		filterPanel = new JPanel(migLayout);
		filterPanel.setBackground(panelColor);

		add(filterPanel);

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("filter");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);

		filterPanel.add(label, "spanx 2");

		/*
		 * Campo tipo paese: stampa
		 */
		string = GuiConfiguration.getMessage("confederationType");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		filterPanel.add(label);


		/*
		 * Campo tipo continente: radioButton
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);

		filterPanel.add(worldRadioButton, "split 3");

		/*
		 * Campo tipo continente: radioButton
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);

		filterPanel.add(continentRadioButton);

		/*
		 * Campo tipo nazione: radioButton
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);

		filterPanel.add(nationRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(continentRadioButton);
		buttonGroup.add(nationRadioButton);

		/*
		 * Campo continente di appartenenza: stampa
		 */
		string = GuiConfiguration.getMessage("continentalConfederation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		filterPanel.add(label);

		/*
		 * Campo continente di appartenenza: comboBox
		 */
		continentComboBox = new JComboBox<String>();
		continentComboBox.setEditable(true);
		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setSelectedIndex(-1);

		filterPanel.add(continentComboBox);

		/*
		 * Campo tabella paesi: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		confederationTablePanel = new JPanel(migLayout);
		confederationTablePanel.setBackground(panelColor);

		add(confederationTablePanel);

		/*
		 * Campo tabella paesi: table
		 */
		confederationTable = new JTable(new TableModel("confederations"));

		confederationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());
		confederationTable.setFillsViewportHeight(true);
		confederationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(confederationTable);

		confederationTablePanel.add(scrollPane);
	}
}

package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SearchCountryPanel
				extends JPanel
{
	protected JPanel countryPanel;
	protected JPanel countryTablePanel;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;
	protected JComboBox<String> continentComboBox;
	protected JTable countryTable;


	protected JLabel titleLabel;
	protected JLabel searchLabel;
	protected ButtonGroup buttonGroup;
	protected JScrollPane scrollPane;
	protected JButton searchButton;

	protected Color panelColor = Color.white;

	public SearchCountryPanel()
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
		string = GuiConfiguration.getMessage("countriesList");
		string += " - ";
		string += "206";
		string += " ";
		string += GuiConfiguration.getMessage("results");
		string = string.toUpperCase();

		titleLabel = new JLabel(string, SwingConstants.LEADING);

		titleLabel.setOpaque(true);
		titleLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		titleLabel.setForeground(Color.white);
		titleLabel.setFont(GuiConfiguration.getOutputBoldFont());

		add(titleLabel);

		/*
		 * Campo ricerca per paese che contiene: label
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string = string.toUpperCase();

		searchLabel = new JLabel(string);
		searchLabel.setOpaque(true);
		searchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		searchLabel.setForeground(Color.white);

		add(searchLabel);

		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		migLayout = new MigLayout
						(
										"debug, wrap 2",
										"20[]30:push[]20",
										"10[]20[]20[]10"
						);

		countryPanel = new JPanel(migLayout);
		countryPanel.setBackground(panelColor);

		add(countryPanel);

		buttonGroup = new ButtonGroup();


		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);

		countryPanel.add(continentRadioButton);

		buttonGroup.add(continentRadioButton);

		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<String>();
		continentComboBox.setEditable(false);
		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());


		continentComboBox.setSelectedIndex(-1);

		countryPanel.add(continentComboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);

		countryPanel.add(nationRadioButton);

		buttonGroup.add(nationRadioButton);


		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String continent = (String) continentComboBox.getSelectedItem();
				Controller.getControllerInstance().subCountries(continent);
				countryTable.setModel(new TableModel("countries"));
			}
		});

		add(searchButton);


		/*
		 * Campo tabella paesi: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		countryTablePanel = new JPanel(migLayout);
		countryTablePanel.setBackground(panelColor);

		add(countryTablePanel);

		/*
		 * Campo tabella paesi: table
		 */
		countryTable = new JTable(new TableModel("countries"));

		countryTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());
		countryTable.setFillsViewportHeight(true);
		countryTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(countryTable);

		countryTablePanel.add(scrollPane);
	}
}

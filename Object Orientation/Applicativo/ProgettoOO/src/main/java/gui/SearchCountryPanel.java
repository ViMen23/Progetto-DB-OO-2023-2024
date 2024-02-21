package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.List;
import java.util.NoSuchElementException;

public class SearchCountryPanel
				extends JPanel
{
	protected JPanel countryPanel;
	protected JPanel countryTablePanel;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;
	protected JComboBox<List<String>> continentComboBox;
	protected JTable countryTable;


	protected JLabel titleLabel;
	protected JLabel searchLabel;
	protected ButtonGroup buttonGroup;
	protected JScrollPane scrollPane;

	protected JButton titleButton;
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
		 * Campo ricerca per paese: label
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += " - ";
		string += GuiConfiguration.getMessage("countries");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countCountries().toString();
		string = string.toUpperCase();

		titleButton = new JButton(string);

		titleButton.setForeground(Color.white);

		add(titleButton);

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

		continentRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				searchButton.setEnabled(true);

				continentComboBox.removeAllItems();
				continentComboBox.setEnabled(false);
			}
		});

		countryPanel.add(continentRadioButton);

		buttonGroup.add(continentRadioButton);

		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<List<String>>();

		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setEnabled(false);

		continentComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				searchButton.setEnabled(true);
			}
		});

		countryPanel.add(continentComboBox);


		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);

		nationRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				continentComboBox.setEnabled(true);

				List<List<String>> nameCountryList = Controller.getInstance().getCountryList
								(
												Country.COUNTRY_TYPE.CONTINENT.toString(),
												null,
												false
								);

				for (List<String> countryList : nameCountryList) {
					continentComboBox.addItem(countryList);
				}

				continentComboBox.setSelectedIndex(-1);
				searchButton.setEnabled(false);
			}
		});

		countryPanel.add(nationRadioButton);

		buttonGroup.add(nationRadioButton);


		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		searchButton.setEnabled(false);

		searchButton.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e)
				{
					String countryType = Country.COUNTRY_TYPE.CONTINENT.toString();
					String superCountryID = null;


					if (nationRadioButton.isSelected()) {
						countryType = Country.COUNTRY_TYPE.NATION.toString();
						superCountryID = ((List<String>) continentComboBox.getSelectedItem()).getLast();
					}

					List<List<String>> data = Controller.getInstance().getCountryList
									(
													countryType,
													superCountryID,
													true
									);

					countryTable.setModel(new TableModel("countries", data));
					countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());
					countryPanel.revalidate();
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
		countryTable = new JTable(new TableModel("countries", null));

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

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
import java.util.ArrayList;
import java.util.List;

public class SearchCountryPanel
				extends JPanel
{
	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	protected JPanel countryTypePanel;
	protected JPanel countrySuperPanel;
	protected JPanel countryPanel;
	protected JPanel countryTablePanel;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;
	protected JComboBox<List<String>> continentComboBox;
	protected JTable countryTable;
	protected JLabel label;
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
				"20[]20[]50[]10"
			);

		setLayout(migLayout);

		setName("searchCountryPanel");

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
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				if (countryPanel.isShowing()) {
					remove(countryPanel);
					titleButton.setIcon(minimizeIcon);
				} else {
					add(countryPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"0[]0[]10[]0[]20[]0"
			);

		countryPanel = new JPanel(migLayout);
		countryPanel.setOpaque(false);

		add(countryPanel);


		/*
		 * Campo ricerca per tipo di paese: stampa
		 */
		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("countryType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		countryPanel.add(label);


		/*
		 * Campo ricerca per tipo di paese: panel
		 */
		migLayout = new MigLayout
						(
										"debug, flowx",
										"20:push[]50[]20:push",
										"10[]10"
						);

		countryTypePanel = new JPanel(migLayout);
		countryTypePanel.setBackground(panelColor);

		countryPanel.add(countryTypePanel);


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

		countryTypePanel.add(continentRadioButton);


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

		countryTypePanel.add(nationRadioButton);


		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(continentRadioButton);
		buttonGroup.add(nationRadioButton);


		/*
		 * Campo ricerca continente che contiene la nazione: stampa
		 */
		string = "Scegli continente che contiene la nazione"; //TODO I18N
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		countryPanel.add(label);

		/*
		 * Campo pannello: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20:push[]20:push",
				"10[]10"
			);

		countrySuperPanel = new JPanel(migLayout);
		countrySuperPanel.setBackground(panelColor);

		countryPanel.add(countrySuperPanel);

		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<List<String>>();

		continentComboBox.setRenderer(new ComboBoxRenderer());
		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setEnabled(false);

		List<String> aa = new ArrayList<String>();
		aa.add("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

		continentComboBox.setPrototypeDisplayValue(aa);

		continentComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				searchButton.setEnabled(true);
			}
		});

		countrySuperPanel.add(continentComboBox);


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

					countryTablePanel.revalidate();
				}
		});

		countryPanel.add(searchButton);


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

package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;
import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.*;
import java.util.List;

public class SearchCountryPanel
				extends JPanel
{
	protected final Color panelColor = Color.white;
	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	protected final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	protected JButton titleButton;
	protected JButton resetButton;
	protected JButton searchButton;

	protected JPanel countryPanel;
	protected JPanel countryTypePanel;
	protected JPanel countrySuperPanel;
	protected JPanel countryTablePanel;

	protected JLabel chooseCountryTypeLabel;
	protected JLabel chooseCountrySuperLabel;
	protected JLabel titleTable;

	protected ButtonGroup buttonGroup;

	protected JRadioButton worldRadioButton;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;

	protected JComboBox<String> continentComboBox;
	protected final Vector<String> countryNameVector = new Vector<>();
	protected final Map<String, String> countryNameMap = new HashMap<>();

	protected JTable countryTable;
	protected final Vector<String> countryTableColumnName = new Vector<>();
	protected final Vector<Vector<String>> countryTableData = new Vector<>();
	protected JScrollPane scrollPane;

	protected String countryType = null;
	protected String superCountryID = null;

	public SearchCountryPanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]20[]20[]10[]0"
			);

		setLayout(migLayout);

		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/

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
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA PAESE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca paese: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"0[]0[]0[]0[]0"
			);

		countryPanel = new JPanel(migLayout);
		countryPanel.setOpaque(false);

		add(countryPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PANEL RICERCA TIPO PAESE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo di paese: stampa
		 */
		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("countryType");
		string = string.toUpperCase();

		chooseCountryTypeLabel = new JLabel(string, SwingConstants.LEADING);
		chooseCountryTypeLabel.setOpaque(true);
		chooseCountryTypeLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		chooseCountryTypeLabel.setForeground(Color.white);

		chooseCountryTypeLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		countryPanel.add(chooseCountryTypeLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA PAESE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo di paese: panel
		 */
		migLayout = new MigLayout
						(
										"debug, flowx",
										"50:push[]80[]80[]80[]20:push",
										"10[]10"
						);

		countryTypePanel = new JPanel(migLayout);
		countryTypePanel.setBackground(panelColor);

		countryPanel.add(countryTypePanel);


		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);

		worldRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				searchButton.setEnabled(true);
				countryType = Country.COUNTRY_TYPE.WORLD.toString();
			}
		});

		countryTypePanel.add(worldRadioButton);
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
				countryType = Country.COUNTRY_TYPE.CONTINENT.toString();
			}
		});

		countryTypePanel.add(continentRadioButton);


		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);

		nationRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationRadioButton.isSelected()) {
					searchButton.setEnabled(true);
					continentComboBox.setEnabled(true);

					continentComboBox.firePopupMenuWillBecomeVisible();

					countryType = Country.COUNTRY_TYPE.NATION.toString();
				}
				else {
					continentComboBox.setEnabled(false);
					continentComboBox.setSelectedIndex(-1);
					superCountryID = null;
				}
			}
		});

		countryTypePanel.add(nationRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(worldRadioButton);
		buttonGroup.add(continentRadioButton);
		buttonGroup.add(nationRadioButton);

		/*
		 * Campo bottone reset: button
		 */
		resetButton = new JButton(resetIcon);

		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				searchButton.setEnabled(false);

				countryType = null;
				superCountryID = null;
				buttonGroup.clearSelection();
			}
		});

		countryTypePanel.add(resetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PANEL SCELTA PAESE SUPER
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca continente che contiene la nazione: stampa
		 */
		string = "Scegli continente che contiene la nazione"; //TODO I18N
		string = string.toUpperCase();

		chooseCountrySuperLabel = new JLabel(string, SwingConstants.LEADING);
		chooseCountrySuperLabel.setOpaque(true);
		chooseCountrySuperLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		chooseCountrySuperLabel.setForeground(Color.white);
		chooseCountrySuperLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		countryPanel.add(chooseCountrySuperLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA PAESE SUPER
		 *------------------------------------------------------------------------------------------------------*/

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
		continentComboBox = new JComboBox<String>();


		continentComboBox.setEnabled(false);

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				continentComboBox.removeAllItems();
				fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				superCountryID = ((List<String>) continentComboBox.getSelectedItem()).getLast();
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countrySuperPanel.add(continentComboBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/

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
					String string;

					Controller.getInstance().getCountryList
									(
													countryTableColumnName,
													countryTableData,
													countryType,
													superCountryID
									);



					string = GuiConfiguration.getMessage("results");
					string += " ";
					string += GuiConfiguration.getMessage("countries");
					string += " - ";
					string += data.size();
					string += " ";
					string += GuiConfiguration.getMessage("results");
					string = string.toUpperCase();

					titleTable.setText(string);

					countryTable.setModel(new TableModel("countries", data));
					countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());

					countryTablePanel.revalidate();
				}
		});

		countryPanel.add(searchButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA
		 *------------------------------------------------------------------------------------------------------*/

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
		 * Campo titolo tabella paesi: label
		 */
		string = GuiConfiguration.getMessage("no");
		string += " ";
		string += GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("performed");
		string = string.toUpperCase();

		titleTable = new JLabel(string);

		titleTable.setOpaque(true);
		titleTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titleTable.setForeground(Color.white);

		titleTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		countryTablePanel.add(titleTable);


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
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void fillCountryComboBox(JComboBox<String> comboBox, String type, String superCountryID)
	{
		//comboBox.addItem(GuiConfiguration.getListStringSelectAll());
		countryNameVector.clear();

		String string = GuiConfiguration.getMessage("select");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = StringUtils.capitalize(string);

		countryNameVector.add(string);


		countryNameMap.clear();

		countryNameMap.put(string, null);



		Controller.getInstance().getCountryList
			(
							countryNameVector,
							countryNameMap,
							type,
							superCountryID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(countryNameVector));

	}
}

package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;
import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.*;

public class SearchCountryPanel
				extends JPanel
{
	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private final JPanel countryPanel;
	private final JPanel countryTypePanel;
	private final JPanel countrySuperPanel;
	private final JPanel countryTablePanel;

	private final JLabel chooseCountryTypeLabel;
	private final JLabel chooseCountrySuperLabel;
	private final JLabel titleTable;

	private final ButtonGroup buttonGroup;

	private final JRadioButton worldRadioButton;
	private final JRadioButton continentRadioButton;
	private final JRadioButton nationRadioButton;

	private final JComboBox<String> continentComboBox;
	private final Vector<String> countryNameVector = new Vector<>();
	private final Map<String, String> countryNameMap = new HashMap<>();

	private final JTable countryTable;
	private final Vector<String> countryTableColumnName = new Vector<>();
	private final Vector<Vector<String>> countryTableData = new Vector<>();
	private final JScrollPane scrollPane;

	private String countryType = null;
	private String superCountryID = null;

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
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

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
		worldRadioButton.setCursor(GuiConfiguration.getButtonCursor());

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
		continentRadioButton.setCursor(GuiConfiguration.getButtonCursor());

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

		nationRadioButton.setCursor(GuiConfiguration.getButtonCursor());

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
		resetButton.setCursor(GuiConfiguration.getButtonCursor());

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
		continentComboBox = new JComboBox<>();

		continentComboBox.setEnabled(false);

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				superCountryID = countryNameMap.get( (String) continentComboBox.getSelectedItem());
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
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		searchButton.setEnabled(false);

		searchButton.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e)
				{
					countryTableColumnName.clear();
					countryTableData.clear();

					Controller.getInstance().getCountryList
									(
													countryTableColumnName,
													countryTableData,
													countryType,
													superCountryID
									);


					countryTable.setModel(new TableModel(countryTableData, countryTableColumnName));
					countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());


					GuiConfiguration.setTitleTable(titleTable, "countries", countryTableData.size());
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
		countryTable = new JTable();

		countryTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());
		countryTable.setFillsViewportHeight(true);
		countryTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		countryTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) countryTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);



		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(countryTable);

		countryTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void fillCountryComboBox(JComboBox<String> comboBox, String type, String superCountryID)
	{

		GuiConfiguration.initComboBoxVector(countryNameVector, countryNameMap);

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

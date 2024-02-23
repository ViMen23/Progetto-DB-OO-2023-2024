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

public class SearchConfederationPanel
	extends JPanel
{
	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	private final JPanel confederationPanel;
	private final JPanel confederationTypePanel;
	private final JPanel confederationSuperPanel;
	private final JPanel confederationTablePanel;

	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private JLabel label;
	private final JLabel titleTable;

	private final JRadioButton worldRadioButton;
	private final JRadioButton continentRadioButton;
	private final JRadioButton nationRadioButton;

	private final JComboBox<String> continentComboBox;
	private final Vector<String> confederationNameVector = new Vector<>();
	private final Map<String, String> confederationNameMap = new HashMap<>();
	private final JTable confederationTable;
	private final Vector<String> confederationTableColumnName = new Vector<>();
	private final Vector<Vector<String>> confederationTableData = new Vector<>();

	private final ButtonGroup buttonGroup;
	private final JScrollPane scrollPane;

	private String typeCountry = null;
	private String superConfederationID = null;

	public SearchConfederationPanel()
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

		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("confederations");
		string += " - ";
		string += GuiConfiguration.getMessage("confederations");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countConfederations().toString();
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

				if (confederationPanel.isShowing()){
					remove(confederationPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(confederationPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA CONFEDERAZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca confederazione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"0[]0[]10[]0[]20[]0"
			);

		confederationPanel = new JPanel(migLayout);
		confederationPanel.setOpaque(false);

		add(confederationPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PANEL RICERCA TIPO CONFEDERAZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo confederazione: label
		 */
		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("confederationType");
		string = string.toUpperCase();

		label = new JLabel(string);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		confederationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL SCELTA TIPO CONFEDERAZIONE
		 *------------------------------------------------------------------------------------------------------*/
		/*
		 * Campo ricerca per tipo confederazione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]80[]80[]20:push",
				"10[]10"
			);

		confederationTypePanel = new JPanel(migLayout);
		confederationTypePanel.setBackground(panelColor);

		confederationPanel.add(confederationTypePanel);

		/*
		 * Campo mondo: radio button
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
				typeCountry = Country.COUNTRY_TYPE.WORLD.toString();

			}
		});

		confederationTypePanel.add(worldRadioButton);

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
				typeCountry = Country.COUNTRY_TYPE.CONTINENT.toString();
			}
		});

		confederationTypePanel.add(continentRadioButton);

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

					typeCountry = Country.COUNTRY_TYPE.NATION.toString();
				}
				else {
					continentComboBox.setEnabled(false);
					continentComboBox.setSelectedIndex(-1);
					superConfederationID = null;
				}
			}
		});

		confederationTypePanel.add(nationRadioButton);

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

				typeCountry = null;
				superConfederationID = null;
				buttonGroup.clearSelection();
			}
		});

		confederationTypePanel.add(resetButton);
		/*------------------------------------------------------------------------------------------------------*/

		/*--------------------------------------------------------------------------------------------------------
		 * LABEL PANEL SCELTA PAESE SUPER
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca continente che contiene la nazione: stampa
		 */
		string = "Scegli confederazione che contiene la confederazione nazione"; //TODO I18N
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		confederationPanel.add(label);

		/*
		 * Campo pannello: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]20:push",
				"10[]10"
			);

		confederationSuperPanel = new JPanel(migLayout);
		confederationSuperPanel.setBackground(panelColor);

		confederationPanel.add(confederationSuperPanel);

		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<String>();

		continentComboBox.setEnabled(false);

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e) {
				continentComboBox.removeAllItems();
				fillConfederationComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {
				superConfederationID = confederationNameMap.get ((String) continentComboBox.getSelectedItem());
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) {
			}
		});

		confederationSuperPanel.add(continentComboBox);
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
				confederationTableColumnName.clear();
				confederationTableData.clear();

				Controller.getInstance().getConfederationList
								(
									confederationTableColumnName,
									confederationTableData,
									typeCountry,
									superConfederationID
								);

				confederationTable.setModel(new TableModel(confederationTableData, confederationTableColumnName));
				confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());

				GuiConfiguration.setTitleTable(titleTable, "confederations", confederationTableData.size());

				confederationTablePanel.revalidate();
			}
		});

		confederationPanel.add(searchButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo tabella confederazioni: panel
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

		confederationTablePanel.add(titleTable);

		/*
		 * Campo tabella confederazioni: table
		 */
		confederationTable = new JTable();

		confederationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());
		confederationTable.setFillsViewportHeight(true);

		confederationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		confederationTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) confederationTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);



		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(confederationTable);

		confederationTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void fillConfederationComboBox(JComboBox<String> comboBox, String type, String superConfederationID)
	{

		GuiConfiguration.initComboBoxVector(confederationNameVector, confederationNameMap);

		Controller.getInstance().getConfederationList
			(
				confederationNameVector,
				confederationNameMap,
				type,
				superConfederationID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(confederationNameVector));
	}


}

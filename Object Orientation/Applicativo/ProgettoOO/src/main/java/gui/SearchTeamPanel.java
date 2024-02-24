package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import javax.swing.table.DefaultTableCellRenderer;
import java.util.HashMap;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;
import java.util.Vector;

public class SearchTeamPanel
				extends JPanel
{

	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	private final JPanel teamPanel;
	private final JPanel namePanel;
	private final JPanel teamTypePanel;
	private final JPanel countryConfederationPanel;
	private final JPanel teamTablePanel;


	private final JButton titleButton;
	private final JButton longNameResetButton;
	private final JButton shortNameResetButton;
	private final JButton teamTypeResetButton;
	private final JButton countryResetButton;
	private final JButton searchButton;

	private final JLabel nameSearchLabel;
	private final JLabel longNameErrorLabel;
	private final JLabel shortNameErrorLabel;

	private final JLabel teamTypeSearchLabel;
	private final JLabel nationConfederationSearchLabel;
	private final JLabel titleTable;

	private final JTextField longNameTextField;
	private final JTextField shortNameTextField;

	private final JRadioButton clubRadioButton;
	private final JRadioButton nationalRadioButton;
	private final JComboBox<String> continentComboBox;
	private final Vector<String> teamContinentVector = new Vector<>();
	private final Map<String, String> teamContinentMap = new HashMap<>();

	private final JComboBox<String> nationComboBox;

	private final Vector<String> teamNationVector = new Vector<>();
	private final Map<String, String> teamNationMap = new HashMap<>();

	private final JTable teamTable;
	private final Vector<String> teamTableColumnName = new Vector<>();
	private final Vector<Vector<String>> teamTableData = new Vector<>();

	private final JScrollPane scrollPane;

	private final ButtonGroup buttonGroup;

	private JLabel label;

	private String teamSubLongName = null;
	private String teamSubShortName = null;
	private String teamType = null;
	private String teamNationID = null;
	private String teamContinentID = null;


	public SearchTeamPanel()
	{

		MigLayout migLayout;
		String string;


		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]20[]50[]10"
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
		string += GuiConfiguration.getMessage("teams");
		string += " - ";
		string += GuiConfiguration.getMessage("teams");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countTeams().toString();
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (teamPanel.isShowing()){
					remove(teamPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else{
					add(teamPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]20[]0"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setOpaque(false);

		add(teamPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchLabel = new JLabel(string);
		nameSearchLabel.setOpaque(true);
		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchLabel.setForeground(Color.white);
		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		teamPanel.add(nameSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 4, center",
				"50[]80[]10[]70[]20",
				"10[]20[]10"
			);

		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		teamPanel.add(namePanel);

		/*
		 * Campo nome esteso: stampa
		 */
		string = GuiConfiguration.getMessage("longName");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome esteso: textField
		 */
		longNameTextField = new JTextField(GuiConfiguration.getInputColumn());
		longNameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternAlnum.matcher(longNameTextField.getText()).find()) {

					teamSubLongName = longNameTextField.getText();
					longNameErrorLabel.setVisible(false);
				}
				else {

					teamSubLongName = null;
					longNameErrorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(longNameTextField);

		/*
		 * Campo errore regex: label
		 */
		longNameErrorLabel = new JLabel(errorIcon);

		namePanel.add(longNameErrorLabel);

		/*
		 * Campo bottone reset: button
		 */
		longNameResetButton = new JButton(resetIcon);
		longNameResetButton.setCursor(GuiConfiguration.getButtonCursor());
		longNameResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamSubLongName = null;
				longNameTextField.setText(null);
			}
		});

		namePanel.add(longNameResetButton);

		/*
		 * Campo nome abbreviato: stampa
		 */
		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome abbreviato: textField
		 */
		shortNameTextField = new JTextField(GuiConfiguration.getInputColumn());

		shortNameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternCode.matcher(shortNameTextField.getText()).find()) {

					teamSubShortName = shortNameTextField.getText();
					shortNameErrorLabel.setVisible(false);
				}
				else {

					teamSubShortName = null;
					shortNameErrorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(shortNameTextField);

		/*
		 * Campo errore regex: label
		 */
		shortNameErrorLabel = new JLabel(errorIcon);

		namePanel.add(shortNameErrorLabel);

		/*
		 * Campo bottone reset: button
		 */
		shortNameResetButton = new JButton(resetIcon);
		shortNameResetButton.setCursor(GuiConfiguration.getButtonCursor());
		shortNameResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamSubShortName = null;
				shortNameTextField.setText(null);
			}
		});

		namePanel.add(shortNameResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo squadra: label
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		teamTypeSearchLabel = new JLabel(string);

		teamTypeSearchLabel.setOpaque(true);
		teamTypeSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		teamTypeSearchLabel.setForeground(Color.white);
		teamTypeSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		teamPanel.add(teamTypeSearchLabel);

		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per tipo squadra: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]20",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		teamPanel.add(teamTypePanel);

		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamType = Team.TEAM_TYPE.CLUB.toString();
			}
		});

		teamTypePanel.add(clubRadioButton);

		/*
		 * Campo nazionale: radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);
		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});

		teamTypePanel.add(nationalRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(clubRadioButton);
		buttonGroup.add(nationalRadioButton);

		/*
		 * Campo bottone reset: button
		 */
		teamTypeResetButton = new JButton(resetIcon);
		teamTypeResetButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypeResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamType = null;
				buttonGroup.clearSelection();
			}
		});

		teamTypePanel.add(teamTypeResetButton);
		/*------------------------------------------------------------------------------------------------------*/

		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NAZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nazione e confederazione: label
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		nationConfederationSearchLabel = new JLabel(string);

		nationConfederationSearchLabel.setOpaque(true);
		nationConfederationSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nationConfederationSearchLabel.setForeground(Color.white);
		nationConfederationSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());


		teamPanel.add(nationConfederationSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NAZIONE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nazione e confederazione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 3, center",
				"50[]80[]80[]20",
				"10[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		teamPanel.add(countryConfederationPanel);

		/*
		 * Campo continente: stampa
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);

		/*
		 * Campo continente: comboBox
		 */
		continentComboBox = new JComboBox<>();

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						continentComboBox,
						teamContinentVector,
						teamContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				teamContinentID   = teamContinentMap.get((String) continentComboBox.getSelectedItem());

				teamNationID = null;

				if (teamContinentID != null) {

					nationComboBox.setEnabled(true);
					nationComboBox.firePopupMenuWillBecomeVisible();
				}
				else {

					nationComboBox.setEnabled(false);
					nationComboBox.setSelectedIndex(-1);
				}
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryConfederationPanel.add(continentComboBox);

		/*
		 * Campo bottone reset: button
		 */
		countryResetButton = new JButton(resetIcon);
		countryResetButton.setCursor(GuiConfiguration.getButtonCursor());
		countryResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				continentComboBox.setSelectedIndex(-1);
				nationComboBox.setEnabled(false);
				nationComboBox.setSelectedIndex(-1);

				teamContinentID = null;
				teamNationID = null;
			}
		});

		countryConfederationPanel.add(countryResetButton, "spany 2");


		/*
		 * Campo nazione: stampa
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);

		/*
		 * Campo nazione: comboBox
		 */
		nationComboBox = new JComboBox<>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						nationComboBox,
						teamNationVector,
						teamNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						teamContinentID
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				teamNationID = teamNationMap.get((String) nationComboBox.getSelectedItem());
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryConfederationPanel.add(nationComboBox);
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

		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				fillTeamTable(teamTableData, teamTableColumnName, teamTable, "teams");

				teamTablePanel.revalidate();
			}
		});

		teamPanel.add(searchButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo tabella competizioni: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		teamTablePanel = new JPanel(migLayout);
		teamTablePanel.setBackground(panelColor);

		add(teamTablePanel);

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

		teamTablePanel.add(titleTable);

		/*
		 * Campo tabella paesi: table
		 */
		teamTable = new JTable();

		teamTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());
		teamTable.setFillsViewportHeight(true);
		teamTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		teamTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) teamTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(teamTable);

		teamTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}
	public void fillCountryComboBox(JComboBox<String> comboBox,
									Vector<String> vector,
									Map<String, String> map,
									String type,
									String superCountryID)
	{
		GuiConfiguration.initComboBoxVector(vector, map, true);

		Controller.getInstance().setCountryComboBox
			(
				vector,
				map,
				type,
				superCountryID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}

	public void fillTeamTable(Vector<Vector<String>> tableData,
							  Vector<String> tableColumnName,
							  JTable table,
							  String tableName)
	{
		tableColumnName.clear();
		tableData.clear();


		Controller.getInstance().setTeamTable
			(
				teamTableColumnName,
				tableData,
				teamSubLongName,
				teamSubShortName,
				teamType,
				teamContinentID,
				teamNationID
			);

		table.setModel(new TableModel(tableData, tableColumnName));
		table.setPreferredScrollableViewportSize(teamTable.getPreferredSize());

		GuiConfiguration.setTitleTable(titleTable, tableName, tableData.size());

	}
}

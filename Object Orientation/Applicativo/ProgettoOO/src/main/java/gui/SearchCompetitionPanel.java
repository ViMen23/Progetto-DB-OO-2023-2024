package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;


public class SearchCompetitionPanel
				extends JPanel
{

	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");

	protected JPanel competitionPanel;
	protected JPanel namePanel;
	protected JPanel competitionTypePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel competitionTablePanel;

	protected JButton titleButton;
	protected JButton searchButton;

	protected JCheckBox nameSearchCheckBox;
	protected JCheckBox competitionTypeSearchCheckBox;
	protected JCheckBox teamTypeSearchCheckBox;
	protected JCheckBox countrySearchCheckBox;

	protected JRadioButton leagueRadioButton;
	protected JRadioButton cupRadioButton;
	protected JRadioButton supercupRadioButton;
	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;
	protected JRadioButton worldRadioButton;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;

	protected JTextField nameTextField;

	protected JComboBox<List<String>> continentComboBox;
	protected JComboBox<List<String>> nationComboBox;
	protected ButtonGroup buttonGroup;
	protected JLabel label;
	protected JTable competitionTable;
	protected JScrollPane scrollPane;
	protected Color panelColor = Color.white;

	public SearchCompetitionPanel()
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
		setName("searchCompetitionPanel");


		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("competitions");
		string += " - ";
		string += GuiConfiguration.getMessage("competitions");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		//string += Controller.getInstance().countCountries().toString(); TODO
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				if (competitionPanel.isShowing()){
					remove(competitionPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else{
					add(competitionPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});

		/*
		 * Campo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]10[]0[]20[]20"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setOpaque(false);

		add(competitionPanel);

		/*
		 * Campo ricerca per nome: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchCheckBox = new JCheckBox(string);
		nameSearchCheckBox.setOpaque(true);
		nameSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchCheckBox.setForeground(Color.white);
		nameSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(nameSearchCheckBox);

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50[]80[]20:push",
				"10[]10"
			);


		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		competitionPanel.add(namePanel);

		/*
		 * Campo nome: stampa
		 */
		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome: textfield
		 */
		nameTextField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(nameTextField);

		/*
		 * Campo ricerca per tipo di competizione: panel
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		competitionTypeSearchCheckBox = new JCheckBox(string);
		competitionTypeSearchCheckBox.setOpaque(true);
		competitionTypeSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		competitionTypeSearchCheckBox.setForeground(Color.white);
		competitionTypeSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(competitionTypeSearchCheckBox);

		/*
		 * Campo ricerca per tipo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50[]80[]80[]20:push",
				"10[]10"
			);

		competitionTypePanel = new JPanel(migLayout);

		competitionTypePanel.setBackground(panelColor);

		competitionPanel.add(competitionTypePanel);

		/*
		 * Campo campionato: radioButton
		 */
		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);

		leagueRadioButton = new JRadioButton(string);

		competitionTypePanel.add(leagueRadioButton);

		/*
		 * Campo coppa: radioButton
		 */
		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);

		cupRadioButton = new JRadioButton(string);

		competitionTypePanel.add(cupRadioButton);

		/*
		 * Campo supercoppa: radioButton
		 */
		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);

		supercupRadioButton = new JRadioButton(string);

		competitionTypePanel.add(supercupRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */

		buttonGroup = new ButtonGroup();

		buttonGroup.add(leagueRadioButton);
		buttonGroup.add(cupRadioButton);
		buttonGroup.add(supercupRadioButton);


		/*
		 * Campo ricerca per tipo squadra: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		teamTypeSearchCheckBox = new JCheckBox(string);
		teamTypeSearchCheckBox.setOpaque(true);
		teamTypeSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		teamTypeSearchCheckBox.setForeground(Color.white);
		teamTypeSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(teamTypeSearchCheckBox);

		/*
		 * Campo ricerca per tipo squadra: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50[]80[]20:push",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		competitionPanel.add(teamTypePanel);

		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);

		teamTypePanel.add(clubRadioButton);

		/*
		 * Campo nazionale: radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);

		teamTypePanel.add(nationalRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(clubRadioButton);
		buttonGroup.add(nationalRadioButton);


		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		countrySearchCheckBox = new JCheckBox(string);
		countrySearchCheckBox.setOpaque(true);
		countrySearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		countrySearchCheckBox.setForeground(Color.white);
		countrySearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		competitionPanel.add(countrySearchCheckBox);

		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50[]80[]20:push",
				"10[]20[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		competitionPanel.add(countryConfederationPanel);

		/*
		 * Campo mondo: radio button
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);

		countryConfederationPanel.add(worldRadioButton, "wrap");

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);

		countryConfederationPanel.add(continentRadioButton);

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

		countryConfederationPanel.add(continentComboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);

		countryConfederationPanel.add(nationRadioButton);

		/*
		 * Campo nazione: combo box
		 */
		nationComboBox = new JComboBox<List<String>>();

		nationComboBox.setRenderer(new ComboBoxRenderer());
		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.setPrototypeDisplayValue(aa);

		countryConfederationPanel.add(nationComboBox);


		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(worldRadioButton);
		buttonGroup.add(continentRadioButton);
		buttonGroup.add(nationRadioButton);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		competitionPanel.add(searchButton);

		/*
		 * Campo tabella competizioni: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		competitionTablePanel = new JPanel(migLayout);
		competitionTablePanel.setBackground(panelColor);

		add(competitionTablePanel);

		/*
		 * Campo tabella paesi: table
		 */
		competitionTable = new JTable(new TableModel("countries", null));

		competitionTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());
		competitionTable.setFillsViewportHeight(true);
		competitionTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(competitionTable);

		competitionTablePanel.add(scrollPane);
	}
}
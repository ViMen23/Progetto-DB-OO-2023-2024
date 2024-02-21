package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ArrayList;
import java.util.List;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SearchTeamPanel
				extends JPanel
{

	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");


	protected JPanel teamPanel;
	protected JPanel namePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel teamTablePanel;


	protected JButton titleButton;
	protected JButton searchButton;

	protected JCheckBox nameSearchCheckBox;
	protected JCheckBox teamTypeSearchCheckBox;
	protected JCheckBox nationConfederationSearchCheckBox;

	protected JTextField longNameTextField;
	protected JTextField shortNameTextField;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;
	protected JComboBox<List<String>> continentComboBox;
	protected JComboBox<List<String>> nationComboBox;

	protected JTable teamTable;
	protected JScrollPane scrollPane;

	protected ButtonGroup buttonGroup;

	protected JLabel label;

	protected Color panelColor = Color.white;

	protected Boolean nameSearchValid = true;

	protected Boolean longNameSearchValid = null;
	protected Boolean shortNameSearchValid = null;
	protected Boolean teamTypeSearchValid = true;
	protected Boolean countryTypeSearchValid = true;
	protected Boolean anySelected = false;

	protected String teamSubLongName = null;
	protected String teamSubShortName = null;

	protected String teamType = null;
	protected String teamCountryID = null;


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
		setName("searchTeamPanel");

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

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

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

		/*
		 * Campo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]20[]20"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setOpaque(false);

		add(teamPanel);

		/*
		 * Campo ricerca per nome: checkBox
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

		nameSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = nameSearchCheckBox.isSelected();

				longNameTextField.setEnabled(selected);
				shortNameTextField.setEnabled(selected);

				longNameTextField.setText("");
				shortNameTextField.setText("");

				teamSubLongName = null;
				teamSubShortName = null;

				nameSearchValid = !selected;

				setAnySelected();

				setEnableButton();
			}
		});

		teamPanel.add(nameSearchCheckBox);

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50[]80[]20:push",
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
		 * Campo nome esteso: textfield
		 */
		longNameTextField = new JTextField(GuiConfiguration.getInputColumn());
		longNameTextField.setEnabled(false);

		longNameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{

			}
		});

		namePanel.add(longNameTextField);

		/*
		 * Campo nome abbreviato: stampa
		 */
		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo nome abbreviato: textfield
		 */
		shortNameTextField = new JTextField(GuiConfiguration.getInputColumn());
		shortNameTextField.setEnabled(false);

		namePanel.add(shortNameTextField);

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

		teamTypeSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = teamTypeSearchCheckBox.isSelected();

				clubRadioButton.setEnabled(selected);
				nationalRadioButton.setEnabled(selected);

				buttonGroup.clearSelection();
				teamType = null;

				teamTypeSearchValid= !selected;

				setAnySelected();

				setEnableButton();
			}
		});

		teamPanel.add(teamTypeSearchCheckBox);

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

		teamPanel.add(teamTypePanel);

		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setEnabled(false);

		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				teamTypeSearchValid = true;
				teamType = Team.TEAM_TYPE.CLUB.toString();

				setEnableButton();
			}
		});

		teamTypePanel.add(clubRadioButton);

		/*
		 * Campo nazionale: radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);
		nationalRadioButton.setEnabled(false);

		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				teamTypeSearchValid = true;
				teamType = Team.TEAM_TYPE.NATIONAL.toString();

				setEnableButton();
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
		 * Campo ricerca per nazione e confederazione: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		nationConfederationSearchCheckBox = new JCheckBox(string);

		nationConfederationSearchCheckBox.setOpaque(true);
		nationConfederationSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		nationConfederationSearchCheckBox.setForeground(Color.white);
		nationConfederationSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		nationConfederationSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = nationConfederationSearchCheckBox.isSelected();

				continentComboBox.setEnabled(selected);

				teamCountryID = null;

				countryTypeSearchValid = !selected;

				if (nationConfederationSearchCheckBox.isSelected()) {
					fillContinentComboBox();
				}
				else {
					continentComboBox.removeAllItems();
					nationComboBox.removeAllItems();
				}

				nationComboBox.setEnabled(false);

				setAnySelected();

				setEnableButton();
			}
		});

		teamPanel.add(nationConfederationSearchCheckBox);

		/*
		 * Campo ricerca per nazione e confederazione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50[]80[]20:push",
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
		continentComboBox = new JComboBox<List<String>>();

		continentComboBox.setRenderer(new ComboBoxRenderer());
		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setEnabled(false);

		continentComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if(continentComboBox.getSelectedIndex() != -1) {

					nationComboBox.removeAllItems();

					String superCountryID = ((List<String>)continentComboBox.getSelectedItem()).getLast();

					List<List<String>> nameCountryList = Controller.getInstance().getCountryList
						(
							Country.COUNTRY_TYPE.NATION.toString(),
							superCountryID,
							false
						);

					for (List<String> countryList: nameCountryList) {
						nationComboBox.addItem(countryList);
					}

					nationComboBox.setSelectedIndex(-1);

					nationComboBox.setEnabled(true);
					searchButton.setEnabled(false);
				}
			}
		});

		List<String> aa = new ArrayList<String>();
		aa.add("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

		continentComboBox.setPrototypeDisplayValue(aa);

		countryConfederationPanel.add(continentComboBox);

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
		nationComboBox = new JComboBox<List<String>>();

		nationComboBox.setRenderer(new ComboBoxRenderer());
		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.setPrototypeDisplayValue(aa);

		nationComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				countryTypeSearchValid = true;

				if (nationComboBox.getSelectedIndex() != -1 ){
					teamCountryID = ((List<String>)nationComboBox.getSelectedItem()).getLast();
				}

				setEnableButton();
			}
		});

		countryConfederationPanel.add(nationComboBox);

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
				List<List<String>> data = Controller.getInstance().getTeamList
					(
						teamSubLongName,
						teamSubShortName,
						teamType,
						teamCountryID,
						true
					);

				teamTable.setModel(new TableModel("teams", data));
				teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());
				teamTable.revalidate();

			}
		});

		teamPanel.add(searchButton);


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
		 * Campo tabella paesi: table
		 */
		teamTable = new JTable(new TableModel("teams", null));

		teamTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());
		teamTable.setFillsViewportHeight(true);
		teamTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(teamTable);

		teamTablePanel.add(scrollPane);

	}

	public void setEnableButton()
	{
		if (nameSearchValid && teamTypeSearchValid && countryTypeSearchValid && anySelected) {
			searchButton.setEnabled(true);
		}
		else {
			searchButton.setEnabled(false);
		}
	}

	public void setAnySelected()
	{
		if (nameSearchCheckBox.isSelected() || teamTypeSearchCheckBox.isSelected() ||
			teamTypeSearchCheckBox.isSelected() || nationConfederationSearchCheckBox.isSelected())
		{
			anySelected = true;
		}
		else {
			anySelected = false;
		}
	}

	public void fillContinentComboBox()
	{
		List<List<String>> nameCountryList = Controller.getInstance().getCountryList
			(
				Country.COUNTRY_TYPE.CONTINENT.toString(),
				null,
				false
			);

		for (List<String> countryList: nameCountryList) {
			continentComboBox.addItem(countryList);
		}

		continentComboBox.setSelectedIndex(-1);

		continentComboBox.setEnabled(true);
		searchButton.setEnabled(false);
	}
}

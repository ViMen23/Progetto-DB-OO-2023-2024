package gui;

import controller.Controller;
import model.Country;
import model.Team;
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
import java.util.List;


public class StepFilterPanel
				extends JPanel
{
	protected final Color panelColor = Color.white;

	protected JPanel teamTypePanel;
	protected JPanel seasonPanel;
	protected JPanel countryPanel;
	protected JPanel competitionPanel;
	protected JPanel teamPanel;
	protected JPanel playerPanel;

	protected JButton fakeButton;
	protected JButton searchButton;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;
	protected JRadioButton worldRadioButton;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;


	protected JComboBox<String> seasonComboBox;
	protected JComboBox<List<String>> continentComboBox;
	protected JComboBox<List<String>> nationComboBox;
	protected JComboBox<List<String>> competitionComboBox;
	protected JComboBox<List<String>> teamComboBox;
	protected JComboBox<List<String>> playerComboBox;


	protected ButtonGroup buttonGroup;
	protected JLabel label;

	protected String teamType;
	protected String countryType;
	protected String countryID;


	public StepFilterPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]20[]20"
			);

		setLayout(migLayout);

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("stepFilter");
		string = string.toUpperCase();

		fakeButton = new JButton(string);
		fakeButton.setEnabled(false);

		add(fakeButton);

		/*
		 * Campo scelta tipo team: stampa
		 */
		string = "1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		add(label);

		/*
		 * Campo scelta tipo team: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]20:push",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		add(teamTypePanel);

		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);

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

		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				teamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});

		teamTypePanel.add(nationalRadioButton);

		/*
		 * Campo gruppo bottone: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(clubRadioButton);
		buttonGroup.add(nationalRadioButton);

		/*
		 * Campo scelta stagione: stampa
		 */
		string = "2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string +=  GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		add(label);

		/*
		 * Campo stagione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]20:push",
				"10[]10"
			);

		seasonPanel = new JPanel(migLayout);
		seasonPanel.setBackground(panelColor);

		add(seasonPanel);

		/*
		 * Campo stagione: stampa
		 */
		string = GuiConfiguration.getMessage("season");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		seasonPanel.add(label);

		/*
		 * Campo stagione: comboBox
		 */
		seasonComboBox = new JComboBox<String>();

		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		seasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		seasonPanel.add(seasonComboBox);

		/*
		 * Campo scelta paese: stampa
		 */
		string = "3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		add(label);

		/*
		 * Campo paese: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50:push[]80[]20:push",
				"10[]20[]20[]10"
			);

		countryPanel = new JPanel(migLayout);
		countryPanel.setBackground(panelColor);

		add(countryPanel);

		/*
		 * Campo mondo: radio button
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);

		worldRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				/*
				List<List<String>> world = Controller.getInstance().getCountryList
											(
												Country.COUNTRY_TYPE.WORLD.toString(),
												null,
												false
											);



				countryID = world.getFirst().getLast();

				 */
				countryType = Country.COUNTRY_TYPE.WORLD.toString();
			}
		});

		countryPanel.add(worldRadioButton, "wrap");

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);

		continentRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (continentRadioButton.isSelected()) {

					continentComboBox.setEnabled(true);
					continentComboBox.firePopupMenuWillBecomeVisible();

					countryType = Country.COUNTRY_TYPE.CONTINENT.toString();
				}
				else {
					continentComboBox.setEnabled(false);
					continentComboBox.setSelectedIndex(-1);
				}
			}
		});

		countryPanel.add(continentRadioButton);

		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<List<String>>();


		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

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
				countryID = ((List<String>) continentComboBox.getSelectedItem()).getLast();

				if (nationRadioButton.isSelected()) {

					nationComboBox.setEnabled(true);
					nationComboBox.firePopupMenuWillBecomeVisible();
				}
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryPanel.add(continentComboBox);

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
				if (nationRadioButton.isSelected()){
					continentComboBox.setEnabled(true);
					continentComboBox.firePopupMenuWillBecomeVisible();

					countryType = Country.COUNTRY_TYPE.NATION.toString();
				}
				else {
					continentComboBox.setEnabled(false);
					nationComboBox.setEnabled(false);

					continentComboBox.setSelectedIndex(-1);
					nationComboBox.setSelectedIndex(-1);
				}
			}
		});

		countryPanel.add(nationRadioButton);

		/*
		 * Campo nazione: combo box
		 */
		nationComboBox = new JComboBox<List<String>>();


		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				nationComboBox.removeAllItems();

				fillCountryComboBox(nationComboBox, Country.COUNTRY_TYPE.NATION.toString(), countryID);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				countryID = ((List<String>) nationComboBox.getSelectedItem()).getLast();
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		countryPanel.add(nationComboBox);

		/*
		 * Campo gruppo bottone: button group
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(worldRadioButton);
		buttonGroup.add(continentRadioButton);
		buttonGroup.add(nationRadioButton);

		/*
		 * Campo scelta competizione: stampa
		 */
		string = "4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		add(label);

		/*
		 * Campo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]20:push",
				"10[]10"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setBackground(panelColor);

		add(competitionPanel);

		/*
		 * Campo competizione: stampa
		 */
		string = GuiConfiguration.getMessage("competition");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		competitionPanel.add(label);

		/*
		 * Campo competizione: comboBox
		 */
		competitionComboBox = new JComboBox<List<String>>();


		competitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		competitionComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());

		competitionComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				competitionComboBox.removeAllItems();

				fillCompetitionComboBox(competitionComboBox);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) {

			}
		});

		competitionPanel.add(competitionComboBox);

		/*
		 * Campo scelta squadra: stampa
		 */
		string = "5. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo scelta squadra: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
				"10[]10"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setBackground(panelColor);

		add(teamPanel);

		/*
		 * Campo squadra: stampa
		 */
		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		teamPanel.add(label);

		/*
		 * Campo squadra: comboBox
		 */
		teamComboBox = new JComboBox<List<String>>();



		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		teamComboBox.setSelectedIndex(-1);

		teamPanel.add(teamComboBox);

		/*
		 * Campo scelta calciatore: stampa
		 */
		string = " 6. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("player");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo scelta calciatore: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
				"10[]10"
			);

		playerPanel = new JPanel(migLayout);
		playerPanel.setBackground(panelColor);

		add(playerPanel);

		/*
		 * Campo calciatore: stampa
		 */
		string = GuiConfiguration.getMessage("player");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		playerPanel.add(label);

		/*
		 * Campo calciatore: comboBox
		 */
		playerComboBox = new JComboBox<List<String>>();
		playerComboBox.setEditable(true);
		playerComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		playerComboBox.setSelectedIndex(-1);

		playerPanel.add(playerComboBox);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("go");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		add(searchButton);
	}

	public void fillCountryComboBox(JComboBox<List<String>> comboBox, String type, String superCountryID)
	{
		/*
		List<List<String>> nameCountryList = Controller.getInstance().getCountryList
			(
				type,
				superCountryID,
				false
			);

		for (List<String> countryList: nameCountryList) {
			comboBox.addItem(countryList);
		}

		 */

	}

	public void fillCompetitionComboBox(JComboBox<List<String>> comboBox)
	{
		/*
		List<List<String>> nameCompetitionList = Controller.getInstance().getCompetitionList
			(
				null,
				null,
				teamType,
				countryType,
				countryID,
				false
			);

		for (List<String> competitionList: nameCompetitionList){
			comboBox.addItem(competitionList);
		}

		 */
	}
}

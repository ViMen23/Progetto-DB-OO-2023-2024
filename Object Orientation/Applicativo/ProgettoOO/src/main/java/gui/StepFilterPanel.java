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
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;


public class StepFilterPanel
				extends JPanel
{
	private final Color panelColor = Color.white;
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	private final JPanel titlePanel;
	private final JPanel stepFilterPanel;
	private final JPanel teamTypePanel;
	private final JPanel seasonPanel;
	private final JPanel countryPanel;
	private final JPanel competitionPanel;
	private final JPanel teamPanel;
	private final JPanel playerPanel;

	private final JButton titleButton;
	private final JButton resetButton;

	private final JButton searchButton;

	private final JRadioButton clubRadioButton;
	private final JRadioButton nationalRadioButton;
	private final JRadioButton worldRadioButton;
	private final JRadioButton continentRadioButton;
	private final JRadioButton nationRadioButton;


	private final JComboBox<String> seasonComboBox;
	private final JComboBox<String> continentComboBox;
	private final JComboBox<String> nationComboBox;
	private final JComboBox<String> competitionComboBox;
	private final JComboBox<String> teamComboBox;
	private final JComboBox<String> playerComboBox;


	private final JLabel competitionLabel;
	private final JLabel seasonLabel;
	private final JLabel teamLabel;
	private final JLabel playerLabel;

	private final Vector<String> continentVector = new Vector<>();
	private final Vector<String> nationVector = new Vector<>();
	private final Vector<String> competitionVector = new Vector<>();
	private final Vector<String> seasonVector = new Vector<>();
	private final Vector<String> teamVector = new Vector<>();
	private final Vector<String> playerVector = new Vector<>();
	private final Map<String, String> continentMap = new HashMap<>();
	private final Map<String, String> nationMap = new HashMap<>();
	private final  Map<String, String> competitionMap = new HashMap<>();
	private final  Map<String, String> seasonMap = new HashMap<>();
	private final  Map<String, String> teamMap = new HashMap<>();
	private final  Map<String, String> playerMap = new HashMap<>();




	private final ButtonGroup countryTypeButtonGroup;
	private final ButtonGroup teamTypeButtonGroup;

	private JPanel infoPanel;

	private JLabel label;


	private String bookmark = null;
	private String countryType = null;
	private String continentID = null;
	private String nationID = null;
	private String teamType = null;
	private String competitionID = null;
	private String seasonStartYear = null;
	private String teamID = null;
	private String playerID = null;


	public StepFilterPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[]0",
				"10[]10[]0[]10"
			);

		setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"0[]110[]0",
				"10[]10"
			);

		titlePanel = new JPanel(migLayout);
		titlePanel.setOpaque(true);
		titlePanel.setBackground(panelColor);

		add(titlePanel, "sgx general, dock north");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("stepFilter");
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setEnabled(false);

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		titlePanel.add(titleButton, "width 80%");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER STEPFILTER PANEL
		 *------------------------------------------------------------------------------------------------------*/



		resetButton = new JButton(resetIcon);
		resetButton.setCursor(GuiConfiguration.getButtonCursor());

		titlePanel.add(resetButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				MainFrame.getMainFrameInstance().remove(component);

				StepFilterPanel stepFilterPanel = new StepFilterPanel();

				MainFrame.getMainFrameInstance().add(stepFilterPanel, "sgx frame");
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRO GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[60%, fill]50[35%, fill]10",
				"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0"
			);

		stepFilterPanel = new JPanel(migLayout);
		stepFilterPanel.setOpaque(false);

		add(stepFilterPanel, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



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

		stepFilterPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"5%[15%]10%[15%]5%",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		stepFilterPanel.add(teamTypePanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA CLUB
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(clubRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (teamType != null) {
					resetFromTeamType();
				}

				teamType = Team.TEAM_TYPE.CLUB.toString();

				worldRadioButton.setEnabled(true);
				continentRadioButton.setEnabled(true);
				nationRadioButton.setEnabled(true);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA NAZIONALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);
		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(nationalRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (teamType != null) {
					resetFromTeamType();
				}

				teamType = Team.TEAM_TYPE.NATIONAL.toString();

				worldRadioButton.setEnabled(true);
				continentRadioButton.setEnabled(true);
				nationRadioButton.setEnabled(true);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/


		teamTypeButtonGroup = new ButtonGroup();

		teamTypeButtonGroup.add(clubRadioButton);
		teamTypeButtonGroup.add(nationalRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		stepFilterPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = "2. ";
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

		stepFilterPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10:push[40%]5%",
				"10[]20[]20[]10"
			);

		countryPanel = new JPanel(migLayout);
		countryPanel.setBackground(panelColor);

		stepFilterPanel.add(countryPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE MONDO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		worldRadioButton = new JRadioButton(string);
		worldRadioButton.setEnabled(false);

		countryPanel.add(worldRadioButton, "wrap");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		worldRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (worldRadioButton.isSelected()) {
					countryType = Country.COUNTRY_TYPE.WORLD.toString();

					competitionComboBox.setEnabled(true);
					competitionLabel.setEnabled(true);
				}
				else {
					resetFromCountry();
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);
		continentRadioButton.setEnabled(false);

		countryPanel.add(continentRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (continentRadioButton.isSelected()) {

					countryType = Country.COUNTRY_TYPE.CONTINENT.toString();

					continentComboBox.setEnabled(true);
				}
				else {
					continentComboBox.setEnabled(false);

					continentComboBox.setSelectedIndex(-1);

					continentID = null;

					resetFromCountry();
				}

			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox = new JComboBox<>();
		continentComboBox.setEnabled(false);

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		countryPanel.add(continentComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillCountryComboBox
					(
						continentComboBox,
						continentVector,
						continentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						false
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (continentID != null) {
					resetFromCountry();
				}

				String tmp = (String) continentComboBox.getSelectedItem();

				continentID = continentMap.get(tmp);

				if (continentRadioButton.isSelected()) {
					competitionComboBox.setEnabled(true);
					competitionLabel.setEnabled(true);
				}
				else if (nationRadioButton.isSelected()) {

					nationComboBox.setEnabled(true);

					nationComboBox.setSelectedIndex(-1);

					nationID = null;
				}

				continentComboBox.removeAllItems();
				continentComboBox.addItem(tmp);
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);
		nationRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		nationRadioButton.setEnabled(false);

		countryPanel.add(nationRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationRadioButton.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (nationRadioButton.isSelected()) {
					countryType = Country.COUNTRY_TYPE.NATION.toString();

					continentComboBox.setEnabled(true);
				}
				else {
					continentComboBox.setEnabled(false);
					nationComboBox.setEnabled(false);

					continentComboBox.setSelectedIndex(-1);
					nationComboBox.setSelectedIndex(-1);

					continentID = null;
					nationID = null;

					resetFromCountry();
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox = new JComboBox<>();
		nationComboBox.setEnabled(false);

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		countryPanel.add(nationComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillCountryComboBox
					(
						nationComboBox,
						nationVector,
						nationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						continentID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (nationID != null) {
					resetFromCountry();
				}

				nationID = nationMap.get((String) nationComboBox.getSelectedItem());

				competitionComboBox.setEnabled(true);
				competitionLabel.setEnabled(true);
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO PAESE
		 *------------------------------------------------------------------------------------------------------*/



		countryTypeButtonGroup = new ButtonGroup();

		countryTypeButtonGroup.add(worldRadioButton);
		countryTypeButtonGroup.add(continentRadioButton);
		countryTypeButtonGroup.add(nationRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		stepFilterPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/


		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[][]10"
			);

		competitionPanel = new JPanel(migLayout);
		competitionPanel.setBackground(panelColor);

		stepFilterPanel.add(competitionPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("competition");
		string = StringUtils.capitalize(string);

		competitionLabel = new JLabel(string, SwingConstants.LEADING);
		competitionLabel.setEnabled(false);

		competitionPanel.add(competitionLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		competitionComboBox = new JComboBox<>();
		competitionComboBox.setEnabled(false);

		competitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		competitionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		competitionPanel.add(competitionComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		competitionComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCompetitionComboBox
					(
						competitionComboBox,
						competitionVector,
						competitionMap,
						null,
						null,
						teamType,
						countryType,
						continentID,
						nationID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (competitionID != null) {
					resetFromCompetition();
				}

				competitionID = competitionMap.get((String) competitionComboBox.getSelectedItem());


				if (competitionID != null) {
					seasonComboBox.setEnabled(true);
					seasonLabel.setEnabled(true);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRO PER COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		stepFilterPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = "4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string +=  GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[]10"
			);

		seasonPanel = new JPanel(migLayout);
		seasonPanel.setBackground(panelColor);

		stepFilterPanel.add(seasonPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("season");
		string = StringUtils.capitalize(string);

		seasonLabel = new JLabel(string, SwingConstants.LEADING);
		seasonLabel.setEnabled(false);

		seasonPanel.add(seasonLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX STAGIONE
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox = new JComboBox<>();
		seasonComboBox.setEnabled(false);

		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		seasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		seasonPanel.add(seasonComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		seasonComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
					seasonComboBox.removeAllItems();
				}

				GuiConfiguration.fillSeasonComboBox
					(
						seasonComboBox,
						seasonVector,
						seasonMap,
						teamType,
						competitionID,
						false
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (seasonStartYear != null) {
					resetFromSeason();
				}

				if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
					seasonStartYear = seasonMap.get((String) seasonComboBox.getSelectedItem());
				}
				else {
					seasonStartYear = (String) seasonComboBox.getSelectedItem();
				}

				if (seasonStartYear != null) {
					teamComboBox.setEnabled(true);
					teamLabel.setEnabled(true);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRO PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		stepFilterPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "5. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[][]10"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setBackground(panelColor);

		stepFilterPanel.add(teamPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		teamLabel = new JLabel(string, SwingConstants.LEADING);
		teamLabel.setEnabled(false);

		teamPanel.add(teamLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		teamComboBox = new JComboBox<>();
		teamComboBox.setEnabled(false);

		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		teamComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		teamPanel.add(teamComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		teamComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillTeamComboBox(teamComboBox, teamVector, teamMap, seasonStartYear, competitionID, false);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				if (teamID != null) {
					resetFromTeam();
				}

				teamID = teamMap.get((String) teamComboBox.getSelectedItem());

				if (teamID != null) {
					bookmark = teamID;

					searchButton.setEnabled(true);
					playerComboBox.setEnabled(true);
					playerLabel.setEnabled(true);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		stepFilterPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		string = " 6. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("player");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		stepFilterPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10:push[40%]5%",
				"10[][]10"
			);

		playerPanel = new JPanel(migLayout);
		playerPanel.setBackground(panelColor);

		stepFilterPanel.add(playerPanel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("player");
		string = StringUtils.capitalize(string);

		playerLabel = new JLabel(string, SwingConstants.LEADING);
		playerLabel.setEnabled(false);

		playerPanel.add(playerLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX CALCIATORE
		 *------------------------------------------------------------------------------------------------------*/



		playerComboBox = new JComboBox<>();
		playerComboBox.setEnabled(false);

		playerComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		playerComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		playerPanel.add(playerComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		playerComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillPlayerComboBox(playerComboBox, playerVector, playerMap, seasonStartYear, teamID, false);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerID = playerMap.get((String) playerComboBox.getSelectedItem());

				if (playerID != null) {
					bookmark = playerID;
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		stepFilterPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE CERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("go");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setEnabled(false);

		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		stepFilterPanel.add(searchButton, "span 2");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void fillCompetitionComboBox(JComboBox<String> comboBox,
										Vector<String> vector,
										Map<String, String> map,
										String competitionSubName,
										String competitionType,
										String competitionTeamType,
										String competitionCountryType,
										String competitionContinentID,
										String competitionNationID,
										Boolean selectAll)
	{
		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setCompetitionComboBox
			(
				vector,
				map,
				competitionSubName,
				competitionType,
				competitionTeamType,
				competitionCountryType,
				competitionContinentID,
				competitionNationID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}


	public void fillTeamComboBox(JComboBox<String> comboBox,
								   Vector<String> vector,
								   Map<String, String> map,
								   String startYear,
								   String competitionID,
								   Boolean selectAll)
	{
		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setTeamComboBox(vector, map, startYear, competitionID);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}

	public void fillPlayerComboBox(JComboBox<String> comboBox,
								   Vector<String> vector,
								   Map<String, String> map,
								   String startYear,
								   String competitionID,
								   Boolean selectAll)
	{
		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setPlayerComboBox(vector, map, startYear, competitionID);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}

	public void resetFromTeamType()
	{
		countryTypeButtonGroup.clearSelection();

		countryType = null;

		resetFromCountry();
	}

	public void resetFromCountry()
	{
		competitionComboBox.setEnabled(false);
		competitionLabel.setEnabled(false);

		competitionComboBox.setSelectedIndex(-1);

		competitionID = null;

		resetFromCompetition();
	}
	public void resetFromCompetition()
	{
		seasonComboBox.setEnabled(false);
		seasonLabel.setEnabled(false);

		seasonComboBox.setSelectedIndex(-1);

		seasonStartYear = null;

		resetFromSeason();
	}

	public void resetFromSeason()
	{
		teamComboBox.setEnabled(false);
		teamLabel.setEnabled(false);

		teamComboBox.setSelectedIndex(-1);

		teamID = null;

		resetFromTeam();
	}

	public void resetFromTeam()
	{
		searchButton.setEnabled(false);
		playerComboBox.setEnabled(false);
		playerLabel.setEnabled(false);

		playerComboBox.setSelectedIndex(-1);

		playerID = null;

		resetFromPlayer();
	}

	public void resetFromPlayer()
	{
		bookmark = teamID;
	}

}

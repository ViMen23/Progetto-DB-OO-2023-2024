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
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
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

		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		titlePanel.add(titleButton, "width 80%");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (stepFilterPanel.isShowing()) {
					remove(stepFilterPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(stepFilterPanel, "dock center, sgx general");
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
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
				countryTypeButtonGroup.clearSelection();
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
		 * LABEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = "1. ";
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
				"5%[20%]10%[40%]20%",
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

					clubRadioButton.setEnabled(true);
					nationalRadioButton.setEnabled(true);
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

				continentID = continentMap.get((String) continentComboBox.getSelectedItem());

				if (continentRadioButton.isSelected()) {

					clubRadioButton.setEnabled(true);

					nationalRadioButton.setEnabled(true);
				}
				else if (nationRadioButton.isSelected()) {

					nationComboBox.setEnabled(true);

					nationComboBox.setSelectedIndex(-1);

					nationID = null;
				}
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

				clubRadioButton.setEnabled(true);

				nationalRadioButton.setEnabled(true);
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
		 * LABEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "2. ";
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
				"30[20%, center]80[20%, center]30",
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
		clubRadioButton.setEnabled(false);

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

				competitionComboBox.setEnabled(true);
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
		nationalRadioButton.setEnabled(false);

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

				competitionComboBox.setEnabled(true);
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
				"5%[20%]10%[40%]20%",
				"10[]10"
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

		label = new JLabel(string, SwingConstants.LEADING);

		competitionPanel.add(label);
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
					bookmark = competitionID;
					searchButton.setEnabled(true);
					seasonComboBox.setEnabled(true);
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
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]10"
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

		label = new JLabel(string, SwingConstants.LEADING);

		seasonPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TEAM
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
				fillSeasonComboBox
					(
						seasonComboBox,
						seasonVector,
						seasonMap,
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

				seasonStartYear = seasonMap.get((String) seasonComboBox.getSelectedItem());

				if (seasonStartYear != null) {
					teamComboBox.setEnabled(true);
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
		 * LABEL FILTRA PER ANNI
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
		 * PANEL FILTRA PER ANNI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]10"
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

		label = new JLabel(string, SwingConstants.LEADING);

		teamPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX DA ANNO
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

					playerComboBox.setEnabled(true);
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
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]10"
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

		label = new JLabel(string, SwingConstants.LEADING);

		playerPanel.add(label);
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

		stepFilterPanel.add(searchButton, "sgx panel_first_column");



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

	public void fillSeasonComboBox(JComboBox<String> comboBox,
								   Vector<String> vector,
								   Map<String, String> map,
								   String competitionID,
								   Boolean selectAll)
	{
		String season;
		Integer step;

		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setCompetitionEditionComboBox(vector, competitionID);

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			step = 1;
		}
		else {
			step = 0;
		}

		for (String string: vector) {

			Integer year = Integer.valueOf(string);

			season = year.toString();
			season += " - ";

			year = year + step;

			season += year.toString();

			comboBox.addItem(season);

			map.put(season, string);
		}
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
	public void resetFromCountry()
	{
		clubRadioButton.setEnabled(false);
		nationalRadioButton.setEnabled(false)
		;
		teamTypeButtonGroup.clearSelection();

		teamType = null;

		resetFromTeamType();
	}
	public void resetFromTeamType()
	{
		competitionComboBox.setEnabled(false);

		competitionComboBox.setSelectedIndex(-1);

		competitionID = null;

		resetFromCompetition();
	}
	public void resetFromCompetition()
	{
		searchButton.setEnabled(false);
		seasonComboBox.setEnabled(false);

		seasonComboBox.setSelectedIndex(-1);

		seasonStartYear = null;

		resetFromSeason();

		bookmark = null;
	}

	public void resetFromSeason()
	{
		teamComboBox.setEnabled(false);

		teamComboBox.setSelectedIndex(-1);

		teamID = null;

		resetFromTeam();
	}

	public void resetFromTeam()
	{
		playerComboBox.setEnabled(false);

		playerComboBox.setSelectedIndex(-1);

		playerID = null;

		resetFromPlayer();

		bookmark = competitionID;
	}

	public void resetFromPlayer()
	{
		bookmark = teamID;
	}

}

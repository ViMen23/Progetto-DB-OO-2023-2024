
package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;

import java.awt.*;

/**
 * TYPE : class - gui package
 * NAME : ChooseYearRangePanel
 *
 * DESC: Pannello per l'interfaccia di scelta di un intervallo di tempo
 *       compreso tra due anni
 */

public class CompetitionEditionFilterPanel
				extends JPanel
{
	protected JPanel teamTypePanel;
	protected JPanel seasonPanel;
	protected JPanel countryPanel;
	protected JPanel competitionPanel;

	protected JButton fakeButton;
	protected JButton searchButton;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;
	protected JRadioButton worldRadioButton;
	protected JRadioButton continentRadioButton;
	protected JRadioButton nationRadioButton;

	protected JComboBox<String> seasonComboBox;
	protected JComboBox<String> worldComboBox;
	protected JComboBox<String> continentComboBox;
	protected JComboBox<String> nationComboBox;
	protected JComboBox<String> competitionComboBox;


	protected JLabel label;
	protected ButtonGroup buttonGroup;

	protected Color panelColor = Color.white;

	public CompetitionEditionFilterPanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10:push[fill]10:push",
				"20[]10[]0[]10[]0[]10[]0[]10[]0[]20[]20"
			);

		setLayout(migLayout);


		/*
		 * Campo titolo: button
		 */
		string = GuiConfiguration.getMessage("competitionEditionFilter");
		string = string.toUpperCase();

		fakeButton = new JButton(string);
		fakeButton.setEnabled(false);

		add(fakeButton);

		/*
		 * Campo scelta tipo team: stampa
		 */
		string = " 1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo scelta tipo team: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
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

		teamTypePanel.add(clubRadioButton);

		/*
		 * Campo nazionale: radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);

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
		string = " 2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string +=  GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo stagione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
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
		seasonComboBox.setSelectedIndex(-1);

		seasonPanel.add(seasonComboBox);

		/*
		 * Campo scelta paese: stampa
		 */
		string = " 3. ";
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

		add(label);

		/*
		 * Campo paese: panel
		 */
		migLayout = new MigLayout
		(
			"debug, wrap 2",
			"20[]30:push[]20",
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

		countryPanel.add(worldRadioButton);

		/*
		 * Campo mondo: comboBox
		 */
		worldComboBox = new JComboBox<String>();

		worldComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		worldComboBox.setSelectedIndex(-1);

		countryPanel.add(worldComboBox);

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		continentRadioButton = new JRadioButton(string);

		countryPanel.add(continentRadioButton);

		/*
		 * Campo continente: combo box
		 */
		continentComboBox = new JComboBox<String>();

		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setSelectedIndex(-1);

		countryPanel.add(continentComboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		nationRadioButton = new JRadioButton(string);

		countryPanel.add(nationRadioButton);

		/*
		 * Campo nazione: combo box
		 */
		nationComboBox = new JComboBox<String>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setSelectedIndex(-1);

		countryPanel.add(nationComboBox);

		/*
		 * Campo gruppo bottone: buttonGroup
		 */
		buttonGroup = new ButtonGroup();

		buttonGroup.add(worldRadioButton);
		buttonGroup.add(continentRadioButton);
		buttonGroup.add(nationRadioButton);

		/*
		 * Campo competizione: stampa
		 */
		string = " 4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
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
		competitionComboBox = new JComboBox<String>();

		competitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		competitionComboBox.setSelectedIndex(-1);

		competitionPanel.add(competitionComboBox);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("go");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		add(searchButton);
	}

}

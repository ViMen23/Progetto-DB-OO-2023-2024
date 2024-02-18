
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

	protected JButton button;
	protected JLabel label;
	protected ButtonGroup buttonGroup;
	protected JRadioButton radioButton;
	protected JComboBox<String> comboBox;

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

		button = new JButton(string);
		button.setEnabled(false);

		add(button);

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


		buttonGroup = new ButtonGroup();

		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		teamTypePanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo nazionale: radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		teamTypePanel.add(radioButton);

		buttonGroup.add(radioButton);


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
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		seasonPanel.add(comboBox);

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


		buttonGroup = new ButtonGroup();

		/*
		 * Campo mondo: radio button
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		countryPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo mondo: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryPanel.add(comboBox);

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		countryPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo continente: combo box
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryPanel.add(comboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		countryPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo nazione: combo box
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryPanel.add(comboBox);

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
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		competitionPanel.add(comboBox);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("go");
		string = string.toUpperCase();

		button = new JButton(string);

		add(button);
	}

}

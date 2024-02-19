
package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;


public class MilitancyFilterPanel
				extends JPanel
{
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel teamPanel;
	protected JPanel yearPanel;


	protected JButton fakeButton;
	protected JButton searchButton;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;

	protected JComboBox<String> worldComboBox;
	protected JComboBox<String> continentComboBox;
	protected JComboBox<String> nationComboBox;
	protected JComboBox<String> teamComboBox;
	protected JComboBox<String> fromYearComboBox;
	protected JComboBox<String> toYearComboBox;

	protected JLabel label;
	protected ButtonGroup buttonGroup;


	protected Color panelColor = Color.white;

	public MilitancyFilterPanel()
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10:push[fill]10:push",
				"20[]10[]0[]10[]0[]10[]0[]10[]0[]20[]20"
			);


		setLayout(migLayout);

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("militancyFilter");
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
		 * Campo scelta paese: stampa
		 */
		string = " 2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo scelta paese: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"20[]30:push[]20",
				"10[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		add(countryConfederationPanel);

		/*
		 * Campo mondo: stampa
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);

		/*
		 * Campo mondo: comboBox
		 */
		worldComboBox = new JComboBox<String>();

		worldComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		worldComboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(worldComboBox);

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
		continentComboBox = new JComboBox<String>();

		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setSelectedIndex(-1);

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
		nationComboBox = new JComboBox<String>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(nationComboBox);

		/*
		 * Campo scelta squadra: stampa
		 */
		string = " 3. ";
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
		teamComboBox = new JComboBox<String>();

		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		teamComboBox.setSelectedIndex(-1);

		teamPanel.add(teamComboBox);

		/*
		 * Campo scelta anni: stampa
		 */
		string = " 4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("years");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);

		/*
		 * Campo scelta anni: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30[]50:push[]30[]20",
				"10[]10"
			);

		yearPanel = new JPanel(migLayout);
		yearPanel.setBackground(panelColor);

		add(yearPanel);

		/*
		 * Campo anni da: stampa
		 */
		string = GuiConfiguration.getMessage("from");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		yearPanel.add(label);

		/*
		 * Campo anni da: comboBox
		 */
		fromYearComboBox = new JComboBox<String>();

		fromYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		fromYearComboBox.setSelectedIndex(-1);

		yearPanel.add(fromYearComboBox);

		/*
		 * Campo ad anni: stampa
		 */
		string = GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		yearPanel.add(label);

		/*
		 * Campo ad anni: comboBox
		 */
		toYearComboBox = new JComboBox<String>();

		toYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		toYearComboBox.setSelectedIndex(-1);

		yearPanel.add(toYearComboBox);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		add(searchButton);
	}
}

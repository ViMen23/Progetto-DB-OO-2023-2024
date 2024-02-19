package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;

import java.awt.*;

public class SearchTeamPanel
				extends JPanel
{
	protected JPanel namePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;


	protected JButton fakeButton;
	protected JButton searchButton;

	protected JCheckBox nameSearchCheckBox;
	protected JCheckBox teamTypeSearchCheckBox;
	protected JCheckBox nationConfederationSearchCheckBox;

	protected JTextField longNameTextField;
	protected JTextField shortNameTextField;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;

	protected JComboBox<String> worldComboBox;
	protected JComboBox<String> continentComboBox;
	protected JComboBox<String> nationComboBox;


	protected ButtonGroup buttonGroup;

	protected JLabel label;

	protected Color panelColor = Color.white;

	public SearchTeamPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10:push[fill]10:push",
				"20[]10[]0[]10[]0[]10[]0[]20[]20"
			);

		setLayout(migLayout);

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("teams");
		string = string.toUpperCase();

		fakeButton = new JButton(string);
		fakeButton.setEnabled(false);

		add(fakeButton);

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

		add(nameSearchCheckBox);

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"20[]30:push[]20",
				"10[]20[]10"
			);

		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		add(namePanel);

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

		add(teamTypeSearchCheckBox);

		/*
		 * Campo ricerca per tipo squadra: panel
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

		add(nationConfederationSearchCheckBox);

		/*
		 * Campo ricerca per nazione e confederazione: panel
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
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		add(searchButton);

	}
}

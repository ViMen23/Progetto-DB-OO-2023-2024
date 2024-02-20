package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;



public class SearchCompetitionPanel
				extends JPanel
{
	protected JPanel namePanel;
	protected JPanel competitionTypePanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;

	protected JButton button;
	protected JCheckBox checkBox;
	protected ButtonGroup buttonGroup;
	protected JRadioButton radioButton;
	protected JLabel label;
	protected JTextField textField;
	protected JComboBox<String> comboBox;

	protected Color panelColor = Color.white;

	public SearchCompetitionPanel()
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
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("competitions");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setEnabled(false);

		add(button);

		/*
		 * Campo ricerca per nome: checkbox
		 */

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
				"10[]10"
			);


		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		add(namePanel);

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
		textField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(textField);

		/*
		 * Campo ricerca per tipo di competizione: panel
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per tipo competizione: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]30:push[]20",
				"10[]10"
			);

		competitionTypePanel = new JPanel(migLayout);

		competitionTypePanel.setBackground(panelColor);
		add(competitionTypePanel);

		buttonGroup = new ButtonGroup();

		/*
		 * Campo campionato: radioButton
		 */
		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		competitionTypePanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo coppa: radioButton
		 */
		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		competitionTypePanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo supercoppa: radioButton
		 */
		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		competitionTypePanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo ricerca per tipo squadra: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

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
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"20[]30:push[]20",
				"10[]20[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		add(countryConfederationPanel);

		buttonGroup = new ButtonGroup();

		/*
		 * Campo mondo: radio button
		 */
		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		countryConfederationPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo mondo: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(false);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());


		comboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(comboBox);

		/*
		 * Campo continente: radio button
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		countryConfederationPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo continente: combo box
		 */

		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(comboBox);

		/*
		 * Campo nazione: radio button
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		countryConfederationPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo nazione: combo box
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(comboBox);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		add(button);
	}
}
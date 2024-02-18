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


	protected JButton button;
	protected JCheckBox checkBox;
	protected JLabel label;
	protected JTextField textField;
	protected ButtonGroup buttonGroup;
	protected JRadioButton radioButton;
	protected JComboBox<String> comboBox;

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

		button = new JButton(string);
		button.setEnabled(false);

		add(button);

		/*
		 * Campo ricerca per nome: checkBox
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
		textField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(textField);

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
		textField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(textField);

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
		 * Campo ricerca per nazione e confederazione: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);

		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

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
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(comboBox);

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
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		countryConfederationPanel.add(comboBox);

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

package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;

public class SearchPlayerPanel
				extends JPanel
{
	protected JPanel namePanel;
	protected JPanel agePanel;
	protected JPanel bornNationPanel;
	protected JPanel rolePanel;
	protected JPanel mainPositionPanel;
	protected JPanel preferredFootPanel;

	protected JButton button;

	protected JCheckBox checkBox;

	protected JLabel label;

	protected JTextField textField;

	protected JComboBox<String> comboBox;

	protected ButtonGroup buttonGroup;

	protected JRadioButton radioButton;

	public SearchPlayerPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10:push[fill]10:push",
				"20[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]20[]20"
			);

		setLayout(migLayout);

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("players");
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
		namePanel.setBackground(Color.white);

		add(namePanel);

		/*
		 * Campo nome: stampa
		 */
		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo testo: input
		 */
		textField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(textField);

		/*
		 * Campo cognome: stampa
		 */
		string = GuiConfiguration.getMessage("surname");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo testo: input
		 */
		textField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(textField);

		/*
		 * Campo ricerca per eta: input
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("age");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);


		/*
		 * Campo ricerca per eta: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"20[]30:push[]20",
				"10[]20[]10"
			);

		agePanel = new JPanel(migLayout);
		agePanel.setBackground(Color.white);

		add(agePanel);

		/*
		 * Campo anno di riferimento: stampa
		 */
		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);

		/*
		 * Campo anno di riferimento: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		agePanel.add(comboBox);

		/*
		 * Campo eta: stampa
		 */
		string = GuiConfiguration.getMessage("age");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);

		/*
		 * Campo eta: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		agePanel.add(comboBox, "split 2");

		/*
		 * Campo eta: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);


		agePanel.add(comboBox);

		/*
		 * Campo ricerca per paese di nascita: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("bornNation");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);

		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per paese di nascita: panel
		 */

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"20[]30:push[]20",
				"10[]20[]10"
			);

		bornNationPanel = new JPanel(migLayout);
		bornNationPanel.setBackground(Color.white);

		add(bornNationPanel);

		/*
		 * Campo ricerca per paese di nascita continente: stampa
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		bornNationPanel.add(label);

		/*
		 * Campo ricerca per paese di nascita continente: stampa
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		bornNationPanel.add(comboBox);


		/*
		 * Campo ricerca per paese di nascita nazione: stampa
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		bornNationPanel.add(label);

		/*
		 * Campo ricerca per paese di nascita nazione: stampa
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		bornNationPanel.add(comboBox);

		/*
		 * Campo ricerca per ruolo: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);

		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per ruolo: panel
		 */

		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]30:push[]30:push[]20",
				"10[]10"
			);


		rolePanel = new JPanel(migLayout);
		rolePanel.setBackground(Color.white);

		add(rolePanel);

		/*
		 * Campo ricerca per ruolo portiere: checkBox
		 */
		string = GuiConfiguration.getMessage("goalkeeper");
		string = StringUtils.capitalize(string);

		checkBox = new JCheckBox(string);

		rolePanel.add(checkBox);

		/*
		 * Campo ricerca per ruolo difensore: checkBox
		 */
		string = GuiConfiguration.getMessage("defender");
		string = StringUtils.capitalize(string);

		checkBox = new JCheckBox(string);

		rolePanel.add(checkBox);

		/*
		 * Campo ricerca per ruolo centrocampista: checkBox
		 */
		string = GuiConfiguration.getMessage("midfield");
		string = StringUtils.capitalize(string);

		checkBox = new JCheckBox(string);

		rolePanel.add(checkBox);

		/*
		 * Campo ricerca per ruolo difensore: checkBox
		 */
		string = GuiConfiguration.getMessage("fowarder");
		string = StringUtils.capitalize(string);

		checkBox = new JCheckBox(string);

		rolePanel.add(checkBox);

		/*
		 * Campo ricerca per posizione principale: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("mainPosition");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);

		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per posizione principale: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]20",
				"10[]10"
			);

		mainPositionPanel = new JPanel(migLayout);
		mainPositionPanel.setBackground(Color.white);

		add(mainPositionPanel);

		/*
		 * Campo posizione: stampa
		 */
		string = GuiConfiguration.getMessage("position");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		mainPositionPanel.add(label);

		/*
		 * Campo posizione: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		mainPositionPanel.add(comboBox);

		/*
		 * Campo ricerca per il piede preferito: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("preferredFoot");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setForeground(Color.white);

		add(checkBox);

		/*
		 * Campo ricerca per il piede preferito: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]30:push[]30:push[]20",
				"10[]10"
			);

		preferredFootPanel = new JPanel(migLayout);
		preferredFootPanel.setBackground(Color.white);

		add(preferredFootPanel);


		buttonGroup = new ButtonGroup();

		/*
		 * Campo ricerca per il piede preferito destro: radioButton
		 */
		string = GuiConfiguration.getMessage("right");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		preferredFootPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo ricerca per il piede preferito sinistro: radioButton
		 */
		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		preferredFootPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo ricerca per entrambi i piedi preferiti: radioButton
		 */
		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		preferredFootPanel.add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		add(button);

	}
}

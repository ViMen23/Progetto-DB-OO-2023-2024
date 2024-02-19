package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.sql.ResultSet;
import java.util.Vector;

public class SearchPlayerPanel
				extends JPanel
{
	protected JPanel namePanel;
	protected JPanel agePanel;
	protected JPanel bornNationPanel;
	protected JPanel rolePanel;
	protected JPanel mainPositionPanel;
	protected JPanel preferredFootPanel;

	protected JButton fakeButton;
	protected JButton searchButton;

	protected JCheckBox nameSearchCheckBox;
	protected JCheckBox ageSearchCheckBox;
	protected JCheckBox bornNationSearchCheckBox;
	protected JCheckBox roleSearchCheckBox;
	protected JCheckBox goalkeeperCheckBox;
	protected JCheckBox defenderCheckBox;
	protected JCheckBox midfielderCheckBox;
	protected JCheckBox forwardCheckBox;
	protected JCheckBox mainPositionSearchCheckBox;
	protected JCheckBox preferredFootSearchCheckBox;

	protected JTextField nameTextField;
	protected JTextField surnameTextField;

	protected JComboBox<String> yearReferenceComboBox;
	protected JComboBox<String> ageOperationComboBox;
	protected JComboBox<String> ageComboBox;
	protected JComboBox<String> continentComboBox;
	protected JComboBox<String> nationComboBox;
	protected JComboBox<String> mainPositionComboBox;

	protected JRadioButton rightFootRadioButton;
	protected JRadioButton leftFootRadioButton;
	protected JRadioButton eitherFootRadioButton;


	protected JLabel label;
	protected ButtonGroup buttonGroup;

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
		nameTextField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(nameTextField);

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
		surnameTextField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(surnameTextField);

		/*
		 * Campo ricerca per eta: input
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("age");
		string = string.toUpperCase();

		ageSearchCheckBox = new JCheckBox(string);
		ageSearchCheckBox.setOpaque(true);
		ageSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		ageSearchCheckBox.setForeground(Color.white);

		add(ageSearchCheckBox);

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
		yearReferenceComboBox = new JComboBox<String>();

		yearReferenceComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		yearReferenceComboBox.setSelectedIndex(-1);

		agePanel.add(yearReferenceComboBox);

		/*
		 * Campo eta: stampa
		 */
		string = GuiConfiguration.getMessage("age");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);

		/*
		 * Campo operazione età: comboBox
		 */
		ageOperationComboBox = new JComboBox<String>();

		ageOperationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		ageOperationComboBox.setSelectedIndex(-1);

		agePanel.add(ageOperationComboBox, "split 2");

		/*
		 * Campo età: comboBox
		 */
		ageComboBox = new JComboBox<String>();

		ageComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		ageComboBox.setSelectedIndex(-1);


		agePanel.add(ageComboBox);

		/*
		 * Campo ricerca per paese di nascita: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("bornNation");
		string = string.toUpperCase();

		bornNationSearchCheckBox = new JCheckBox(string);

		bornNationSearchCheckBox.setOpaque(true);
		bornNationSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		bornNationSearchCheckBox.setForeground(Color.white);

		add(bornNationSearchCheckBox);

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
		continentComboBox = new JComboBox<String>();

		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		continentComboBox.setSelectedIndex(-1);


		bornNationPanel.add(continentComboBox);

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
		nationComboBox = new JComboBox<String>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setSelectedIndex(-1);

		bornNationPanel.add(nationComboBox);

		/*
		 * Campo ricerca per ruolo: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		roleSearchCheckBox = new JCheckBox(string);

		roleSearchCheckBox.setOpaque(true);
		roleSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		roleSearchCheckBox.setForeground(Color.white);

		add(roleSearchCheckBox);

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

		goalkeeperCheckBox = new JCheckBox(string);

		rolePanel.add(goalkeeperCheckBox);

		/*
		 * Campo ricerca per ruolo difensore: checkBox
		 */
		string = GuiConfiguration.getMessage("defender");
		string = StringUtils.capitalize(string);

		defenderCheckBox = new JCheckBox(string);

		rolePanel.add(defenderCheckBox);

		/*
		 * Campo ricerca per ruolo centrocampista: checkBox
		 */
		string = GuiConfiguration.getMessage("midfield");
		string = StringUtils.capitalize(string);

		midfielderCheckBox = new JCheckBox(string);

		rolePanel.add(midfielderCheckBox);

		/*
		 * Campo ricerca per ruolo difensore: checkBox
		 */
		string = GuiConfiguration.getMessage("fowarder");
		string = StringUtils.capitalize(string);

		forwardCheckBox = new JCheckBox(string);

		rolePanel.add(forwardCheckBox);

		/*
		 * Campo ricerca per posizione principale: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("mainPosition");
		string = string.toUpperCase();

		mainPositionSearchCheckBox = new JCheckBox(string);

		mainPositionSearchCheckBox.setOpaque(true);
		mainPositionSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		mainPositionSearchCheckBox.setForeground(Color.white);

		add(mainPositionSearchCheckBox);

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
		mainPositionComboBox = new JComboBox<String>();

		mainPositionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		mainPositionComboBox.setSelectedIndex(-1);

		mainPositionPanel.add(mainPositionComboBox);

		/*
		 * Campo ricerca per il piede preferito: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("preferredFoot");
		string = string.toUpperCase();

		preferredFootSearchCheckBox = new JCheckBox(string);
		preferredFootSearchCheckBox.setOpaque(true);
		preferredFootSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		preferredFootSearchCheckBox.setForeground(Color.white);

		add(preferredFootSearchCheckBox);

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

		rightFootRadioButton = new JRadioButton(string);

		preferredFootPanel.add(rightFootRadioButton);

		buttonGroup.add(rightFootRadioButton);

		/*
		 * Campo ricerca per il piede preferito sinistro: radioButton
		 */
		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);

		leftFootRadioButton = new JRadioButton(string);

		preferredFootPanel.add(leftFootRadioButton);

		buttonGroup.add(leftFootRadioButton);

		/*
		 * Campo ricerca per entrambi i piedi preferiti: radioButton
		 */
		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);

		eitherFootRadioButton = new JRadioButton(string);

		preferredFootPanel.add(eitherFootRadioButton);

		buttonGroup.add(eitherFootRadioButton);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		add(searchButton);

	}
}

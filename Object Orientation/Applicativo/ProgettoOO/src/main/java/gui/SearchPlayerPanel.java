package gui;

import controller.Controller;
import model.Country;
import model.Player;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;

public class SearchPlayerPanel
				extends JPanel
{
	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");

	protected JPanel playerPanel;
	protected JPanel namePanel;
	protected JPanel agePanel;
	protected JPanel bornNationPanel;
	protected JPanel rolePanel;
	protected JPanel mainPositionPanel;
	protected JPanel preferredFootPanel;
	protected JPanel playerTablePanel;

	protected JButton titleButton;
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
	protected JComboBox<String> minimumAgeComboBox;
	protected JComboBox<String> maximumAgeComboBox;
	protected JComboBox<List<String>> continentComboBox;
	protected JComboBox<List<String>> nationComboBox;
	protected JComboBox<List<String>> mainPositionComboBox;

	protected JRadioButton rightFootRadioButton;
	protected JRadioButton leftFootRadioButton;
	protected JRadioButton eitherFootRadioButton;


	protected JLabel label;
	protected ButtonGroup preferredFootGroupButton;

	protected JTable playerTable;
	protected JScrollPane scrollPane;

	protected Color panelColor = Color.white;

	protected Boolean nameSearchValid = true;
	protected Boolean playerNameSearchValid = true;
	protected Boolean playerSurnameSearchValid = true;
	protected Boolean ageSearchValid = true;
	protected Boolean bornNationSearchValid = true;
	protected Boolean roleSearchValid = true;
	protected Boolean mainPositionValid = true;
	protected Boolean preferredFootSearchValid = true;
	protected Boolean anySelected = false;


	protected String playerSubName = null;
	protected String playerSubSurname = null;
	protected String playerReferringYear = null;
	protected String playerMinAge = null;
	protected String playerCountryID = null;
	protected String playerMaxAge = null;
	protected String playerRole = null;
	protected String playerPositionID = null;
	protected String playerFoot = null;



	public SearchPlayerPanel()
	{

		MigLayout migLayout;
		String string;


		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]20[]50[]10"
			);

		setLayout(migLayout);
		setName("searchPlayerPanel");

		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("players");
		string += " - ";
		string += GuiConfiguration.getMessage("players");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		//string += Controller.getInstance().countPlayers().toString(); TODO
		string = string.toUpperCase();


		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				if (playerPanel.isShowing()) {
					remove(playerPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(playerPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});

		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]20[]0"
			);

		playerPanel = new JPanel(migLayout);
		playerPanel.setOpaque(false);

		add(playerPanel);

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
		nameSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		nameSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = nameSearchCheckBox.isSelected();

				nameTextField.setEnabled(selected);
				surnameTextField.setEnabled(selected);

				nameTextField.setText("");
				surnameTextField.setText("");

				playerNameSearchValid = false;
				playerSurnameSearchValid = false;

				nameSearchValid = !selected;

				System.out.println(nameSearchValid);

				setAnySelected();

				setEnableButton();

				System.out.println(nameSearchValid);

			}
		});

		playerPanel.add(nameSearchCheckBox);

		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50:push[]80[]20:push",
				"10[]20[]10"
			);

		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		playerPanel.add(namePanel);

		/*
		 * Campo nome: stampa
		 */
		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo testo: textField
		 */
		nameTextField = new JTextField(GuiConfiguration.getInputColumn());
		nameTextField.setEnabled(false);

		nameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				String string = nameTextField.getText();

				playerNameSearchValid = Regex.patternString.matcher(string).find();

				if (string.isEmpty()) {
					playerSubName = null;
				}
				else {
					playerSubName = string;
				}
				setNameSearchValid();

				setEnableButton();
			}
		});

		namePanel.add(nameTextField);

		/*
		 * Campo cognome: stampa
		 */
		string = GuiConfiguration.getMessage("surname");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo testo: textfield
		 */
		surnameTextField = new JTextField(GuiConfiguration.getInputColumn());
		surnameTextField.setEnabled(false);

		surnameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				String string = surnameTextField.getText();

				playerSurnameSearchValid = Regex.patternString.matcher(string).find();

				if (string.isEmpty()) {
					playerSubSurname = null;
				}
				else {
					playerSubSurname = string;
				}
				setNameSearchValid();

				setEnableButton();
			}
		});

		namePanel.add(surnameTextField);

		/*
		 * Campo ricerca per eta: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("age");
		string = string.toUpperCase();

		ageSearchCheckBox = new JCheckBox(string);
		ageSearchCheckBox.setOpaque(true);
		ageSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
		ageSearchCheckBox.setForeground(Color.white);
		ageSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		ageSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = ageSearchCheckBox.isSelected();

				yearReferenceComboBox.setEnabled(selected);

				ageSearchValid = !selected;

				if (selected) {
					fillReferenceYearComboBox();
				}
				else {
					yearReferenceComboBox.removeAllItems();
					minimumAgeComboBox.removeAllItems();
					maximumAgeComboBox.removeAllItems();

					minimumAgeComboBox.setEnabled(false);
					maximumAgeComboBox.setEnabled(false);
				}

				setAnySelected();

				setEnableButton();
			}
		});

		playerPanel.add(ageSearchCheckBox);

		/*
		 * Campo ricerca per eta: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 4",
				"50:push[]80[]80[]80[]20:push",
				"10[]20[]10"
			);

		agePanel = new JPanel(migLayout);
		agePanel.setBackground(panelColor);

		playerPanel.add(agePanel);

		/*
		 * Campo anno di riferimento: stampa
		 */
		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label, "spanx 2, center");

		/*
		 * Campo anno di riferimento: comboBox
		 */
		yearReferenceComboBox = new JComboBox<String>();

		yearReferenceComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		yearReferenceComboBox.setEnabled(false);

		String tmp = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

		yearReferenceComboBox.setPrototypeDisplayValue(tmp);

		yearReferenceComboBox.putClientProperty("JComboBox.isTableCellEditor", Boolean.TRUE); //Used to make the action fire only one time
		yearReferenceComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (yearReferenceComboBox.getSelectedIndex() != -1) {
					playerReferringYear = (String) yearReferenceComboBox.getSelectedItem();

					maximumAgeComboBox.removeAllItems();
					minimumAgeComboBox.removeAllItems();

					Integer minimumAge = 15; //TODO take this value from db
					Integer maximumAge = 50; //TODO take this value from db

					fillAgeComboBox(minimumAgeComboBox, minimumAge, maximumAge);

					minimumAgeComboBox.setEnabled(true);
				}
				else {
					minimumAgeComboBox.setEnabled(false);
				}

				ageSearchValid = false;

				setEnableButton();
			}
		});

		agePanel.add(yearReferenceComboBox, "spanx 2, center");

		/*
		 * Campo età minima: stampa
		 */
		string = GuiConfiguration.getMessage("minimumAge");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);

		/*
		 * Campo età minima: comboBox
		 */
		minimumAgeComboBox = new JComboBox<String>();

		minimumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		minimumAgeComboBox.setEnabled(false);

		minimumAgeComboBox.setPrototypeDisplayValue(tmp);

		minimumAgeComboBox.putClientProperty("JComboBox.isTableCellEditor", Boolean.TRUE);

		minimumAgeComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				maximumAgeComboBox.removeAllItems();

				if (minimumAgeComboBox.getSelectedIndex() != -1) {
					playerMinAge = (String) minimumAgeComboBox.getSelectedItem();

					Integer maximumAge = 50; //TODO take this value from db

					fillAgeComboBox(maximumAgeComboBox, Integer.valueOf(playerMinAge), maximumAge);

					maximumAgeComboBox.setEnabled(true);
				}
				else {
					maximumAgeComboBox.setEnabled(false);
				}

				ageSearchValid = false;

				setEnableButton();
			}
		});

		agePanel.add(minimumAgeComboBox);

		/*
		 * Campo età massima: stampa
		 */
		string = GuiConfiguration.getMessage("maximumAge");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);

		/*
		 * Campo età massima: comboBox
		 */
		maximumAgeComboBox = new JComboBox<String>();

		maximumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		maximumAgeComboBox.setEnabled(false);

		maximumAgeComboBox.setPrototypeDisplayValue(tmp);

		maximumAgeComboBox.putClientProperty("JComboBox.isTableCellEditor", Boolean.TRUE);

		maximumAgeComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (maximumAgeComboBox.getSelectedIndex() != -1 ) {
					playerMaxAge = (String) maximumAgeComboBox.getSelectedItem();

					ageSearchValid = true;
				}
				else {
					ageSearchValid = false;
				}

				setEnableButton();
			}
		});

		agePanel.add(maximumAgeComboBox);

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
		bornNationSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		bornNationSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = bornNationSearchCheckBox.isSelected();

				continentComboBox.setEnabled(selected);

				bornNationSearchValid = !selected;

				if (selected) {
					fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
				}
				else {
					continentComboBox.removeAllItems();
					nationComboBox.removeAllItems();

					nationComboBox.setEnabled(false);
				}

				setAnySelected();

				setEnableButton();
			}
		});

		playerPanel.add(bornNationSearchCheckBox);

		/*
		 * Campo ricerca per paese di nascita: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"50:push[]80[]20:push",
				"10[]20[]10"
			);

		bornNationPanel = new JPanel(migLayout);
		bornNationPanel.setBackground(panelColor);

		playerPanel.add(bornNationPanel);

		/*
		 * Campo continente: stampa
		 */
		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		bornNationPanel.add(label);

		/*
		 * Campo continente: comboBox
		 */
		continentComboBox = new JComboBox<List<String>>();

		continentComboBox.setRenderer(new ComboBoxRenderer());
		continentComboBox.setEnabled(false);

		List<String> aa = new ArrayList<String>();
		aa.add("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

		continentComboBox.setPrototypeDisplayValue(aa);

		continentComboBox.putClientProperty("JComboBox.isTableCellEditor", Boolean.TRUE);


		continentComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				nationComboBox.removeAllItems();

				if(continentComboBox.getSelectedIndex() != -1) {

					String superCountryID = ((List<String>)continentComboBox.getSelectedItem()).getLast();

					fillCountryComboBox(nationComboBox, Country.COUNTRY_TYPE.NATION.toString(), superCountryID);

					nationComboBox.setEnabled(true);
				}
				else {
					nationComboBox.setEnabled(false);
				}

				bornNationSearchValid = false;

				setEnableButton();
			}
		});

		bornNationPanel.add(continentComboBox);

		/*
		 * Campo nazione: stampa
		 */
		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		bornNationPanel.add(label);

		/*
		 * Campo nazione: comboBox
		 */
		nationComboBox = new JComboBox<List<String>>();

		nationComboBox.setRenderer(new ComboBoxRenderer());
		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.putClientProperty("JComboBox.isTableCellEditor", Boolean.TRUE);
		nationComboBox.setPrototypeDisplayValue(aa);


		nationComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (nationComboBox.getSelectedIndex() != -1 ){
					playerCountryID = ((List<String>)nationComboBox.getSelectedItem()).getLast();

					bornNationSearchValid = true;
				}
				else {
					bornNationSearchValid = false;
				}

				setEnableButton();
			}
		});

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
		roleSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		roleSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = roleSearchCheckBox.isSelected();

				goalkeeperCheckBox.setEnabled(selected);
				goalkeeperCheckBox.setSelected(false);

				defenderCheckBox.setEnabled(selected);
				defenderCheckBox.setSelected(false);

				midfielderCheckBox.setEnabled(selected);
				midfielderCheckBox.setSelected(false);

				forwardCheckBox.setEnabled(selected);
				forwardCheckBox.setSelected(false);

				roleSearchValid = !selected;

				setAnySelected();

				setEnableButton();
			}
		});

		playerPanel.add(roleSearchCheckBox);

		/*
		 * Campo ricerca per ruolo: panel
		 */

		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]80[]80[]20:push",
				"10[]10"
			);


		rolePanel = new JPanel(migLayout);
		rolePanel.setBackground(Color.white);

		playerPanel.add(rolePanel);

		/*
		 * Campo ricerca per ruolo portiere: checkBox
		 */
		string = GuiConfiguration.getMessage("goalkeeper");
		string = StringUtils.capitalize(string);

		goalkeeperCheckBox = new JCheckBox(string);
		goalkeeperCheckBox.setEnabled(false);

		goalkeeperCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				setRoleSearchValid();

				setEnableButton();
			}
		});

		rolePanel.add(goalkeeperCheckBox);

		/*
		 * Campo ricerca per ruolo difensore: checkBox
		 */
		string = GuiConfiguration.getMessage("defender");
		string = StringUtils.capitalize(string);

		defenderCheckBox = new JCheckBox(string);
		defenderCheckBox.setEnabled(false);

		defenderCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				setRoleSearchValid();

				setEnableButton();
			}
		});


		rolePanel.add(defenderCheckBox);

		/*
		 * Campo ricerca per ruolo centrocampista: checkBox
		 */
		string = GuiConfiguration.getMessage("midfield");
		string = StringUtils.capitalize(string);

		midfielderCheckBox = new JCheckBox(string);
		midfielderCheckBox.setEnabled(false);

		midfielderCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				setRoleSearchValid();

				setEnableButton();
			}
		});


		rolePanel.add(midfielderCheckBox);

		/*
		 * Campo ricerca per ruolo difensore: checkBox
		 */
		string = GuiConfiguration.getMessage("fowarder");
		string = StringUtils.capitalize(string);

		forwardCheckBox = new JCheckBox(string);
		forwardCheckBox.setEnabled(false);

		forwardCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				setRoleSearchValid();

				setEnableButton();
			}
		});

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
		mainPositionSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		mainPositionSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = mainPositionSearchCheckBox.isSelected();

				mainPositionComboBox.setEnabled(selected);

				mainPositionValid = !selected;

				if (selected) {
					fillPositionComboBox(mainPositionComboBox);
				}
				else {
					mainPositionComboBox.removeAllItems();
				}

				setAnySelected();

				setEnableButton();
			}
		});

		playerPanel.add(mainPositionSearchCheckBox);

		/*
		 * Campo ricerca per posizione principale: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]20:push",
				"10[]10"
			);

		mainPositionPanel = new JPanel(migLayout);
		mainPositionPanel.setBackground(panelColor);

		playerPanel.add(mainPositionPanel);

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
		mainPositionComboBox = new JComboBox<List<String>>();

		mainPositionComboBox.setRenderer(new ComboBoxRenderer());
		mainPositionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		mainPositionComboBox.setEnabled(false);

		mainPositionComboBox.setPrototypeDisplayValue(aa);

		mainPositionComboBox.putClientProperty("JComboBox.isTableCellEditor", Boolean.TRUE);

		mainPositionComboBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (mainPositionComboBox.getSelectedIndex() != -1) {
					mainPositionValid = true;
					playerPositionID = ((List<String>)mainPositionComboBox.getSelectedItem()).getLast();
				}
				else {
					mainPositionValid = false;
				}

				setEnableButton();
			}
		});
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
		preferredFootSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());

		preferredFootSearchCheckBox.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Boolean selected = preferredFootSearchCheckBox.isSelected();

				leftFootRadioButton.setEnabled(selected);
				rightFootRadioButton.setEnabled(selected);
				eitherFootRadioButton.setEnabled(selected);

				preferredFootGroupButton.clearSelection();

				preferredFootSearchValid = !selected;

				setAnySelected();

				setEnableButton();
			}
		});

		playerPanel.add(preferredFootSearchCheckBox);

		/*
		 * Campo ricerca per il piede preferito: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx",
				"50:push[]80[]80[]20:push",
				"10[]10"
			);

		preferredFootPanel = new JPanel(migLayout);
		preferredFootPanel.setBackground(panelColor);

		playerPanel.add(preferredFootPanel);

		/*
		 * Campo ricerca per il piede preferito destro: radioButton
		 */
		string = GuiConfiguration.getMessage("right");
		string = StringUtils.capitalize(string);

		rightFootRadioButton = new JRadioButton(string);
		rightFootRadioButton.setEnabled(false);

		rightFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				preferredFootSearchValid = true;
				playerFoot = Player.FOOT_TYPE.RIGHT.toString();

				setEnableButton();
			}
		});

		preferredFootPanel.add(rightFootRadioButton);

		/*
		 * Campo ricerca per il piede preferito sinistro: radioButton
		 */
		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);

		leftFootRadioButton = new JRadioButton(string);
		leftFootRadioButton.setEnabled(false);

		leftFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				preferredFootSearchValid = true;
				playerFoot = Player.FOOT_TYPE.LEFT.toString();

				setEnableButton();
			}
		});

		preferredFootPanel.add(leftFootRadioButton);

		/*
		 * Campo ricerca per entrambi i piedi preferiti: radioButton
		 */
		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);

		eitherFootRadioButton = new JRadioButton(string);
		eitherFootRadioButton.setEnabled(false);

		eitherFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				preferredFootSearchValid = true;
				playerFoot = Player.FOOT_TYPE.EITHER.toString();

				setEnableButton();
			}
		});

		preferredFootPanel.add(eitherFootRadioButton);

		/*
		 * Campo gruppo bottoni: buttonGroup
		 */
		preferredFootGroupButton = new ButtonGroup();

		preferredFootGroupButton.add(rightFootRadioButton);
		preferredFootGroupButton.add(leftFootRadioButton);
		preferredFootGroupButton.add(eitherFootRadioButton);

		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setEnabled(false);

		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				setRolePlayer();

				List<List<String>> data = Controller.getInstance().getPlayerList
					(
						playerSubName,
						playerSubSurname,
						playerReferringYear,
						playerMinAge,
						playerMaxAge,
						playerCountryID,
						playerRole,
						playerPositionID,
						playerFoot,
						true
					);


				playerTable.setModel(new TableModel("teams", data));
				playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());
				playerTablePanel.revalidate();
			}
		});
		playerPanel.add(searchButton);


		/*
		 * Campo tabella competizioni: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		playerTablePanel = new JPanel(migLayout);
		playerTablePanel.setBackground(panelColor);

		add(playerTablePanel);

		/*
		 * Campo tabella paesi: table
		 */
		playerTable = new JTable(new TableModel("teams", null));

		playerTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());
		playerTable.setFillsViewportHeight(true);
		playerTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		/*
		 * Campo barra di scorrimento: jScrollPane
		 */
		scrollPane = new JScrollPane(playerTable);

		playerTablePanel.add(scrollPane);
	}

	public void setEnableButton()
	{
		if (nameSearchValid && ageSearchValid && bornNationSearchValid && roleSearchValid && mainPositionValid &&
			preferredFootSearchValid && anySelected)
		{
			searchButton.setEnabled(true);
		}
		else {
			searchButton.setEnabled(false);
		}
	}

	public void setNameSearchValid()
	{
		if (playerNameSearchValid && playerSurnameSearchValid) {
			nameSearchValid = true;
		}
		else if (playerNameSearchValid && playerSubSurname == null) {
			nameSearchValid = true;
		}
		else if (playerSurnameSearchValid && playerSubName == null) {
			nameSearchValid = true;
		}
		else {
			nameSearchValid = false;
		}

	}
	public void setRoleSearchValid()
	{
		if (goalkeeperCheckBox.isSelected() || defenderCheckBox.isSelected() || midfielderCheckBox.isSelected() ||
				forwardCheckBox.isSelected())
		{
			roleSearchValid = true;
		}
		else {
			roleSearchValid = false;
		}
	}
	public void setAnySelected()
	{
		if (nameSearchCheckBox.isSelected() || ageSearchCheckBox.isSelected() ||
			bornNationSearchCheckBox.isSelected() || roleSearchCheckBox.isSelected() ||
			mainPositionSearchCheckBox.isSelected() || preferredFootSearchCheckBox.isSelected())
		{
			anySelected = true;
		}
		else {
			anySelected = false;
		}
	}

	public void setRolePlayer()
	{
		String string = "";

		if (roleSearchCheckBox.isSelected()){

			if (goalkeeperCheckBox.isSelected()){
				string += "GK";
			}

			if (defenderCheckBox.isSelected()){
				if (string.isEmpty()){
					string += "DF";
				}
				else {
					string += "_DF";
				}
			}

			if (midfielderCheckBox.isSelected()){
				if (string.isEmpty()){
					string += "MF";
				}
				else {
					string += "_MF";
				}
			}

			if (forwardCheckBox.isSelected()){
				if (string.isEmpty()){
					string += "FW";
				}
				else {
					string += "_FW";
				}
			}

			playerRole = string;
		}
		else {
			playerRole = null;
		}
	}

	public void fillCountryComboBox(JComboBox<List<String>> comboBox, String type, String superCountryID)
	{
		List<List<String>> nameCountryList = Controller.getInstance().getCountryList
			(
				type,
				superCountryID,
				false
			);

		for (List<String> countryList: nameCountryList) {
			comboBox.addItem(countryList);
		}

		comboBox.setSelectedIndex(-1);
	}

	public void fillReferenceYearComboBox()
	{
		Integer maximumYear = Year.now().getValue();
		Integer minimumYear = 1830; //TODO replace with call to db

		for( Integer i = maximumYear; i >= minimumYear; --i){
			yearReferenceComboBox.addItem(i.toString());
		}

		yearReferenceComboBox.setSelectedIndex(-1);
	}

	public void fillAgeComboBox(JComboBox<String> comboBox, Integer minimumAge, Integer maximumAge)
	{

		for( Integer i = minimumAge; i <= maximumAge; ++i){
			comboBox.addItem(i.toString());
		}

		comboBox.setSelectedIndex(-1);
	}

	public void fillPositionComboBox(JComboBox<List<String>> comboBox)
	{
		List<List<String>> namePositionList = Controller.getInstance().getPositionList(false);

		for (List<String> positionList: namePositionList) {
			comboBox.addItem(positionList);
		}

		comboBox.setSelectedIndex(-1);
	}
}

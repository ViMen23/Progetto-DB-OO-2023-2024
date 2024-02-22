//package gui;
//
//import controller.Controller;
//import model.Country;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import javax.swing.event.CaretEvent;
//import javax.swing.event.CaretListener;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.awt.event.ItemEvent;
//import java.awt.event.ItemListener;
//import java.util.ArrayList;
//import java.util.List;
//
//public class SearchPlayerPanel
//				extends JPanel
//{
//	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
//	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
//
//	protected JPanel playerPanel;
//	protected JPanel namePanel;
//	protected JPanel agePanel;
//	protected JPanel bornNationPanel;
//	protected JPanel rolePanel;
//	protected JPanel mainPositionPanel;
//	protected JPanel preferredFootPanel;
//
//	protected JButton titleButton;
//	protected JButton searchButton;
//
//	protected JCheckBox nameSearchCheckBox;
//	protected JCheckBox ageSearchCheckBox;
//	protected JCheckBox bornNationSearchCheckBox;
//	protected JCheckBox roleSearchCheckBox;
//	protected JCheckBox goalkeeperCheckBox;
//	protected JCheckBox defenderCheckBox;
//	protected JCheckBox midfielderCheckBox;
//	protected JCheckBox forwardCheckBox;
//	protected JCheckBox mainPositionSearchCheckBox;
//	protected JCheckBox preferredFootSearchCheckBox;
//
//	protected JTextField nameTextField;
//	protected JTextField surnameTextField;
//
//	protected JComboBox<List<String>> yearReferenceComboBox;
//	protected JComboBox<List<String>> ageOperationComboBox;
//	protected JComboBox<List<String>> ageComboBox;
//	protected JComboBox<List<String>> continentComboBox;
//	protected JComboBox<List<String>> nationComboBox;
//	protected JComboBox<List<String>> mainPositionComboBox;
//
//	protected JRadioButton rightFootRadioButton;
//	protected JRadioButton leftFootRadioButton;
//	protected JRadioButton eitherFootRadioButton;
//
//
//	protected JLabel label;
//	protected ButtonGroup buttonGroup;
//
//	protected Color panelColor = Color.white;
//
//	protected Boolean nameSearchValid = true;
//	protected Boolean playerNameSearchValid = true;
//	protected Boolean playerSurnameSearchValid = true;
//
//	protected Boolean bornNationSearchValid = true;
//
//	protected Boolean anySelected = false;
//
//	protected String playerSubName = "";
//	protected String playerSubSurname = "";
//	protected String playerCountryID = null;
//
//
//	public SearchPlayerPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"10[grow, fill]10",
//				"20[]20[]50[]10"
//			);
//
//		setLayout(migLayout);
//		setName("searchPlayerPanel");
//
//		/*
//		 * Campo titolo: bottone
//		 */
//		string = GuiConfiguration.getMessage("search");
//		string += " ";
//		string += GuiConfiguration.getMessage("players");
//		string += " - ";
//		string += GuiConfiguration.getMessage("players");
//		string += " ";
//		string += GuiConfiguration.getMessage("available");
//		string += " ";
//		//string += Controller.getInstance().countPlayers().toString(); TODO
//		string = string.toUpperCase();
//
//		titleButton = new JButton(string);
//		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
//		titleButton.setIcon(maximizeIcon);
//		titleButton.setIconTextGap(40);
//
//		add(titleButton);
//
//		titleButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e) {
//
//				if (playerPanel.isShowing()){
//					remove(playerPanel);
//					titleButton.setIcon(minimizeIcon);
//				}
//				else{
//					add(playerPanel, 1);
//					titleButton.setIcon(maximizeIcon);
//				}
//
//				revalidate();
//			}
//		});
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"0[grow, fill]0",
//				"0[]0[]10[]0[]10[]0[]10[]0[]10[]0[]20[]20"
//			);
//
//		playerPanel = new JPanel(migLayout);
//		playerPanel.setOpaque(false);
//
//		add(playerPanel);
//
//		/*
//		 * Campo ricerca per nome: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("name");
//		string = string.toUpperCase();
//
//		nameSearchCheckBox = new JCheckBox(string);
//		nameSearchCheckBox.setOpaque(true);
//		nameSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
//		nameSearchCheckBox.setForeground(Color.white);
//		nameSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		nameSearchCheckBox.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				Boolean selected = nameSearchCheckBox.isSelected();
//
//				nameTextField.setEnabled(selected);
//				surnameTextField.setEnabled(selected);
//
//				nameTextField.setText("");
//				surnameTextField.setText("");
//
//				playerNameSearchValid = false;
//				playerSurnameSearchValid = false;
//
//				nameSearchValid = !selected;
//
//				setAnySelected();
//
//				setEnableButton();
//			}
//		});
//
//		playerPanel.add(nameSearchCheckBox);
//
//		/*
//		 * Campo ricerca per nome: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"50[]80[]20:push",
//				"10[]20[]10"
//			);
//
//		namePanel = new JPanel(migLayout);
//		namePanel.setBackground(Color.white);
//
//		playerPanel.add(namePanel);
//
//		/*
//		 * Campo nome: stampa
//		 */
//		string = GuiConfiguration.getMessage("name");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		namePanel.add(label);
//
//		/*
//		 * Campo testo: input
//		 */
//		nameTextField = new JTextField(GuiConfiguration.getInputColumn());
//		nameTextField.setEnabled(false);
//
//		nameTextField.addCaretListener(new CaretListener() {
//			@Override
//			public void caretUpdate(CaretEvent e)
//			{
//				String string = nameTextField.getText();
//
//				playerNameSearchValid = Regex.patternAlnum.matcher(string).find();
//
//				if (string.isEmpty()) {
//					playerSubName = null;
//				}
//				else {
//					playerSubName = string;
//				}
//
//				setNameSearchValid();
//				setEnableButton();
//			}
//		});
//
//		namePanel.add(nameTextField);
//
//		/*
//		 * Campo cognome: stampa
//		 */
//		string = GuiConfiguration.getMessage("surname");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		namePanel.add(label);
//
//		/*
//		 * Campo testo: input
//		 */
//		surnameTextField = new JTextField(GuiConfiguration.getInputColumn());
//		surnameTextField.setEnabled(false);
//
//		surnameTextField.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				String string = surnameTextField.getText();
//
//				playerSurnameSearchValid = Regex.patternAlnum.matcher(string).find();
//
//				if (string.isEmpty()) {
//					playerSubSurname = null;
//				}
//				else {
//					playerSubSurname = string;
//				}
//
//				setNameSearchValid();
//				setEnableButton();
//			}
//		});
//
//		namePanel.add(surnameTextField);
//
//		/*
//		 * Campo ricerca per eta: input
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("age");
//		string = string.toUpperCase();
//
//		ageSearchCheckBox = new JCheckBox(string);
//		ageSearchCheckBox.setOpaque(true);
//		ageSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
//		ageSearchCheckBox.setForeground(Color.white);
//		ageSearchCheckBox.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		ageSearchCheckBox.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//
//		playerPanel.add(ageSearchCheckBox);
//
//		/*
//		 * Campo ricerca per eta: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"20[]30:push[]20",
//				"10[]20[]10"
//			);
//
//		agePanel = new JPanel(migLayout);
//		agePanel.setBackground(Color.white);
//
//		playerPanel.add(agePanel);
//
//		/*
//		 * Campo anno di riferimento: stampa
//		 */
//		string = GuiConfiguration.getMessage("referenceYear");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string);
//
//		agePanel.add(label);
//
//		/*
//		 * Campo anno di riferimento: comboBox
//		 */
//		yearReferenceComboBox = new JComboBox<List<String>>();
//
//		yearReferenceComboBox.setRenderer(new ComboBoxRenderer());
//		yearReferenceComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		yearReferenceComboBox.setEnabled(false);
//
//		List<String> aa = new ArrayList<String>();
//		aa.add("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//
//		yearReferenceComboBox.setPrototypeDisplayValue(aa);
//
//		agePanel.add(yearReferenceComboBox);
//
//		/*
//		 * Campo eta: stampa
//		 */
//		string = GuiConfiguration.getMessage("age");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string);
//
//		agePanel.add(label);
//
//		/*
//		 * Campo operazione età: comboBox
//		 */
//		ageOperationComboBox = new JComboBox<List<String>>();
//
//		ageOperationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		ageOperationComboBox.setSelectedIndex(-1);
//
//		agePanel.add(ageOperationComboBox, "split 2");
//
//		/*
//		 * Campo età: comboBox
//		 */
//		ageComboBox = new JComboBox<List<String>>();
//
//		ageComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		ageComboBox.setSelectedIndex(-1);
//
//
//		agePanel.add(ageComboBox);
//
//		/*
//		 * Campo ricerca per paese di nascita: checkbox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("bornNation");
//		string = string.toUpperCase();
//
//		bornNationSearchCheckBox = new JCheckBox(string);
//
//		bornNationSearchCheckBox.setOpaque(true);
//		bornNationSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
//		bornNationSearchCheckBox.setForeground(Color.white);
//
//		bornNationSearchCheckBox.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//
//		playerPanel.add(bornNationSearchCheckBox);
//
//		/*
//		 * Campo ricerca per paese di nascita: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"50[]80[]20:push",
//				"10[]20[]10"
//			);
//
//		bornNationPanel = new JPanel(migLayout);
//		bornNationPanel.setBackground(panelColor);
//
//		playerPanel.add(bornNationPanel);
//
//		/*
//		 * Campo continente: stampa
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		bornNationPanel.add(label);
//
//		/*
//		 * Campo continente: comboBox
//		 */
//		continentComboBox = new JComboBox<List<String>>();
//
//		continentComboBox.setRenderer(new ComboBoxRenderer());
//		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		continentComboBox.setEnabled(false);
//
//		continentComboBox.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				if(continentComboBox.getSelectedIndex() != -1) {
//
//					nationComboBox.removeAllItems();
//
//					String superCountryID = ((List<String>)continentComboBox.getSelectedItem()).getLast();
//
//					List<List<String>> nameCountryList = Controller.getInstance().getCountryList
//						(
//							Country.COUNTRY_TYPE.NATION.toString(),
//							superCountryID,
//							false
//						);
//
//					for (List<String> countryList: nameCountryList) {
//						nationComboBox.addItem(countryList);
//					}
//
//					nationComboBox.setSelectedIndex(-1);
//
//					nationComboBox.setEnabled(true);
//					searchButton.setEnabled(false);
//				}
//			}
//		});
//
//		continentComboBox.setPrototypeDisplayValue(aa);
//
//		bornNationPanel.add(continentComboBox);
//
//		/*
//		 * Campo nazione: stampa
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		bornNationPanel.add(label);
//
//		/*
//		 * Campo nazione: comboBox
//		 */
//		nationComboBox = new JComboBox<List<String>>();
//
//		nationComboBox.setRenderer(new ComboBoxRenderer());
//		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		nationComboBox.setEnabled(false);
//
//		nationComboBox.setPrototypeDisplayValue(aa);
//
//		nationComboBox.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				bornNationSearchValid = true;
//
//				if (nationComboBox.getSelectedIndex() != -1 ){
//					playerCountryID = ((List<String>)nationComboBox.getSelectedItem()).getLast();
//				}
//
//				setEnableButton();
//			}
//		});
//
//		countryConfederationPanel.add(nationComboBox);
//		/*
//		 * Campo ricerca per ruolo: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("role");
//		string = string.toUpperCase();
//
//		roleSearchCheckBox = new JCheckBox(string);
//
//		roleSearchCheckBox.setOpaque(true);
//		roleSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
//		roleSearchCheckBox.setForeground(Color.white);
//
//		add(roleSearchCheckBox);
//
//		/*
//		 * Campo ricerca per ruolo: panel
//		 */
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30:push[]30:push[]30:push[]20",
//				"10[]10"
//			);
//
//
//		rolePanel = new JPanel(migLayout);
//		rolePanel.setBackground(Color.white);
//
//		add(rolePanel);
//
//		/*
//		 * Campo ricerca per ruolo portiere: checkBox
//		 */
//		string = GuiConfiguration.getMessage("goalkeeper");
//		string = StringUtils.capitalize(string);
//
//		goalkeeperCheckBox = new JCheckBox(string);
//
//		rolePanel.add(goalkeeperCheckBox);
//
//		/*
//		 * Campo ricerca per ruolo difensore: checkBox
//		 */
//		string = GuiConfiguration.getMessage("defender");
//		string = StringUtils.capitalize(string);
//
//		defenderCheckBox = new JCheckBox(string);
//
//		rolePanel.add(defenderCheckBox);
//
//		/*
//		 * Campo ricerca per ruolo centrocampista: checkBox
//		 */
//		string = GuiConfiguration.getMessage("midfield");
//		string = StringUtils.capitalize(string);
//
//		midfielderCheckBox = new JCheckBox(string);
//
//		rolePanel.add(midfielderCheckBox);
//
//		/*
//		 * Campo ricerca per ruolo difensore: checkBox
//		 */
//		string = GuiConfiguration.getMessage("fowarder");
//		string = StringUtils.capitalize(string);
//
//		forwardCheckBox = new JCheckBox(string);
//
//		rolePanel.add(forwardCheckBox);
//
//		/*
//		 * Campo ricerca per posizione principale: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("mainPosition");
//		string = string.toUpperCase();
//
//		mainPositionSearchCheckBox = new JCheckBox(string);
//
//		mainPositionSearchCheckBox.setOpaque(true);
//		mainPositionSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
//		mainPositionSearchCheckBox.setForeground(Color.white);
//
//		add(mainPositionSearchCheckBox);
//
//		/*
//		 * Campo ricerca per posizione principale: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30:push[]20",
//				"10[]10"
//			);
//
//		mainPositionPanel = new JPanel(migLayout);
//		mainPositionPanel.setBackground(Color.white);
//
//		add(mainPositionPanel);
//
//		/*
//		 * Campo posizione: stampa
//		 */
//		string = GuiConfiguration.getMessage("position");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		mainPositionPanel.add(label);
//
//		/*
//		 * Campo posizione: comboBox
//		 */
//		mainPositionComboBox = new JComboBox<String>();
//
//		mainPositionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		mainPositionComboBox.setSelectedIndex(-1);
//
//		mainPositionPanel.add(mainPositionComboBox);
//
//		/*
//		 * Campo ricerca per il piede preferito: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("preferredFoot");
//		string = string.toUpperCase();
//
//		preferredFootSearchCheckBox = new JCheckBox(string);
//		preferredFootSearchCheckBox.setOpaque(true);
//		preferredFootSearchCheckBox.setBackground(GuiConfiguration.getSearchPanelColor());
//		preferredFootSearchCheckBox.setForeground(Color.white);
//
//		add(preferredFootSearchCheckBox);
//
//		/*
//		 * Campo ricerca per il piede preferito: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30:push[]30:push[]20",
//				"10[]10"
//			);
//
//		preferredFootPanel = new JPanel(migLayout);
//		preferredFootPanel.setBackground(Color.white);
//
//		add(preferredFootPanel);
//
//
//		buttonGroup = new ButtonGroup();
//
//		/*
//		 * Campo ricerca per il piede preferito destro: radioButton
//		 */
//		string = GuiConfiguration.getMessage("right");
//		string = StringUtils.capitalize(string);
//
//		rightFootRadioButton = new JRadioButton(string);
//
//		preferredFootPanel.add(rightFootRadioButton);
//
//		buttonGroup.add(rightFootRadioButton);
//
//		/*
//		 * Campo ricerca per il piede preferito sinistro: radioButton
//		 */
//		string = GuiConfiguration.getMessage("left");
//		string = StringUtils.capitalize(string);
//
//		leftFootRadioButton = new JRadioButton(string);
//
//		preferredFootPanel.add(leftFootRadioButton);
//
//		buttonGroup.add(leftFootRadioButton);
//
//		/*
//		 * Campo ricerca per entrambi i piedi preferiti: radioButton
//		 */
//		string = GuiConfiguration.getMessage("either");
//		string = StringUtils.capitalize(string);
//
//		eitherFootRadioButton = new JRadioButton(string);
//
//		preferredFootPanel.add(eitherFootRadioButton);
//
//		buttonGroup.add(eitherFootRadioButton);
//
//		/*
//		 * Campo avvia ricerca: button
//		 */
//		string = GuiConfiguration.getMessage("search");
//		string = string.toUpperCase();
//
//		searchButton = new JButton(string);
//
//		add(searchButton);
//
//	}
//}

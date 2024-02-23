//package gui;
//
//import controller.Controller;
//import model.Country;
//import model.Player;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import javax.swing.event.CaretEvent;
//import javax.swing.event.CaretListener;
//import javax.swing.event.PopupMenuEvent;
//import javax.swing.event.PopupMenuListener;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.awt.event.ItemEvent;
//import java.awt.event.ItemListener;
//import java.time.Year;
//
//import java.util.List;
//
//public class SearchPlayerPanel
//				extends JPanel
//{
//	protected final Color panelColor = Color.white;
//	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
//	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
//	protected final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
//	protected final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");
//
//
//	protected JPanel playerPanel;
//	protected JPanel namePanel;
//	protected JPanel agePanel;
//	protected JPanel bornNationPanel;
//	protected JPanel rolePanel;
//	protected JPanel mainPositionPanel;
//	protected JPanel preferredFootPanel;
//	protected JPanel playerTablePanel;
//
//	protected JButton titleButton;
//	protected JButton nameResetButton;
//	protected JButton surnameResetButton;
//	protected JButton ageResetButton;
//	protected JButton bornNationResetButton;
//	protected JButton roleResetButton;
//	protected JButton positionResetButton;
//	protected JButton footResetButton;
//	protected JButton searchButton;
//
//	protected JLabel nameSearchLabel;
//	protected JLabel nameErrorLabel;
//	protected JLabel surnameErrorLabel;
//	protected JLabel ageSearchLabel;
//	protected JLabel bornNationSearchLabel;
//	protected JLabel roleSearchLabel;
//	protected JLabel mainPositionSearchLabel;
//	protected JLabel preferredFootSearchLabel;
//
//	protected JTextField nameTextField;
//	protected JTextField surnameTextField;
//
//
//	protected JComboBox<String> yearReferenceComboBox;
//	protected JComboBox<String> minimumAgeComboBox;
//	protected JComboBox<String> maximumAgeComboBox;
//	protected JComboBox<List<String>> continentComboBox;
//	protected JComboBox<List<String>> nationComboBox;
//	protected JComboBox<List<String>> mainPositionComboBox;
//
//	protected JCheckBox goalkeeperCheckBox;
//	protected JCheckBox defenderCheckBox;
//	protected JCheckBox midfielderCheckBox;
//	protected JCheckBox forwardCheckBox;
//
//	protected JRadioButton rightFootRadioButton;
//	protected JRadioButton leftFootRadioButton;
//	protected JRadioButton eitherFootRadioButton;
//
//
//	protected JLabel label;
//	protected ButtonGroup preferredFootGroupButton;
//
//	protected JTable playerTable;
//	protected JScrollPane scrollPane;
//
//	protected Boolean nameSearchValid = false;
//	protected Boolean surnameSearchValid = false;
//	protected Boolean ageSearchValid = false;
//	protected Boolean bornNationSearchValid = false;
//	protected Boolean roleSearchValid = false;
//	protected Boolean mainPositionValid = false;
//	protected Boolean preferredFootSearchValid = false;
//
//
//	protected String playerSubName = null;
//	protected String playerSubSurname = null;
//	protected String playerReferringYear = null;
//	protected String playerMinAge = null;
//	protected String playerContinentID = null;
//	protected String playerContinentType = null;
//	protected String playerCountryType = null;
//	protected String playerCountryID = null;
//	protected String playerMaxAge = null;
//	protected String playerRole = null;
//	protected String playerPositionID = null;
//	protected String playerFoot = null;
//
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
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE TITOLO
//		 *------------------------------------------------------------------------------------------------------*/
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
//		string += Controller.getInstance().countPlayers().toString();
//		string = string.toUpperCase();
//
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
//				if (playerPanel.isShowing()) {
//					remove(playerPanel);
//					titleButton.setIcon(minimizeIcon);
//				}
//				else {
//					add(playerPanel, 1);
//					titleButton.setIcon(maximizeIcon);
//				}
//
//				revalidate();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA GENERALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"0[grow, fill]0",
//				"0[]0[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]20[]0"
//			);
//
//		playerPanel = new JPanel(migLayout);
//		playerPanel.setOpaque(false);
//
//		add(playerPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER NOME
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per nome: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("name");
//		string = string.toUpperCase();
//
//		nameSearchLabel = new JLabel(string);
//		nameSearchLabel.setOpaque(true);
//
//		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		nameSearchLabel.setForeground(Color.white);
//		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		playerPanel.add(nameSearchLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER NOME
//		 *------------------------------------------------------------------------------------------------------*/
//		/*
//		 * Campo ricerca per nome: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 4",
//				"50:push[]80[]10[]70[]20:push",
//				"10[]20[]10"
//			);
//
//		namePanel = new JPanel(migLayout);
//		namePanel.setBackground(panelColor);
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
//		 * Campo testo: textField
//		 */
//		nameTextField = new JTextField(GuiConfiguration.getInputColumn());
//		nameTextField.addCaretListener(new CaretListener() {
//			@Override
//			public void caretUpdate(CaretEvent e)
//			{
//				if (Regex.patternString.matcher(nameTextField.getText()).find()) {
//					nameSearchValid = true;
//					searchButton.setEnabled(true);
//
//					playerSubName = nameTextField.getText();
//					nameErrorLabel.setVisible(false);
//
//				} else {
//					nameSearchValid = false;
//					setEnableButton();
//
//					playerSubName = null;
//					nameErrorLabel.setVisible(true);
//				}
//			}
//		});
//
//		namePanel.add(nameTextField);
//
//		/*
//		 * Campo errore regex: label
//		 */
//		nameErrorLabel = new JLabel(errorIcon);
//
//		namePanel.add(nameErrorLabel);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		nameResetButton = new JButton(resetIcon);
//		nameResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				nameSearchValid = false;
//				setEnableButton();
//
//				playerSubName = null;
//				nameTextField.setText(null);
//			}
//		});
//
//		namePanel.add(nameResetButton);
//
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
//		 * Campo testo: textfield
//		 */
//		surnameTextField = new JTextField(GuiConfiguration.getInputColumn());
//		surnameTextField.addCaretListener(new CaretListener() {
//			@Override
//			public void caretUpdate(CaretEvent e)
//			{
//				if (Regex.patternString.matcher(surnameTextField.getText()).find()) {
//
//					surnameSearchValid = true;
//					searchButton.setEnabled(true);
//
//					playerSubSurname = surnameTextField.getText();
//					surnameErrorLabel.setVisible(false);
//
//				} else {
//					surnameSearchValid = false;
//					setEnableButton();
//
//					playerSubSurname = null;
//					surnameErrorLabel.setVisible(true);
//				}
//			}
//		});
//
//		namePanel.add(surnameTextField);
//
//		/*
//		 * Campo errore regex: label
//		 */
//		surnameErrorLabel = new JLabel(errorIcon);
//
//		namePanel.add(surnameErrorLabel);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		surnameResetButton = new JButton(resetIcon);
//		surnameResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				surnameSearchValid = false;
//				setEnableButton();
//
//				playerSubSurname = null;
//				surnameTextField.setText(null);
//			}
//		});
//
//		namePanel.add(surnameResetButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER ETÀ
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per eta: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("age");
//		string = string.toUpperCase();
//
//		ageSearchLabel = new JLabel(string);
//		ageSearchLabel.setOpaque(true);
//		ageSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		ageSearchLabel.setForeground(Color.white);
//		ageSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		playerPanel.add(ageSearchLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER ETÀ
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per eta: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 5",
//				"50:push[]80[]80[]80[]80[]20:push",
//				"10[]20[]10"
//			);
//
//		agePanel = new JPanel(migLayout);
//		agePanel.setBackground(panelColor);
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
//		agePanel.add(label, "spanx 2, center");
//
//		/*
//		 * Campo anno di riferimento: comboBox
//		 */
//		yearReferenceComboBox = new JComboBox<String>();
//
//		yearReferenceComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		yearReferenceComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		yearReferenceComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				yearReferenceComboBox.removeAllItems();
//				Integer minimumYear = 1830; //TODO replace with call to db
//
//				fillReferenceYearComboBox(minimumYear);
//
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				playerReferringYear = (String) yearReferenceComboBox.getSelectedItem();
//
//				minimumAgeComboBox.setEnabled(true);
//				minimumAgeComboBox.firePopupMenuWillBecomeVisible();
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//
//		agePanel.add(yearReferenceComboBox, "spanx 2, center");
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		ageResetButton = new JButton(resetIcon);
//		ageResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				ageSearchValid = false;
//				setEnableButton();
//
//				minimumAgeComboBox.setEnabled(false);
//				maximumAgeComboBox.setEnabled(false);
//
//				minimumAgeComboBox.setSelectedIndex(-1);
//				maximumAgeComboBox.setSelectedIndex(-1);
//				yearReferenceComboBox.setSelectedIndex(-1);
//
//				playerReferringYear = null;
//				playerMinAge = null;
//				playerMaxAge = null;
//			}
//		});
//
//		agePanel.add(ageResetButton, "spany 2, center");
//
//
//		/*
//		 * Campo età minima: stampa
//		 */
//		string = GuiConfiguration.getMessage("minimumAge");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string);
//
//		agePanel.add(label);
//
//		/*
//		 * Campo età minima: comboBox
//		 */
//		minimumAgeComboBox = new JComboBox<String>();
//
//		minimumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		minimumAgeComboBox.setEnabled(false);
//
//		minimumAgeComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		minimumAgeComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				minimumAgeComboBox.removeAllItems();
//				Integer minimumAge = 15;	//TODO REPLACE WITH A CALL TO DB
//				Integer maximumAge = 50;	//TODO REPLACE WITH A CALL TO DB
//
//				fillAgeComboBox(minimumAgeComboBox, minimumAge, maximumAge);
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				playerMinAge = (String) minimumAgeComboBox.getSelectedItem();
//
//				maximumAgeComboBox.setEnabled(true);
//				maximumAgeComboBox.firePopupMenuWillBecomeVisible();
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//
//		agePanel.add(minimumAgeComboBox);
//
//		/*
//		 * Campo età massima: stampa
//		 */
//		string = GuiConfiguration.getMessage("maximumAge");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string);
//
//		agePanel.add(label);
//
//		/*
//		 * Campo età massima: comboBox
//		 */
//		maximumAgeComboBox = new JComboBox<String>();
//
//		maximumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		maximumAgeComboBox.setEnabled(false);
//
//		maximumAgeComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		maximumAgeComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				maximumAgeComboBox.removeAllItems();
//
//				Integer maximumAge = 50;	//TODO REPLACE WITH A CALL TO DB
//
//				fillAgeComboBox(maximumAgeComboBox, Integer.valueOf(playerMinAge), maximumAge);
//
//				ageSearchValid = true;
//				searchButton.setEnabled(true);
//
//			}
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				playerMaxAge = (String) maximumAgeComboBox.getSelectedItem();
//			}
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//
//		});
//
//		agePanel.add(maximumAgeComboBox);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per paese di nascita: checkbox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("bornNation");
//		string = string.toUpperCase();
//
//		bornNationSearchLabel = new JLabel(string);
//
//		bornNationSearchLabel.setOpaque(true);
//		bornNationSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		bornNationSearchLabel.setForeground(Color.white);
//		bornNationSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		playerPanel.add(bornNationSearchLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER PAESE DI NASCITA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//		/*
//		 * Campo ricerca per paese di nascita: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 3",
//				"50:push[]80[]80[]20:push",
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
//
//		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());
//
//		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				continentComboBox.removeAllItems();
//				fillCountryComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
//
//				bornNationSearchValid = true;
//				searchButton.setEnabled(true);
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				playerContinentID   = ((List<String>) continentComboBox.getSelectedItem()).getLast();
//				playerContinentType = Country.COUNTRY_TYPE.CONTINENT.toString();
//
//				playerCountryID = playerContinentID;
//				playerCountryType = playerContinentType;
//
//				if (playerContinentID == null) {
//					nationComboBox.setEnabled(false);
//					nationComboBox.setSelectedIndex(-1);
//				}
//				else {
//					nationComboBox.setEnabled(true);
//					nationComboBox.firePopupMenuWillBecomeVisible();
//				}
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//
//		bornNationPanel.add(continentComboBox);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		bornNationResetButton = new JButton(resetIcon);
//		bornNationResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				bornNationSearchValid = false;
//				setEnableButton();
//
//				continentComboBox.setSelectedIndex(-1);
//				nationComboBox.setEnabled(false);
//				nationComboBox.setSelectedIndex(-1);
//
//				playerContinentID = null;
//				playerContinentType = null;
//				playerCountryID = null;
//				playerCountryType = null;
//			}
//		});
//
//		bornNationPanel.add(bornNationResetButton, "spany 2, center");
//
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
//		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());
//
//		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				nationComboBox.removeAllItems();
//				fillCountryComboBox(nationComboBox, Country.COUNTRY_TYPE.NATION.toString(), playerCountryID);
//			}
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				String tmp = ((List<String>) nationComboBox.getSelectedItem()).getLast();
//
//				if (tmp != null) {
//					playerCountryID = tmp;
//					playerCountryType = Country.COUNTRY_TYPE.NATION.toString();
//				}
//				else {
//					playerCountryType = playerContinentType;
//					playerCountryID = playerContinentID;
//				}
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//
//		bornNationPanel.add(nationComboBox);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER RUOLO
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per ruolo: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("role");
//		string = string.toUpperCase();
//
//		roleSearchLabel = new JLabel(string);
//
//		roleSearchLabel.setOpaque(true);
//		roleSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		roleSearchLabel.setForeground(Color.white);
//		roleSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		playerPanel.add(roleSearchLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER RUOLO
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per ruolo: panel
//		 */
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"50:push[]80[]80[]80[]80[]20:push",
//				"10[]10"
//			);
//
//
//		rolePanel = new JPanel(migLayout);
//		rolePanel.setBackground(Color.white);
//
//		playerPanel.add(rolePanel);
//
//		/*
//		 * Campo ricerca per ruolo portiere: checkBox
//		 */
//		string = GuiConfiguration.getMessage("goalkeeper");
//		string = StringUtils.capitalize(string);
//
//		goalkeeperCheckBox = new JCheckBox(string);
//		goalkeeperCheckBox.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				if (goalkeeperCheckBox.isSelected()) {
//					roleSearchValid = true;
//					searchButton.setEnabled(true);
//				}
//				else {
//					setRoleSearchValid();
//					setEnableButton();
//				}
//			}
//		});
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
//		defenderCheckBox.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				if (defenderCheckBox.isSelected()) {
//					roleSearchValid = true;
//					searchButton.setEnabled(true);
//				}
//				else {
//					setRoleSearchValid();
//					setEnableButton();
//				}
//			}
//		});
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
//		midfielderCheckBox.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				if (midfielderCheckBox.isSelected()) {
//					roleSearchValid = true;
//					searchButton.setEnabled(true);
//				}
//				else {
//					setRoleSearchValid();
//					setEnableButton();
//				}
//			}
//		});
//
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
//		forwardCheckBox.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				if (forwardCheckBox.isSelected()) {
//					roleSearchValid = true;
//					searchButton.setEnabled(true);
//				}
//				else {
//					setRoleSearchValid();
//					setEnableButton();
//				}
//			}
//		});
//
//		rolePanel.add(forwardCheckBox);
//		/*
//		 * Campo bottone reset: button
//		 */
//		roleResetButton = new JButton(resetIcon);
//		roleResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				roleSearchValid = false;
//				setEnableButton();
//
//				goalkeeperCheckBox.setSelected(false);
//				defenderCheckBox.setSelected(false);
//				midfielderCheckBox.setSelected(false);
//				forwardCheckBox.setSelected(false);
//
//			}
//		});
//
//		rolePanel.add(roleResetButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL RICERCA PER PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per posizione principale: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("mainPosition");
//		string = string.toUpperCase();
//
//		mainPositionSearchLabel = new JLabel(string);
//
//		mainPositionSearchLabel.setOpaque(true);
//		mainPositionSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		mainPositionSearchLabel.setForeground(Color.white);
//		mainPositionSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		playerPanel.add(mainPositionSearchLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER POSIZIONE PRINCIPALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per posizione principale: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"50:push[]80[]80[]20:push",
//				"10[]10"
//			);
//
//		mainPositionPanel = new JPanel(migLayout);
//		mainPositionPanel.setBackground(panelColor);
//
//		playerPanel.add(mainPositionPanel);
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
//		mainPositionComboBox = new JComboBox<List<String>>();
//
//		mainPositionComboBox.setRenderer(new ComboBoxRenderer());
//		mainPositionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		mainPositionComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());
//
//		mainPositionComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				mainPositionComboBox.removeAllItems();
//
//				mainPositionValid = true;
//				searchButton.setEnabled(true);
//
//				fillPositionComboBox(mainPositionComboBox);
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				playerPositionID = ((List<String>) mainPositionComboBox.getSelectedItem()).getLast();
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//
//		mainPositionPanel.add(mainPositionComboBox);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		positionResetButton = new JButton(resetIcon);
//		positionResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				mainPositionValid = false;
//				setEnableButton();
//
//				mainPositionComboBox.setSelectedIndex(-1);
//
//				playerPositionID = null;
//			}
//		});
//
//		mainPositionPanel.add(positionResetButton);
//
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL RICERCA PER PIEDE PREFERITO
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per il piede preferito: checkBox
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("preferredFoot");
//		string = string.toUpperCase();
//
//		preferredFootSearchLabel = new JLabel(string);
//		preferredFootSearchLabel.setOpaque(true);
//		preferredFootSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		preferredFootSearchLabel.setForeground(Color.white);
//		preferredFootSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//
//		playerPanel.add(preferredFootSearchLabel);
//
//		/*
//		 * Campo ricerca per il piede preferito: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"50:push[]80[]80[]80[]20:push",
//				"10[]10"
//			);
//
//		preferredFootPanel = new JPanel(migLayout);
//		preferredFootPanel.setBackground(panelColor);
//
//		playerPanel.add(preferredFootPanel);
//
//		/*
//		 * Campo ricerca per il piede preferito destro: radioButton
//		 */
//		string = GuiConfiguration.getMessage("right");
//		string = StringUtils.capitalize(string);
//
//		rightFootRadioButton = new JRadioButton(string);
//		rightFootRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				preferredFootSearchValid = true;
//				searchButton.setEnabled(true);
//
//				playerFoot = Player.FOOT_TYPE.RIGHT.toString();
//			}
//		});
//
//		preferredFootPanel.add(rightFootRadioButton);
//
//		/*
//		 * Campo ricerca per il piede preferito sinistro: radioButton
//		 */
//		string = GuiConfiguration.getMessage("left");
//		string = StringUtils.capitalize(string);
//
//		leftFootRadioButton = new JRadioButton(string);
//		leftFootRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				preferredFootSearchValid = true;
//				searchButton.setEnabled(true);
//
//				playerFoot = Player.FOOT_TYPE.LEFT.toString();
//			}
//		});
//
//		preferredFootPanel.add(leftFootRadioButton);
//		/*
//		 * Campo ricerca per entrambi i piedi preferiti: radioButton
//		 */
//		string = GuiConfiguration.getMessage("either");
//		string = StringUtils.capitalize(string);
//
//		eitherFootRadioButton = new JRadioButton(string);
//		eitherFootRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				preferredFootSearchValid = true;
//				searchButton.setEnabled(true);
//
//				playerFoot = Player.FOOT_TYPE.EITHER.toString();
//			}
//		});
//		preferredFootPanel.add(eitherFootRadioButton);
//
//		/*
//		 * Campo gruppo bottoni: buttonGroup
//		 */
//		preferredFootGroupButton = new ButtonGroup();
//
//		preferredFootGroupButton.add(rightFootRadioButton);
//		preferredFootGroupButton.add(leftFootRadioButton);
//		preferredFootGroupButton.add(eitherFootRadioButton);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		footResetButton = new JButton(resetIcon);
//		footResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				preferredFootSearchValid = false;
//				setEnableButton();
//
//				playerFoot = null;
//				preferredFootGroupButton.clearSelection();
//			}
//		});
//
//		preferredFootPanel.add(footResetButton);
//
//
//		/*
//		 * Campo avvia ricerca: button
//		 */
//		string = GuiConfiguration.getMessage("search");
//		string = string.toUpperCase();
//
//		searchButton = new JButton(string);
//		searchButton.setEnabled(false);
//
//		searchButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//
//				setRolePlayer();
//
//				System.out.println(playerSubName);
//				System.out.println(playerSubSurname);
//				System.out.println(playerReferringYear);
//				System.out.println(playerMinAge);
//				System.out.println(playerMaxAge);
//				System.out.println(playerCountryID);
//				System.out.println(playerRole);
//				System.out.println(playerPositionID);
//				System.out.println(playerFoot);
//
//
//				List<List<String>> data = Controller.getInstance().getPlayerList
//					(
//						playerSubName,
//						playerSubSurname,
//						playerReferringYear,
//						playerMinAge,
//						playerMaxAge,
//						playerCountryID,
//						playerRole,
//						playerPositionID,
//						playerFoot,
//						true
//					);
//
//
//				playerTable.setModel(new TableModel("players", data));
//				playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());
//				playerTablePanel.revalidate();
//			}
//		});
//		playerPanel.add(searchButton);
//
//
//		/*
//		 * Campo tabella competizioni: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[grow, fill]",
//				"10[]10"
//			);
//
//		playerTablePanel = new JPanel(migLayout);
//		playerTablePanel.setBackground(panelColor);
//
//		add(playerTablePanel);
//
//		/*
//		 * Campo tabella paesi: table
//		 */
//		playerTable = new JTable(new TableModel("players", null));
//
//		playerTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());
//		playerTable.setFillsViewportHeight(true);
//		playerTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(playerTable);
//
//		playerTablePanel.add(scrollPane);
//	}
//
//	public void setEnableButton()
//	{
//		if (nameSearchValid || surnameSearchValid || ageSearchValid || bornNationSearchValid || roleSearchValid ||
//				mainPositionValid || preferredFootSearchValid)
//		{
//			searchButton.setEnabled(true);
//		}
//		else {
//			searchButton.setEnabled(false);
//		}
//	}
//
//	public void setRoleSearchValid()
//	{
//		if (goalkeeperCheckBox.isSelected() || defenderCheckBox.isSelected() || midfielderCheckBox.isSelected() ||
//				forwardCheckBox.isSelected())
//		{
//			roleSearchValid = true;
//		}
//		else {
//			roleSearchValid = false;
//		}
//	}
//
//	public void setRolePlayer()
//	{
//		String string = "";
//
//		if (roleSearchValid) {
//
//			if (goalkeeperCheckBox.isSelected()) {
//				string += "GK";
//			}
//
//			if (defenderCheckBox.isSelected()) {
//				if (string.isEmpty()) {
//					string += "DF";
//				}
//				else {
//					string += "_DF";
//				}
//			}
//
//			if (midfielderCheckBox.isSelected()) {
//				if (string.isEmpty()) {
//					string += "MF";
//				}
//				else {
//					string += "_MF";
//				}
//			}
//
//			if (forwardCheckBox.isSelected()) {
//				if (string.isEmpty()) {
//					string += "FW";
//				}
//				else {
//					string += "_FW";
//				}
//			}
//
//			playerRole = string;
//		}
//		else {
//			playerRole = null;
//		}
//	}
//
//	public void fillCountryComboBox(JComboBox<List<String>> comboBox, String type, String superCountryID)
//	{
//		comboBox.addItem(GuiConfiguration.getListStringSelectAll());
//
//		List<List<String>> nameCountryList = Controller.getInstance().getCountryList
//			(
//				type,
//				superCountryID,
//				false
//			);
//
//		for (List<String> countryList: nameCountryList) {
//			comboBox.addItem(countryList);
//		}
//
//	}
//
//	public void fillReferenceYearComboBox(Integer minimumYear)
//	{
//		Integer maximumYear = Year.now().getValue();
//
//		for( Integer i = maximumYear; i >= minimumYear; --i){
//			yearReferenceComboBox.addItem(i.toString());
//		}
//
//	}
//
//	public void fillAgeComboBox(JComboBox<String> comboBox, Integer minimumAge, Integer maximumAge)
//	{
//
//		for( Integer i = minimumAge; i <= maximumAge; ++i){
//			comboBox.addItem(i.toString());
//		}
//
//	}
//
//	public void fillPositionComboBox(JComboBox<List<String>> comboBox)
//	{
//		List<List<String>> namePositionList = Controller.getInstance().getPositionList(false);
//
//		for (List<String> positionList: namePositionList) {
//			comboBox.addItem(positionList);
//		}
//
//	}
//}

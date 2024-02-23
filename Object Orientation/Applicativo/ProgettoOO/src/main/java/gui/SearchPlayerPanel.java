package gui;

import controller.Controller;
import model.Country;
import model.Player;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.time.Year;

import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class SearchPlayerPanel
				extends JPanel
{
	private final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	private final JPanel playerPanel;
	private final JPanel namePanel;
	private final JPanel agePanel;
	private final JPanel bornNationPanel;
	private final JPanel rolePanel;
	private final JPanel mainPositionPanel;
	private final JPanel preferredFootPanel;
	private final JPanel playerTablePanel;

	private final JButton titleButton;
	private final JButton nameResetButton;
	private final JButton surnameResetButton;
	private final JButton ageResetButton;
	private final JButton bornNationResetButton;
	private final JButton roleResetButton;
	private final JButton positionResetButton;
	private final JButton footResetButton;
	private final JButton searchButton;

	private final JLabel nameSearchLabel;
	private final JLabel nameErrorLabel;
	private final JLabel surnameErrorLabel;
	private final JLabel ageSearchLabel;
	private final JLabel bornNationSearchLabel;
	private final JLabel roleSearchLabel;
	private final JLabel mainPositionSearchLabel;
	private final JLabel preferredFootSearchLabel;
	private final JLabel titleTable;

	private final JTextField nameTextField;
	private final JTextField surnameTextField;


	private final JComboBox<String> yearReferenceComboBox;
	private final JComboBox<String> minimumAgeComboBox;
	private final JComboBox<String> maximumAgeComboBox;
	private final JComboBox<String> continentComboBox;
	private final JComboBox<String> nationComboBox;
	private final JComboBox<String> mainPositionComboBox;

	private final Vector<String> playerContinentVector = new Vector<>();
	private final Vector<String> playerNationVector = new Vector<>();
	private final Vector<String> playerMainPositionVector = new Vector<>();
	private final Map<String, String> playerContinentMap = new HashMap<>();
	private final Map<String, String> playerNationMap = new HashMap<>();
	private final Map<String, String> playerMainPositionMap = new HashMap<>();


	private final JCheckBox goalkeeperCheckBox;
	private final JCheckBox defenderCheckBox;
	private final JCheckBox midfielderCheckBox;
	private final JCheckBox forwardCheckBox;

	private final JRadioButton rightFootRadioButton;
	private final JRadioButton leftFootRadioButton;
	private final JRadioButton eitherFootRadioButton;


	private JLabel label;
	private final ButtonGroup preferredFootGroupButton;

	private final JTable playerTable;
	private final Vector<String> playerTableColumnName = new Vector<>();
	private final Vector<Vector<String>> playerTableData = new Vector<>();

	private final JScrollPane scrollPane;

	private String playerSubName = null;
	private String playerSubSurname = null;
	private String playerReferringYear = null;
	private String playerMinAge = null;
	private String playerContinentID = null;
	private String playerNationID = null;
	private String playerMaxAge = null;
	private String playerRole = null;
	private String playerPositionID = null;
	private String playerFoot = null;



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

		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/

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
		string += Controller.getInstance().countPlayers().toString();
		string = string.toUpperCase();


		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		add(titleButton);

		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

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
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]10[]0[]10[]0[]10[]0[]10[]0[]20[]0"
			);

		playerPanel = new JPanel(migLayout);
		playerPanel.setOpaque(false);

		add(playerPanel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per nome: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchLabel = new JLabel(string);
		nameSearchLabel.setOpaque(true);

		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchLabel.setForeground(Color.white);
		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(nameSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/
		/*
		 * Campo ricerca per nome: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 4, center",
				"50[]80[]10[]70[]20",
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
		nameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternString.matcher(nameTextField.getText()).find()) {

					playerSubName = nameTextField.getText();
					nameErrorLabel.setVisible(false);

				} else {

					playerSubName = null;
					nameErrorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(nameTextField);

		/*
		 * Campo errore regex: label
		 */
		nameErrorLabel = new JLabel(errorIcon);

		namePanel.add(nameErrorLabel);

		/*
		 * Campo bottone reset: button
		 */
		nameResetButton = new JButton(resetIcon);
		nameResetButton.setCursor(GuiConfiguration.getButtonCursor());
		nameResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerSubName = null;
				nameTextField.setText(null);
			}
		});

		namePanel.add(nameResetButton);


		/*
		 * Campo cognome: label
		 */
		string = GuiConfiguration.getMessage("surname");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);

		/*
		 * Campo testo: textField
		 */
		surnameTextField = new JTextField(GuiConfiguration.getInputColumn());
		surnameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternString.matcher(surnameTextField.getText()).find()) {

					playerSubSurname = surnameTextField.getText();
					surnameErrorLabel.setVisible(false);

				} else {

					playerSubSurname = null;
					surnameErrorLabel.setVisible(true);
				}
			}
		});

		namePanel.add(surnameTextField);

		/*
		 * Campo errore regex: label
		 */
		surnameErrorLabel = new JLabel(errorIcon);

		namePanel.add(surnameErrorLabel);

		/*
		 * Campo bottone reset: button
		 */
		surnameResetButton = new JButton(resetIcon);
		surnameResetButton.setCursor(GuiConfiguration.getButtonCursor());
		surnameResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerSubSurname = null;
				surnameTextField.setText(null);
			}
		});

		namePanel.add(surnameResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER ETÀ
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per eta: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("age");
		string = string.toUpperCase();

		ageSearchLabel = new JLabel(string);
		ageSearchLabel.setOpaque(true);
		ageSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		ageSearchLabel.setForeground(Color.white);
		ageSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(ageSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER ETÀ
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per eta: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 5, center",
				"50[]80[]80[]80[]80[]20",
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
		yearReferenceComboBox = new JComboBox<>();

		yearReferenceComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		yearReferenceComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		fillReferenceYearComboBox(1830);
		yearReferenceComboBox.setSelectedIndex(-1);

		yearReferenceComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e) { }
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerReferringYear = (String) yearReferenceComboBox.getSelectedItem();

				minimumAgeComboBox.setEnabled(true);
				minimumAgeComboBox.firePopupMenuWillBecomeVisible();
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		agePanel.add(yearReferenceComboBox, "spanx 2, center");

		/*
		 * Campo bottone reset: button
		 */
		ageResetButton = new JButton(resetIcon);
		ageResetButton.setCursor(GuiConfiguration.getButtonCursor());
		ageResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				minimumAgeComboBox.setEnabled(false);
				maximumAgeComboBox.setEnabled(false);

				minimumAgeComboBox.setSelectedIndex(-1);
				maximumAgeComboBox.setSelectedIndex(-1);
				yearReferenceComboBox.setSelectedIndex(-1);

				playerReferringYear = null;
				playerMinAge = null;
				playerMaxAge = null;
			}
		});

		agePanel.add(ageResetButton, "spany 2, center");


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
		minimumAgeComboBox = new JComboBox<>();

		minimumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		minimumAgeComboBox.setEnabled(false);

		minimumAgeComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		fillAgeComboBox(minimumAgeComboBox, 15, 50);
		minimumAgeComboBox.setSelectedIndex(-1);

		minimumAgeComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e) { }

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerMinAge = (String) minimumAgeComboBox.getSelectedItem();

				maximumAgeComboBox.setEnabled(true);
				maximumAgeComboBox.firePopupMenuWillBecomeVisible();
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
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
		maximumAgeComboBox = new JComboBox<>();

		maximumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		maximumAgeComboBox.setEnabled(false);

		maximumAgeComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		maximumAgeComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				maximumAgeComboBox.removeAllItems();

				fillAgeComboBox(maximumAgeComboBox, Integer.valueOf(playerMinAge), 50);

				maximumAgeComboBox.setSelectedIndex(-1);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerMaxAge = (String) maximumAgeComboBox.getSelectedItem();
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }

		});

		agePanel.add(maximumAgeComboBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per paese di nascita: checkbox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("bornNation");
		string = string.toUpperCase();

		bornNationSearchLabel = new JLabel(string);

		bornNationSearchLabel.setOpaque(true);
		bornNationSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		bornNationSearchLabel.setForeground(Color.white);
		bornNationSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(bornNationSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER PAESE DI NASCITA
		 *------------------------------------------------------------------------------------------------------*/


		/*
		 * Campo ricerca per paese di nascita: panel
		 */
		migLayout = new MigLayout
			(
				"debug, wrap 3, center",
				"50[]80[]80[]20",
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
		continentComboBox = new JComboBox<>();


		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						continentComboBox,
						playerContinentVector,
						playerContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerContinentID   = playerContinentMap.get((String) continentComboBox.getSelectedItem());

				if (playerContinentID != null) {

					nationComboBox.setEnabled(true);
					nationComboBox.firePopupMenuWillBecomeVisible();
				}
				else {
					nationComboBox.setEnabled(false);
					nationComboBox.setSelectedIndex(-1);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		bornNationPanel.add(continentComboBox);

		/*
		 * Campo bottone reset: button
		 */
		bornNationResetButton = new JButton(resetIcon);
		bornNationResetButton.setCursor(GuiConfiguration.getButtonCursor());
		bornNationResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				continentComboBox.setSelectedIndex(-1);
				nationComboBox.setEnabled(false);
				nationComboBox.setSelectedIndex(-1);

				playerContinentID = null;
				playerNationID = null;
			}
		});

		bornNationPanel.add(bornNationResetButton, "spany 2, center");


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
		nationComboBox = new JComboBox<>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						nationComboBox,
						playerNationVector,
						playerNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						playerContinentID
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerNationID =  playerNationMap.get( (String) nationComboBox.getSelectedItem() );
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		bornNationPanel.add(nationComboBox);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per ruolo: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		roleSearchLabel = new JLabel(string);

		roleSearchLabel.setOpaque(true);
		roleSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		roleSearchLabel.setForeground(Color.white);
		roleSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(roleSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per ruolo: panel
		 */

		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]80[]80[]20",
				"10[]10"
			);


		rolePanel = new JPanel(migLayout);
		rolePanel.setBackground(panelColor);

		playerPanel.add(rolePanel);

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
		 * Campo bottone reset: button
		 */
		roleResetButton = new JButton(resetIcon);
		roleResetButton.setCursor(GuiConfiguration.getButtonCursor());
		roleResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				goalkeeperCheckBox.setSelected(false);
				defenderCheckBox.setSelected(false);
				midfielderCheckBox.setSelected(false);
				forwardCheckBox.setSelected(false);
			}
		});

		rolePanel.add(roleResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per posizione principale: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("mainPosition");
		string = string.toUpperCase();

		mainPositionSearchLabel = new JLabel(string);

		mainPositionSearchLabel.setOpaque(true);
		mainPositionSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		mainPositionSearchLabel.setForeground(Color.white);
		mainPositionSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(mainPositionSearchLabel);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per posizione principale: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]20",
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
		mainPositionComboBox = new JComboBox<>();

		mainPositionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		mainPositionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		mainPositionComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillPositionComboBox(mainPositionComboBox, playerMainPositionVector, playerMainPositionMap);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerPositionID = playerMainPositionMap.get( (String) mainPositionComboBox.getSelectedItem() );
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		mainPositionPanel.add(mainPositionComboBox);

		/*
		 * Campo bottone reset: button
		 */
		positionResetButton = new JButton(resetIcon);
		positionResetButton.setCursor(GuiConfiguration.getButtonCursor());
		positionResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				mainPositionComboBox.setSelectedIndex(-1);

				playerPositionID = null;
			}
		});

		mainPositionPanel.add(positionResetButton);

		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER PIEDE PREFERITO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per il piede preferito: checkBox
		 */
		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("preferredFoot");
		string = string.toUpperCase();

		preferredFootSearchLabel = new JLabel(string);
		preferredFootSearchLabel.setOpaque(true);
		preferredFootSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		preferredFootSearchLabel.setForeground(Color.white);
		preferredFootSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(preferredFootSearchLabel);

		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER PIEDE PREFERITO
		 *------------------------------------------------------------------------------------------------------*/

		/*
		 * Campo ricerca per il piede preferito: panel
		 */
		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]80[]20",
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
		rightFootRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		rightFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = Player.FOOT_TYPE.RIGHT.toString();
			}
		});

		preferredFootPanel.add(rightFootRadioButton);

		/*
		 * Campo ricerca per il piede preferito sinistro: radioButton
		 */
		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);

		leftFootRadioButton = new JRadioButton(string);
		leftFootRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		leftFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = Player.FOOT_TYPE.LEFT.toString();
			}
		});

		preferredFootPanel.add(leftFootRadioButton);
		/*
		 * Campo ricerca per entrambi i piedi preferiti: radioButton
		 */
		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);

		eitherFootRadioButton = new JRadioButton(string);
		eitherFootRadioButton.setCursor(GuiConfiguration.getButtonCursor());
		eitherFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = Player.FOOT_TYPE.EITHER.toString();
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
		 * Campo bottone reset: button
		 */
		footResetButton = new JButton(resetIcon);
		footResetButton.setCursor(GuiConfiguration.getButtonCursor());
		footResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = null;
				preferredFootGroupButton.clearSelection();
			}
		});

		preferredFootPanel.add(footResetButton);
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/


		/*
		 * Campo avvia ricerca: button
		 */
		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				setRolePlayer();

				fillPlayerTable(playerTableData, playerTableColumnName, playerTable, "players");

				System.out.println(playerRole);

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
		 * Campo titolo tabella paesi: label
		 */
		string = GuiConfiguration.getMessage("no");
		string += " ";
		string += GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("performed");
		string = string.toUpperCase();

		titleTable = new JLabel(string);

		titleTable.setOpaque(true);
		titleTable.setBackground(GuiConfiguration.getSearchPanelColor());
		titleTable.setForeground(Color.white);

		titleTable.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerTablePanel.add(titleTable);


		/*
		 * Campo tabella paesi: table
		 */
		playerTable = new JTable();

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

	public void setRolePlayer()
	{
		String string = "";

		if (goalkeeperCheckBox.isSelected()) {
			string += "GK";
		}

		if (defenderCheckBox.isSelected()) {
				string += "_DF";
		}

		if (midfielderCheckBox.isSelected()) {
				string += "_MF";
		}

		if (forwardCheckBox.isSelected()) {
			string += "_FW";
		}

		if (string.isEmpty()){
			playerRole = null;
		}
		else if (!goalkeeperCheckBox.isSelected()){
			playerRole = string.substring(1);
		}
		else {
			playerRole = string;
		}


	}

	public void fillCountryComboBox(JComboBox<String> comboBox,
									Vector<String> vector,
									Map<String, String> map,
									String type,
									String superCountryID)
	{

		GuiConfiguration.initComboBoxVector(vector, map);

		Controller.getInstance().setCountryComboBox
			(
				vector,
				map,
				type,
				superCountryID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}

	public void fillReferenceYearComboBox(Integer minimumYear)
	{
		Integer maximumYear = Year.now().getValue();

		for( Integer i = maximumYear; i >= minimumYear; --i){
			yearReferenceComboBox.addItem(i.toString());
		}

	}

	public void fillAgeComboBox(JComboBox<String> comboBox, Integer minimumAge, Integer maximumAge)
	{

		for( Integer i = minimumAge; i <= maximumAge; ++i){
			comboBox.addItem(i.toString());
		}

	}

	public void fillPositionComboBox(JComboBox<String> comboBox,
									 Vector<String> vector,
									 Map<String, String> map)
	{

		GuiConfiguration.initComboBoxVector(vector, map);

		Controller.getInstance().setPositionComboBox
			(
				vector,
				map
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}
	public void fillPlayerTable(Vector<Vector<String>> tableData,
									 Vector<String> tableColumnName,
									 JTable table,
									 String tableName)
	{
		tableData.clear();
		tableColumnName.clear();

		Controller.getInstance().setPlayerTable
			(
				tableColumnName,
				tableData,
				playerSubName,
				playerSubSurname,
				playerReferringYear,
				playerMinAge,
				playerMaxAge,
				playerContinentID,
				playerNationID,
				playerRole,
				playerPositionID,
				playerFoot
			);

		table.setModel(new TableModel(tableData, tableColumnName));
		table.setPreferredScrollableViewportSize(table.getPreferredSize());

		GuiConfiguration.setTitleTable(titleTable, tableName, tableData.size());
	}
}

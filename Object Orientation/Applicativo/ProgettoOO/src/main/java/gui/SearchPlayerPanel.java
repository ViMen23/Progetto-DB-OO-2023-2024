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
import javax.swing.table.DefaultTableCellRenderer;
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
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");


	private final JPanel titlePanel;
	private final JPanel playerPanel;
	private final JPanel namePanel;
	private final JPanel agePanel;
	private final JPanel bornNationPanel;
	private final JPanel rolePanel;
	private final JPanel mainPositionPanel;
	private final JPanel preferredFootPanel;
	private final JPanel playerTablePanel;

	private final JButton titleButton;
	private final JButton resetButton;
	private final JButton searchButton;

	private final JLabel nameSearchLabel;
	private final JLabel ageSearchLabel;
	private final JLabel bornNationSearchLabel;
	private final JLabel roleSearchLabel;
	private final JLabel mainPositionSearchLabel;
	private final JLabel preferredFootSearchLabel;
	private final JLabel titleTableLabel;

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

	private final ButtonGroup preferredFootGroupButton;

	private final JTable playerTable;
	private final Vector<String> playerTableColumnName = new Vector<>();
	private final Vector<Vector<String>> playerTableData = new Vector<>();


	private JScrollPane playerScrollPane;
	private final JScrollPane scrollPane;

	private JLabel label;
	private JPanel infoPanel;

	private String playerSubName = null;
	private String playerSubSurname = null;
	private String playerReferringYear = null;
	private String playerMinAge = null;
	private String playerMaxAge = null;
	private String playerContinentID = null;
	private String playerNationID = null;
	private String playerRole = null;
	private String playerPositionID = null;
	private String playerFoot = null;



	public SearchPlayerPanel()
	{

		MigLayout migLayout;
		String string;


		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[]0",
				"10[]10[]0[]10"
			);

		setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TITOLO GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"0[]110[]0",
				"10[]10"
			);

		titlePanel = new JPanel(migLayout);
		titlePanel.setOpaque(true);
		titlePanel.setBackground(panelColor);

		add(titlePanel, "sgx general, dock north");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/



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

		titlePanel.add(titleButton, "width 80%");



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (playerPanel.isShowing()) {
					remove(playerPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(playerPanel,"dock center, sgx general");
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER TEAM PANEL
		 *------------------------------------------------------------------------------------------------------*/



		resetButton = new JButton(resetIcon);
		resetButton.setCursor(GuiConfiguration.getButtonCursor());

		titlePanel.add(resetButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				nameTextField.setText(null);
				playerSubName = null;

				surnameTextField.setText(null);
				playerSubSurname = null;

				yearReferenceComboBox.setSelectedIndex(-1);
				playerReferringYear = null;

				minimumAgeComboBox.setEnabled(false);
				minimumAgeComboBox.setSelectedIndex(-1);
				playerMinAge = null;

				maximumAgeComboBox.setEnabled(false);
				maximumAgeComboBox.setSelectedIndex(-1);
				playerMaxAge = null;

				continentComboBox.setSelectedIndex(-1);
				playerContinentID = null;

				nationComboBox.setEnabled(false);
				nationComboBox.setSelectedIndex(-1);
				playerNationID = null;

				goalkeeperCheckBox.setSelected(false);
				defenderCheckBox.setSelected(false);
				midfielderCheckBox.setSelected(false);
				forwardCheckBox.setSelected(false);

				playerRole = null;

				mainPositionComboBox.setSelectedIndex(-1);
				playerPositionID = null;

				preferredFootGroupButton.clearSelection();
				playerFoot = null;

			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[60%, fill]50[35%, fill]10",
				"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0"
			);

		playerPanel = new JPanel(migLayout);
		playerPanel.setOpaque(false);

		add(playerPanel, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		//playerScrollPane = new JScrollPane(playerPanel);
		//playerScrollPane.setPreferredSize(playerPanel.getMaximumSize());

		//add(playerScrollPane, "dock center, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		nameSearchLabel = new JLabel(string);

		nameSearchLabel.setOpaque(true);
		nameSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		nameSearchLabel.setForeground(Color.white);

		nameSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(nameSearchLabel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]10"
			);

		namePanel = new JPanel(migLayout);
		namePanel.setBackground(panelColor);

		playerPanel.add(namePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NOME
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TEXTFIELD NOME ESTESO
		 *------------------------------------------------------------------------------------------------------*/



		nameTextField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(nameTextField);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternString.matcher(nameTextField.getText()).find()) {
					playerSubName = nameTextField.getText();
				} else {
					playerSubName = null;
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL COGNOME
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("surname");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		namePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TEXTFIELD COGNOME
		 *------------------------------------------------------------------------------------------------------*/



		surnameTextField = new JTextField(GuiConfiguration.getInputColumn());

		namePanel.add(surnameTextField);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		surnameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				if (Regex.patternString.matcher(surnameTextField.getText()).find()) {
					playerSubSurname = surnameTextField.getText();
				} else {
					playerSubSurname = null;
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER NOME
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		playerPanel.add(infoPanel, "sg panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER ETÀ
		 *------------------------------------------------------------------------------------------------------*/



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
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER ETÀ
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]20[]10"
			);

		agePanel = new JPanel(migLayout);
		agePanel.setBackground(panelColor);

		playerPanel.add(agePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL ANNO DI RIFERIMENTO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL ANNO DI RIFERIMENTO
		 *------------------------------------------------------------------------------------------------------*/



		yearReferenceComboBox = new JComboBox<>();
		yearReferenceComboBox.setCursor(GuiConfiguration.getButtonCursor());

		yearReferenceComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		yearReferenceComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		GuiConfiguration.fillYearComboBox(yearReferenceComboBox, GuiConfiguration.getMinYear());
		yearReferenceComboBox.setSelectedIndex(-1);

		agePanel.add(yearReferenceComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		yearReferenceComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e) { }
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerReferringYear = (String) yearReferenceComboBox.getSelectedItem();

				if (playerReferringYear != null) {
					minimumAgeComboBox.setEnabled(true);
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL ETÀ MINIMA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("minimumAge");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX ETÀ MINIMA
		 *------------------------------------------------------------------------------------------------------*/



		minimumAgeComboBox = new JComboBox<>();
		minimumAgeComboBox.setEnabled(false);
		minimumAgeComboBox.setCursor(GuiConfiguration.getButtonCursor());

		minimumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		minimumAgeComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		fillAgeComboBox(minimumAgeComboBox, GuiConfiguration.getMinAge(), GuiConfiguration.getMaxAge());
		minimumAgeComboBox.setSelectedIndex(-1);

		agePanel.add(minimumAgeComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		minimumAgeComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e) { }

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerMinAge = (String) minimumAgeComboBox.getSelectedItem();

				if (playerMinAge != null) {
					maximumAgeComboBox.setEnabled(true);
					maximumAgeComboBox.setSelectedIndex(-1);
					playerMaxAge = null;
				}
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL ETÀ MASSIMA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("maximumAge");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		agePanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL ETÀ MASSIMA
		 *------------------------------------------------------------------------------------------------------*/



		maximumAgeComboBox = new JComboBox<>();
		maximumAgeComboBox.setEnabled(false);
		maximumAgeComboBox.setCursor(GuiConfiguration.getButtonCursor());

		maximumAgeComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		maximumAgeComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		agePanel.add(maximumAgeComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		maximumAgeComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				maximumAgeComboBox.removeAllItems();

				fillAgeComboBox(maximumAgeComboBox, Integer.valueOf(playerMinAge), GuiConfiguration.getMaxAge());
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerMaxAge = (String) maximumAgeComboBox.getSelectedItem();
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }

		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		playerPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("bornNation");
		string = string.toUpperCase();

		bornNationSearchLabel = new JLabel(string);

		bornNationSearchLabel.setOpaque(true);
		bornNationSearchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		bornNationSearchLabel.setForeground(Color.white);

		bornNationSearchLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(bornNationSearchLabel, "sgx panel_first_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER PAESE DI NASCITA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"5%[20%]10%[40%]20%",
				"10[]20[]10"
			);

		bornNationPanel = new JPanel(migLayout);
		bornNationPanel.setBackground(panelColor);

		playerPanel.add(bornNationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		bornNationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox = new JComboBox<>();
		continentComboBox.setCursor(GuiConfiguration.getButtonCursor());

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		bornNationPanel.add(continentComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillCountryComboBox
					(
						continentComboBox,
						playerContinentVector,
						playerContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						true
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				playerContinentID   = playerContinentMap.get((String) continentComboBox.getSelectedItem());

				if (playerContinentID != null) {
					nationComboBox.setEnabled(true);
				}
				else {
					nationComboBox.setEnabled(false);
				}

				nationComboBox.setSelectedIndex(-1);
				playerNationID = null;
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		bornNationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TIPO PAESE NAZIONE
		 *------------------------------------------------------------------------------------------------------*/


		nationComboBox = new JComboBox<>();
		nationComboBox.setEnabled(false);
		nationComboBox.setCursor(GuiConfiguration.getButtonCursor());

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		bornNationPanel.add(nationComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				GuiConfiguration.fillCountryComboBox
					(
						nationComboBox,
						playerNationVector,
						playerNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						playerContinentID,
						true
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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER TIPO PAESE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		playerPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/



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
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"30[20%, center]80[20%, center]80[20%, center]80[20%, center]30",
				"10[]10"
			);


		rolePanel = new JPanel(migLayout);
		rolePanel.setBackground(panelColor);

		playerPanel.add(rolePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO PORTIERE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("goalkeeper");
		string = StringUtils.capitalize(string);

		goalkeeperCheckBox = new JCheckBox(string);
		goalkeeperCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(goalkeeperCheckBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO DIFENSORE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("defender");
		string = StringUtils.capitalize(string);

		defenderCheckBox = new JCheckBox(string);
		defenderCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(defenderCheckBox);

		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO CENTROCAMPISTA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("midfield");
		string = StringUtils.capitalize(string);

		midfielderCheckBox = new JCheckBox(string);
		midfielderCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(midfielderCheckBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * CHECKBOX RUOLO ATTACCANTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("fowarder");
		string = StringUtils.capitalize(string);

		forwardCheckBox = new JCheckBox(string);
		forwardCheckBox.setCursor(GuiConfiguration.getButtonCursor());

		rolePanel.add(forwardCheckBox);



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER RUOLO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[]",
				"[]"
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		playerPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/



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
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx",
				"5%[20%]10%[40%]20%",
				"10[]10"
			);

		mainPositionPanel = new JPanel(migLayout);
		mainPositionPanel.setBackground(panelColor);

		playerPanel.add(mainPositionPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("position");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		mainPositionPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/



		mainPositionComboBox = new JComboBox<>();
		mainPositionComboBox.setCursor(GuiConfiguration.getButtonCursor());

		mainPositionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		mainPositionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		mainPositionPanel.add(mainPositionComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER POSIZIONE PRINCIPALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		playerPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL RICERCA PER PIEDE PREFERITO
		 *------------------------------------------------------------------------------------------------------*/



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
		 * LABEL INFO
		 *------------------------------------------------------------------------------------------------------*/



		string = "INFO";

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerPanel.add(label, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL RICERCA PER PIEDE PREFERITO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"30[20%, center]80[20%, center]80[20%, center]30",
				"10[]10"
			);

		preferredFootPanel = new JPanel(migLayout);
		preferredFootPanel.setBackground(panelColor);

		playerPanel.add(preferredFootPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON PIEDE PREFERITO DESTRO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("right");
		string = StringUtils.capitalize(string);

		rightFootRadioButton = new JRadioButton(string);
		rightFootRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		preferredFootPanel.add(rightFootRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		rightFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = Player.FOOT_TYPE.RIGHT.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON PIEDE PREFERITO SINISTRO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);

		leftFootRadioButton = new JRadioButton(string);
		leftFootRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		preferredFootPanel.add(leftFootRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		leftFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = Player.FOOT_TYPE.LEFT.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON PIEDE PREFERITO ENTRAMBI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);

		eitherFootRadioButton = new JRadioButton(string);
		eitherFootRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		preferredFootPanel.add(eitherFootRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		eitherFootRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerFoot = Player.FOOT_TYPE.EITHER.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER PIEDE PREFERITO
		 *------------------------------------------------------------------------------------------------------*/



		preferredFootGroupButton = new ButtonGroup();

		preferredFootGroupButton.add(rightFootRadioButton);
		preferredFootGroupButton.add(leftFootRadioButton);
		preferredFootGroupButton.add(eitherFootRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL INFO RICERCA PER TIPO
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				""
			);

		infoPanel = new JPanel(migLayout);
		infoPanel.setBackground(panelColor);

		playerPanel.add(infoPanel, "sgx panel_second_column");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE RICERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);
		searchButton.setCursor(GuiConfiguration.getButtonCursor());

		playerPanel.add(searchButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				setRolePlayer();

				fillPlayerTable(playerTableData, playerTableColumnName, playerTable, "players");

				playerTablePanel.revalidate();
				playerPanel.revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL TABELLA CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"[grow, fill]",
				"10[]10"
			);

		playerTablePanel = new JPanel(migLayout);
		playerTablePanel.setBackground(panelColor);

		add(playerTablePanel, "dock south, sgx general");
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TITOLO TABELLA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("no");
		string += " ";
		string += GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("performed");
		string = string.toUpperCase();

		titleTableLabel = new JLabel(string);

		titleTableLabel.setOpaque(true);
		titleTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
		titleTableLabel.setForeground(Color.white);

		titleTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());

		playerTablePanel.add(titleTableLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * TABLE TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		playerTable = new JTable();

		playerTable.setRowHeight(GuiConfiguration.getTableRowHeight());
		playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());
		playerTable.setFillsViewportHeight(true);

		playerTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		playerTable.setAutoCreateRowSorter(true);
		( (DefaultTableCellRenderer) playerTable.getTableHeader().getDefaultRenderer()
		).setHorizontalAlignment(SwingConstants.CENTER);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * SCROLLPANE SCROLL PER LA TABELLA DEI CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		scrollPane = new JScrollPane(playerTable);

		playerTablePanel.add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/
	}

	public void setRolePlayer()
	{
		String string = "";

		if (goalkeeperCheckBox.isSelected()) {
			string += "_GK";
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
		else {
			playerRole = string.substring(1);
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

		GuiConfiguration.initComboBoxVector(vector, map, true);

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

		GuiConfiguration.setTitleTable(titleTableLabel, tableName, tableData.size());
	}
}

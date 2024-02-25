//package gui;
//
//import model.Team;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import javax.swing.event.PopupMenuEvent;
//import javax.swing.event.PopupMenuListener;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.awt.event.ItemEvent;
//import java.awt.event.ItemListener;
//import java.util.List;
//
//
//public class StepFilterPanel
//				extends JPanel
//{
//	private final Color panelColor = Color.white;
//	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
//	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
//	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");
//
//	private final JPanel titlePanel;
//	private final JPanel stepFilterPanel;
//	protected JPanel teamTypePanel;
//	protected JPanel seasonPanel;
//	protected JPanel countryPanel;
//	protected JPanel competitionPanel;
//	protected JPanel teamPanel;
//	protected JPanel playerPanel;
//
//	private final JButton titleButton;
//	private final JButton resetButton;
//
//	protected JButton searchButton;
//
//	protected JRadioButton clubRadioButton;
//	protected JRadioButton nationalRadioButton;
//	protected JRadioButton worldRadioButton;
//	protected JRadioButton continentRadioButton;
//	protected JRadioButton nationRadioButton;
//
//
//	protected JComboBox<String> seasonComboBox;
//	protected JComboBox<List<String>> continentComboBox;
//	protected JComboBox<List<String>> nationComboBox;
//	protected JComboBox<List<String>> competitionComboBox;
//	protected JComboBox<List<String>> teamComboBox;
//	protected JComboBox<List<String>> playerComboBox;
//
//
//	private final ButtonGroup countryTypeButtonGroup;
//
//	private JPanel infoPanel;
//
//	private JLabel label;
//
//
//	private String teamType = null;
//	protected String countryType = null;
//	protected String countryID = null;
//
//
//	public StepFilterPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy, fill",
//				"0[]0",
//				"10[]10[]0[]10"
//			);
//
//		setLayout(migLayout);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL TITOLO GENERALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"0[]110[]0",
//				"10[]10"
//			);
//
//		titlePanel = new JPanel(migLayout);
//		titlePanel.setOpaque(true);
//		titlePanel.setBackground(panelColor);
//
//		add(titlePanel, "sgx general, dock north");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE TITOLO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("stepFilter");
//		string = string.toUpperCase();
//
//		titleButton = new JButton(string);
//
//		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
//		titleButton.setIcon(maximizeIcon);
//		titleButton.setIconTextGap(40);
//		titleButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		titlePanel.add(titleButton, "width 80%");
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		titleButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//
//				if (stepFilterPanel.isShowing()) {
//					remove(stepFilterPanel);
//					titleButton.setIcon(minimizeIcon);
//				}
//				else {
//					add(stepFilterPanel, "dock center, sgx general");
//					titleButton.setIcon(maximizeIcon);
//				}
//
//				revalidate();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE DI RESET PER STEPFILTER PANEL
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		resetButton = new JButton(resetIcon);
//		resetButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		titlePanel.add(resetButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		resetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRO GENERALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"10[60%, fill]50[35%, fill]10",
//				"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0"
//			);
//
//		stepFilterPanel = new JPanel(migLayout);
//		stepFilterPanel.setOpaque(false);
//
//		add(stepFilterPanel, "dock center, sgx general");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "1. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("country");
//		string += "/";
//		string += GuiConfiguration.getMessage("confederation");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"5%[20%]10%[40%]20%",
//				"10[]20[]10"
//			);
//
//		countryPanel = new JPanel(migLayout);
//		countryPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(countryPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO PAESE MONDO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("world");
//		string = StringUtils.capitalize(string);
//
//		worldRadioButton = new JRadioButton(string);
//
//		countryPanel.add(worldRadioButton, "wrap");
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		worldRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO PAESE CONTINENTE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		continentRadioButton = new JRadioButton(string);
//
//		countryPanel.add(continentRadioButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentRadioButton.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX TIPO PAESE CONTINENTE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentComboBox = new JComboBox<String>();
//
//		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		countryPanel.add(continentComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO PAESE NAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		nationRadioButton = new JRadioButton(string);
//		nationRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		countryPanel.add(nationRadioButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationRadioButton.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX TIPO PAESE NAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationComboBox = new JComboBox<String>();
//
//		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		nationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		countryPanel.add(nationComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BUTTONGROUP PER TIPO PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		countryTypeButtonGroup = new ButtonGroup();
//
//		countryTypeButtonGroup.add(worldRadioButton);
//		countryTypeButtonGroup.add(continentRadioButton);
//		countryTypeButtonGroup.add(nationRadioButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO FILTRA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"",
//				""
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(infoPanel, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "2. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("teamType");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx, center",
//				"30[20%, center]80[20%, center]30",
//				"10[]10"
//			);
//
//		teamTypePanel = new JPanel(migLayout);
//		teamTypePanel.setBackground(panelColor);
//
//		stepFilterPanel.add(teamTypePanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO SQUADRA CLUB
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("club");
//		string = StringUtils.capitalize(string);
//
//		clubRadioButton = new JRadioButton(string);
//		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		teamTypePanel.add(clubRadioButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		clubRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO SQUADRA NAZIONALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("national");
//		string = StringUtils.capitalize(string);
//
//		nationalRadioButton = new JRadioButton(string);
//		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		teamTypePanel.add(nationalRadioButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		nationalRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BUTTONGROUP PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//		teamTypeButtonGroup = new ButtonGroup();
//
//		teamTypeButtonGroup.add(clubRadioButton);
//		teamTypeButtonGroup.add(nationalRadioButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO FILTRA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"",
//				""
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(infoPanel, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "3. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("competition");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER COMPETIZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"5%[20%]10%[40%]20%",
//				"10[]10"
//			);
//
//		competitionPanel = new JPanel(migLayout);
//		competitionPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(teamPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL COMPETIZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("competition");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		competitionPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX TEAM
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		competitionComboBox = new JComboBox<String>();
//
//		competitionComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		competitionComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		competitionPanel.add(competitionComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		competitionComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e)
//			{
//				//TODO
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO FILTRO PER COMPETIZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[]",
//				"[]"
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(infoPanel, "sg panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER STAGIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "4. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string +=  GuiConfiguration.getMessage("season");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER STAGIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"5%[20%]10%[40%]20%",
//				"10[]20[]10"
//			);
//
//		seasonPanel = new JPanel(migLayout);
//		seasonPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(seasonPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL STAGIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("season");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		seasonPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX TEAM
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		seasonComboBox = new JComboBox<>();
//
//		seasonComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		seasonComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		seasonPanel.add(seasonComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		seasonComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				//TODO
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL INFO FILTRO PER SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[]",
//				"[]"
//			);
//
//		infoPanel = new JPanel(migLayout);
//		infoPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(infoPanel, "sg panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER ANNI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "5. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("team");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL INFO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "INFO";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		stepFilterPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER ANNI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"5%[20%]10%[40%]20%",
//				"10[]20[]10"
//			);
//
//		teamPanel = new JPanel(migLayout);
//		teamPanel.setBackground(panelColor);
//
//		stepFilterPanel.add(teamPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("team");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		teamPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX DA ANNO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		teamComboBox = new JComboBox<String>();
//
//		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//
//		teamComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//		
//		teamPanel.add(teamComboBox);
//
//		/*
//		 * Campo scelta calciatore: stampa
//		 */
//		string = " 6. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("player");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		add(label);
//
//		/*
//		 * Campo scelta calciatore: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30:push[]20",
//				"10[]10"
//			);
//
//		playerPanel = new JPanel(migLayout);
//		playerPanel.setBackground(panelColor);
//
//		add(playerPanel);
//
//		/*
//		 * Campo calciatore: stampa
//		 */
//		string = GuiConfiguration.getMessage("player");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		playerPanel.add(label);
//
//		/*
//		 * Campo calciatore: comboBox
//		 */
//		playerComboBox = new JComboBox<List<String>>();
//		playerComboBox.setEditable(true);
//		playerComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		playerComboBox.setSelectedIndex(-1);
//
//		playerPanel.add(playerComboBox);
//
//		/*
//		 * Campo avvia ricerca: button
//		 */
//		string = GuiConfiguration.getMessage("go");
//		string = string.toUpperCase();
//
//		searchButton = new JButton(string);
//
//		add(searchButton);
//	}
//
//	public void fillCountryComboBox(JComboBox<List<String>> comboBox, String type, String superCountryID)
//	{
//		/*
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
//		 */
//
//	}
//
//	public void fillCompetitionComboBox(JComboBox<List<String>> comboBox)
//	{
//		/*
//		List<List<String>> nameCompetitionList = Controller.getInstance().getCompetitionList
//			(
//				null,
//				null,
//				teamType,
//				countryType,
//				countryID,
//				false
//			);
//
//		for (List<String> competitionList: nameCompetitionList){
//			comboBox.addItem(competitionList);
//		}
//
//		 */
//	}
//}

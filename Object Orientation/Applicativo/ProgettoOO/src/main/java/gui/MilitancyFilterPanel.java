//
//package gui;
//
//import controller.Controller;
//import model.Country;
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
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Vector;
//
//
//public class MilitancyFilterPanel
//				extends JPanel
//{
//
//	protected final Color panelColor = Color.white;
//	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
//	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
//	private final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
//	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");
//
//	protected JPanel militancyPanel;
//	protected JPanel teamTypePanel;
//	protected JPanel countryConfederationPanel;
//	protected JPanel teamPanel;
//	protected JPanel yearPanel;
//
//
//	protected JButton titleButton;
//	protected JButton teamTypeResetButton;
//	protected JButton searchButton;
//
//	protected JRadioButton clubRadioButton;
//	protected JRadioButton nationalRadioButton;
//
//	protected JComboBox<String> worldComboBox;
//	protected JComboBox<String> continentComboBox;
//	protected JComboBox<String> nationComboBox;
//	protected JComboBox<String> teamComboBox;
//	protected JComboBox<String> fromYearComboBox;
//	protected JComboBox<String> toYearComboBox;
//
//	private final Vector<String> militancyContinentVector = new Vector<>();
//	private final Vector<String> militancyNationVector = new Vector<>();
//	private final Map<String, String> militancyContinentMap = new HashMap<>();
//	private final Map<String, String> militancyNationMap = new HashMap<>();
//
//	protected JLabel label;
//	protected ButtonGroup teamTypeButtonGroup;
//
//	private String bookmark = null;
//
//	private String militancyTeamType = null;
//	private String militancyContinentID = null;
//	private String militancyNationID = null;
//
//
//	public MilitancyFilterPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"10[grow, fill]10",
//				"20[]20[]50[]10"
//			);
//
//		setLayout(migLayout);
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE TITOLO
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo titolo: bottone
//		 */
//		string = GuiConfiguration.getMessage("militancyFilter");
//		string = string.toUpperCase();
//
//		titleButton = new JButton(string);
//		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
//		titleButton.setIcon(maximizeIcon);
//		titleButton.setIconTextGap(40);
//		titleButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		add(titleButton);
//
//		titleButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//
//				if (militancyPanel.isShowing()) {
//					remove(militancyPanel);
//					titleButton.setIcon(minimizeIcon);
//				}
//				else {
//					add(militancyPanel, 1);
//					titleButton.setIcon(maximizeIcon);
//				}
//
//				revalidate();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRO GENERALE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo competizione: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"0[grow, fill]0",
//				"0[]0[]10[]0[]20[]0"
//			);
//
//		militancyPanel = new JPanel(migLayout);
//		militancyPanel.setOpaque(false);
//
//		add(militancyPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo scelta tipo team: stampa
//		 */
//		string = "1. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("teamType");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		militancyPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER TIPO SQUADRA
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo scelta tipo team: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx, center",
//				"50[]80[]80[]20",
//				"10[]10"
//			);
//
//		teamTypePanel = new JPanel(migLayout);
//		teamTypePanel.setBackground(panelColor);
//
//		militancyPanel.add(teamTypePanel);
//
//		/*
//		 * Campo club: radio button
//		 */
//		string = GuiConfiguration.getMessage("club");
//		string = StringUtils.capitalize(string);
//
//		clubRadioButton = new JRadioButton(string);
//
//		clubRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				militancyTeamType = Team.TEAM_TYPE.CLUB.toString();
//			}
//		});
//
//		teamTypePanel.add(clubRadioButton);
//
//		/*
//		 * Campo nazionale: radio button
//		 */
//		string = GuiConfiguration.getMessage("national");
//		string = StringUtils.capitalize(string);
//
//		nationalRadioButton = new JRadioButton(string);
//
//		nationalRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				militancyTeamType = Team.TEAM_TYPE.NATIONAL.toString();
//			}
//		});
//
//		teamTypePanel.add(nationalRadioButton);
//
//		/*
//		 * Campo gruppo bottone: buttonGroup
//		 */
//		teamTypeButtonGroup = new ButtonGroup();
//
//		teamTypeButtonGroup.add(clubRadioButton);
//		teamTypeButtonGroup.add(nationalRadioButton);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		teamTypeResetButton = new JButton(resetIcon);
//		teamTypeResetButton.setCursor(GuiConfiguration.getButtonCursor());
//		teamTypeResetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				//TODO
//			}
//		});
//
//		teamTypePanel.add(teamTypeResetButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL FILTRA PER PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo scelta paese: stampa
//		 */
//		string = "2. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("nation");
//		string += "/";
//		string += GuiConfiguration.getMessage("confederation");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		militancyPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL FILTRA PER PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo scelta paese: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 3, center",
//				"50[]80[]80[]20",
//				"10[]20[]10"
//			);
//
//		countryConfederationPanel = new JPanel(migLayout);
//		countryConfederationPanel.setBackground(panelColor);
//
//		militancyPanel.add(countryConfederationPanel);
//
//		/*
//		 * Campo continente: stampa
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		countryConfederationPanel.add(label);
//
//		/*
//		 * Campo continente: comboBox
//		 */
//		continentComboBox = new JComboBox<>();
//
//		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				fillCountryComboBox
//					(
//						continentComboBox,
//						militancyContinentVector,
//						militancyContinentMap,
//						Country.COUNTRY_TYPE.CONTINENT.toString(),
//						null
//					);
//			}
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				militancyContinentID = militancyContinentMap.get((String) continentComboBox.getSelectedItem());
//
//				if ( militancyContinentID != null ) {
//					nationComboBox.setEnabled(true);
//				}
//				else {
//					nationComboBox.setEnabled(false);
//					nationComboBox.setSelectedIndex(-1);
//				}
//
//			}
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) { }
//		});
//
//		countryConfederationPanel.add(continentComboBox);
//
//		/*
//		 * Campo nazione: stampa
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		countryConfederationPanel.add(label);
//
//		/*
//		 * Campo nazione: comboBox
//		 */
//		nationComboBox = new JComboBox<>();
//
//		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		nationComboBox.setSelectedIndex(-1);
//		nationComboBox.setEnabled(false);
//
//		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				fillCountryComboBox
//					(
//						nationComboBox,
//						militancyNationVector,
//						militancyNationMap,
//						Country.COUNTRY_TYPE.NATION.toString(),
//						militancyContinentID
//					);
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				militancyNationID = militancyNationMap.get((String) nationComboBox.getSelectedItem());
//
//				if (militancyNationID != null){
//					bookmark = militancyNationID;
//				}
//
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) {
//
//			}
//		});
//
//		countryConfederationPanel.add(nationComboBox);
//
//		/*
//		 * Campo scelta squadra: stampa
//		 */
//		string = " 3. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("team");
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
//		 * Campo scelta squadra: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30:push[]20",
//				"10[]10"
//			);
//
//		teamPanel = new JPanel(migLayout);
//		teamPanel.setBackground(panelColor);
//
//		add(teamPanel);
//
//		/*
//		 * Campo squadra: stampa
//		 */
//		string = GuiConfiguration.getMessage("team");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		teamPanel.add(label);
//
//		/*
//		 * Campo squadra: comboBox
//		 */
//		teamComboBox = new JComboBox<String>();
//
//		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		teamComboBox.setSelectedIndex(-1);
//
//		teamPanel.add(teamComboBox);
//
//		/*
//		 * Campo scelta anni: stampa
//		 */
//		string = " 4. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("years");
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
//		 * Campo scelta anni: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30[]50:push[]30[]20",
//				"10[]10"
//			);
//
//		yearPanel = new JPanel(migLayout);
//		yearPanel.setBackground(panelColor);
//
//		add(yearPanel);
//
//		/*
//		 * Campo anni da: stampa
//		 */
//		string = GuiConfiguration.getMessage("from");
//		string += " ";
//		string += GuiConfiguration.getMessage("year");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		yearPanel.add(label);
//
//		/*
//		 * Campo anni da: comboBox
//		 */
//		fromYearComboBox = new JComboBox<String>();
//
//		fromYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		fromYearComboBox.setSelectedIndex(-1);
//
//		yearPanel.add(fromYearComboBox);
//
//		/*
//		 * Campo ad anni: stampa
//		 */
//		string = GuiConfiguration.getMessage("to");
//		string += " ";
//		string += GuiConfiguration.getMessage("year");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		yearPanel.add(label);
//
//		/*
//		 * Campo ad anni: comboBox
//		 */
//		toYearComboBox = new JComboBox<String>();
//
//		toYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		toYearComboBox.setSelectedIndex(-1);
//
//		yearPanel.add(toYearComboBox);
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
//	}
//
//
//	public void fillCountryComboBox(JComboBox<String> comboBox,
//									Vector<String> vector,
//									Map<String, String> map,
//									String type,
//									String superCountryID)
//	{
//
//		GuiConfiguration.initComboBoxVector(vector, map); //TODO ATTENZIONE SELEZIONA TUTTO DA RIMUOVERE
//
//		Controller.getInstance().setCountryComboBox
//			(
//				vector,
//				map,
//				type,
//				superCountryID
//			);
//
//		comboBox.setModel(new DefaultComboBoxModel<>(vector));
//	}
//}

//package gui;
//
//import controller.Controller;
//import model.Country;
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
//import java.util.ArrayList;
//import java.util.List;
//
//public class SearchConfederationPanel
//	extends JPanel
//{
//	protected final Color panelColor = Color.white;
//	protected final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
//	protected final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
//	protected final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");
//
//	protected JPanel confederationPanel;
//	protected JPanel confederationTypePanel;
//	protected JPanel confederationSuperPanel;
//	protected JPanel confederationTablePanel;
//
//	protected JButton titleButton;
//	protected JButton resetButton;
//	protected JButton searchButton;
//
//	protected JLabel label;
//
//	protected JRadioButton worldRadioButton;
//	protected JRadioButton continentRadioButton;
//	protected JRadioButton nationRadioButton;
//
//	protected JComboBox<List<String>> continentComboBox;
//	protected JTable confederationTable;
//
//	protected ButtonGroup buttonGroup;
//	protected JScrollPane scrollPane;
//
//	protected String typeCountry = null;
//	protected String superConfederationID = null;
//
//	public SearchConfederationPanel()
//	{
//		String string;
//		MigLayout migLayout;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"10[grow, fill]10",
//				"20[]10[]10[]20"
//			);
//
//		setLayout(migLayout);
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE TITOLO
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo titolo: bottone
//		 */
//		string = GuiConfiguration.getMessage("search");
//		string += " ";
//		string += GuiConfiguration.getMessage("confederations");
//		string += " - ";
//		string += GuiConfiguration.getMessage("confederations");
//		string += " ";
//		string += GuiConfiguration.getMessage("available");
//		string += " ";
//		string += Controller.getInstance().countConfederations().toString();
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
//				if (confederationPanel.isShowing()){
//					remove(confederationPanel);
//					titleButton.setIcon(minimizeIcon);
//				}
//				else{
//					add(confederationPanel, 1);
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
//		 * PANEL SCELTA CONFEDERAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca confederazione: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"10[grow, fill]10",
//				"0[]0[]10[]0[]20[]0"
//			);
//
//		confederationPanel = new JPanel(migLayout);
//		confederationPanel.setOpaque(false);
//
//		add(confederationPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL PANEL RICERCA TIPO CONFEDERAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca per tipo confederazione: label
//		 */
//		string = GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("confederationType");
//		string = string.toUpperCase();
//
//		label = new JLabel(string);
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		confederationPanel.add(label);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL SCELTA TIPO CONFEDERAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//		/*
//		 * Campo ricerca per tipo confederazione: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"50:push[]80[]80[]80[]20:push",
//				"10[]10"
//			);
//
//		confederationTypePanel = new JPanel(migLayout);
//		confederationTypePanel.setBackground(panelColor);
//
//		confederationPanel.add(confederationTypePanel);
//
//		/*
//		 * Campo mondo: radio button
//		 */
//		string = GuiConfiguration.getMessage("world");
//		string = StringUtils.capitalize(string);
//
//		worldRadioButton = new JRadioButton(string);
//
//		worldRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				searchButton.setEnabled(true);
//				typeCountry = Country.COUNTRY_TYPE.WORLD.toString();
//
//			}
//		});
//
//		confederationTypePanel.add(worldRadioButton);
//
//		/*
//		 * Campo continente: radio button
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		continentRadioButton = new JRadioButton(string);
//
//		continentRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//
//				searchButton.setEnabled(true);
//				typeCountry = Country.COUNTRY_TYPE.CONTINENT.toString();
//			}
//		});
//
//		confederationTypePanel.add(continentRadioButton);
//
//		/*
//		 * Campo nazione: radio button
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		nationRadioButton = new JRadioButton(string);
//
//		nationRadioButton.addItemListener(new ItemListener() {
//			@Override
//			public void itemStateChanged(ItemEvent e)
//			{
//				if (nationRadioButton.isSelected()) {
//					searchButton.setEnabled(true);
//					continentComboBox.setEnabled(true);
//
//					continentComboBox.firePopupMenuWillBecomeVisible();
//
//					typeCountry = Country.COUNTRY_TYPE.NATION.toString();
//				}
//				else {
//					continentComboBox.setEnabled(false);
//					continentComboBox.setSelectedIndex(-1);
//					superConfederationID = null;
//				}
//			}
//		});
//
//		confederationTypePanel.add(nationRadioButton);
//
//		/*
//		 * Campo gruppo bottoni: buttonGroup
//		 */
//		buttonGroup = new ButtonGroup();
//
//		buttonGroup.add(worldRadioButton);
//		buttonGroup.add(continentRadioButton);
//		buttonGroup.add(nationRadioButton);
//
//		/*
//		 * Campo bottone reset: button
//		 */
//		resetButton = new JButton(resetIcon);
//
//		resetButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				searchButton.setEnabled(false);
//
//				typeCountry = null;
//				superConfederationID = null;
//				buttonGroup.clearSelection();
//			}
//		});
//
//		confederationTypePanel.add(resetButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL PANEL SCELTA PAESE SUPER
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo ricerca continente che contiene la nazione: stampa
//		 */
//		string = "Scegli confederazione che contiene la confederazione nazione"; //TODO I18N
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		confederationPanel.add(label);
//
//		/*
//		 * Campo pannello: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"50:push[]20:push",
//				"10[]10"
//			);
//
//		confederationSuperPanel = new JPanel(migLayout);
//		confederationSuperPanel.setBackground(panelColor);
//
//		confederationPanel.add(confederationSuperPanel);
//
//		/*
//		 * Campo continente: combo box
//		 */
//		continentComboBox = new JComboBox<List<String>>();
//
//		continentComboBox.setRenderer(new ComboBoxRenderer());
//		continentComboBox.setEnabled(false);
//
//		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getComboBoxDiplayValue());
//
//		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e) {
//				continentComboBox.removeAllItems();
//				fillConfederationComboBox(continentComboBox, Country.COUNTRY_TYPE.CONTINENT.toString(), null);
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {
//				superConfederationID = ((List<String>) continentComboBox.getSelectedItem()).getLast();
//			}
//
//			@Override
//			public void popupMenuCanceled(PopupMenuEvent e) {
//			}
//		});
//
//		confederationSuperPanel.add(continentComboBox);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE RICERCA
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo avvia ricerca: button
//		 */
//		string = GuiConfiguration.getMessage("search");
//		string = string.toUpperCase();
//
//		searchButton = new JButton(string);
//
//		searchButton.setEnabled(false);
//
//		searchButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				List<List<String>> data = Controller.getInstance().getConfederationList
//								(
//									typeCountry,
//									superConfederationID,
//									true
//								);
//
//				confederationTable.setModel(new TableModel("confederations", data));
//				confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());
//				confederationTablePanel.revalidate();
//			}
//		});
//
//		confederationPanel.add(searchButton);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL TABELLA
//		 *------------------------------------------------------------------------------------------------------*/
//
//		/*
//		 * Campo tabella confederazioni: panel
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[grow, fill]",
//				"10[]10"
//			);
//
//		confederationTablePanel = new JPanel(migLayout);
//		confederationTablePanel.setBackground(panelColor);
//
//		add(confederationTablePanel);
//
//		/*
//		 * Campo tabella confederazioni: table
//		 */
//		confederationTable = new JTable(new TableModel("countries", null));
//
//		confederationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());
//		confederationTable.setFillsViewportHeight(true);
//		confederationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(confederationTable);
//
//		confederationTablePanel.add(scrollPane);
//		/*------------------------------------------------------------------------------------------------------*/
//	}
//
//	public void fillConfederationComboBox(JComboBox<List<String>> comboBox, String typeCountry, String superConfederationID)
//	{
//
//		comboBox.addItem(GuiConfiguration.getListStringSelectAll());
//
//		List<List<String>> nameConfederationList = Controller.getInstance().getConfederationList
//			(
//				typeCountry,
//				superConfederationID,
//				false
//			);
//
//		for (List<String> confederationList: nameConfederationList) {
//			comboBox.addItem(confederationList);
//		}
//
//	}
//}

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
//import javax.swing.table.DefaultTableCellRenderer;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.awt.event.ItemEvent;
//import java.awt.event.ItemListener;
//import java.util.*;
//
//public class SearchConfederationPanel
//	extends JPanel
//{
//	private final Color panelColor = Color.white;
//
//	private final JPanel titlePanel;
//	private final JPanel confederationPanel;
//	private final JPanel confederationTypePanel;
//	private final JPanel confederationSuperPanel;
//	private final JPanel confederationTablePanel;
//
//	private final JButton titleButton;
//	private final JButton resetButton;
//	private final JButton searchButton;
//
//	private final JLabel titleTableLabel;
//
//	private final JRadioButton worldRadioButton;
//	private final JRadioButton continentRadioButton;
//	private final JRadioButton nationRadioButton;
//
//	private final JComboBox<String> continentConfederationComboBox;
//	private final JTable confederationTable;
//
//	private final Vector<Vector<String>> confederationTableData = new Vector<>();
//	private final Vector<String> confederationTableColumnName = new Vector<>();
//	private final Vector<String> confederationNameVector = new Vector<>();
//	private final Map<String, String> confederationNameMap = new HashMap<>();
//
//
//	private final ButtonGroup buttonGroup;
//	private final JScrollPane scrollPane;
//
//	private JPanel infoPanel;
//
//	private JLabel label;
//
//	private String typeCountry = null;
//	private String superConfederationID = null;
//
//	public SearchConfederationPanel()
//	{
//		String string;
//		MigLayout migLayout;
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
//
//		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
//		titleButton.setIcon(GuiConfiguration.getMaximizeIcon());
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
//				GuiConfiguration.minimizePanel
//					(
//						getRootPanel(),
//						confederationPanel,
//						titleButton,
//						"dock center, sgx general"
//					);
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE DI RESET PER CONFEDERATION PANEL
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		resetButton = new JButton(GuiConfiguration.getResetIcon());
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
//				GuiConfiguration.switchPanel
//					(
//						MainFrame.getMainFrameInstance().getContentPane(),
//						new SearchConfederationPanel(),
//						2,
//						"sgx frame"
//					);
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL SCELTA CONFEDERAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"10[60%, fill]50[35%, fill]10",
//				"0[]0[fill]10[]0[fill]20[]0"
//			);
//
//		confederationPanel = new JPanel(migLayout);
//		confederationPanel.setOpaque(false);
//
//		add(confederationPanel, "dock center, sgx general");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL PANEL RICERCA TIPO CONFEDERAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("confederationType");
//		string = string.toUpperCase();
//
//		label = new JLabel(string);
//
//		label.setOpaque(true);
//		label.setBackground(GuiConfiguration.getSearchPanelColor());
//		label.setForeground(Color.white);
//
//		label.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		confederationPanel.add(label, "sgx panel_first_column");
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
//		confederationPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL SCELTA TIPO CONFEDERAZIONE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx, center",
//				"12.5%[15%]15%[15%]15%[15%]12.5%",
//				"10[]10"
//			);
//
//		confederationTypePanel = new JPanel(migLayout);
//
//		confederationTypePanel.setBackground(panelColor);
//
//		confederationPanel.add(confederationTypePanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO CONFEDERAZIONE MONDO
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("world");
//		string = StringUtils.capitalize(string);
//
//		worldRadioButton = new JRadioButton(string);
//		worldRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		confederationTypePanel.add(worldRadioButton);
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
//				typeCountry = Country.COUNTRY_TYPE.WORLD.toString();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * RADIOBUTTON TIPO CONFEDERAZIONE CONTINENTE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		continentRadioButton = new JRadioButton(string);
//		continentRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		confederationTypePanel.add(continentRadioButton);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentRadioButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				typeCountry = Country.COUNTRY_TYPE.CONTINENT.toString();
//			}
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
//		confederationTypePanel.add(nationRadioButton);
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
//				if (nationRadioButton.isSelected()) {
//
//					continentConfederationComboBox.setEnabled(true);
//
//					typeCountry = Country.COUNTRY_TYPE.NATION.toString();
//				}
//				else {
//					continentConfederationComboBox.setEnabled(false);
//					continentConfederationComboBox.setSelectedIndex(-1);
//
//					superConfederationID = null;
//				}
//			}
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
//		buttonGroup = new ButtonGroup();
//
//		buttonGroup.add(worldRadioButton);
//		buttonGroup.add(continentRadioButton);
//		buttonGroup.add(nationRadioButton);
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
//		confederationPanel.add(infoPanel, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL PANEL SCELTA PAESE SUPER
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = "Scegli confederazione che contiene la confederazione nazione"; //TODO I18N
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
//		confederationPanel.add(label, "sgx panel_first_column");
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
//		confederationPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL SCELTA CONFEDERAZIONE SUPER
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"10:push[40%]5%",
//				"10[]10"
//			);
//
//		confederationSuperPanel = new JPanel(migLayout);
//		confederationSuperPanel.setBackground(panelColor);
//
//		confederationPanel.add(confederationSuperPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX DELLE CONFEDERAZIONI SUPER DELLE CONFEDERAZIONI NAZIONALI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentConfederationComboBox = new JComboBox<>();
//		continentConfederationComboBox.setEnabled(false);
//		continentConfederationComboBox.setCursor(GuiConfiguration.getButtonCursor());
//
//		continentConfederationComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		confederationSuperPanel.add(continentConfederationComboBox);
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentConfederationComboBox.addPopupMenuListener(new PopupMenuListener() {
//			@Override
//			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
//			{
//				fillConfederationComboBox();
//			}
//
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				superConfederationID = GuiConfiguration.getSelectedItemIDComboBox
//					(
//						continentConfederationComboBox,
//						confederationNameMap
//					);
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
//		 * PANEL INFO DEI PAESI SUPER DELLE NAZIONI
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
//		confederationPanel.add(infoPanel, "sg panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * BOTTONE RICERCA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("search");
//		string = string.toUpperCase();
//
//		searchButton = new JButton(string);
//		searchButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		confederationPanel.add(searchButton, "span 2");
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * IMPLEMENTAZIONE LOGICA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		searchButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				fillConfederationTable();
//
//				GuiConfiguration.setTitleTable
//					(
//						titleTableLabel,
//						GuiConfiguration.getMessage("confederations"),
//						confederationTableData.size()
//					);
//
//				getRootPanel().revalidate();
//			}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL TABELLA CONFEDERAZIONI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
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
//		add(confederationTablePanel, "dock south, sgx general");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL TITOLO TABELLA
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("no");
//		string += " ";
//		string += GuiConfiguration.getMessage("research");
//		string += " ";
//		string += GuiConfiguration.getMessage("performed");
//		string = string.toUpperCase();
//
//		titleTableLabel = new JLabel(string);
//
//		titleTableLabel.setOpaque(true);
//		titleTableLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		titleTableLabel.setForeground(Color.white);
//
//		titleTableLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		confederationTablePanel.add(titleTableLabel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * TABLE TABELLA DEI PAESI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		confederationTable = new JTable();
//
//		confederationTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());
//		confederationTable.setFillsViewportHeight(true);
//
//		confederationTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//		confederationTable.setAutoCreateRowSorter(true);
//		( (DefaultTableCellRenderer) confederationTable.getTableHeader().getDefaultRenderer()
//		).setHorizontalAlignment(SwingConstants.CENTER);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * SCROLLPANE SCROLL PER LA TABELLA DEI PAESI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		scrollPane = new JScrollPane(confederationTable);
//
//		confederationTablePanel.add(scrollPane);
//		/*------------------------------------------------------------------------------------------------------*/
//	}
//
//
//	/**
//	 * TODO
//	 * @return
//	 */
//	public JPanel getRootPanel()
//	{
//		return this;
//	}
//
//	/**
//	 * TODO
//	 * @param vector
//	 * @param map
//	 * @param type
//	 * @param superConfederationID
//	 */
//	public void getConfederationComboBoxData(Vector<String> vector,
//											 Map<String, String> map,
//											 String type,
//											 String superConfederationID)
//	{
//		Controller.getInstance().setConfederationComboBox
//			(
//				vector,
//				map,
//				type,
//				superConfederationID
//			);
//	}
//
//	/**
//	 * TODO
//	 * @param tableColumnName
//	 * @param tableData
//	 * @param typeCountry
//	 * @param superConfederationID
//	 */
//	public void getConfederationTableData(Vector<String> tableColumnName,
//										  Vector<Vector<String>> tableData,
//										  String typeCountry,
//										  String superConfederationID)
//	{
//		tableColumnName.clear();
//		tableData.clear();
//
//		Controller.getInstance().setConfederationTable
//			(
//				tableColumnName,
//				tableData,
//				typeCountry,
//				superConfederationID
//			);
//
//	}
//
//	/**
//	 * TODO
//	 */
//	public void fillConfederationComboBox()
//	{
//		GuiConfiguration.initComboBoxVector(confederationNameVector, confederationNameMap, true);
//
//		getConfederationComboBoxData(confederationNameVector, confederationNameMap, typeCountry, superConfederationID);
//
//		GuiConfiguration.fillComboBox(continentConfederationComboBox, confederationNameVector);
//	}
//
//
//	/**
//	 * TODO
//	 */
//	public void fillConfederationTable()
//	{
//		getConfederationTableData(confederationTableColumnName, confederationTableData, typeCountry, superConfederationID);
//
//		GuiConfiguration.fillTable(confederationTable, confederationTableData, confederationTableColumnName);
//	}
//
//}

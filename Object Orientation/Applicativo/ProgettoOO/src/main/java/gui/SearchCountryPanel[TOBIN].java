//package gui;
//
//import controller.Controller;
//import model.Country;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//import javax.swing.*;
//import javax.swing.event.ListSelectionEvent;
//import javax.swing.event.ListSelectionListener;
//import javax.swing.event.PopupMenuEvent;
//import javax.swing.event.PopupMenuListener;
//import javax.swing.table.DefaultTableCellRenderer;
//import java.awt.*;
//import java.awt.event.*;
//import java.util.*;
//
//public class SearchCountryPanel
//				extends JPanel
//{
//	private final Color panelColor = Color.white;
//	private final JButton titleButton;
//	private final JButton resetButton;
//	private final JButton searchButton;
//
//	private final JPanel titlePanel;
//	private final JPanel countryPanel;
//	private final JPanel countryTypePanel;
//	private final JPanel countrySuperPanel;
//	private final JPanel countryTablePanel;
//
//	private final JLabel chooseCountryTypeLabel;
//	private final JLabel chooseCountrySuperLabel;
//	private final JLabel titleTableLabel;
//
//	private final ButtonGroup buttonGroup;
//
//	private final JRadioButton worldRadioButton;
//	private final JRadioButton continentRadioButton;
//	private final JRadioButton nationRadioButton;
//
//	private final JComboBox<String> continentComboBox;
//
//	private final Vector<String> countryNameVector = new Vector<>();
//	private final Map<String, String> countryNameMap = new HashMap<>();
//
//	private final JTable countryTable;
//	private final Vector<String> countryTableColumnName = new Vector<>();
//	private final Vector<Vector<String>> countryTableData = new Vector<>();
//
//	private final JScrollPane scrollPane;
//
//	private JPanel infoPanel;
//	private JLabel label;
//	private String countryType = null;
//	private String superCountryID = null;
//
//	private Integer columnIndex;
//	private Integer rowIndex;
//
//
//	public SearchCountryPanel()
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
//		string = null;
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
//						countryPanel,
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
//		 * BOTTONE DI RESET PER COUNTRY PANEL
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
//						new SearchCountryPanel(),
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
//		 * PANEL SCELTA PAESE
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
//		countryPanel = new JPanel(migLayout);
//		countryPanel.setOpaque(false);
//
//		add(countryPanel, "dock center, sgx general");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * LABEL PANEL RICERCA TIPO PAESE
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		string = GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("countryType");
//		string = string.toUpperCase();
//
//		chooseCountryTypeLabel = new JLabel(string, SwingConstants.LEADING);
//
//		chooseCountryTypeLabel.setOpaque(true);
//		chooseCountryTypeLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		chooseCountryTypeLabel.setForeground(Color.white);
//
//		chooseCountryTypeLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		countryPanel.add(chooseCountryTypeLabel, "sgx panel_first_column");
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
//		countryPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL SCELTA PAESE
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
//		countryTypePanel = new JPanel(migLayout);
//
//		countryTypePanel.setBackground(panelColor);
//
//		countryPanel.add(countryTypePanel, "sgx panel_first_column");
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
//		worldRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		countryTypePanel.add(worldRadioButton);
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
//				countryType = Country.COUNTRY_TYPE.WORLD.toString();
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
//		continentRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		countryTypePanel.add(continentRadioButton);
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
//				countryType = Country.COUNTRY_TYPE.CONTINENT.toString();
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
//
//		nationRadioButton.setCursor(GuiConfiguration.getButtonCursor());
//
//		countryTypePanel.add(nationRadioButton);
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
//					continentComboBox.setEnabled(true);
//
//					countryType = Country.COUNTRY_TYPE.NATION.toString();
//				}
//				else {
//					continentComboBox.setEnabled(false);
//					continentComboBox.setSelectedIndex(-1);
//					superCountryID = null;
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
//		countryPanel.add(infoPanel, "sgx panel_second_column");
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
//		string = "Scegli continente che contiene la nazione"; //TODO I18N
//		string = string.toUpperCase();
//
//		chooseCountrySuperLabel = new JLabel(string, SwingConstants.LEADING);
//
//		chooseCountrySuperLabel.setOpaque(true);
//		chooseCountrySuperLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		chooseCountrySuperLabel.setForeground(Color.white);
//
//		chooseCountrySuperLabel.setBorder(GuiConfiguration.getSearchLabelBorder());
//
//		countryPanel.add(chooseCountrySuperLabel, "sgx panel_first_column");
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
//		countryPanel.add(label, "sgx panel_second_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL SCELTA PAESE SUPER
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
//		countrySuperPanel = new JPanel(migLayout);
//		countrySuperPanel.setBackground(panelColor);
//
//		countryPanel.add(countrySuperPanel, "sgx panel_first_column");
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * COMBOBOX DEI PAESI SUPER DELLE NAZIONI
//		 *------------------------------------------------------------------------------------------------------*/
//
//
//
//		continentComboBox = new JComboBox<>();
//		continentComboBox.setEnabled(false);
//		continentComboBox.setCursor(GuiConfiguration.getButtonCursor());
//
//		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
//
//		countrySuperPanel.add(continentComboBox);
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
//				GuiConfiguration.fillCountryComboBox
//					(
//						continentComboBox,
//						countryNameVector,
//						countryNameMap,
//						Country.COUNTRY_TYPE.CONTINENT.toString(),
//						null,
//						true
//					);
//			}
//			@Override
//			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
//			{
//				superCountryID = GuiConfiguration.getSelectedItemIDComboBox(continentComboBox, countryNameMap);
//			}
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
//		countryPanel.add(infoPanel, "sg panel_second_column");
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
//		countryPanel.add(searchButton, "span 2");
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
//				@Override
//				public void actionPerformed(ActionEvent e)
//				{
//					fillCountryTable();
//
//					GuiConfiguration.setTitleTable
//						(
//							titleTableLabel,
//							GuiConfiguration.getMessage("countries"),
//							countryTableData.size()
//						);
//
//					getRootPanel().revalidate();
//				}
//		});
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//
//		/*--------------------------------------------------------------------------------------------------------
//		 * PANEL TABELLA PAESI
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
//		countryTablePanel = new JPanel(migLayout);
//		countryTablePanel.setBackground(panelColor);
//
//		add(countryTablePanel);
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
//		countryTablePanel.add(titleTableLabel);
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
//		countryTable = new JTable();
//
//		countryTable.setRowHeight(GuiConfiguration.getTableRowHeight());
//		countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());
//		countryTable.setFillsViewportHeight(true);
//
//		countryTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//		countryTable.setAutoCreateRowSorter(true);
//		( (DefaultTableCellRenderer) countryTable.getTableHeader().getDefaultRenderer()
//		).setHorizontalAlignment(SwingConstants.CENTER);
//
//
//		//countryTable.setCellSelectionEnabled(true);
//
//		countryTable.getColumnModel().getSelectionModel().addListSelectionListener(new ListSelectionListener() {
//			@Override
//			public void valueChanged(ListSelectionEvent e)
//			{
//				setColumnIndex(countryTable.convertColumnIndexToModel(countryTable.getSelectedColumn()));
//			}
//		});
//
//
//		countryTable.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
//			@Override
//			public void valueChanged(ListSelectionEvent e)
//			{
//				setRowIndex( countryTable.convertRowIndexToModel(countryTable.getSelectedRow()));
//			}
//		});
//
//		countryTable.addMouseListener(new MouseAdapter() {
//			@Override
//			public void mouseClicked(MouseEvent e)
//			{
//				if (e.getClickCount() >= 1) {
//					printTableIndex();
//				}
//			}
//		});
//
//
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
//		scrollPane = new JScrollPane(countryTable);
//
//		countryTablePanel.add(scrollPane);
//		/*------------------------------------------------------------------------------------------------------*/
//	}
//
//
//	public void getCountryTableData(Vector<String> tableColumnName,
//									Vector<Vector<String>> tableData,
//									String countryType,
//									String superCountryID)
//	{
//		tableData.clear();
//		tableColumnName.clear();
//
//		Controller.getInstance().setCountryTable
//			(
//				tableColumnName,
//				tableData,
//				countryType,
//				superCountryID
//			);
//	}
//
//	public void fillCountryTable()
//	{
//		getCountryTableData(countryTableColumnName, countryTableData, countryType, superCountryID);
//
//		GuiConfiguration.fillTable(countryTable, countryTableData, countryTableColumnName);
//	}
//
//
//	public Integer getColumnIndex()
//	{
//		return columnIndex;
//	}
//
//	public Integer getRowIndex()
//	{
//		return rowIndex;
//	}
//
//	public void setColumnIndex(Integer columnIndex)
//	{
//		this.columnIndex = columnIndex;
//	}
//
//
//	public void setRowIndex(Integer rowIndex)
//	{
//		this.rowIndex = rowIndex;
//	}
//
//	public void printTableIndex()
//	{
//		System.out.println("Row: " + getRowIndex() + " / " + "Column: " + getColumnIndex());
//	}
//
//
//	public JPanel getRootPanel() { return this; }
//}
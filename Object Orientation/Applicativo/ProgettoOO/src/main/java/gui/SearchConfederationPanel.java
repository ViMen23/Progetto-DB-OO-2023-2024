//package gui;
//
//import controller.Controller;
//import model.Country;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import javax.swing.event.ListDataListener;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Objects;
//import java.util.Vector;
//
//public class SearchConfederationPanel
//	extends JPanel
//{
//	protected JPanel confederationPanel;
//	protected JPanel confederationTablePanel;
//
//	protected JRadioButton worldRadioButton;
//	protected JRadioButton continentRadioButton;
//	protected JRadioButton nationRadioButton;
//
//	protected JComboBox<String> worldComboBox;
//	protected JComboBox<String> continentComboBox;
//	protected JTable confederationTable;
//
//
//	protected JLabel titleLabel;
//	protected JLabel searchLabel;
//	protected ButtonGroup buttonGroup;
//	protected JScrollPane scrollPane;
//	protected JButton searchButton;
//
//	protected Color panelColor = Color.white;
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
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("confederationsList");
//		string += " - ";
//		string += Controller.getControllerInstance().countConfederations().toString();
//		string += " ";
//		string += GuiConfiguration.getMessage("results");
//		string = string.toUpperCase();
//
//		titleLabel = new JLabel(string, SwingConstants.LEADING);
//
//		titleLabel.setOpaque(true);
//		titleLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		titleLabel.setForeground(Color.white);
//		titleLabel.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(titleLabel);
//
//		/*
//		 * Campo ricerca per paese che contiene: label
//		 */
//		string = GuiConfiguration.getMessage("searchBy");
//		string += " ";
//		string += GuiConfiguration.getMessage("confederation");
//		string = string.toUpperCase();
//
//		searchLabel = new JLabel(string);
//		searchLabel.setOpaque(true);
//		searchLabel.setBackground(GuiConfiguration.getSearchPanelColor());
//		searchLabel.setForeground(Color.white);
//
//		add(searchLabel);
//
//		/*
//		 * Campo ricerca per paese e confederazione: checkBox
//		 */
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"20[]30:push[]20",
//				"10[]20[]20[]10"
//			);
//
//		confederationPanel = new JPanel(migLayout);
//		confederationPanel.setBackground(panelColor);
//
//		add(confederationPanel);
//
//		/*
//		 * Campo mondo: radio button
//		 */
//		string = GuiConfiguration.getMessage("world");
//		string = StringUtils.capitalize(string);
//
//		worldRadioButton = new JRadioButton(string);
//
//		confederationPanel.add(worldRadioButton);
//
//		/*
//		 * Campo mondo: comboBox
//		 */
//		worldComboBox = new JComboBox<String>();
//
//		worldComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		worldComboBox.setEnabled(false);
//		worldComboBox.setPrototypeDisplayValue("xxxxxxxxxxxxxxxxxxxx");
//
//		confederationPanel.add(worldComboBox);
//
//		/*
//		 * Campo continente: radio button
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		continentRadioButton = new JRadioButton(string);
//
//		continentRadioButton.addActionListener
//			(
//				new ActionListener() {
//					@Override
//					public void actionPerformed(ActionEvent e) {
//						if(!searchButton.isEnabled()){
//							searchButton.setEnabled(true);
//						}
//						if(continentComboBox.isEnabled()){
//							continentComboBox.setEnabled(false);
//							continentComboBox.setSelectedIndex(-1);
//						}
//					}
//				}
//			);
//
//		confederationPanel.add(continentRadioButton);
//		/*
//		 * Campo continente: combo box
//		 */
//		continentComboBox = new JComboBox<String>();
//
//		continentComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		continentComboBox.setEnabled(false);
//		continentComboBox.setPrototypeDisplayValue("xxxxxxxxxxxxxxxxxxxx");
//
//		confederationPanel.add(continentComboBox);
//
//		/*
//		 * Campo nazione: radio button
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		nationRadioButton = new JRadioButton(string);
//
//		nationRadioButton.addActionListener
//		(
//			new ActionListener() {
//				@Override
//				public void actionPerformed(ActionEvent e) {
//					if(!searchButton.isEnabled()){
//						searchButton.setEnabled(true);
//					}
//					if(!continentComboBox.isEnabled()){
//						continentComboBox.setEnabled(true);
//					}
//
//					if(continentComboBox.getItemCount() == 0) {
//						ArrayList<String> nameCountry = Controller.getControllerInstance().getStringCountryComboBox("World");
//						continentComboBox.setModel(new DefaultComboBoxModel<String>(nameCountry));
//					}
//					continentComboBox.setSelectedIndex(0);
//				}
//			}
//		);
//
//		confederationPanel.add(nationRadioButton);
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
//		searchButton.addActionListener
//			(
//				new ActionListener() {
//					@Override
//					public void actionPerformed(ActionEvent e) {
//
//						if( continentRadioButton.isSelected() ) {
//							Controller.getControllerInstance().subCountries("World");
//
//							List<List<String>> data = Controller.getControllerInstance().getCountryDataTable();
//
//							confederationTable.setModel(new TableModel("countries", data));
//						}
//						else if(nationRadioButton.isSelected()){
//							String continent = (String) continentComboBox.getSelectedItem();
//							Controller.getControllerInstance().subCountries(continent);
//
//							List<List<String>> data = Controller.getControllerInstance().getCountryDataTable();
//
//							confederationTable.setModel(new TableModel("countries", data));
//						}
//
//						confederationTable.setPreferredScrollableViewportSize(confederationTable.getPreferredSize());
//
//						confederationTable.revalidate();
//					}
//				}
//			);
//
//		add(searchButton);
//
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
//		confederationTable = new JTable(new TableModel("confederations", null));
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
//	}
//}

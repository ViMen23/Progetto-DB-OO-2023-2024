//package gui;
//
//import net.miginfocom.swing.MigLayout;
//
//import javax.swing.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//
//public class ResultSearchPanel
//				extends JPanel
//{
//	protected JLabel label;
//	protected JTable table;
//	protected JScrollPane scrollPane;
//
//
//
//	public ResultSearchPanel(String searchTable, Integer countSearch)
//	{
//
//		String string;
//		MigLayout migLayout;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowy",
//				"[]",
//				"10[]20[]10"
//			);
//
//		setLayout(migLayout);
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		string = GuiConfiguration.getMessage("result");
//		string += " ";
//		string += GuiConfiguration.getMessage(searchTable);
//		string += " - ";
//		string += Integer.toString(countSearch);
//		string += " ";
//		string += GuiConfiguration.getMessage("countResult");
//		string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//
//		/*
//		 * Campo tabella risultati ricerca: table
//		 */
//		searchTable = "competitions";
//
//		table = new JTable(new TableModel(searchTable, null));
//
//		table.setFillsViewportHeight(true);
//		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//		table.setAutoCreateRowSorter(true);
//
//		/*
//		 * Campo barra di scorrimento: jScrollPane
//		 */
//		scrollPane = new JScrollPane(table);
//
//		add(scrollPane);
//
//	}
//}

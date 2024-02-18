//
//package gui;
//
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//
///**
// * TYPE : class - gui package
// * NAME : UserSearchCompetitionPanel
// *
// * DESC: TODO
// */
//
//public class SearchNationConfederationPanel
//				extends JPanel
//{
//
//	protected JLabel label;
//	protected JComboBox<String> comboBox;
//
//	public SearchNationConfederationPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"20[]30:push[]20",
//				"10[]20[]10"
//			);
//
//		setLayout(migLayout);
//
//		/*
//		 * Campo mondo: stampa
//		 */
//		string = GuiConfiguration.getMessage("world");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo mondo: comboBox
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//
//		/*
//		 * Campo continente: stampa
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo continente: comboBox
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//
//		/*
//		 * Campo nazione: stampa
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo nazione: comboBox
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//	}
//}

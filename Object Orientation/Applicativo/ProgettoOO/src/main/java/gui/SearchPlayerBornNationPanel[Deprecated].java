//
//package gui;
//
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//import javax.swing.*;
//
///**
// * TYPE : class - gui package
// * NAME : UserSearchCompetitionPanel
// *
// * DESC: TODO
// */
//
//public class SearchPlayerBornNationPanel
//				extends JPanel
//{
//	protected JLabel label;
//	protected JComboBox<String> comboBox;
//
//	protected String string;
//
//	public SearchPlayerBornNationPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"[]30[]",
//				"10[]20[]10"
//			);
//
//
//		setLayout(migLayout);
//
//		/*
//		 * Campo ricerca per paese di nascita continente: stampa
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo ricerca per paese di nascita continente: stampa
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//
//
//		/*
//		 * Campo ricerca per paese di nascita nazione: stampa
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo ricerca per paese di nascita nazione: stampa
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//
//	}
//
//}

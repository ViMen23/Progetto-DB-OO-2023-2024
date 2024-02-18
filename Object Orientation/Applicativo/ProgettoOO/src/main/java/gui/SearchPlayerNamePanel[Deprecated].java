//package gui;
//
//import javax.swing.*;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
///**
// * TYPE : class - gui package
// * NAME : UserSearchCompetitionPanel
// *
// * DESC: TODO
// */
//
//public class SearchPlayerNamePanel
//				extends JPanel
//{
//	protected JLabel label;
//	protected JTextField textField;
//
//	public SearchPlayerNamePanel()
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
//		setLayout(migLayout);
//
//		/*
//		 * Campo nome: stampa
//		 */
//		string = GuiConfiguration.getMessage("name");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo testo: input
//		 */
//		textField = new JTextField(GuiConfiguration.getInputColumn());
//
//		add(textField);
//
//		/*
//		 * Campo cognome: stampa
//		 */
//		string = GuiConfiguration.getMessage("surname");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo testo: input
//		 */
//		textField = new JTextField(GuiConfiguration.getInputColumn());
//
//		add(textField);
//
//	}
//
//}
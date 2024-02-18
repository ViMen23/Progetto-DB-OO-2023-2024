//
//package gui;
//
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
//public class SearchCompetitionNamePanel
//				extends JPanel
//{
//
//	protected JLabel label;
//	protected JTextField textField;
//
//
//	public SearchCompetitionNamePanel()
//	{
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]30:push[]20",
//				"10[]10"
//			);
//
//		setLayout(migLayout);
//
//
//		/*
//		 * Campo nome: stampa
//		 */
//
//		string = GuiConfiguration.getMessage("name");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo nome: textfield
//		 */
//
//		textField = new JTextField(GuiConfiguration.getInputColumn());
//
//		add(textField);
//	}
//}

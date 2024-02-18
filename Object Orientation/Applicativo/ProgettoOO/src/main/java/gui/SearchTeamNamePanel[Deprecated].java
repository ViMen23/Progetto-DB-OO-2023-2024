//package gui;
//
//import javax.swing.*;
//
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
//public class SearchTeamNamePanel
//				extends JPanel
//{
//	protected JLabel label;
//	protected JTextField textField;
//	protected JCheckBox checkBox;
//
//
//	public SearchTeamNamePanel()
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
//		 * Campo nome esteso: stampa
//		 */
//		string = GuiConfiguration.getMessage("longName");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo nome esteso: textfield
//		 */
//		textField = new JTextField(GuiConfiguration.getInputColumn());
//
//		add(textField);
//
//		/*
//		 * Campo nome abbreviato: stampa
//		 */
//		string = GuiConfiguration.getMessage("shortName");
//		string = StringUtils.capitalize(string);
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo nome abbreviato: textfield
//		 */
//		textField = new JTextField(GuiConfiguration.getInputColumn());
//
//		add(textField);
//	}
//}

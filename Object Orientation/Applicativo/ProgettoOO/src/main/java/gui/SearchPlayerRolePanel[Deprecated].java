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
//
//public class SearchPlayerRolePanel
//				extends JPanel
//
//{
//	protected JLabel label;
//	protected JRadioButton radioButton;
//	protected JCheckBox checkBox;
//	protected ButtonGroup buttonGroup;
//
//
//
//	public SearchPlayerRolePanel()
//	{
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, flowx",
//				"20[]50[]50[]50[]20",
//				"10[]10"
//			);
//
//		setLayout(migLayout);
//
//		/*
//		 * Campo ricerca per ruolo portiere: checkBox
//		 */
//		string = GuiConfiguration.getMessage("goalkeeper");
//		string = StringUtils.capitalize(string);
//
//		checkBox = new JCheckBox(string);
//
//		add(checkBox);
//
//		/*
//		 * Campo ricerca per ruolo difensore: checkBox
//		 */
//		string = GuiConfiguration.getMessage("defender");
//		string = StringUtils.capitalize(string);
//
//		checkBox = new JCheckBox(string);
//
//		add(checkBox);
//
//		/*
//		 * Campo ricerca per ruolo centrocampista: checkBox
//		 */
//		string = GuiConfiguration.getMessage("midfield");
//		string = StringUtils.capitalize(string);
//
//		checkBox = new JCheckBox(string);
//
//		add(checkBox);
//
//		/*
//		 * Campo ricerca per ruolo difensore: checkBox
//		 */
//		string = GuiConfiguration.getMessage("fowarder");
//		string = StringUtils.capitalize(string);
//
//		checkBox = new JCheckBox(string);
//
//		add(checkBox);
//	}
//}

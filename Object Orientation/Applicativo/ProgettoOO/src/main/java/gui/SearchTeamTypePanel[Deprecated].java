//package gui;
//
//
//import javax.swing.*;
//
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
///**
// * TYPE : class - gui package
// * NAME : SearchTeamTypePanel
// *
// * DESC: TODO
// */
//
//public class SearchTeamTypePanel
//				extends JPanel
//{
//	protected JRadioButton radioButton;
//	protected ButtonGroup buttonGroup;
//
//
//	public SearchTeamTypePanel()
//	{
//		String string;
//		MigLayout migLayout;
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
//		buttonGroup = new ButtonGroup();
//
//		/*
//		 * Campo club: radio button
//		 */
//		string = GuiConfiguration.getMessage("club");
//		string = StringUtils.capitalize(string);
//
//		radioButton = new JRadioButton(string);
//
//		add(radioButton);
//
//		buttonGroup.add(radioButton);
//
//
//		/*
//		 * Campo nazionale: radio button
//		 */
//		string = GuiConfiguration.getMessage("national");
//		string = StringUtils.capitalize(string);
//
//		radioButton = new JRadioButton(string);
//
//		add(radioButton);
//
//		buttonGroup.add(radioButton);
//	}
//}

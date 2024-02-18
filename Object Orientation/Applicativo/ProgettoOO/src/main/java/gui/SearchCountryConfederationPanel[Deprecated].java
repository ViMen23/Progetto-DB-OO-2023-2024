//
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
//public class SearchCountryConfederationPanel
//				extends JPanel
//{
//
//	protected JComboBox<String> comboBox;
//	protected JRadioButton radioButton;
//	protected ButtonGroup buttonGroup;
//
//	public SearchCountryConfederationPanel()
//	{
//
//		MigLayout migLayout;
//		String string;
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"20[]30:push[]20",
//				"10[]20[]20[]10"
//			);
//
//		setLayout(migLayout);
//
//		buttonGroup = new ButtonGroup();
//
//		/*
//		 * Campo mondo: radio button
//		 */
//		string = GuiConfiguration.getMessage("world");
//		string = StringUtils.capitalize(string);
//
//		radioButton = new JRadioButton(string);
//
//		add(radioButton);
//
//		buttonGroup.add(radioButton);
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
//		 * Campo continente: radio button
//		 */
//		string = GuiConfiguration.getMessage("continent");
//		string = StringUtils.capitalize(string);
//
//		radioButton = new JRadioButton(string);
//
//		add(radioButton);
//
//		buttonGroup.add(radioButton);
//
//		/*
//		 * Campo continente: combo box
//		 */
//
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//
//		/*
//		 * Campo nazione: radio button
//		 */
//		string = GuiConfiguration.getMessage("nation");
//		string = StringUtils.capitalize(string);
//
//		radioButton = new JRadioButton(string);
//
//		add(radioButton);
//
//		buttonGroup.add(radioButton);
//
//		/*
//		 * Campo nazione: combo box
//		 */
//		comboBox = new JComboBox<String>();
//		comboBox.setEditable(true);
//		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
//		comboBox.setSelectedIndex(-1);
//
//		add(comboBox);
//	}
//}

//package gui;
//
//import net.miginfocom.swing.MigLayout;
//import javax.swing.*;
//
///**
// * TYPE : class - gui package
// * NAME : ChoosePanel
// *
// * DESC: Pannello per costruire un'interfaccia con nome campo da scegliere
// * 			 e lista di elementi tra cui scegliere
// */
//public class ChoosePanel
//				extends JPanel
//{
//	protected JLabel label;
//	protected JComboBox<String> comboBox;
//
//	public ChoosePanel(String toChoose)
//	{
//		MigLayout migLayout;
//
//		migLayout = new MigLayout
//			(
//				"debug, insets 10 0 10 0, center",
//				"30[]20[]30",
//				"[center]"
//			);
//
//		setLayout(migLayout);
//
//		/*
//		 * Campo scelta: stampa
//		 */
//		label = new JLabel(toChoose, SwingConstants.LEADING);
//
//		add(label);
//
//		/*
//		 * Campo scelta: comboBox
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

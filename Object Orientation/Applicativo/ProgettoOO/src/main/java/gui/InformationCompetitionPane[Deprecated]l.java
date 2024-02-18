//
//package gui;
//
//import controller.Controller;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//import javax.swing.*;
//import java.awt.*;
//
//public class InformationCompetitionPanel
//				extends JPanel
//{
//
//	protected JLabel label;
//
//
//	public InformationCompetitionPanel()
//	{
//		String string;
//		MigLayout migLayout;
//
//		migLayout = new MigLayout
//			(
//				"debug, wrap 2",
//				"10[]40[]",
//				"10[]0[fill]10[]10[]10[]10[]10"
//			);
//
//		setLayout(migLayout);
//		setBackground(Color.white);
//
//
//		/*
//		 * Campo titolo: stampa
//		 */
//		 string = GuiConfiguration.getMessage("competition");
//		 string += ": ";
//		 string = string.toUpperCase();
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//
//		/*
//		 * Campo valore titolo: stampa
//		 */
//		string = "Serie A";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//
//
//		/*
//		 * Campo separatore titolo: bordo
//		 */
//		label = new JLabel();
//		label.setBorder(GuiConfiguration.getLabelBorder());
//
//		add(label, "spanx 2");
//
//
//		/*
//		 * Campo tipo: stampa
//		 */
//		string = GuiConfiguration.getMessage("competitionType");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//
//		/*
//		 * Campo valore tipo: stampa
//		 */
//
//		string = "CAMPIONATO-CLUB";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//
//
//		/*
//		 * Campo frequenza: stampa
//		 */
//		string = GuiConfiguration.getMessage("frequency");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//
//		/*
//		 * Campo valore frequenza: stampa
//		 */
//		string = "1";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//
//
//		/*
//		 * Campo paese: stampa
//		 */
//		string = GuiConfiguration.getMessage("country");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//
//		/*
//		 * Campo valore paese:  stampa
//		 */
//		string = "Italia";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//
//
//		/*
//		 * Campo confederazione: stampa
//		 */
//		string = GuiConfiguration.getMessage("confederation");
//		string = StringUtils.capitalize(string);
//		string += ": ";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//
//		add(label);
//
//
//		/*
//		 * Campo confederazione: stampa
//		 */
//		string = "Federazione giuco calcio";
//
//		label = new JLabel(string, SwingConstants.LEADING);
//		label.setFont(GuiConfiguration.getOutputBoldFont());
//
//		add(label);
//	}
//}

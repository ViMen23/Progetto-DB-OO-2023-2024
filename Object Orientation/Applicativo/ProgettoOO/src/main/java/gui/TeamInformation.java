package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;


public class TeamInformation
				extends JPanel
{
	protected JLabel label;


	public TeamInformation()
	{

		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[grow, fill]40[grow, fill]10",
				"10[]0[]10[]10[]10[]10[]10"
			);

		setLayout(migLayout);

		/*
		 * Campo titolo: stampa
		 */
		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);

		/*
		 * Campo valore titolo: stampa
		 */
		string = "SSC Napoli";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);

		/*
		 * Campo separatore titolo: stampa
		 */
		label = new JLabel();
		label.setBorder(GuiConfiguration.getLabelBorder());

		add(label, "spanx 2");

		/*
		 * Campo nome abbreviato: stampa
		 */
		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		add(label);

		/*
		 * Campo nome abbreviato: stampa
		 */
		string = "NAP";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);

		/*
		 * Campo tipo squadra: stampa
		 */
		string = GuiConfiguration.getMessage("teamType");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		add(label);

		/*
		 * Campo valore tipo squadra: stampa
		 */
		string = "CLUB";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);

		/*
		 * Campo paese: stampa
		 */
		string = GuiConfiguration.getMessage("country");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		add(label);

		/*
		 * Campo valore paese: stampa
		 */
		string = "ITALIA WITH FLAG";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);


		/*
		 * Campo confederazione: stampa
		 */
		string = GuiConfiguration.getMessage("confederation");
		string = StringUtils.capitalize(string);
		string += ": ";

		label = new JLabel(string, SwingConstants.LEADING);

		add(label);

		/*
		 * Campo valore confederazione: stampa
		 */
		string = "FEDERAZIONE GIUOCO CALCIO";

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);
	}
}

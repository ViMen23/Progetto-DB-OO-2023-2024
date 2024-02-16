/*
package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.util.ResourceBundle;
*/
/*
public class TeamInformation
				extends JPanel
{
	protected JLabel label;
	protected JButton button;

	protected String tmp;


	public TeamInformation(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		setBackground(Color.white);

		Font outputBoldFont = this.getFont().deriveFont(Font.BOLD);

		GridBagConstraints gbc;
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));


		//Titolo squadra
		tmp = currentLocale.getString("team").toUpperCase()  + ": ";

		JLabel label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(label, gbc);

		//Valore nome squadra

		tmp = "SSC Napoli";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 40, 0, 0);

		add(label, gbc);


		//Separatore

		label = new JLabel();
		label.setBorder(labelBorder);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 2;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 0, 0, 0);

		add(label, gbc);

		// acronimo

		tmp = StringUtils.capitalize(currentLocale.getString("shortName")) + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 10, 0, 0);

		add(label, gbc);

		// acrononimo valore

		tmp = "NAP";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 2;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 40, 0, 0);

		add(label, gbc);

		//Tipo squadra

		tmp = StringUtils.capitalize(currentLocale.getString("teamType")) + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 10, 0, 0);

		add(label, gbc);


		//Tipo valore squadra

		tmp = "CLUB";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 3;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 40, 0, 0);

		add(label, gbc);


		//Tipo paese squadra

		tmp = StringUtils.capitalize(currentLocale.getString("country")) + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 10, 10, 0);

		add(label, gbc);

		//Tipo paese squadra

		tmp = "ITALIA WITH FLAG";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(0, 40, 10, 0);

		add(label, gbc);



		//Bottone trofei







	}
}
*/
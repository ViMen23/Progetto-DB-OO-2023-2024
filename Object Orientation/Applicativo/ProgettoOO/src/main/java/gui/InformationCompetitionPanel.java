package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.util.ResourceBundle;

public class InformationCompetitionPanel
				extends JPanel
{
	protected JLabel label;


	final static float outputFontSize = 15;
	final static float inputFontSize = 15;

	public InformationCompetitionPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		setBackground(Color.white);

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font outputBoldFont = outputFont.deriveFont(Font.BOLD);

		GridBagConstraints gbc;
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));


		//Titolo competizione label

		String tmp = currentLocale.getString("competition").toUpperCase() + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(label, gbc);

		// separatore

		label = new JLabel();
		label.setBorder(labelBorder);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 2;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.insets = new Insets(0, 0, 0, 0);

		add(label, gbc);

		//Titolo competizione valore label
		tmp = "Serie A";

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


		// tipo e tipo squadra label
		tmp = currentLocale.getString("competitionType") + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(label, gbc);

		//tipo e tipo squadra valore label
		tmp = "CAMPIONATO-CLUB";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 2;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 40, 0, 0);

		add(label, gbc);


		//frequenza label
		tmp = currentLocale.getString("frequency") + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(label, gbc);

		//frequenza valore label
		tmp = "1";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 3;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 40, 0, 0);

		add(label, gbc);


		//paese label
		tmp = currentLocale.getString("country") + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(label, gbc);

		//paese valore label
		tmp = "Italia";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 40, 0, 0);

		add(label, gbc);


		//confederazione label
		tmp = currentLocale.getString("confederation") + ": ";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 5;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(label, gbc);

		//confederazione valore label
		tmp = "Federazione giuco calcio";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 5;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 40, 0, 0);

		add(label, gbc);


	}
}

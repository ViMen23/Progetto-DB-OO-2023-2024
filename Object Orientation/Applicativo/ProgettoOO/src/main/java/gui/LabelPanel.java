package gui;

import javax.swing.*;
import java.awt.*;

public class LabelPanel
				extends JPanel
{
	private final JLabel label;
	public LabelPanel(JLabel label)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,0,0),
										0, 0
						);

		this.label = label;

		add(this.label, gbc);
	}

	public JLabel getLabel()
	{
		return label;
	}
}

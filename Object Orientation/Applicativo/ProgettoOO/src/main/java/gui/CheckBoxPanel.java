package gui;

import javax.swing.*;
import java.awt.*;

public class CheckBoxPanel
				extends JPanel
{
	private final JCheckBox checkBox;
	public CheckBoxPanel(JCheckBox checkBox)
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

		this.checkBox = checkBox;

		add(this.checkBox, gbc);
	}

	public JCheckBox getCheckBox()
	{
		return checkBox;
	}
}

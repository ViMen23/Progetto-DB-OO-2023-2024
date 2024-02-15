package gui;

import javax.swing.*;
import java.awt.*;

public class ButtonPanel
				extends JPanel
{
	private final JButton button;
	public ButtonPanel(JButton button)
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

		this.button = button;

		add(this.button, gbc);
	}

	public JButton getButton()
	{
		return button;
	}
}

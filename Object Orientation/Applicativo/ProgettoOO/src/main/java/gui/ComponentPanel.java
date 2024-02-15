package gui;

import javax.swing.*;
import java.awt.*;

public class ComponentPanel
				extends JPanel
{
	private final JComponent component;
	public JPanel panel;
	public ComponentPanel(JComponent component)
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

		this.component = component;

		this.getC
		add(this.component, gbc);
	}

}

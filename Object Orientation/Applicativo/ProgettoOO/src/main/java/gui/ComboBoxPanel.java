package gui;

import javax.swing.*;
import java.awt.*;

public class ComboBoxPanel
				extends JPanel
{
	private final JComboBox<String> comboBox;
	public ComboBoxPanel(JComboBox<String> comboBox)
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

		this.comboBox = comboBox;

		add(this.comboBox, gbc);
	}

	public JComboBox<String> getComboBox()
	{
		return comboBox;
	}
}

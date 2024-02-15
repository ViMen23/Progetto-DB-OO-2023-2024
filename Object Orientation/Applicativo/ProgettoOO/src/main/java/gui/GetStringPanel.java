package gui;

import javax.swing.*;
import java.awt.*;

public class GetStringPanel
				extends JPanel
{
	protected JLabel label;
	protected JTextField textField;

	public GetStringPanel(String toPrint)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		label = new JLabel(toPrint);
		label.setFont(GuiConfiguration.getOutputFont());
		label.setName("label");

		gbc = new GridBagConstraints
						(
										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,0,30),
										0, 0
						);

		add(label, gbc);

		textField = new JTextField(GuiConfiguration.getInputColumn());
		textField.setFont(GuiConfiguration.getOutputFont());
		textField.setName("textField");

		gbc = new GridBagConstraints
						(
										1, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,0,0),
										0, 0
						);

		add(textField, gbc);

	}
}

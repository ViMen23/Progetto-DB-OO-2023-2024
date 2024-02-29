package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class LabelComboPanel
				extends JPanel
{
	private final MyComboBox myComboBox;
	public LabelComboPanel(String field,
												 JLabel ctrlLabel)
	{
		MigLayout migLayout;
		migLayout = new MigLayout(
						GuiConfiguration.chooseContinentLayoutConstraint,
						GuiConfiguration.chooseContinentColumnConstraint,
						GuiConfiguration.chooseContinentRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		JLabel label;
		label = new JLabel(field);
		this.add(label);

		this.myComboBox = new MyComboBox(false, ctrlLabel);
		this.add(myComboBox);
	}

	public MyComboBox getMyComboBox()
	{
		return myComboBox;
	}
}

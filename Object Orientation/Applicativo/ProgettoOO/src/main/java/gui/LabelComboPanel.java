package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.util.Vector;

public class LabelComboPanel
				extends JPanel
{
	private final MyComboBox myComboBox;
	public LabelComboPanel(String field,
												 Boolean enable,
												 JLabel ctrlLabel)
	{
		MigLayout migLayout;
		migLayout = new MigLayout(
						GuiConfiguration.chooseContinentLayoutConstraint,
						GuiConfiguration.chooseContinentColumnConstraint,
						GuiConfiguration.countryTypeRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		JLabel label;
		label = new JLabel(field);
		this.add(label);

		this.myComboBox = new MyComboBox(enable, ctrlLabel);
		this.add(myComboBox);
	}

	public LabelComboPanel(String field,
												 Boolean enable,
												 String rowConstraint,
												 JLabel ctrlLabel)
	{
		MigLayout migLayout;
		migLayout = new MigLayout(
						GuiConfiguration.chooseContinentLayoutConstraint,
						GuiConfiguration.chooseContinentColumnConstraint,
						rowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		JLabel label;
		label = new JLabel(field);
		this.add(label);

		this.myComboBox = new MyComboBox(enable, ctrlLabel);
		this.add(myComboBox);
	}


	public MyComboBox getMyComboBox()
	{
		return myComboBox;
	}
}

package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

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
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
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
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
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

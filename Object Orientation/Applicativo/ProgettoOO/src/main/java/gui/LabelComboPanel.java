package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;


/**
 * Questa classe rappresenta un pannello che combina una label e un combo box.
 */
public class LabelComboPanel
				extends JPanel
{
	private final MyComboBox myComboBox;
	public LabelComboPanel(String field,
												 Boolean enable,
												 JLabel ctrlLabel)
	{
		this(
						field,
						enable,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null,
						ctrlLabel
		);
	}

	public LabelComboPanel(String field,
												 Boolean enable,
												 String columnConstraint,
												 String rowConstraint,
												 JLabel ctrlLabel)
	{
		MigLayout migLayout;
		JLabel label;

		migLayout = new MigLayout(
						null,
						columnConstraint,
						rowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


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

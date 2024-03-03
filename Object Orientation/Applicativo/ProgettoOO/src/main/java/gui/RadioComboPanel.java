package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class RadioComboPanel
				extends JPanel
{
	private final MyComboBox myComboBox;
	private final JRadioButton radioButton;
	private final Boolean combo;
	public RadioComboPanel(String field,
												 JLabel ctrlLabelRadio,
												 JLabel ctrlLabelCombo,
												 Boolean combo)
	{
		this(field, GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT, ctrlLabelRadio, ctrlLabelCombo, combo);
	}

	public RadioComboPanel(String field,
												 String rowConstraint,
												 JLabel ctrlLabelRadio,
												 JLabel ctrlLabelCombo,
												 Boolean combo)
	{
		this.combo = combo;

		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						rowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		this.radioButton = new JRadioButton(GuiConfiguration.getMessage(field));
		this.add(radioButton);

		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				ctrlLabelRadio.setText(field);
			}
		});

		this.myComboBox = new MyComboBox(false, ctrlLabelCombo);
		if (combo) {
			this.add(myComboBox);
		} else {
			this.add(new JLabel());
		}

	}


	public MyComboBox getMyComboBox()
	{
		if (combo) {
			return myComboBox;
		} else {
			return null;
		}
	}

	public JRadioButton getRadioButton()
	{
		return radioButton;
	}
}

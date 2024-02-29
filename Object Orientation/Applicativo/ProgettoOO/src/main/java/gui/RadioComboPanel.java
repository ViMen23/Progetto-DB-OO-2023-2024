package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

public class RadioComboPanel
				extends JPanel
{
	private final MyComboBox myComboBox;
	private final Boolean combo;
	public RadioComboPanel(String field,
												 JLabel ctrlLabelRadio,
												 JLabel ctrlLabelCombo,
												 Boolean combo)
	{
		this.combo = combo;

		MigLayout migLayout;
		migLayout = new MigLayout(
						GuiConfiguration.chooseContinentLayoutConstraint,
						GuiConfiguration.chooseContinentColumnConstraint,
						GuiConfiguration.chooseContinentRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		JRadioButton radioButton;
		radioButton = new JRadioButton(field);
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
}

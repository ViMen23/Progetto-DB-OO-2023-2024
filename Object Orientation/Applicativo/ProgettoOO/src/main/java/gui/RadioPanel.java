package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class RadioPanel
				extends JPanel
{
	public RadioPanel(Enum[] enumArray,
										JLabel ctrlLabel)
	{
		MigLayout migLayout;
		ButtonGroup buttonGroup = new ButtonGroup();

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_SIZE_20P_INT_GAP_10P_LAYOUT_CONSTRAINT,
						null
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		if (2 == enumArray.length) {
			this.add(new JLabel());
		}

		for (int i = 0; i < enumArray.length; ++i) {
			JRadioButton radioButton;
			int j = i;

			radioButton = new JRadioButton(GuiConfiguration.getMessage(enumArray[i].toString()));
			buttonGroup.add(radioButton);
			this.add(radioButton);

			radioButton.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e)
				{
					ctrlLabel.setText(enumArray[j].toString());
				}
			});
		}
	}
	public RadioPanel(Enum[] enumArray,
										JLabel ctrlLabel,
										String selectedButton)
	{
		MigLayout migLayout;
		ButtonGroup buttonGroup = new ButtonGroup();

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_SIZE_20P_INT_GAP_10P_LAYOUT_CONSTRAINT,
						null
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		if (2 == enumArray.length) {
			this.add(new JLabel());
		}

		for (int i = 0; i < enumArray.length; ++i) {
			JRadioButton radioButton;
			int j = i;

			radioButton = new JRadioButton(GuiConfiguration.getMessage(enumArray[i].toString()));
			buttonGroup.add(radioButton);
			this.add(radioButton);

			radioButton.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {
					ctrlLabel.setText(enumArray[j].toString());
				}
			});

			if (GuiConfiguration.getMessage(enumArray[i].toString()).equalsIgnoreCase(selectedButton)) {
				radioButton.setSelected(true);
				radioButton.doClick();
			}
		}
	}
}

package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

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
			GuiConfiguration.countryTypeLayoutConstraint,
			GuiConfiguration.countryTypeColumnConstraint,
			GuiConfiguration.countryTypeRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		if (2 == enumArray.length) {
			this.add(new JLabel());
		}

		for (int i = 0; i < enumArray.length; ++i) {
			JRadioButton radioButton;
			int j = i;

			String string = enumArray[i].toString();
			string = string.toLowerCase();
			string = GuiConfiguration.getMessage(string);
			string = StringUtils.capitalize(string);

			radioButton = new JRadioButton(string);
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
}

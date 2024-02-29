package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class RadioChoicePanel
				extends JPanel
{
	public RadioChoicePanel(String title, JLabel control, ArrayList<String> radio)
	{
		MigLayout migLayout;

		migLayout = new MigLayout(
						"debug, fill",
						"[fill][][]",
						"[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		TitleLabel titleLabel;
		titleLabel = new TitleLabel(title);
		this.add(titleLabel, "spanx 3, wrap, grow");



		ButtonGroup buttonGroup = new ButtonGroup();

		JRadioButton radioButton;

		for (String r : radio) {
			radioButton = new JRadioButton(r);
			radioButton.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {
					control.setText(r);
				}
			});

			buttonGroup.add(radioButton);
			this.add(radioButton);
		}

	}
}

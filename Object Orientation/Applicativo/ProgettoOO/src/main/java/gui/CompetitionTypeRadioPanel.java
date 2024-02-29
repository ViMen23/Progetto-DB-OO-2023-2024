package gui;

import model.Competition;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CompetitionTypeRadioPanel
				extends JPanel
{
	public CompetitionTypeRadioPanel(JLabel controlLabel)
	{
		MigLayout migLayout;
		String string;

		ButtonGroup buttonGroup = new ButtonGroup();
		JRadioButton radioButton;

		migLayout = new MigLayout(
						GuiConfiguration.countryTypeLayoutConstraint,
						GuiConfiguration.countryTypeColumnConstraint,
						GuiConfiguration.countryTypeRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				controlLabel.setText(Competition.COMPETITION_TYPE.LEAGUE.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				controlLabel.setText(Competition.COMPETITION_TYPE.CUP.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				controlLabel.setText(Competition.COMPETITION_TYPE.SUPER_CUP.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);
	}
}

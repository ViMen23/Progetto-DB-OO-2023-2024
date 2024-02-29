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
	private String competitionType = null;

	public CompetitionTypeRadioPanel(String title)
	{
		MigLayout migLayout;
		String string;

		TitleLabel titleLabel;
		ButtonGroup buttonGroup = new ButtonGroup();
		JRadioButton radioButton;

		migLayout = new MigLayout(
						"debug, fill",
						"0[fill][][]0",
						"0[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		titleLabel = new TitleLabel(title);
		this.add(titleLabel, "spanx, wrap, grow");


		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				competitionType = Competition.COMPETITION_TYPE.LEAGUE.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				competitionType = Competition.COMPETITION_TYPE.CUP.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				competitionType = Competition.COMPETITION_TYPE.SUPER_CUP.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);
	}


	public String getCompetitionType()
	{
		return competitionType;
	}
}

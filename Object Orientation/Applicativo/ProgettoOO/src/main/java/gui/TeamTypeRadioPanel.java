package gui;

import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TeamTypeRadioPanel
				extends JPanel
{
	private String teamType = null;

	public TeamTypeRadioPanel(String title)
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


		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				teamType = Team.TEAM_TYPE.CLUB.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				teamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);
	}


	public String getTeamType()
	{
		return teamType;
	}
}

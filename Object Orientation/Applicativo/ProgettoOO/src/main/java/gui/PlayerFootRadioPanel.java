package gui;

import model.Country;
import model.Player;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class PlayerFootRadioPanel
				extends JPanel
{
	private String foot = null;

	public PlayerFootRadioPanel(String title)
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


		string = GuiConfiguration.getMessage("right");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				foot = Player.FOOT_TYPE.RIGHT.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				foot = Player.FOOT_TYPE.LEFT.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				foot = Player.FOOT_TYPE.EITHER.toString();
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);
	}

	public String getFoot()
	{
		return foot;
	}
}

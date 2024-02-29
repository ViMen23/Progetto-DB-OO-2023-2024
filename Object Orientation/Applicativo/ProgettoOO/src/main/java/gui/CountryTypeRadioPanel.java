package gui;

import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CountryTypeRadioPanel
				extends JPanel
{

	public CountryTypeRadioPanel(JLabel controlLabel)
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


		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				controlLabel.setText(Country.COUNTRY_TYPE.WORLD.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				controlLabel.setText(Country.COUNTRY_TYPE.CONTINENT.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);


		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);
		radioButton = new JRadioButton(string);
		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				controlLabel.setText(Country.COUNTRY_TYPE.NATION.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);
	}
}

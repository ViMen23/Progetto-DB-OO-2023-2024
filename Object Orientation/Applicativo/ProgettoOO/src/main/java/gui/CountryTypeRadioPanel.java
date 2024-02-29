package gui;

import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public abstract class CountryTypeRadioPanel
				extends JPanel
{

	public CountryTypeRadioPanel(String title)
	{
		MigLayout migLayout;
		String string;

		TitleLabel titleLabel;
		ButtonGroup buttonGroup = new ButtonGroup();
		JRadioButton radioButton;

		migLayout = new MigLayout(
						"debug, fill",
						"0[15%, fill]15%[15%]15%[15%]0",
						"0[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		titleLabel = new TitleLabel(title);
		this.add(titleLabel, "spanx, wrap, grow");


		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		radioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				setCountryType(Country.COUNTRY_TYPE.WORLD.toString());
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
				setCountryType(Country.COUNTRY_TYPE.CONTINENT.toString());
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
				setCountryType(Country.COUNTRY_TYPE.NATION.toString());
			}
		});

		buttonGroup.add(radioButton);
		this.add(radioButton);
	}

	abstract void setCountryType(String string);
}

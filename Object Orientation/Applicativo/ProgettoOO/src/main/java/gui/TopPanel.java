package gui;

import net.miginfocom.swing.MigLayout;

import org.apache.commons.lang3.StringUtils;

import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TopPanel
				extends JPanel
{
	protected JLabel logoLabel;
	protected JButton localeButton;
	protected JButton loginButton;

	public TopPanel()
	{
		ImageIcon imageIcon;
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
						(
										"debug",
										"5%[]50%[]5%[]5%",
										"[]"
						);

		setLayout(migLayout);
		setBackground(Color.white);


		/*
		 * Campo logo: stampa
		 */
		imageIcon = GuiConfiguration.createImageIcon("images/foogo3.png", 350, 75);

		logoLabel = new JLabel(imageIcon);

		add(logoLabel);


		/*
		 * Campo locale: bottone
		 */
		imageIcon = GuiConfiguration.createImageIcon("images/world2.png");

		localeButton = new JButton(imageIcon);

		localeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String string;
				string = "";
				string += GuiConfiguration.getMessage("choose");
				string += " ";
				string += GuiConfiguration.getMessage("locale");
				string = string.toUpperCase();

				JOptionPane.showOptionDialog
								(
												null,
												new ChooseLocalePanel(),
												string,
												JOptionPane.DEFAULT_OPTION,
												JOptionPane.PLAIN_MESSAGE,
												null,
												new Object[]{},
												null
								);
			}
		});

		add(localeButton);


		/*
		 * Campo login: bottone
		 */
		string = StringUtils.capitalize(GuiConfiguration.getMessage("login"));
		imageIcon = GuiConfiguration.createImageIcon("images/loginLogout.png");

		loginButton = new JButton(string, imageIcon);

		loginButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String string;
				string = "";
				string = GuiConfiguration.getMessage("adminLogin");
				string = string.toUpperCase();

				JOptionPane.showOptionDialog
								(
												null,
												new AdminLoginPanel(),
												string,
												JOptionPane.DEFAULT_OPTION,
												JOptionPane.PLAIN_MESSAGE,
												null,
												new Object[]{},
												null
								);
			}
		});

		add(loginButton);
	}

}
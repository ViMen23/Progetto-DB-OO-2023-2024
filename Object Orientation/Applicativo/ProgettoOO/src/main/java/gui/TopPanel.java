package gui;

import net.miginfocom.swing.MigLayout;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TopPanel
				extends JPanel
{
	public TopPanel()
	{
		final ImageIcon logoIcon = GuiConfiguration.createImageIcon("images/foogo3.png", 350, 75);
		final ImageIcon localeIcon = GuiConfiguration.createImageIcon("images/world2.png");
		final ImageIcon loginIcon = GuiConfiguration.createImageIcon("images/loginLogout.png");

		final JLabel logoLabel;
		final JButton localeButton;
		final JButton loginButton;

		MigLayout migLayout;

		migLayout = new MigLayout(
						"debug",
						"5%[]50%[]5%[]5%",//TODO
						"[]"
		);

		setLayout(migLayout);
		setBackground(Color.white);
		/*------------------------------------------------------------------------------------------------------*/

		logoLabel = new JLabel(logoIcon);
		add(logoLabel);
		/*------------------------------------------------------------------------------------------------------*/

		localeButton = new JButton(localeIcon);
		localeButton.setCursor(GuiConfiguration.HAND_CURSOR);
		add(localeButton);

		/*------------------------------------------------------------------------------------------------------*/

		localeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showOptionDialog(
								null,
								new ChooseLocalePanel(),
								GuiConfiguration.getMessage("chooseLanguage"),
								JOptionPane.DEFAULT_OPTION,
								JOptionPane.PLAIN_MESSAGE,
								null,
								new Object[]{},
								null
				);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		loginButton = new JButton(GuiConfiguration.getMessage("login"), loginIcon);
		loginButton.setCursor(GuiConfiguration.HAND_CURSOR);

		add(loginButton);

		/*------------------------------------------------------------------------------------------------------*/


		loginButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showOptionDialog(
								null,
								new AdminLoginPanel(),
								GuiConfiguration.getMessage("adminLogin"),
								JOptionPane.DEFAULT_OPTION,
								JOptionPane.PLAIN_MESSAGE,
								null,
								new Object[]{},
								null
				);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
	}
}
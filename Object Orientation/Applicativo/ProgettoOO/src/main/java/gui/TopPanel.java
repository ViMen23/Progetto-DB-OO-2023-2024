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
	private final ImageIcon logoIcon = GuiConfiguration.createImageIcon("images/foogo3.png", 350, 75);
	private final ImageIcon localeIcon = GuiConfiguration.createImageIcon("images/world2.png");
	private final ImageIcon loginIcon = GuiConfiguration.createImageIcon("images/loginLogout.png");

	private final JLabel logoLabel;
	private final JButton localeButton;
	private final JButton loginButton;

	public TopPanel()
	{
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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL LOGO
		 *------------------------------------------------------------------------------------------------------*/



		logoLabel = new JLabel(logoIcon);

		add(logoLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON LOCALE
		 *------------------------------------------------------------------------------------------------------*/



		localeButton = new JButton(localeIcon);
		localeButton.setCursor(GuiConfiguration.getButtonCursor());

		add(localeButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		localeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON LOGIN
		 *------------------------------------------------------------------------------------------------------*/



		string = StringUtils.capitalize(GuiConfiguration.getMessage("login"));

		loginButton = new JButton(string, loginIcon);
		loginButton.setCursor(GuiConfiguration.getButtonCursor());

		add(loginButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		loginButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
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
		/*------------------------------------------------------------------------------------------------------*/
	}
}
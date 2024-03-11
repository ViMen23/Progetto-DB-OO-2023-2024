package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

public class TopPanel
				extends JPanel
{
	public TopPanel()
	{
		final ImageIcon logoIcon = GuiConfiguration.createImageIcon("images/foogo3.png", 350, 75);
		final ImageIcon localeIcon = GuiConfiguration.createImageIcon("images/world2.png");
		final ImageIcon loginIcon = GuiConfiguration.createImageIcon("images/loginLogout.png");
		final JLabel ctrlLabel = new JLabel((String) null);

		final JLabel logoLabel;
		final JButton localeButton;
		final JButton loginButton;

		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						"5%[]50%[]5%[]5%",//TODO
						null
		);

		setLayout(migLayout);
		setBackground(Color.white);
		setPreferredSize(new Dimension(1500, 0));
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
				if (0 == StringUtils.compareIgnoreCase(loginButton.getText(), GuiConfiguration.getMessage("login"))) {
					JOptionPane.showOptionDialog(
									null,
									new AdminLoginPanel(ctrlLabel),
									GuiConfiguration.getMessage("adminLogin"),
									JOptionPane.DEFAULT_OPTION,
									JOptionPane.PLAIN_MESSAGE,
									null,
									new Object[]{},
									null
					);

					if(null != ctrlLabel.getText()) {
						loginButton.setText(GuiConfiguration.getMessage("logout"));
					}
				}
				else {
					Controller.getInstance().logoutAdmin();
					loginButton.setText(GuiConfiguration.getMessage("login"));
					ctrlLabel.setText(null);
					GuiConfiguration.resetHomeFrame();
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
	}
}
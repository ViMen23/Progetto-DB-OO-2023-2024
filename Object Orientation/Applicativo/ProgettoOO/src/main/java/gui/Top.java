package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class Top
				extends JPanel {
	protected JLabel label;
	protected JButton button;


	public Top(Controller controller)
	{
		MigLayout migLayout;
		ImageIcon imageIcon;
		String string;
		Font font;

		migLayout = new MigLayout
						(
										"debug",
										"30[]50:push[]30[]30",
										""
						);

		setLayout(migLayout);

		font = GuiConfiguration.getOutputFont();

		imageIcon = GuiConfiguration.createImageIcon("images/foogo3.png", 350, 75);

		label = new JLabel(imageIcon);
		label.setFont(font);

		add(label);

		imageIcon = GuiConfiguration.createImageIcon("images/world2.png", 30, 30);

		button = new JButton(imageIcon);
		add(button);

		string = GuiConfiguration.getMessage("login");
		imageIcon = GuiConfiguration.createImageIcon("images/loginLogout.png", 30, 30);

		button = new JButton(string, imageIcon);
		button.setFont(font);

		add(button);
	}
}
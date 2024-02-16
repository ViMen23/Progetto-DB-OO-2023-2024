package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Top
				extends JPanel
				implements ActionListener
{
	protected JLabel label;
	protected JButton button;


	public Top(Controller controller)
	{
		MigLayout migLayout;
		ImageIcon imageIcon;
		String string;

		migLayout = new MigLayout
						(
										"debug",
										"30[]50:push[]30[]30",
										""
						);

		setLayout(migLayout);


		imageIcon = GuiConfiguration.createImageIcon("images/foogo3.png", 350, 75);

		label = new JLabel(imageIcon);

		add(label);

		imageIcon = GuiConfiguration.createImageIcon("images/world2.png");

		button = new JButton(imageIcon);

		add(button);

		string = StringUtils.capitalize(GuiConfiguration.getMessage("login"));
		imageIcon = GuiConfiguration.createImageIcon("images/loginLogout.png");

		button = new JButton(string, imageIcon);
		button.setName("top+login");
		button.addActionListener(this);

		add(button);
	}

	@Override
	public void actionPerformed(ActionEvent e)
	{

		JComponent component = (JComponent) e.getSource();

		if (component.getName().equalsIgnoreCase("top+login")){
			JOptionPane.showMessageDialog(this, new AdminLoginPanel(Controller.getControllerInstance()).getRootPane(),
				"Pagina di Accesso", JOptionPane.DEFAULT_OPTION);
	}

	}
}
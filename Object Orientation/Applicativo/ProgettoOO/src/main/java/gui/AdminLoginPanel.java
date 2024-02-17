
package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

/**
 * TYPE : class - gui package
 * NAME : AdminLogin
 *
 * DESC: Classe per l'interfaccia grafica che permette il login di un amministratore dell'applicativo
 */

public class AdminLoginPanel
				extends JPanel
				implements ItemListener
{
	protected JLabel label;
	protected JTextField textField;
	protected JPasswordField passwordField;
	protected JButton button;
	protected JCheckBox checkBox;

	protected String string;

	public AdminLoginPanel(Controller controller)
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug",
				"30:push[center]30[right]30:push",
				"30:push[]20[]20[]20[]15[]30:push"
			);

		setLayout(migLayout);
		setName("login");

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: stampa
		 */

		string = GuiConfiguration.getMessage("username");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setName("login+usernameLabel");

		add(label, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: input
		 */

		textField = new JTextField(GuiConfiguration.getInputColumn());
		textField.setName("login+usernameTextField");

		add(textField, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: stampa
		 */

		string = GuiConfiguration.getMessage("password");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setName("login+passwordLabel");

		add(label, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: input
		 */

		passwordField = new JPasswordField(GuiConfiguration.getInputColumn());
		passwordField.setName("login+passwordField");

		add(passwordField, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Box mostra password
		 */

		string = Main.getMessage("show");
		string += " ";
		string += Main.getMessage("password");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setName("login+showPassword");
		checkBox.addItemListener(this);

		add(checkBox);

		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Bottone conferma login
		 */

		string = GuiConfiguration.getMessage("next");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setEnabled(false);
		button.setName("login+nextButton");

		add(button);
		/*------------------------------------------------------------------------------------------------------*/


	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{

		JComponent component = (JComponent) e.getSource();


		if (component.getName().equalsIgnoreCase("login+showPassword")) {

			JPasswordField passwordField1;

			component = Controller.getControllerInstance().getDestComp(component, "login+passwordField");

			passwordField1 = (JPasswordField) component;

			if (e.getStateChange() == ItemEvent.SELECTED) {
				passwordField1.setEchoChar((char) 0);
			} else {
				passwordField1.setEchoChar((char) UIManager.get("PasswordField.echoChar"));
			}

		}
	}


}

package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;


/**
 * TYPE : class - gui package
 * NAME : AdminLogin
 *
 * DESC: Classe per l'interfaccia grafica che permette il login di un amministratore dell'applicativo
 */

public class AdminLoginPanel implements ItemListener
{
	protected JLabel label;
	protected JTextField textField;
	protected JPasswordField passwordField;
	protected JButton button;
	protected JCheckBox checkBox;

	protected String string;
	protected JPanel panel;


	public AdminLoginPanel(Controller controller)
	{
		MigLayout migLayout;
		String string;

		panel = new JPanel();

		migLayout = new MigLayout
			(
				"debug",
				"30:push[center]30[right]30:push",
				"30:push[]20[]20[]20[]15[]30:push"
			);

		panel.setLayout(migLayout);
		panel.setName("login");

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: stampa
		 */

		string = GuiConfiguration.getMessage("username");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setName("login+usernameLabel");

		panel.add(label, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: input
		 */

		textField = new JTextField(GuiConfiguration.getInputColumn());
		textField.setName("login+usernameTextField");

		panel.add(textField, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: stampa
		 */

		string = GuiConfiguration.getMessage("password");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setName("login+passwordLabel");

		panel.add(label, "spanx 2, wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: input
		 */

		passwordField = new JPasswordField(GuiConfiguration.getInputColumn());
		passwordField.setName("login+passwordField");

		panel.add(passwordField, "spanx 2, wrap");
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

		panel.add(checkBox);

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

		panel.add(button);
		/*------------------------------------------------------------------------------------------------------*/


	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{
		JComponent component = (JComponent) e.getSource();


		if (component.getName().equalsIgnoreCase("login+showPassword")){

			JPasswordField passwordField1 = null;

			for(Component aComponent: component.getParent().getComponents() ) {

				if(aComponent.getName().equalsIgnoreCase("login+passwordField")){
					passwordField1 = (JPasswordField) aComponent;
					break;
				}
			}

			if(e.getStateChange() == ItemEvent.SELECTED){
				passwordField1.setEchoChar((char)0);
			}
			else{
				passwordField1.setEchoChar((char)UIManager.get("PasswordField.echoChar"));
			}

		}

	}

	public JPanel getRootPane()
	{
		return this.panel;
	}
}

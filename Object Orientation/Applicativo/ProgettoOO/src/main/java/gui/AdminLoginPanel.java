/*
package gui;

import controller.Controller;
import javax.swing.*;
import java.awt.*;

*/
/**
 * TYPE : class - gui package
 * NAME : AdminLogin
 *
 * DESC: Classe per l'interfaccia grafica che permette il login di un amministratore dell'applicativo
 */
/*
public class AdminLoginPanel
				extends JPanel
{
	protected JLabel label;
	protected JTextField textField;
	protected JPasswordField passwordField;
	protected JButton button;
	protected JCheckBox checkBox;

	protected String string;


	public AdminLoginPanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: stampa
		 */
/*
		string = GuiConfiguration.getMessage("username");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,0,0),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: input
		 */
/*
		textField = new JTextField(GuiConfiguration.getInputColumn());
		textField.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 1,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,0,0),
										0, 0
						);

		add(textField, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: stampa
		 */
/*
		string = GuiConfiguration.getMessage("password");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 2,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,0,0),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: input
		 */
/*
		passwordField = new JPasswordField(GuiConfiguration.getInputColumn());
		passwordField.setEchoChar('#');
		passwordField.setFont(GuiConfiguration.getOutputFont());

		gbc.gridy = gbc.gridy + 1;

		add(passwordField, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Bottone conferma login
		 */
/*
		string = GuiConfiguration.getMessage("next");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setFont(GuiConfiguration.getOutputFont());
		button.setEnabled(false);

		gbc = new GridBagConstraints
						(

										0, 3,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,0,0),
										0, 0
						);

		add(button, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Box mostra password
		 */
/*
		string = Main.getMessage("show");
		string += " ";
		string += Main.getMessage("password");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 4,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,0,0),
										0, 0
						);

		add(checkBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/
/*
	}

}
*/
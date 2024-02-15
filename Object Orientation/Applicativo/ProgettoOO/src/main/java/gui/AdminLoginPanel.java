package gui;

import controller.Controller;
import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.*;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.regex.Matcher;

/**
 * TYPE : class - gui package
 * NAME : AdminLogin
 *
 * DESC: Classe per l'interfaccia grafica che permette il login di un amministratore dell'applicativo
 */
public class AdminLoginPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel label;
	protected JTextField textField;
	protected JPasswordField passwordField;
	protected JButton button;
	protected JCheckBox checkBox;

	protected ResourceBundle resourceBundle;
	protected Font font;
	protected String string;

	protected int inputColumn = 25;

	public AdminLoginPanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		resourceBundle = Main.getCurrentLocale();
		font = (Font) UIManager.get("defaultFont");

		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: stampa
		 */
		string = resourceBundle.getString("username");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo username: input
		 */
		textField = new JTextField(inputColumn);
		textField.addCaretListener(this);
		textField.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		add(textField, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: stampa
		 */
		string = resourceBundle.getString("password");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.CENTER);
		label.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(10,0,10,0);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo password: input
		 */
		passwordField = new JPasswordField(inputColumn);
		passwordField.addCaretListener(this);
		passwordField.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		add(passwordField, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Bottone conferma login
		 */
		string = resourceBundle.getString("next");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setFont(font);
		button.setActionCommand("next");
		button.setEnabled(false);
		button.addActionListener(this);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_END;
		gbc.ipadx = 50;
		gbc.ipady = 10;
		gbc.insets = new Insets(10,0,0,0);

		add(button, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Box mostra password
		 */
		string = resourceBundle.getString("show");
		string += " ";
		string += resourceBundle.getString("password");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setFont(font);
		checkBox.addItemListener(this);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.ipadx = 50;
		gbc.ipady = 10;
		gbc.insets = new Insets(10,0,0,0);

		add(checkBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/
	}

	@Override
	public void actionPerformed(ActionEvent e)
	{

	}

	@Override
	public void caretUpdate(CaretEvent e)
	{

	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{

	}

}

package gui;

import controller.Controller;
import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.*;
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
	protected JLabel usernameLabel;
	protected JTextField usernameField;
	protected JLabel passwordLabel;
	protected JPasswordField passwordField;
	protected JButton confirmButton;
	protected JCheckBox passwordCheckBox;

	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final static int inputColumn = 25;

	public AdminLoginPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		// configurazione campo username output
		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		usernameLabel = new JLabel(currentLocale.getString("usernameLabel"), SwingConstants.CENTER);
		usernameLabel.setFont(outputFont);

		add(usernameLabel, gbc);

		// configurazione campo username input
		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		usernameField = new JTextField(inputColumn);
		usernameField.setFont(inputFont);
		usernameField.addCaretListener(this);

		add(usernameField, gbc);

		// configurazione campo password output
		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(10,0,10,0);

		passwordLabel = new JLabel(currentLocale.getString("passwordLabel"), SwingConstants.CENTER);
		passwordLabel.setFont(outputFont);

		add(passwordLabel, gbc);

		// configurazione campo password input
		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		passwordField = new JPasswordField(inputColumn);
		passwordField.setFont(inputFont);
		passwordField.addCaretListener(this);

		add(passwordField, gbc);

		// configurazione bottone conferma login
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_END;
		gbc.ipadx = 50;
		gbc.ipady = 10;
		gbc.insets = new Insets(10,0,0,0);

		confirmButton = new JButton(currentLocale.getString("loginButtonMsg"));
		confirmButton.setFont(outputFont);
		confirmButton.setVerticalTextPosition(AbstractButton.CENTER);
		confirmButton.setHorizontalTextPosition(AbstractButton.CENTER);
		confirmButton.setMnemonic(KeyEvent.VK_ENTER);
		confirmButton.setEnabled(false);
		confirmButton.addActionListener(this);

		add(confirmButton, gbc);

		// configurazione box mostra password
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.ipadx = 50;
		gbc.ipady = 10;
		gbc.insets = new Insets(10,0,0,0);

		passwordCheckBox = new JCheckBox(currentLocale.getString("passwordCheckBoxMsg"));
		passwordCheckBox.setFont(outputFont);
		passwordCheckBox.setEnabled(true);
		passwordCheckBox.addItemListener(this);

		add(passwordCheckBox, gbc);
	}

	@Override
	public void actionPerformed(ActionEvent e)
	{
		// TODO: fare quello che si deve fare
		System.out.println("we");
	}

	@Override
	public void caretUpdate(CaretEvent e)
	{
		Matcher usernameMatcher = Regex.patternUsername.matcher(usernameField.getText());

		if (usernameMatcher.find())
		{
			Matcher passwordMatcher = Regex.patternPassword.matcher(new String(passwordField.getPassword()));

			if (passwordMatcher.find())
			{
				confirmButton.setEnabled(true);
			}
			else
			{
				// TODO: stampa x rossa
				System.out.println("Password non valida");
			}
		}
		else
		{
			// TODO: stampa x rossa
			System.out.println("Username non valido");
		}

	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{
		if (e.getStateChange() == ItemEvent.SELECTED)
		{
			passwordField.setEchoChar('\0');
		}
		else if (e.getStateChange() == ItemEvent.DESELECTED)
		{
			passwordField.setEchoChar('*');
		}
	}

}

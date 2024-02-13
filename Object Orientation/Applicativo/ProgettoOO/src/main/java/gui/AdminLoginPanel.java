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
	protected JLabel label;
	protected JTextField textField;
	protected JPasswordField passwordField;
	protected JButton button;
	protected JCheckBox checkBox;

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

		label = new JLabel(currentLocale.getString("username").toUpperCase(), SwingConstants.CENTER);
		label.setFont(outputFont);

		add(label, gbc);


		// configurazione campo username input
		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		textField = new JTextField(inputColumn);
		textField.setFont(inputFont);
		textField.addCaretListener(this);

		add(textField, gbc);

		// configurazione campo password output
		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(10,0,10,0);

		label = new JLabel(currentLocale.getString("password").toUpperCase(), SwingConstants.CENTER);
		label.setFont(outputFont);

		add(label, gbc);

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

		button = new JButton(currentLocale.getString("next").toUpperCase());
		button.setFont(outputFont);
		button.setVerticalTextPosition(AbstractButton.CENTER);
		button.setHorizontalTextPosition(AbstractButton.CENTER);
		button.setMnemonic(KeyEvent.VK_ENTER);
		button.setEnabled(false);
		button.addActionListener(this);

		add(button, gbc);

		// configurazione box mostra password
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.ipadx = 50;
		gbc.ipady = 10;
		gbc.insets = new Insets(10,0,0,0);

		checkBox = new JCheckBox((currentLocale.getString("show") + " " + currentLocale.getString("password")).toUpperCase());
		checkBox.setFont(outputFont);
		checkBox.setEnabled(true);
		checkBox.addItemListener(this);

		add(checkBox, gbc);
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

package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;

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
public class AdminLoginPanel
				extends JPanel
{
	protected JLabel usernameLabel;
	protected JTextField usernameTextField;
	protected JLabel passwordLabel;
	protected JPasswordField passwordField;
	protected JButton okButton;
	protected JCheckBox showPasswordCheckBox;

	protected String string;
	private Boolean username = false;
	private Boolean password = false;

	public AdminLoginPanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				"30:push[]20[]20[]20[]20[]20[]30:push"
			);

		setLayout(migLayout);


		/*
		 * Campo username: stampa
		 */
		string = GuiConfiguration.getMessage("username");
		string = string.toUpperCase();

		usernameLabel = new JLabel(string, SwingConstants.CENTER);

		add(usernameLabel);


		/*
		 * Campo username: input
		 */
		usernameTextField = new JTextField(GuiConfiguration.getInputColumn());

		usernameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e) {
				setUsername(Regex.patternUsername.matcher(usernameTextField.getText()).find());
				tryActiveButton();
			}
		});

		add(usernameTextField);


		/*
		 * Campo password: stampa
		 */
		string = GuiConfiguration.getMessage("password");
		string = string.toUpperCase();

		passwordLabel = new JLabel(string, SwingConstants.CENTER);

		add(passwordLabel);


		/*
		 * Campo password: input
		 */
		passwordField = new JPasswordField(GuiConfiguration.getInputColumn());

		passwordField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e) {
				setPassword(Regex.patternPassword.matcher(new String(passwordField.getPassword())).find());
				tryActiveButton();
			}
		});

		add(passwordField);


		/*
		 * Box mostra password
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("password");
		string = string.toUpperCase();

		showPasswordCheckBox = new JCheckBox(string);

		showPasswordCheckBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				if (ItemEvent.DESELECTED == e.getStateChange()) {
					passwordField.setEchoChar((char) UIManager.get("PasswordField.echoChar"));
				} else if (ItemEvent.SELECTED == e.getStateChange()) {
					passwordField.setEchoChar('\0');
				}
			}
		});

		add(showPasswordCheckBox);

		/*
		 * Bottone conferma login
		 */
		string = GuiConfiguration.getMessage("next");
		string = string.toUpperCase();

		okButton = new JButton(string);
		okButton.setEnabled(false);

		okButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (Controller.getInstance().isAdmin(usernameTextField.getText(), new String(passwordField.getPassword()))) {
					System.out.println("Benvenuto");
				} else {
					System.out.println("Chi sei?");
				}
			}
		});

		add(okButton, "align trailing");
	}


	private Boolean getUsername()
	{
		return username;
	}

	private Boolean getPassword()
	{
		return password;
	}

	private void setUsername(Boolean value)
	{
		username = value;
	}

	private void setPassword(Boolean value)
	{
		password = value;
	}

	private void tryActiveButton()
	{
		okButton.setEnabled(getUsername() && getPassword());
	}

}
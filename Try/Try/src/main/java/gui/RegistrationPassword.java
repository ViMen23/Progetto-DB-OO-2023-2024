package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.event.*;

public class RegistrationPassword {
	private JPanel generalPanel;
	private JPanel setPasswordPanel;
	private JLabel setPasswordJLabel;
	private JLabel sPasswordJLabel;
	private JPasswordField setPasswordJTextField;
	private JPanel returnLoginPanel;
	private JLabel returnLoginJLabel;
	private JButton returnLoginJButton;
	private JLabel cofirmPasswordJLabel;
	private JButton avantiJButton;
	private JLabel cPasswordJLabel;
	private JPasswordField confirmPasswordJTextField;
	private JPanel confirmPasswordPanel;
	private JCheckBox showFirstPasswordCheckBox;
	private JCheckBox ShowConfirmPasswordCheckBox;

	public JFrame loginUsernameFrame;
	public JFrame registrationUsernameFrame;
	public JFrame registrationPasswordFrame;
	private String username;
	public Controller controller;

	public RegistrationPassword(JFrame loginUsernameFrame, JFrame registrationUsernameFrame,
															String username, Controller controller)
	{
		this.loginUsernameFrame = loginUsernameFrame;
		this.registrationUsernameFrame = registrationUsernameFrame;
		this.username = username;
		this.controller = controller;

		registrationPasswordFrame = new JFrame("Password");
		registrationPasswordFrame.setContentPane(generalPanel);
		registrationPasswordFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		registrationPasswordFrame.pack();
		registrationPasswordFrame.setVisible(true);

		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent)
			{
				String password1 = String.valueOf(setPasswordJTextField.getPassword());

				if (confirmPasswordPanel.isVisible() == true){
					String password2 = String.valueOf(confirmPasswordJTextField.getPassword());
					if (password1.equals(password2)) {
						if (controller.passwordIsValid(password1)) {
							controller.aggiungiUtente(username, password1);
							String message = "\nRegistrazione avvenuta con successo.";
							message += "\n\nVerrai indirizzato alla pagina di login per effettuare l'accesso.";
							JOptionPane.showMessageDialog(null, message);
							loginUsernameFrame.setVisible(true);
							registrationPasswordFrame.setVisible(false);
							registrationPasswordFrame.dispose();
						}
						else {
							String message = "\nPassword inserita non valida.";
							message += "\n\nLa password deve essere lunga almeno 8 caratteri";
							message += "\nLa password deve contenere:";
							message += "\n\t1. Almeno una lettera minuscola";
							message += "\n\t2. Almeno una lettera maiuscola";
							message += "\n\t3. Almeno un numero";
							message += "\n\t1. Almeno un carattere speciale";
							message += "\n\nRiprovare.";
							JOptionPane.showMessageDialog(null, message);

							RegistrationPassword registrationPassword = new RegistrationPassword(
									loginUsernameFrame, registrationPasswordFrame, username, controller);

							registrationPasswordFrame.setVisible(false);
							registrationPasswordFrame.dispose();
						}
					}
					else {
						String message = "\nLe due password inserite non combaciano.";
						message += "\n\nRiprovare.";
						JOptionPane.showMessageDialog(null, message);

						RegistrationPassword registrationPassword = new RegistrationPassword(
								loginUsernameFrame, registrationPasswordFrame, username, controller);

						registrationPasswordFrame.setVisible(false);
						registrationPasswordFrame.dispose();
					}
				}
				else{
					if (controller.passwordIsValid(password1)) {
						controller.aggiungiUtente(username, password1);
						String message = "\nRegistrazione avvenuta con successo.";
						message += "\n\nVerrai indirizzato alla pagina di login per effettuare l'accesso.";
						JOptionPane.showMessageDialog(null, message);
						loginUsernameFrame.setVisible(true);
						registrationPasswordFrame.setVisible(false);
						registrationPasswordFrame.dispose();
					}
					else {
						String message = "\nPassword inserita non valida.";
						message += "\n\nLa password deve essere lunga almeno 8 caratteri";
						message += "\nLa password deve contenere:";
						message += "\n\t1. Almeno una lettera minuscola";
						message += "\n\t2. Almeno una lettera maiuscola";
						message += "\n\t3. Almeno un numero";
						message += "\n\t1. Almeno un carattere speciale";
						message += "\n\nRiprovare.";
						JOptionPane.showMessageDialog(null, message);

						RegistrationPassword registrationPassword = new RegistrationPassword(
								loginUsernameFrame, registrationPasswordFrame, username, controller);

						registrationPasswordFrame.setVisible(false);
						registrationPasswordFrame.dispose();
					}
				}
			}
		});
		showFirstPasswordCheckBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if(e.getStateChange() == ItemEvent.SELECTED){
					setPasswordJTextField.setEchoChar((char)0);
					confirmPasswordPanel.setVisible(false);
				}
				else{
					setPasswordJTextField.setEchoChar('•');
					confirmPasswordPanel.setVisible(true);
				}
			}
		});
		returnLoginJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				loginUsernameFrame.setVisible(true);
				registrationPasswordFrame.setVisible(false);
				registrationUsernameFrame.setVisible(false);
				registrationPasswordFrame.dispose();
				registrationUsernameFrame.dispose();

			}
		});
		setPasswordJTextField.addKeyListener(new KeyAdapter() {
			@Override
			public void keyTyped(KeyEvent e) {
				if(e.getKeyChar() == '\n' && !confirmPasswordPanel.isVisible()){
					avantiJButton.doClick();
				}
			}
		});
		confirmPasswordJTextField.addKeyListener(new KeyAdapter() {
			@Override
			public void keyTyped(KeyEvent e) {
				if(e.getKeyChar() == '\n'){
					avantiJButton.doClick();
				}
			}
		});
		ShowConfirmPasswordCheckBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if( e.getStateChange() == ItemEvent.SELECTED){
					confirmPasswordJTextField.setEchoChar((char)0);

				}
				else{
					confirmPasswordJTextField.setEchoChar('•');
				}
			}
		});
	}
}

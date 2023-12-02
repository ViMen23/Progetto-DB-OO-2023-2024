package gui;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import controller.Controller;

public class RegistrationUsername {
	private JPanel generalPanel;
	private JPanel createUserPanel;
	private JLabel createUserJLabel;
	private JButton avantiJButton;
	private JTextField userJTextField;
	private JLabel userJLabel;
	private JPanel returnLoginPanel;
	private JLabel returnLoginJLabel;
	private JButton returnLoginJButton;

	public JFrame loginUsernameFrame;
	public JFrame registrationUsernameFrame;
	public Controller controller;

	public RegistrationUsername(JFrame loginUsernameFrame, Controller controller) {
		this.loginUsernameFrame = loginUsernameFrame;
		this.controller = controller;
		registrationUsernameFrame = new JFrame("Registration");
		registrationUsernameFrame.setContentPane(generalPanel);
		registrationUsernameFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		registrationUsernameFrame.pack();
		registrationUsernameFrame.setVisible(true);

		returnLoginJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent) {
				loginUsernameFrame.setVisible(true);
				registrationUsernameFrame.setVisible(false);
				registrationUsernameFrame.dispose();
			}
		});
		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent) {
				String username = userJTextField.getText();

				if (controller.usernameIsValid(username) && controller.usernameIsAvailable(username)) {
					RegistrationPassword registrationPassword = new RegistrationPassword(
									loginUsernameFrame, registrationUsernameFrame, username, controller);
					registrationUsernameFrame.setVisible(false);
				}
				else {
					String message = "";
					message += "\nUsername non valido.";
					message += "\n\nL'username deve avere lunghezza compresa tra i 4 e 20 caratteri.";
					message += "\n\tL'username deve essere composto da:";
					message += "\n\t1. Caratteri alfanumerici";
					message += "\n\t2. Punti e/o undersore";
					message += "\n\nRiprovare.";

					JOptionPane.showMessageDialog(null, message);
				}
			}
		});
	}

}

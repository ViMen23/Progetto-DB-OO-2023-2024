package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class LoginUsername {
	private JPanel generalPanel;
	private JLabel userJLabel;
	private JTextField userJTextField;
	private JLabel welcomeJLabel;
	private JLabel registerJLabel;
	private JButton avantiJButton;
	private JButton registratiJButton;
	private JPanel loginPanel;
	private JPanel registratiPanel;

	public Controller controller = new Controller();

	public LoginUsername() {
		registratiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent)
			{
				RegistrationUsername registrationUsername = new RegistrationUsername(loginUsernameFrame, controller);
				loginUsernameFrame.setVisible(false);
			}
		});
		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String username = userJTextField.getText();

				if (controller.usernameIsValid(username) && controller.controlloUsername(username)){
					LoginPassword loginPassword = new LoginPassword(loginUsernameFrame, username, controller);
					loginUsernameFrame.setVisible(false);
				}
				else{
					JOptionPane.showMessageDialog(null, "\nUsername errato.");
				}

			}
		}
		);
		userJTextField.addKeyListener(new KeyAdapter() {
			@Override
			public void keyTyped(KeyEvent e)
			{
				if (e.getKeyChar() == '\n') {
					avantiJButton.doClick();
				}
			}
		});
	}

	public static JFrame loginUsernameFrame;
	public static void main(String[] args) {
		loginUsernameFrame = new JFrame("Welcome");
		loginUsernameFrame.setContentPane(new LoginUsername().generalPanel);
		loginUsernameFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		loginUsernameFrame.pack();
		loginUsernameFrame.setVisible(true);
	}
}

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
				RegistrationUsername registrationUsername = new RegistrationUsername(frame, controller);
				frame.setVisible(false);
			}
		});
		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String username = userJTextField.getText();

				if (controller.usernameIsValid(username) && controller.controlloUsername(username)){
					LoginPassword loginPassword = new LoginPassword(frame, username, controller);
					frame.setVisible(false);
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
				if( e.getKeyChar() == '\n'){
					avantiJButton.doClick();
				}
			}
		});
	}

	public static JFrame frame;
	public static void main(String[] args) {
		frame = new JFrame("Welcome");
		frame.setContentPane(new LoginUsername().generalPanel);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.pack();
		frame.setVisible(true);
	}
}

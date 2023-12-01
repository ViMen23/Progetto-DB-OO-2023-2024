package gui;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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

	public LoginUsername() {
		registratiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent)
			{
				RegistrationUsername registrationUsername = new RegistrationUsername(frame);
				frame.setVisible(false);
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

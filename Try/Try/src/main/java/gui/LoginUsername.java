package gui;

import controller.Controller;

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

	public Controller controller = new Controller();

	public LoginUsername() {
		registratiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent)
			{
				RegistrationUsername registrationUsername = new RegistrationUsername(frame);
				frame.setVisible(false);
			}
		});
		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String check = userJTextField.getText();
				if ( ( controller.controlloFormatoUsername(check) == true ) && ( controller.controlloUsername( check ) == true ) ){
					LoginPassword loginPassword = new LoginPassword(frame, check, controller);
					frame.setVisible(false);
				}
				else{
					JOptionPane.showMessageDialog(null, "\nUsername non esiste o inserito male, prova a registrarti prima");
				}
			}
		}
		);
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

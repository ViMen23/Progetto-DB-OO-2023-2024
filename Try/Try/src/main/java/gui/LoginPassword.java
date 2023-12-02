package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginPassword {
	private JPanel generalPanel;
	private JPanel passwordPanel;
	private JLabel loginPasswordJLabel;
	private JButton avantiJButton;
	private JLabel passwordJLabel;
	private JPanel returnLoginPanel;
	private JLabel returnLoginJLabel;
	private JButton returnLoginJButton;
	private JPasswordField passwordJTextField;

	public JFrame lUFrame;
	public JFrame lPFrame;
	private String username;
	public Controller controller;

	// passanto alla finestra password chi l'ha chiamata,
	// l'username valido e il controller così che ci sia solo un controller in giro
	public LoginPassword(JFrame lUFrame, String username, Controller controller)
	{
		this.lUFrame = lUFrame;
		lPFrame = new JFrame("Password");
		lPFrame.setContentPane(generalPanel);
		lPFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		lPFrame.pack();
		lPFrame.setVisible(true);
		this.username = username;
		this.controller = controller;

		returnLoginJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				lUFrame.setVisible(true);
				lPFrame.setVisible(false);
				lPFrame.dispose();
			}
		});

		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String password = String.valueOf(passwordJTextField.getPassword());

				if (controller.passwordIsValid(password) && controller.controlloPassword(username, password)){
					JOptionPane.showMessageDialog(null, "\nAccesso avvenuto con successo");
				}
				else{
					JOptionPane.showMessageDialog(null, "\nPassword sbagliata, riprovare");
				}
			}
		});
	}

}

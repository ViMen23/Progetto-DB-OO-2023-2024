package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;

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

	public JFrame callingFrame;
	public JFrame calledFrame;
	private String username;
	public Controller controller;

	// passanto alla finestra password chi l'ha chiamata, l'username valido e il controller così che ci sia solo un controller in giro
	public LoginPassword(JFrame callingFrame, String username, Controller controller) {
		this.callingFrame = callingFrame;
		calledFrame = new JFrame("Password");
		calledFrame.setContentPane(generalPanel);
		calledFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		calledFrame.pack();
		calledFrame.setVisible(true);
		this.username = username;
		this.controller = controller;
		returnLoginJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				callingFrame.setVisible(true);
				calledFrame.setVisible(false);
				calledFrame.dispose();
			}
		});
		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String check = Arrays.toString(passwordJTextField.getPassword());
				if ( ( controller.controlloFormatoPassword(check) == true ) && ( controller.controlloPassword( username, check ) == true ) ){
					JOptionPane.showMessageDialog(null, "\nAccesso avvenuto con successo");
				}
				else{
					JOptionPane.showMessageDialog(null, "\nPassword sbagliata, riprovare");
				}
			}
		});
	}

}

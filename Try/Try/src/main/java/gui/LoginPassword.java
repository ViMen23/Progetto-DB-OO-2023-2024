package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

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
	private JCheckBox showPasswordCheckBox;

	public JFrame loginUsernameFrame;
	public JFrame loginPasswordFrame;
	private String username;
	public Controller controller;

	// passanto alla finestra password chi l'ha chiamata,
	// l'username valido e il controller così che ci sia solo un controller in giro
	public LoginPassword(JFrame loginUsernameFrame, String username, Controller controller)
	{
		this.loginUsernameFrame = loginUsernameFrame;
		loginPasswordFrame = new JFrame("Password");
		loginPasswordFrame.setContentPane(generalPanel);
		loginPasswordFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		loginPasswordFrame.pack();
		loginPasswordFrame.setVisible(true);
		this.username = username;
		this.controller = controller;

		returnLoginJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				loginUsernameFrame.setVisible(true);
				loginPasswordFrame.setVisible(false);
				loginPasswordFrame.dispose();

			}
		});

		avantiJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String password = String.valueOf(passwordJTextField.getPassword());

				if (controller.passwordIsValid(password) && controller.controlloPassword(username, password)){
					JOptionPane.showMessageDialog(null, "\nAccesso avvenuto con successo");

					loginUsernameFrame.setVisible(false);
					loginPasswordFrame.setVisible(false);
					loginUsernameFrame.dispose();
					loginUsernameFrame.dispose();
				}
				else{
					JOptionPane.showMessageDialog(null, "\nPassword sbagliata, riprovare");
				}
			}
		});

		showPasswordCheckBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if( e.getStateChange() == ItemEvent.SELECTED){
					passwordJTextField.setEchoChar((char)0);
				}
				else
					passwordJTextField.setEchoChar('•');
			}
		});
		passwordJTextField.addKeyListener(new KeyAdapter() {
			@Override
			public void keyTyped(KeyEvent e) {
				if( e.getKeyChar() == '\n'){
					avantiJButton.doClick();
				}
			}
		});
	}

}

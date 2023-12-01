package gui;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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
	public JFrame callingFrame;
	public JFrame calledFrame;

	public RegistrationUsername(JFrame callingFrame) {
		this.callingFrame = callingFrame;
		calledFrame = new JFrame("Registration");
		calledFrame.setContentPane(generalPanel);
		calledFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		calledFrame.pack();
		calledFrame.setVisible(true);

		returnLoginJButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent actionEvent) {
				callingFrame.setVisible(true);
				calledFrame.setVisible(false);
				calledFrame.dispose();
			}
		});
	}

}

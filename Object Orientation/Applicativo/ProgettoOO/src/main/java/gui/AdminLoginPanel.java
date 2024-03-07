package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

/**
 * TYPE : class - gui package
 * NAME : AdminLogin
 * DESC: Classe per l'interfaccia grafica che permette il login di un amministratore dell'applicativo
 */
public class AdminLoginPanel
				extends JPanel
{

	public AdminLoginPanel(JLabel ctrlLabel)
	{
		MigLayout migLayout;
		JLabel usernameLabel;
		JTextField usernameTextField;
		JLabel passwordLabel;
		JPasswordField passwordField;
		JCheckBox showPasswordCheckBox;
		final JButton okButton;
		final boolean[] ctrlButton = {false, false};


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						null,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/

		usernameLabel = new JLabel(GuiConfiguration.getMessage("username"), SwingConstants.CENTER);

		this.add(usernameLabel);
		/*------------------------------------------------------------------------------------------------------*/

		usernameTextField = new JTextField(GuiConfiguration.INPUT_COLUMN);

		this.add(usernameTextField);
		/*------------------------------------------------------------------------------------------------------*/

		passwordLabel = new JLabel(GuiConfiguration.getMessage("password"), SwingConstants.CENTER);

		this.add(passwordLabel);
		/*------------------------------------------------------------------------------------------------------*/

		passwordField = new JPasswordField(GuiConfiguration.INPUT_COLUMN);

		this.add(passwordField);
		/*------------------------------------------------------------------------------------------------------*/

		showPasswordCheckBox = new JCheckBox(GuiConfiguration.getMessage("showPassword"));

		this.add(showPasswordCheckBox);


		showPasswordCheckBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (ItemEvent.DESELECTED == e.getStateChange()) {
					passwordField.setEchoChar((char) UIManager.get("PasswordField.echoChar"));
				} else if (ItemEvent.SELECTED == e.getStateChange()) {
					passwordField.setEchoChar('\0');
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		okButton = new JButton(GuiConfiguration.getMessage("next"));
		okButton.setCursor(GuiConfiguration.HAND_CURSOR);
		okButton.setEnabled(false);

		this.add(okButton, GuiConfiguration.TRAILING_ADD_CONSTRAINT);


		okButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				if (Controller.getInstance().isAdmin(usernameTextField.getText(), new String(passwordField.getPassword()))) {
					JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage("msgCorrectLogin"));

					Container container = MainFrame.getMainFrameInstance().getContentPane();
					for (Component component: container.getComponents()) {
						if (!(component instanceof TopPanel)) {
							component.setVisible(false);
							container.remove(component);
						}
					}

					container.add(new AdminNavigationPanel(), GuiConfiguration.HGROUP_FRAME_TGAP_20_ADD_CONSTRAINT);

					ctrlLabel.setText("@login");

					Window window = SwingUtilities.getWindowAncestor((Component) e.getSource());
					window.dispose();
				} else {
					JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage("msgIncorrectLogin"));
				}
			}
		});

		usernameTextField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				ctrlButton[0] = Regex.patternUsername.matcher(usernameTextField.getText()).find();
				okButton.setEnabled(ctrlButton[0] && ctrlButton[1]);
			}
		});

		passwordField.addCaretListener(new CaretListener() {
			@Override
			public void caretUpdate(CaretEvent e)
			{
				ctrlButton[1] = Regex.patternPassword.matcher(new String(passwordField.getPassword())).find();
				okButton.setEnabled(ctrlButton[0] && ctrlButton[1]);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
	}
}
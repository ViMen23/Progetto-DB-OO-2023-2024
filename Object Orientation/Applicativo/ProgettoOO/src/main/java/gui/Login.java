package gui;

import java.awt.*;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;
import javax.swing.plaf.FontUIResource;
import javax.swing.text.StyleContext;

public class Login
{
  private JPanel generalPanel;

  private JPanel loginPanel, registratiPanel;
  GridBagConstraints gbc;
  private JLabel welcomeJLabel, userJLabel, registerJLabel;
  private JTextField userJTextField;
  private JButton avantiJButton, registratiJButton, countryJButton;

  final ImageIcon icon = createImageIcon("images/world.png");

  ResourceBundle message;
  final static Color colorBackground = new Color(50, 0, 100);

  final static float genPanelFontSize = 22;
  final static float titleFontSize = 48;

  public Login()
  {
	Locale.setDefault(new Locale("it", "IT"));
	message = ResourceBundle.getBundle("guiBundle", Locale.getDefault());

	generalPanel = new JPanel(new GridBagLayout());

	generalPanel.setBackground(colorBackground);

	generalPanel.setMinimumSize(new Dimension(1000, 300));

	Font titleFont = generalPanel.getFont().deriveFont(titleFontSize);

	Border titleBorder = BorderFactory.createTitledBorder(null, message.getString("player"), TitledBorder.CENTER,
		TitledBorder.TOP, titleFont, Color.white);

	generalPanel.setBorder(titleBorder);

	countryJButton = new JButton(icon);

	gbc = new GridBagConstraints();
	gbc.anchor = GridBagConstraints.FIRST_LINE_END;

	generalPanel.add(countryJButton, gbc);

	loginPanel = new JPanel(new GridBagLayout());
	
	loginPanel.setBackground(colorBackground);
	
	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 0;
	gbc.weightx = 1.0;
	gbc.weighty = 1.0;
	gbc.anchor = GridBagConstraints.NORTH;
	gbc.insets = new Insets(200, 0, 0, 0);

	generalPanel.add(loginPanel, gbc);

	welcomeJLabel = new JLabel(message.getString("insUsername"));

	welcomeJLabel.setBackground(colorBackground);

	welcomeJLabel.setForeground(Color.white);

	Font generalFont = generalPanel.getFont().deriveFont( (genPanelFontSize) );

	welcomeJLabel.setFont(generalFont);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 0;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.anchor = GridBagConstraints.WEST;
	gbc.insets = new Insets(0, 0, 30, 0);

	loginPanel.add(welcomeJLabel, gbc);

	avantiJButton = new JButton(message.getString("nextButton"));

	avantiJButton.setFont(generalFont);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 3;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.anchor = GridBagConstraints.EAST;
	gbc.insets = new Insets(0, 0, 50, 0);

	loginPanel.add(avantiJButton, gbc);

	userJTextField = new JTextField(20);

	userJTextField.setFont(generalFont);

	userJTextField.setMargin(new Insets(2, 6, 2, 6));

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 2;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.insets = new Insets(0, 0, 30, 0);

	loginPanel.add(userJTextField, gbc);

	userJLabel = new JLabel(message.getString("usernameLabel"));

	userJLabel.setBackground(colorBackground);

	userJLabel.setForeground(Color.white);

	userJLabel.setFont(generalFont);


	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 1;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.anchor = GridBagConstraints.WEST;
	gbc.insets = new Insets(0, 0, 10, 0);

	loginPanel.add(userJLabel, gbc);

	registratiPanel = new JPanel(new GridBagLayout());

	registratiPanel.setBackground(colorBackground);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 1;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.anchor = GridBagConstraints.SOUTH;
	gbc.insets = new Insets(0, 0, 200, 0);

	generalPanel.add(registratiPanel, gbc);

	registerJLabel = new JLabel(message.getString("noAccountLabel"));

	registerJLabel.setFont(generalFont);

	registerJLabel.setBackground(colorBackground);

	registerJLabel.setForeground(Color.white);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 0;
	gbc.anchor = GridBagConstraints.WEST;
	gbc.insets = new Insets(0, 0, 30, 0);

	registratiPanel.add(registerJLabel, gbc);

	registratiJButton = new JButton(message.getString("registerLabel"));

	registratiJButton.setFont(generalFont);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 1;
	gbc.insets = new Insets(0, 0, 30, 0);

	registratiPanel.add(registratiJButton, gbc);

  }

  public JPanel getRootPanel() { return generalPanel; }


  protected ImageIcon createImageIcon(String path) {
	java.net.URL imgURL = getClass().getResource(path);
	if (imgURL != null) {
	  return new ImageIcon(imgURL);
	} else {
	  System.err.println("Couldn't find file: " + path);
	  return null;
	}
  }

}

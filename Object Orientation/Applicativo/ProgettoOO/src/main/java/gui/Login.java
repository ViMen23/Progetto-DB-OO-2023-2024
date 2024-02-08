package gui;

import model.Language;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
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

  private JPanel loginPanel, registratiPanel, languagePanel, totalPanel;
  GridBagConstraints gbc;
  private JLabel welcomeJLabel, userJLabel, registerJLabel, languageJLabel;
  private JTextField userJTextField;
  private JButton avantiJButton, registratiJButton, countryJButton;

  final ImageIcon icon = createImageIcon("images/world2.png", 40, 40);
  final ImageIcon logo = createImageIcon("images/logo2.png", 70, 70);

  ResourceBundle message;
  //final static Color colorBackground = Color.white;
	final static Color myColor = new Color(50, 50, 50);
  final static float genPanelFontSize = 22;
  final static float titleFontSize = 48;

  public Login()
  {

	Locale.setDefault(new Locale("it", "IT"));
	message = ResourceBundle.getBundle("guiBundle", Locale.getDefault());

	generalPanel = new JPanel(new GridBagLayout());

	generalPanel.setBackground(myColor);

	generalPanel.setMinimumSize(new Dimension(800, 300));

	Font titleFont = generalPanel.getFont().deriveFont(titleFontSize);

	Border titleBorder = BorderFactory.createTitledBorder(null, message.getString("player"), TitledBorder.CENTER,
		TitledBorder.TOP, titleFont, Color.white);

	//generalPanel.setBorder(titleBorder);

	JLabel logoJLabel = new JLabel(logo);
	logoJLabel.setBackground(myColor);
	logoJLabel.setOpaque(true);

	JPanel altroPanel = new JPanel(new GridBagLayout());

	gbc = new GridBagConstraints();
	gbc.weightx = 0.5;
	gbc.gridy = 0;
	gbc.anchor = GridBagConstraints.CENTER;
	gbc.insets = new Insets(70, 0, 0, 330);

	altroPanel.add(logoJLabel, gbc);

	gbc = new GridBagConstraints();
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.anchor = GridBagConstraints.FIRST_LINE_START;




	languagePanel = new JPanel(new BorderLayout());
	languagePanel.setPreferredSize(new Dimension(230, 60));

	languageJLabel = new JLabel(message.getString("chooseLanguage"));
	languagePanel.add(languageJLabel, BorderLayout.NORTH);

	String[] possibleValues = { "One", "Two", "Three" };
	JComboBox<String> optionList = new JComboBox<String>(possibleValues);

	languagePanel.add(optionList, BorderLayout.SOUTH);

	countryJButton = new JButton(icon);
	countryJButton.setToolTipText(message.getString("setLanguage"));
	countryJButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
	countryJButton.setPreferredSize(new Dimension(60, 60));

	Font generalFont = generalPanel.getFont().deriveFont( (genPanelFontSize) );
	countryJButton.addActionListener(new ActionListener() {
	  @Override
	  public void actionPerformed(ActionEvent e) {

		//Border tmp = BorderFactory.createTitledBorder(BorderFactory.createEmptyBorder(), message.getString("chooseLanguage"));
		// optionList.setBorder(tmp);

		JOptionPane.showOptionDialog(generalPanel, languagePanel,
			message.getString("language"), JOptionPane.OK_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null,
			null, null );
	  }
	});
	gbc = new GridBagConstraints();
	//gbc.weightx = 0.5;
	//gbc.weighty = 1.0;
	//gbc.gridx = 0;
	//gbc.gridy = 0;
	gbc.anchor = GridBagConstraints.NORTHEAST;
	//gbc.insets = new Insets(0, 0, 0, 10);
	//gbc.gridwidth = 10;

	altroPanel.add(countryJButton, gbc);

	gbc = new GridBagConstraints();
	gbc.gridy = 0;
	gbc.weighty = 0.5;
	gbc.weightx = 0.5;
	gbc.fill = GridBagConstraints.BOTH;
	gbc.anchor = GridBagConstraints.NORTH;

	altroPanel.setOpaque(false);

	generalPanel.add(altroPanel, gbc);

	loginPanel = new JPanel(new GridBagLayout());

	//loginPanel.setBackground(myColor);
	
	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 0;
	gbc.weightx = 1.0;
	gbc.weighty = 1.0;
	gbc.anchor = GridBagConstraints.NORTH;
	gbc.insets = new Insets(200, 0, 0, 0);

	generalPanel.add(loginPanel, gbc);

	welcomeJLabel = new JLabel(message.getString("insUsername"));
	//welcomeJLabel.setBackground(colorBackground);

	//welcomeJLabel.setForeground(Color.white);



	welcomeJLabel.setFont(generalFont);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 0;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.ipady = 80;
	gbc.anchor = GridBagConstraints.WEST;
	gbc.insets = new Insets(0, 0, 30, 0);

	loginPanel.add(welcomeJLabel, gbc);

	avantiJButton = new JButton(message.getString("nextButton"));
	avantiJButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
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

	//userJLabel.setBackground(colorBackground);

	//userJLabel.setForeground(Color.white);

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

	//registratiPanel.setBackground(colorBackground);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 1;
	gbc.weightx = 0.5;
	gbc.weighty = 0.5;
	gbc.anchor = GridBagConstraints.SOUTH;
	gbc.insets = new Insets(0, 0, 200, 0);

	//generalPanel.add(registratiPanel, gbc);

	registerJLabel = new JLabel(message.getString("noAccountLabel"));

	registerJLabel.setFont(generalFont);

	//registerJLabel.setBackground(colorBackground);

	//registerJLabel.setForeground(Color.white);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 0;
	gbc.ipadx = 50;
	gbc.anchor = GridBagConstraints.WEST;
	gbc.insets = new Insets(0, 20, 30, 0);

	registratiPanel.add(registerJLabel, gbc);

	registratiJButton = new JButton(message.getString("registerLabel"));
	registratiJButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
	registratiJButton.setFont(generalFont);

	gbc = new GridBagConstraints();
	gbc.gridx = 0;
	gbc.gridy = 1;
	gbc.insets = new Insets(0, 0, 30, 0);

	registratiPanel.add(registratiJButton, gbc);


	totalPanel = new JPanel(new GridBagLayout());

	gbc = new GridBagConstraints();
	gbc.weightx = 1;
	gbc.weighty = 1;
	gbc.gridy = 0;
	gbc.anchor = GridBagConstraints.NORTH;
	totalPanel.add(loginPanel, gbc);

	gbc = new GridBagConstraints();
	gbc.weightx = 1;
	gbc.weighty = 1;
	gbc.gridy = 1;
	gbc.anchor = GridBagConstraints.SOUTH;


	totalPanel.add(registratiPanel, gbc);

	gbc = new GridBagConstraints();
	gbc.weighty = 1.0;
	gbc.gridy = 1;
	gbc.anchor = GridBagConstraints.CENTER;
	generalPanel.add(totalPanel, gbc);


  }

  public JPanel getRootPanel() { return generalPanel; }


  protected ImageIcon createImageIcon(String path, Integer width, Integer height)
  {
	java.net.URL imgURL = ClassLoader.getSystemResource(path);

	if (imgURL != null) {

	  ImageIcon img1 = new ImageIcon(imgURL);

	  Image img2 = img1.getImage().getScaledInstance(width,height, Image.SCALE_DEFAULT);
	  return new ImageIcon(img2);
	}
	else {
	  System.err.println("Couldn't find file: " + path);
	  return null;
	}

  }


  public HashMap<Language, String> createHashMapLanguage()
  {
	HashMap<Language, String> tmp = new HashMap<Language, String>();

	tmp.put(Language.inglese, "en_US");
	tmp.put(Language.italiano, "it_IT");

	return tmp;
  }

}

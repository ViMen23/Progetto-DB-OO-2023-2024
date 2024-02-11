package gui;

import javax.swing.*;
import java.awt.*;

public class SplashScreen
{
  public static JWindow main = new JWindow();

  private JLabel name;
  private final ImageIcon logo = Main.createImageIcon("images/logo16.png", 75, 75);


  public SplashScreen()
  {
	main.setBounds(500, 150, 300, 200);
	main.setVisible(true);

	name = new JLabel("YouPlay", logo, JLabel.CENTER);

	main.getContentPane().add(name);


	main.setForeground(Color.blue);
  }





}

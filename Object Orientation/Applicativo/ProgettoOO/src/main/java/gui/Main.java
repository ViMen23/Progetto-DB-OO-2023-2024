package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.*;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * TYPE : class - gui package
 * NAME : Main
 *
 * DESC: TODO
 */
public class Main
{

	public static ResourceBundle currentLocale;
	private static void createAndShowGUI()
	{
		// creazione del locale di default come italiano
		Locale.setDefault(Locale.of("en", "US"));

		currentLocale = null;

		try
		{
			currentLocale = ResourceBundle.getBundle("guiBundle", Locale.getDefault());
		}
		catch (MissingResourceException e)
		{
			System.out.println(e.getMessage());
		}


		JFrame homeFrame = new JFrame("Progetto");

		homeFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		homeFrame.setLayout(new GridBagLayout());
		// posiziona frame al centro dello schermo
		homeFrame.setLocationRelativeTo(null);
		homeFrame.setResizable(true);
		homeFrame.setMinimumSize(new Dimension(1000, 500));

		UIManager.put("nimbusBase", new Color(0, 50, 255));
		UIManager.put("nimbusBlueGrey", new Color(0, 100, 255));
		UIManager.put("control", new Color(50, 200, 255));

		try
		{
			for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels())
			{
				if ("Nimbus".equals(info.getName()))
				{
					UIManager.setLookAndFeel(info.getClassName());
					break;
				}
			}
		} catch (Exception e)
		{
			return;
		}



		//homeFrame.setContentPane(new AdminLoginPanel(Controller.getControllerInstance(), currentLocale));

		//homeFrame.setContentPane(new TopPanel(Controller.getControllerInstance(), currentLocale));

		GridBagConstraints gbc;


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,10,0);
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.PAGE_START;


		homeFrame.add(new TopPanel(Controller.getControllerInstance(), currentLocale), gbc);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,10,0);
		gbc.fill = GridBagConstraints.BOTH;

		homeFrame.add(new UserFilterPanelNew(Controller.getControllerInstance(), currentLocale), gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,10,0);
		gbc.fill = GridBagConstraints.BOTH;

		homeFrame.add(new UserSearchPanel(Controller.getControllerInstance(), currentLocale), gbc);

		homeFrame.pack();
		homeFrame.setVisible(true);

		UserFilterPanelNew.timer.start();
	}

	public static ImageIcon createImageIcon(String imagePath, int wight, int high)
	{
		java.net.URL imageURL = ClassLoader.getSystemResource(imagePath);

		if (imageURL != null)
		{
			ImageIcon imageIcon = new ImageIcon(imageURL);

			Image image = imageIcon.getImage().getScaledInstance(wight, high, Image.SCALE_DEFAULT);

			return new ImageIcon(image);
		}

		return null;

	}

	public static void main(String[] args)
  {
		// Pianifica un lavoro per la creazione e la visualizzazione della GUI di questa applicazione.
		javax.swing.SwingUtilities.invokeLater(new Runnable()
			{
				public void run()
				{
					createAndShowGUI();
				}
			}
		);
  }

}

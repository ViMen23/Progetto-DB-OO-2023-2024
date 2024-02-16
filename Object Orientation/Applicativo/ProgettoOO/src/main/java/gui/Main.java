package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

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


	private static void createAndShowGUI()
	{
		GuiConfiguration.initGuiConfiguration();

		JFrame homeFrame = new JFrame("Progetto");

		homeFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		homeFrame.setLayout(new MigLayout());

		// posiziona frame al centro dello schermo
		homeFrame.setLocationRelativeTo(null);
		homeFrame.setResizable(true);
		homeFrame.setMinimumSize(new Dimension(500, 500));
		homeFrame.setMaximumSize(new Dimension(1500, 1000));

		try {
			for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
				if ("Nimbus".equals(info.getName())) {
					UIManager.setLookAndFeel(info.getClassName());
					break;
				}
			}
		} catch (Exception e) {
			return;
		}



<<<<<<< Updated upstream
		homeFrame.add(new Top(Controller.getControllerInstance()), "top, dock north, dock center, wrap");
		homeFrame.add(new MenuBar(Controller.getControllerInstance()), "dock center");
=======
		//homeFrame.setContentPane(new AdminLoginPanel(Controller.getControllerInstance(), currentLocale));

		//homeFrame.setContentPane(new TopPanel(Controller.getControllerInstance(), currentLocale));

		GridBagConstraints gbc;


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 10;
		gbc.insets = new Insets(0,0,0,0);
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.PAGE_START;


		homeFrame.add(new TopPanel(Controller.getControllerInstance()), gbc);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,10,0);
		gbc.fill = GridBagConstraints.BOTH;

		homeFrame.add(new MenuBarPanel(Controller.getControllerInstance()));

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,10,0);
		gbc.fill = GridBagConstraints.BOTH;

		homeFrame.add(new CompetitionEditionFilterPanel(Controller.getControllerInstance()), gbc);
>>>>>>> Stashed changes

		homeFrame.pack();





		homeFrame.setVisible(true);

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

	public static String getMessage(String key)
	{
		return ResourceBundle.getBundle("guiBundle", Locale.getDefault()).getString(key);
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

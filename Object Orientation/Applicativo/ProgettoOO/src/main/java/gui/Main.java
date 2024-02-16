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



		homeFrame.add(new Top(Controller.getControllerInstance()), "top, dock north, dock center, wrap");
		homeFrame.add(new MenuBar(Controller.getControllerInstance()), "dock center");

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

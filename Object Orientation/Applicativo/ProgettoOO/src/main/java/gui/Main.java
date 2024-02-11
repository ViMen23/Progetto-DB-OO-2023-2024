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
	// TODO: da controllare e sistemare
	private static String gtk = "com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
	private static String motif = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
	private static String windows = "com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
	private static String windowsXP = "com.sun.java.swing.plaf.motif.WindowsXPLookAndFeel";
	private static String windowsVista = "com.sun.java.swing.plaf.motif.WindowsVistaLookAndFeel";
	private static String metal = "com.sun.java.swing.plaf.metal.MetalLookAndFeel";

  private static void createAndShowGUI()
  {
		// creazione del locale di default come italiano
		Locale.setDefault(Locale.of("it", "IT"));

		ResourceBundle currentLocale = null;

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
		homeFrame.setMinimumSize(new Dimension(1000, 100));

		try
		{
			// setto GTK+ come look and feel prefefinito
			UIManager.setLookAndFeel(gtk);
		}
		// TODO: gestire meglio le eccezioni
		catch(Exception e)
		{
			return;
		}

		//homeFrame.setContentPane(new AdminLoginPanel(Controller.getControllerInstance(), currentLocale));
		homeFrame.setContentPane(new TopPanel(Controller.getControllerInstance(), currentLocale));

		GridBagConstraints gbc;

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		homeFrame.add(new UserSearchPanel(Controller.getControllerInstance(), currentLocale), gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		homeFrame.add(new UserFilterPanel(Controller.getControllerInstance(), currentLocale), gbc);

		homeFrame.pack();
		homeFrame.setVisible(true);

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

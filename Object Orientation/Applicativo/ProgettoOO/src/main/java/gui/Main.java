package gui;

import javax.swing.*;
import java.awt.*;

/**
 * Questa classe rappresenta il punto di ingresso principale dell'applicazione.
 */
public class Main
{
	private static void createAndShowGUI()
	{
		GuiConfiguration.initGuiConfiguration();

		MainFrame.getMainFrameInstance().setMinimumSize(new Dimension(1600, 1000));

		MainFrame.getMainFrameInstance().setVisible(true);

		MainFrame.getMainFrameInstance().pack();

	}
	
	public static void main(String[] args)
	{
		SwingUtilities.invokeLater(new Runnable() {
				public void run()
				{
					createAndShowGUI();
				}
		});
	}

}

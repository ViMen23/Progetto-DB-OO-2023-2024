package gui;

import javax.swing.*;
import java.awt.*;

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

		//MainFrame.getMainFrameInstance().add(new CreateTeam(), GuiConfiguration.HGROUP_ADD_CONSTRAINT);
		MainFrame.getMainFrameInstance().setMinimumSize(new Dimension(1600, 100));

		MainFrame.getMainFrameInstance().setVisible(true);

		MainFrame.getMainFrameInstance().pack();
	}
	
	public static void main(String[] args)
	{
		// Pianifica un lavoro per la creazione e la visualizzazione della GUI di questa applicazione.
		SwingUtilities.invokeLater(new Runnable() {
				public void run()
				{
					createAndShowGUI();
				}
		});
	}

}

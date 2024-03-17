package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

/**
 * Questa classe rappresenta la finestra principale dell'applicazione.
 * È un singleton, ovvero esiste una sola istanza della classe in esecuzione.
 */
public class MainFrame
				extends JFrame
{
	private static MainFrame mainFrameInstance = null;
	private MainFrame()
	{
		this.setTitle("FOOGO: football google");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


		MigLayout migLayout;

		migLayout = new MigLayout
			(
				GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
				GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
				GuiConfiguration.THREE_CELL_EXT_GAP_0_INT_GAP_0_10_LAYOUT_CONSTRAINT
			);

		this.getContentPane().setBackground(new Color(210, 210, 210));

		this.setLayout(migLayout);

		this.setExtendedState(JFrame.MAXIMIZED_VERT);

	}

	public static MainFrame getMainFrameInstance() {
		if (null == mainFrameInstance) {
			mainFrameInstance = new MainFrame();
		}

		return mainFrameInstance;
	}
}

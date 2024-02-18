package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;

public class MainFrame
				extends JFrame
{
	private static MainFrame mainFrameInstance = null;
	private MainFrame()
	{
		this.setTitle("NON AVRO' ALCUN DIO AL DI FUORI DI GIOELE");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLayout(new MigLayout());
		this.setLocationRelativeTo(null);
		this.setResizable(true);
	}

	public static MainFrame getMainFrameInstance() {
		if (null == mainFrameInstance) {
			mainFrameInstance = new MainFrame();
		}

		return mainFrameInstance;
	}
}

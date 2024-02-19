package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class MainFrame
				extends JFrame
{
	private static MainFrame mainFrameInstance = null;
	private MainFrame()
	{
		this.setTitle("NON AVRO' ALCUN DIO AL DI FUORI DI GIOELE");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]0[]0"
			);



		setLayout(migLayout);

		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setMinimumSize(getSize());
	}

	public static MainFrame getMainFrameInstance() {
		if (null == mainFrameInstance) {
			mainFrameInstance = new MainFrame();
		}

		return mainFrameInstance;
	}
}

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
		this.setTitle("NON AVRO' ALCUN DIO AL DI FUORI DI GIOELE"); //TODO i18n
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


		MigLayout migLayout;

		migLayout = new MigLayout
			(
				GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
				GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
				GuiConfiguration.THREE_CELL_EXT_GAP_0_INT_GAP_0_10_LAYOUT_CONSTRAINT
			);

		this.getContentPane().setBackground(new Color(210, 210, 210));

		setLayout(migLayout);

		setExtendedState(JFrame.MAXIMIZED_VERT);

	}

	public static MainFrame getMainFrameInstance() {
		if (null == mainFrameInstance) {
			mainFrameInstance = new MainFrame();
		}

		return mainFrameInstance;
	}
}

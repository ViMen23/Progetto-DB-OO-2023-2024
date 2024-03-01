package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class TitleLabel
				extends JLabel
{
	public TitleLabel(String title)
	{
		super(title, SwingConstants.LEADING);

		this.setOpaque(true);
		this.setBackground(GuiConfiguration.LABEL_BACKGROUND_COLOR);
		this.setForeground(Color.white);
		this.setBorder(GuiConfiguration.LABEL_BORDER);
	}
}

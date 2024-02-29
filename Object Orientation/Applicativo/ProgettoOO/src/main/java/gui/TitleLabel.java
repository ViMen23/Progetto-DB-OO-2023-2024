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
		this.setBackground(GuiConfiguration.getSearchPanelColor());
		this.setForeground(Color.white);
		this.setBorder(GuiConfiguration.getSearchLabelBorder());
	}
}

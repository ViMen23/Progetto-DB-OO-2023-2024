package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;

public class TitlePanel
				extends JPanel
{
	public TitlePanel(String title)
	{
		MigLayout migLayout;
		TitleLabel titleLabel;

		migLayout = new MigLayout();

		titleLabel = new TitleLabel(title);
		this.add(titleLabel);
	}
}

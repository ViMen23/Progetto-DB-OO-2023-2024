package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class InfoPanel
				extends JPanel
{
	public InfoPanel(String description)
	{
		MigLayout migLayout = new MigLayout(
						"debug, flowy",
						"[fill, grow]",
						"[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		TitleLabel label;
		label = new TitleLabel("INFO");

		add(label);

		JTextArea textArea = new JTextArea(description);

		this.add(textArea);
	}
}

package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class InfoPanel
				extends JPanel
{
	public InfoPanel(String description)
	{
		MigLayout migLayout;

		migLayout = new MigLayout(
						"debug, flowy",
						"[fill, grow]",
						"[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		JTextArea textArea = new JTextArea(description);
		textArea.setEditable(false);

		this.add(textArea);
	}
}

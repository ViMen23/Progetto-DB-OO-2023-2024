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
						GuiConfiguration.infoPanelLayoutConstraint,
						GuiConfiguration.tablePanelColumnConstraint,
						"[grow, fill]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		JTextArea textArea = new JTextArea(description);
		textArea.setEditable(false);
		textArea.setBorder(null);

		this.add(textArea);
	}
}
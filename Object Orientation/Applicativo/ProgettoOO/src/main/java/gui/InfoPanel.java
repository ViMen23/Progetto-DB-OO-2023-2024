package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

/**
 * Questa classe rappresenta un pannello che visualizza una descrizione testuale.
 */
public class InfoPanel
				extends JPanel
{
	public InfoPanel(String description)
	{
		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		JTextArea textArea = new JTextArea(description);
		textArea.setBorder(BorderFactory.createEmptyBorder(2,10,2,0));
		textArea.setEditable(false);
		textArea.setLineWrap(true);
		textArea.setWrapStyleWord(true);

		textArea.setEditable(false);
		textArea.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));

		this.add(textArea);
	}
}

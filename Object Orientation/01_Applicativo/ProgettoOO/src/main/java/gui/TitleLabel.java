package gui;

import javax.swing.*;
import java.awt.*;

/**
 * Estensione della classe `JLabel` per creare un'etichetta di titolo personalizzata.
 */
public class TitleLabel
				extends JLabel
{
	public TitleLabel(String title)
	{
		super(title, SwingConstants.LEADING);

		this.setOpaque(true);
		this.setBackground(new Color(50, 100, 200));
		this.setForeground(Color.white);
		this.setBorder(BorderFactory.createEmptyBorder(2,10,2,0));
	}
}

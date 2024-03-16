package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.util.Map;

public class GeneralInfoPanel
				extends JPanel
{
	public GeneralInfoPanel()
	{
		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL_LAYOUT_CONSTRAINT,
						null
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);
	}

	public void createGeneralInfoPanel(Map<String, String> panelHashMap, String messageKey)
	{
		JLabel label;

		this.removeAll();

		this.add(new TitleLabel(GuiConfiguration.getMessage(messageKey)), GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		for (String key: panelHashMap.keySet()) {
			label = new JLabel(key, SwingConstants.LEADING);

			this.add(label);

			label = new JLabel(panelHashMap.get(key), SwingConstants.LEADING);

			label.setFont(GuiConfiguration.outputBoldFont);

			this.add(label);
		}

	}

}

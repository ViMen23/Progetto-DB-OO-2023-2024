package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.awt.*;

public class ChooseContinentPanel
				extends JPanel
{
	public ChooseContinentPanel(String title)
	{
		MigLayout migLayout;
		migLayout = new MigLayout(
						"debug",
						"[fill, grow][]",
						"[][]"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		TitleLabel titleLabel;
		titleLabel = new TitleLabel(title);
		this.add(titleLabel, "span, wrap");

		JComboBox<String> comboBox;
		comboBox = new JComboBox<>();
		comboBox.setEnabled(false);
		comboBox.setCursor(GuiConfiguration.getButtonCursor());

		comboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		comboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e) {

			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {

			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) {

			}
		});

		this.add(comboBox, "cell 1 1");
	}
}

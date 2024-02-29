package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public abstract class ComboBoxPanel
				extends JPanel
{
	private final JComboBox<String> comboBox;

	public ComboBoxPanel(String title)
	{
		MigLayout migLayout;

		final TitleLabel titleLabel;
		final Vector<String> comboBoxVector = new Vector<>();
		final Map<String, String> comboBoxMap = new HashMap<>();


		migLayout = new MigLayout
			(
				"debug, flowx",
				"10:push[40%]5%",
				"10[]10"
			);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		titleLabel = new TitleLabel(title);

		this.add(titleLabel, "spanx, wrap, grow");


		comboBox = new JComboBox<>();

		comboBox.setEnabled(false);
		comboBox.setCursor(GuiConfiguration.getButtonCursor());

		comboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		comboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillContinentComboBox(comboBox, comboBoxVector, comboBoxMap);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				setContinentID(GuiConfiguration.getSelectedItemIDComboBox(comboBox, comboBoxMap) );
			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});

		this.add(comboBox);
	}

	public void setEnableComboBox(Boolean bool)
	{
		comboBox.setEnabled(bool);
		comboBox.setSelectedIndex(-1);
	}

	abstract void fillContinentComboBox(JComboBox<String> comboBox,
										Vector<String> comboBoxVector,
										Map<String, String> comboBoxMap);

	abstract void setContinentID(String ID);
}

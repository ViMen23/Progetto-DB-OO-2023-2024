package gui;

import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.util.Vector;

public class MyComboBox
				extends JComboBox<String>
{
	public MyComboBox(Boolean enable, JLabel controlLabel)
	{
		super();

		this.setEnabled(enable);
		this.setCursor(GuiConfiguration.getButtonCursor());
		this.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());
		this.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		this.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				controlLabel.setText("@fill");
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				String selectedString;
				selectedString = (String) MyComboBox.this.getSelectedItem();

				MyComboBox.this.removeAllItems();
				MyComboBox.this.addItem(selectedString);

				controlLabel.setText(selectedString);
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e)
			{

			}
		});
	}

	public void fillComboBox(Vector<String> comboBoxDataVector)
	{
		this.setModel(new DefaultComboBoxModel<>(comboBoxDataVector));
	}
}
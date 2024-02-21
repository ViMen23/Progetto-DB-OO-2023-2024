package gui;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.plaf.ColorUIResource;
import java.awt.*;
import java.util.ArrayList;

public class ComboBoxRenderer extends DefaultListCellRenderer
{

	public ComboBoxRenderer()
	{
		super();
		setOpaque(true);
	}

	@Override
	public Component getListCellRendererComponent(JList list, Object value,
												  int index, boolean isSelected, boolean cellHasFocus)
	{
		if (value == null) {
			return null;
		}

		setText((String) ((ArrayList<?>) value).getFirst());

		if (isSelected) {
			setBackground(UIManager.getColor("nimbusSelectionBackground"));
			setForeground(UIManager.getColor("nimbusLightBackground"));

		} else {
			setBackground(list.getBackground());
			setForeground(list.getForeground());
		}

		return this;
	}
}

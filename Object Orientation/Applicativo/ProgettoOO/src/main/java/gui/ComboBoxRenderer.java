package gui;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

public class ComboBoxRenderer
				implements ListCellRenderer
{
	@Override
	public Component getListCellRendererComponent(JList list, Object value,
																								int index, boolean isSelected, boolean cellHasFocus)
	{
		Component component = new JLabel((String) ((ArrayList<?>) value).getFirst());
		component.setName((String) ((ArrayList<?>) value).getLast());

		return component;
	}
}

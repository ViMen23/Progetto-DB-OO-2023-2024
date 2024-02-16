/*
package gui;

import javax.swing.*;
import javax.swing.plaf.basic.BasicArrowButton;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableCellRenderer;
import java.awt.*;
*/
/*
public class TableRenderer extends DefaultTableCellRenderer
{

	boolean isPressed;

	public TableRenderer()
	{
		super();
	}



	@Override
	public Component getTableCellRendererComponent(JTable table, Object value,
												   boolean isSelected, boolean hasFocus, int row, int column) {


		if (isSelected) {
			setForeground(table.getSelectionForeground());
			setBackground(table.getSelectionBackground());
			if(hasFocus && column == 3)
			{
				isPressed = true;
			}
		} else
		{

			setForeground(table.getForeground());

			if (row % 2 == 0) {
				setBackground((Color) UIManager.get("Table.background"));
			} else {
				setBackground((Color) UIManager.get("Table.alternateRowColor"));
			}
		}


		JButton button = (JButton) value;

		setText(button.getText());

		return this;
	}

}
*/
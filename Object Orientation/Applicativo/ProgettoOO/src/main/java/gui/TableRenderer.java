package gui;


import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.*;

public class TableRenderer
				extends DefaultTableCellRenderer
{

	public TableRenderer()
	{
		super();
	}


	@Override
	public Component getTableCellRendererComponent(JTable table,
																								 Object value,
																								 boolean isSelected,
																								 boolean hasFocus,
																								 int row,
																								 int column)
	{
		if (table == null) {
			return this;
		}

		if (isSelected) {
			super.setForeground(table.getSelectionForeground() );
			super.setBackground(table.getSelectionBackground());
		} else {
			Color background = table.getBackground();

			if (background == null || background instanceof javax.swing.plaf.UIResource) {
				Color alternateColor = UIManager.getColor("Table.alternateRowColor");
				if (alternateColor != null && row % 2 != 0) {
					background = alternateColor;
				}
			}
			super.setForeground(table.getForeground());

			super.setBackground(background);
		}
		setFont(table.getFont());

		if (hasFocus) {
			Border border = null;
			if (isSelected) {
				border = UIManager.getBorder("Table.focusSelectedCellHighlightBorder");
			}
			if (border == null) {
				border = UIManager.getBorder("Table.focusCellHighlightBorder");
			}
			setBorder(border);

			if (!isSelected && table.isCellEditable(row, column)) {
				Color col;
				col = UIManager.getColor("Table.focusCellForeground");
				if (col != null) {
					super.setForeground(col);
				}
				col = UIManager.getColor("Table.focusCellBackground");
				if (col != null) {
					super.setBackground(col);
				}
			}
		} else {
			setBorder(null);
		}
		setValue(value);
		setForeground(Color.blue);

		return this;
	}
}

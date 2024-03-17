package gui;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

/**
 * Questa classe rappresenta una componente Table personalizzata.
 */
public class MyTable
			extends JTable
{
	public MyTable(Boolean sort,
								 Integer[] tableIndex,
								 JLabel ctrlMouseLabel)
	{
		this(sort);

		this.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e)
			{
				super.mouseClicked(e);
				if (e.getClickCount() >= 1) {
					tableIndex[0] = MyTable.this.convertRowIndexToModel(getSelectedRow());
					tableIndex[1] = MyTable.this.convertColumnIndexToModel(getSelectedColumn());
					ctrlMouseLabel.setText("@click");
				}
			}
		});
	}

	public MyTable(Boolean sort)
	{
		super();

		this.setRowHeight(25);

		this.setPreferredScrollableViewportSize(this.getPreferredSize());
		this.setFillsViewportHeight(true);

		this.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		this.setAutoCreateRowSorter(sort);

		DefaultTableCellRenderer defaultRenderer = (DefaultTableCellRenderer) this.getTableHeader().getDefaultRenderer();
		defaultRenderer.setHorizontalAlignment(SwingConstants.CENTER);
	}
}
